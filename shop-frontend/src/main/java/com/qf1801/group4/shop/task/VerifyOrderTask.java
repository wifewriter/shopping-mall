package com.qf1801.group4.shop.task;

import com.qf1801.group4.shop.dao.ShopCartMapper;
import com.qf1801.group4.shop.dao.ShopOrderMapper;
import com.qf1801.group4.shop.dao.ShopOrderProductMapper;
import com.qf1801.group4.shop.dao.ShopProductMapper;
import com.qf1801.group4.shop.entity.ShopCart;
import com.qf1801.group4.shop.entity.ShopOrder;
import com.qf1801.group4.shop.entity.ShopOrderProduct;
import com.qf1801.group4.shop.entity.ShopProduct;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;
import tk.mybatis.mapper.common.example.SelectByExampleMapper;
import tk.mybatis.mapper.entity.Example;

import java.util.Date;
import java.util.Iterator;
import java.util.List;

@Component
public class VerifyOrderTask {

    public static final int VALID_TIME = 15 * 60 * 1000;

    @Autowired
    private ShopOrderMapper shopOrderMapper;
    @Autowired
    private ShopOrderProductMapper shopOrderProductMapper;
    @Autowired
    private ShopProductMapper shopProductMapper;

    @Scheduled(cron = "0/10 * * * * ?")
    @Transactional
    public void cancelOrderBySystem() {
        // 查询出所有的订单
        Example orderExample = new Example(ShopOrder.class);
        Example.Criteria criteria = orderExample.createCriteria();
        criteria.andEqualTo("state", 1);
        List<ShopOrder> shopOrders = shopOrderMapper.selectByExample(orderExample);
        Iterator<ShopOrder> iterator = shopOrders.iterator();
        // 如果有 就取消订单
        while (iterator.hasNext()) {
            ShopOrder shopOrder = iterator.next();
            String shopOrderId = shopOrder.getId();
            long createTime = shopOrder.getCreateTime().getTime();
            long now = new Date().getTime();
            // 超出15分钟的订单设置为取消状态
            if (now - VALID_TIME > createTime) {
                shopOrder.setState((byte) 3);
                shopOrder.setStateOperateTime(new Date());
                shopOrderMapper.updateByPrimaryKeySelective(shopOrder);
                resetShopProductNumber(shopOrderId);
            }
        }
    }


    /**
     * 恢复库存
     */
    private void resetShopProductNumber(String shopOrderId) {
        // 获取订单中的所有商品
        Example ShopOrderProductExample = new Example(ShopOrderProduct.class);
        Example.Criteria criteria = ShopOrderProductExample.createCriteria();
        criteria.andEqualTo("shopOrderId", shopOrderId);
        List<ShopOrderProduct> shopOrderProducts = shopOrderProductMapper.selectByExample(ShopOrderProductExample);
        for (ShopOrderProduct shopOrderProduct : shopOrderProducts) {
            String shopProductId = shopOrderProduct.getShopProductId();
            // 获取商品信息
            ShopProduct shopProduct = shopProductMapper.selectByPrimaryKey(shopProductId);
            // 通过商品的订单数和现有的库存相加获取原来库存
            Integer cartCount = shopOrderProduct.getCount();
            int newNumber = shopProduct.getNumber() + cartCount;
            shopProduct.setNumber(newNumber);
            shopProductMapper.updateByPrimaryKeySelective(shopProduct);
        }
    }


}
