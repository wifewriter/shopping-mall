package com.qf1801.group4.shop.contorller;

import com.qf1801.group4.shop.entity.ShopProductCategory;
import com.qf1801.group4.shop.service.CategoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("category")
@ResponseBody
public class CategoryController {

    @Autowired
    private CategoryService categoryService;

    @RequestMapping("getCategorys")
    public Map<String, List<ShopProductCategory>> getCategorys() {
        // List<Map<String, List<ShopProductCategory>>> list = new ArrayList<>();
        // list.add(categoryService.getShopProductCategories());
        return categoryService.getShopProductCategories();
    }

}
