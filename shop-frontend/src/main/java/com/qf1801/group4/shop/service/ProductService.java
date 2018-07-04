package com.qf1801.group4.shop.service;

import com.github.pagehelper.PageInfo;
import com.qf1801.group4.shop.entity.ShopProduct;

import java.util.List;
import java.util.Map;

public interface ProductService {

    PageInfo get(int pageNo, int pagSize, Map<String, Object> params);

    List<ShopProduct> getRecommendProducts();

    ShopProduct getOne(String id);
}
