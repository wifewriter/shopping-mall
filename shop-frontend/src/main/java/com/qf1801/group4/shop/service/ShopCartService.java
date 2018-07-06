package com.qf1801.group4.shop.service;

import java.util.List;

import com.qf1801.group4.shop.entity.ShopCart;
import com.qf1801.group4.shop.entity.ShopProduct;

public interface ShopCartService {
	
	
	List<ShopProduct> getShopCart(String id);
	
	int deleteShopCart(ShopCart shopCart);
	
}
