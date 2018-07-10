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
		String id = (String) session.getAttribute("sysUserId");
		//String id ="gawewqt";
		//if(id != null || id !=""){
		List<ShopProduct> shopProductList = shopCartService
				.getShopCart(id);
		Double totalPrices= 0.0;
		for (int i = 0; i < shopProductList.size(); i++) {
			Double price = shopProductList.get(i).getPrice();
			Integer cartCount = shopProductList.get(i).getCartCount();
			shopProductList.get(i).setSubtotal(price * cartCount);
			totalPrices += price * cartCount;
		}
		model.addAttribute("totalPrices", totalPrices);
		model.addAttribute("shopProductList", shopProductList);
		return "car/shopcar";
		//}
		
		
	}
	
	/**
	 * 购物车中删除商品
	 * 
	 */
	@RequestMapping("deleteShopCart")
	@ResponseBody
	public Integer deleteShopCart(String cartId){
		ShopCart shopCart=new ShopCart();
		shopCart.setId(cartId);
		return shopCartService.deleteShopCart(shopCart);
	}
	
	/**
	 * 点击'+'或'-'时修改数据库
	 * 
	 * 
	 */
	@RequestMapping("updateShopCart")
	@ResponseBody
	public Integer updateShopCart(String id,Integer count){
		
		ShopCart shopCart=new ShopCart();
		shopCart.setId(id);
		shopCart.setCount(count);
		return shopCartService.updateShopCart(shopCart);
	}
	
	/**
	 * 清空购物车
	 * 
	 */
	@RequestMapping("prugeShopCart")
	@ResponseBody
	public String prugeShopCart(HttpSession session){
		String id = (String) session.getAttribute("sysUserId");
		//String id = "gawewqt";
		ShopCart shopCart=new ShopCart();
		shopCart.setSysUserId(id);
		if(shopCartService.deleteShopCart(shopCart)>0){
			return "success";
		}
		return "fail";
	}
	
	/**
	 * 结算
	 */
	@RequestMapping("settle")
	public String settle(){
		return null;
		}
	

}
