/**
 * 
 */
package com.qf1801.group4.shop.contorller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.qf1801.group4.shop.entity.ShopReceiveAddress;
import com.qf1801.group4.shop.entity.SysUser;
import com.qf1801.group4.shop.service.impl.UserServiceImpl;


/**
 * @author 王明山
 * @date   2018年7月3日-下午5:45:47
 *
 */
@Controller
public class UserController {
	@Autowired
	private  UserServiceImpl userService;
	
	/**
	 * 跳转到个人信息页面,带一个user对象过去
	 * @param request
	 * @param m
	 * @return
	 * String
	 */
	@RequestMapping("/toUserInfo")
	public String toUserInfo(HttpServletRequest request ,Model m){
		HttpSession session = request.getSession();
		String userName = (String) session.getAttribute("userName");
		SysUser user = new SysUser();
		user.setUsername("向世明");
		user.setEmail("1234565789@qq.com");
		m.addAttribute("user", user);
		return "userinfo";
	}
	/**
	 * 跳转到地址管理页面,并传递一个user对象过去,主要是获取id用
	 * 查询该用户已经拥有的地址
	 * @param request
	 * @param m
	 * @return
	 * String
	 */
	@RequestMapping("/toAddress")
	public String toAddress(HttpServletRequest request ,Model m){
		HttpSession session = request.getSession();
		String userName = (String) session.getAttribute("userName");
		SysUser user = userService.getUser(userName);
		List<ShopReceiveAddress> addressList = userService.getAddressList(user.getId());
		m.addAttribute("addressList", addressList);
		m.addAttribute("user", user);
		return "address";
	}
	/**
	 * 保存用户输入的收货地址信息
	 * @param sysUserId
	 * @param shopReceiveAddress
	 * @param request
	 * @return
	 * Object
	 */
	@RequestMapping("/save")
	@ResponseBody
	public Object save(String sysUserId , ShopReceiveAddress shopReceiveAddress,HttpServletRequest request){
		//String id = getId(request);
		shopReceiveAddress.setId(sysUserId);
		userService.save(shopReceiveAddress);
		return shopReceiveAddress;
	}
	
	/**
	 * 获取当前用户的id
	 * @param request
	 * @return
	 * String
	 */
	public String getId(HttpServletRequest request){
		HttpSession session = request.getSession();
		String userName = (String) session.getAttribute("userName");
		SysUser user = userService.getUser(userName);
		return user.getId();
	}
}
