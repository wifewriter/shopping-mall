package com.qf1801.group4.shop.service;

import com.qf1801.group4.shop.entity.ShopProductCategory;

import java.util.List;
import java.util.Map;

public interface CategoryService {
    Map<String, List<ShopProductCategory>> getShopProductCategories();
}
