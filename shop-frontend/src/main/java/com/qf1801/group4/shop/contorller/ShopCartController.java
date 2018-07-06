package com.qf1801.group4.shop.contorller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.qf1801.group4.shop.entity.ShopCart;
import com.qf1801.group4.shop.entity.ShopProduct;
import com.qf1801.group4.shop.service.ShopCartService;

@Controller
@RequestMapping("shopcar")
public class ShopCartController {
	@Autowired
	private ShopCartService shopCartService;

	/**
	 * 到购物车
	 */
	@RequestMapping("toShopCar")
	public String toShopCar(HttpSession session, Model model) {
		String id = (String) session.getAttribute("id");
		List<ShopProduct> shopProductList = shopCartService
				.getShopCart("gawewqt");
		for (int i = 0; i < shopProductList.size(); i++) {
			Double price = shopProductList.get(i).getPrice();
			Integer cartCount = shopProductList.get(i).getCartCount();
			shopProductList.get(i).setSubtotal(price * cartCount);
		}

		model.addAttribute("shopProductList", shopProductList);
		return "shopcar";
	}
	
	@RequestMapping("deleteShopCart")
	@ResponseBody
	public Integer deleteShopCart(String cartId){
		ShopCart shopCart=new ShopCart();
		shopCart.setId(cartId);
		return shopCartService.deleteShopCart(shopCart);
	}

}
