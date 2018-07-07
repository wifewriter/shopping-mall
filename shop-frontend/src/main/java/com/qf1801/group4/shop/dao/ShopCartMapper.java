package com.qf1801.group4.shop.dao;

import java.util.List;

import tk.mybatis.mapper.common.Mapper;

import com.qf1801.group4.shop.entity.ShopCart;
import com.qf1801.group4.shop.entity.ShopProduct;

public interface ShopCartMapper extends Mapper<ShopCart> {
	   List<ShopProduct> getShopProduct(String id);
	   
	   Integer updateShopCart(ShopCart shopCart);
}
