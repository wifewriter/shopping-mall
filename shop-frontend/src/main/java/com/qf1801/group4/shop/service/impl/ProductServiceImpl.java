package com.qf1801.group4.shop.service.impl;

import com.qf1801.group4.shop.dao.ShopProductMapper;
import com.qf1801.group4.shop.entity.ShopProduct;
import com.qf1801.group4.shop.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
public class ProductServiceImpl implements ProductService {

    @Autowired
    private ShopProductMapper shopProductMapper;

    @Override
    public List<ShopProduct> get(Map<String, Object> params) {

        return null;
    }
}
