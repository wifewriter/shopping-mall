package com.qf1801.group4.shop.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.qf1801.group4.shop.dao.ShopCartMapper;
import com.qf1801.group4.shop.entity.ShopCart;
import com.qf1801.group4.shop.entity.ShopProduct;
import com.qf1801.group4.shop.service.ShopCartService;
@Service
public class ShopCartServiceImpl implements ShopCartService {
	@Autowired
	private ShopCartMapper shopCartMapper;

	@Override
	public List<ShopProduct> getShopCartByUserId(String id) {
		List<ShopProduct> list =shopCartMapper.getShopProductsByUserId(id);
		return list;
	}

	@Override
	public int deleteShopCart(ShopCart shopCart) {
		return shopCartMapper.delete(shopCart);
		
	}

	@Override
	public int updateShopCart(ShopCart shopCart) {
		return shopCartMapper.updateByPrimaryKeySelective(shopCart);
	}

}
