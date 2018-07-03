package com.qf1801.group4.shop.service;

import com.qf1801.group4.shop.entity.ShopProduct;

import java.util.List;
import java.util.Map;

public interface ProductService {

    List<ShopProduct> get(Map<String,Object> params);
}
