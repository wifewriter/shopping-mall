package com.qf1801.group4.shop.dao;

import com.qf1801.group4.shop.entity.ShopCart;
import com.qf1801.group4.shop.entity.ShopProduct;
import tk.mybatis.mapper.common.Mapper;

import java.util.List;

public interface ShopCartMapper extends Mapper<ShopCart> {
	   List<ShopProduct> getShopProductsByUserId(String id);
	   
	   Integer updateShopCart(ShopCart shopCart);
}
