package com.qf1801.group4.shop.service;

import com.qf1801.group4.shop.entity.ShopOrder;

public interface ShopOrderService {
    int addOrder(ShopOrder shopOrder, String addressId) throws Exception;
}
