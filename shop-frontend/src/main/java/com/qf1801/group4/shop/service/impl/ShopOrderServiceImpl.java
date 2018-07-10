package com.qf1801.group4.shop.service.impl;

import com.qf1801.group4.shop.dao.*;
import com.qf1801.group4.shop.entity.*;
import com.qf1801.group4.shop.service.ShopOrderService;
import com.sun.org.apache.xerces.internal.util.SynchronizedSymbolTable;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import tk.mybatis.mapper.entity.Example;

import java.math.BigDecimal;
import java.util.List;
import java.util.UUID;


@Service
public class ShopOrderServiceImpl implements ShopOrderService {

    @Autowired
    private ShopCartMapper shopCartMapper;
    @Autowired
    private ShopOrderMapper shopOrderMapper;
    @Autowired
    private ShopOrderProductMapper shopOrderProductMapper;
    @Autowired
    private ShopProductMapper shopProductMapper;
    @Autowired
    private ShopReceiveAddressMapper shopReceiveAddressMapper;


    @Override
    @Transactional
    public int addOrder(ShopOrder shopOrder, String addressId) throws Exception {
        // 设置订单属性
        String shopOrderId = UUID.randomUUID().toString();
        ShopReceiveAddress shopReceiveAddress = shopReceiveAddressMapper.selectByPrimaryKey(addressId);
        shopOrder.setAddress(shopReceiveAddress.getAddress());
        shopOrder.setArea(shopReceiveAddress.getArea());
        shopOrder.setCity(shopReceiveAddress.getCity());
        shopOrder.setProvince(shopReceiveAddress.getProvince());
        shopOrder.setPhone(shopReceiveAddress.getPhone());
        shopOrder.setId(shopOrderId);
        // 添加订单
        int insertRow = shopOrderMapper.insert(shopOrder);
        // 获取该订单的所有商品
        List<ShopProduct> shopProducts = shopCartMapper.getShopProductsByUserId(shopOrder.getSysUserId());
        for (ShopProduct shopProduct : shopProducts) {
            // 验证库存是否充足
            Integer cartCount = shopProduct.getCartCount(); // 购买数量
            Integer number = shopProduct.getNumber();// 当前库存
            if (number < cartCount) {
                throw new RuntimeException("库存不足！");
            }
            // 添加订单商品
            ShopOrderProduct shopOrderProduct = new ShopOrderProduct();
            shopOrderProduct.setId(UUID.randomUUID().toString());
            shopOrderProduct.setCount(cartCount);
            shopOrderProduct.setShopProductId(shopProduct.getId());
            shopOrderProduct.setShopOrderId(shopOrderId);
            BigDecimal subTotal = BigDecimal.valueOf(cartCount * shopProduct.getPrice());
            shopOrderProduct.setSubtotal(subTotal);
            shopOrderProductMapper.insert(shopOrderProduct);
            // 修改库存
            int newNumber = number - cartCount;
            shopProduct.setNumber(newNumber);
            shopProductMapper.updateByPrimaryKeySelective(shopProduct);
            // 删除购物车
            deleteShopCarByUserId(shopOrder.getSysUserId());
        }
        return insertRow;
    }

    /**
     * 删除该用户购物车中的所有商品
     *
     * @param sysUserId
     * @return
     */
    private int deleteShopCarByUserId(String sysUserId) {
        Example shopCarExample = new Example(ShopCart.class);
        shopCarExample.createCriteria().andEqualTo("sysUserId", sysUserId);
        return shopCartMapper.deleteByExample(shopCarExample);
    }
}
