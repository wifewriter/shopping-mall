package com.qf1801.group4.shop.contorller;

import com.qf1801.group4.shop.entity.ShopProduct;
import com.qf1801.group4.shop.service.ShopCartService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
@RequestMapping("order")
@ResponseBody
public class OrderController {

    @Autowired
    private ShopCartService shopCartService;

    @RequestMapping("getShopProductsByUserId")
    public List<ShopProduct> getShopProductsByUserId(String userId) {
        return shopCartService.getShopCartByUserId(userId);
    }
}
