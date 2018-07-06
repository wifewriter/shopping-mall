package com.qf1801.group4.shop.contorller;

import com.github.pagehelper.PageInfo;
import com.qf1801.group4.shop.entity.ShopProduct;
import com.qf1801.group4.shop.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("product")
@ResponseBody
public class ProductController {
    @Autowired
    private ProductService productService;

    @RequestMapping("products")
    public PageInfo mainPage(Model model, Integer pageNo, Integer pageSize, String categoryId,String flag) {
        Map<String, Object> params = new HashMap<>();
        if (categoryId != null) {
        params.put("shopProductCategoryId", categoryId);
        }
        if (flag != null) {
            int flagCondition = Integer.parseInt(flag);
            params.put("flag", flagCondition);
        }
        PageInfo pageInfo = productService.get(pageNo, pageSize, params);
        return pageInfo;
    }

    @RequestMapping("recommendProducts")
    public List<ShopProduct> recommendProducts() {
        return productService.getRecommendProducts();
    }

    @RequestMapping("info")
    public ShopProduct getProduct(String productId) {
        return productService.getOne(productId);
    }
}