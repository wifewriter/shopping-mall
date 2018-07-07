package com.qf1801.group4.shop.service;

import com.qf1801.group4.shop.entity.ShopReceiveAddress;

import java.util.List;

public interface ShopReceiveAddressService {

    List<ShopReceiveAddress> getShopReceiveAddressByUserId(String UserId);
}
