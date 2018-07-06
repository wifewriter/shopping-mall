package com.qf1801.group4.shop.dao;

import com.qf1801.group4.shop.entity.ShopProductCategory;
import tk.mybatis.mapper.common.Mapper;

import java.util.List;

public interface ShopProductCategoryMapper extends Mapper<ShopProductCategory> {
    ShopProductCategory getOne();

    List<ShopProductCategory> getMainMenuAct();
}
