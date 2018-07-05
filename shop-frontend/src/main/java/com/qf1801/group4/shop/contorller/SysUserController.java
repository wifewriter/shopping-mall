package com.qf1801.group4.shop.contorller;

import com.google.code.kaptcha.Constants;
import com.qf1801.group4.shop.common.Constant;
import com.qf1801.group4.shop.entity.SysUser;
import com.qf1801.group4.shop.service.SysUserService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;

@Controller

public class SysUserController {
	//账号或密码错误
	 private static final int MSG_ONE = 1;
	 //账号别禁用
	 private static final int MSG_TWO = 2;
	 //验证码错误
	 private static final int MSG_THREE = 3;
	 
	 
	 private SysUserService userService;
	 
	 
	 /**
		 * 登录
		 */
		@RequestMapping("/login")
		public void login(SysUser sysUser, String validateCode, HttpSession session, Model model){
			String rand = (String) session.getAttribute(Constants.KAPTCHA_SESSION_KEY);
			if(rand.equals(validateCode)){
				SysUser user = userService.get(sysUser);
				if(user==null){
					model.addAttribute(Constant.MSG_INFO,MSG_ONE );
				}else{
					if(user.getStatus()==Constant.STATUS_TWO){
						model.addAttribute(Constant.MSG_INFO,MSG_TWO);
					}
					//登录成功
					if(user.getStatus()==Constant.STATUS_ONE){
						session.setAttribute("eamil", user.getEmail());
						session.setAttribute("username", user.getUsername());					
						model.addAttribute(Constant.MSG_INFO, true);
					}
				}
			}else{
				model.addAttribute(Constant.MSG_INFO,MSG_THREE);
			}
		}
}
