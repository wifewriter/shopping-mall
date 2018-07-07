package com.qf1801.group4.shop.service;

import com.qf1801.group4.shop.entity.ShopCart;
import com.qf1801.group4.shop.entity.ShopProduct;

import java.util.List;

public interface ShopCartService {
	
	
	List<ShopProduct> getShopCartByUserId(String id);
	
	int deleteShopCart(ShopCart shopCart);
	
	int updateShopCart(ShopCart shopCart);
	
}
