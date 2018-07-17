package com.qf1801.group4.shop.dao;


import tk.mybatis.mapper.common.Mapper;

import com.qf1801.group4.shop.entity.ShopProduct;

public interface ShopProductMapper extends Mapper<ShopProduct> {
    ShopProduct getProdWitchShopProductCategory(String id);
}
