package com.qf1801.group4.shop.contorller;

import com.github.pagehelper.PageInfo;
import com.qf1801.group4.shop.entity.ShopProduct;
import com.qf1801.group4.shop.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
@RequestMapping("product")
@ResponseBody
public class ProductController {
    @Autowired
    private ProductService productService;

    @RequestMapping("products")
    public PageInfo mainPage(Model model, Integer pageNo, Integer pageSize) {
        PageInfo pageInfo = productService.get(pageNo, pageSize, null);

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


//~ Formatted by Jindent --- http://www.jindent.com
