package com.qf1801.group4.shop.service;

import com.github.pagehelper.PageInfo;

import java.util.Map;

public interface ProductService {

    PageInfo get(int pageNo, int pagSize, Map<String, Object> params);
}
