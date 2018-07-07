package com.qf1801.group4.shop.contorller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.qf1801.group4.shop.entity.ShopCart;
import com.qf1801.group4.shop.service.ShopCarService;

@Controller
@RequestMapping("ShopCar")
public class ShopCarController {

	@Autowired
	private ShopCarService shopCarService;

	@RequestMapping("addToShopCar")
	@ResponseBody
	public String addToShopCar(ShopCart shopCart, HttpSession session) {
		// todo 修改为session取id
		String userId = (String) session.getAttribute("sysUserId");
		if (userId != null) {
			shopCart.setSysUserId(userId);
			int row = shopCarService.addToShopCar(shopCart);
			if (row > 0) {
				return "success";
			}
		}
		return "userNoLogin";
	}

}
