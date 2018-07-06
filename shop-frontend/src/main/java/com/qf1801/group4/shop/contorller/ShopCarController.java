package com.qf1801.group4.shop.contorller;

import com.qf1801.group4.shop.entity.ShopCart;
import com.qf1801.group4.shop.service.ShopCarService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("ShopCar")
public class ShopCarController {

    @Autowired
    private ShopCarService shopCarService;

    @RequestMapping("addToShopCar")
    @ResponseBody
    public String addToShopCar(ShopCart shopCart, HttpSession session) {
        // todo 修改为session取id
        // String userId = (String) session.getAttribute("userId");
        // shopCart.setSysUserId("userId");
        shopCart.setSysUserId("1");
        int row = shopCarService.addToShopCar(shopCart);
        if (row > 0) {
            return "success";
        }
        return "fail";
    }

}
