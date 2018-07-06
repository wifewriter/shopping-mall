package com.qf1801.group4.shop.service.impl;

import com.qf1801.group4.shop.dao.ShopProductCategoryMapper;
import com.qf1801.group4.shop.entity.ShopProductCategory;
import com.qf1801.group4.shop.service.CategoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import tk.mybatis.mapper.entity.Example;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class CategoryServiceImpl implements CategoryService {

    public static final int ACTIVATION = 1;

    @Autowired
    private ShopProductCategoryMapper shopProductCategoryMapper;

    @Override
    public Map<String, List<ShopProductCategory>> getShopProductCategories() {
        Map<String, List<ShopProductCategory>> categrtyMap = new HashMap<>();
        // 获取启用状态的分类
        Example example = new Example(ShopProductCategory.class);
        example.createCriteria().andEqualTo("status",ACTIVATION);
        List<ShopProductCategory> shopProductCategories = shopProductCategoryMapper.selectByExample(example);
        // 获取一级菜单
        List<ShopProductCategory> mainMenuAct = shopProductCategoryMapper.getMainMenuAct();
        // 按照pid分组
        for (ShopProductCategory mainMenu : mainMenuAct) {
            List<ShopProductCategory> categories = new ArrayList<>();
            for (ShopProductCategory shopProductCategory : shopProductCategories) {
                String pid = shopProductCategory.getPid();
                if (pid != null && pid.equals(mainMenu.getId())) {
                    categories.add(shopProductCategory);
                }
                categrtyMap.put(mainMenu.getCategoryName(), categories);
            }
        }
        return categrtyMap;
    }

}
