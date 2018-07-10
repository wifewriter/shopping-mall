package com.qf1801.group4.shop.service.impl;

import com.qf1801.group4.shop.dao.ShopCartMapper;
import com.qf1801.group4.shop.entity.ShopCart;
import com.qf1801.group4.shop.service.ShopCarService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import tk.mybatis.mapper.entity.Example;

import java.util.List;
import java.util.UUID;

@Service
public class ShopCarServiceImpl implements ShopCarService {

    @Autowired
    private ShopCartMapper shopCartMapper;

    @Override
    public int addToShopCar(ShopCart shopCart) {
        int row = 0;
        Example example = new Example(ShopCart.class);
        Example.Criteria criteria = example.createCriteria();
        criteria.andEqualTo("shopProductId", shopCart.getShopProductId());
        criteria.andEqualTo("sysUserId", shopCart.getSysUserId());
        List<ShopCart> shopCarts = shopCartMapper.selectByExample(example);
        if (shopCarts.size() <= 0) {// 没有就添加
            shopCart.setId(UUID.randomUUID().toString());
            row = shopCartMapper.insert(shopCart);
        } else {
            ShopCart existingShopCar = shopCarts.get(0);
            Integer existingCount = existingShopCar.getCount();
            Integer addCount = shopCart.getCount();
            shopCart.setCount(existingCount+addCount);
            shopCart.setId(existingShopCar.getId());
            row = shopCartMapper.updateByPrimaryKey(shopCart);
        }
        return row;

    }
}
