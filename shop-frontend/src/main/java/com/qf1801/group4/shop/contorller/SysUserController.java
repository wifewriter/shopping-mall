package com.qf1801.group4.shop.contorller;

import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.code.kaptcha.Constants;
import com.qf1801.group4.shop.common.Constant;
import com.qf1801.group4.shop.entity.SysUser;
import com.qf1801.group4.shop.service.SysUserService;

@Controller
@RequestMapping("user")
public class SysUserController {
	 /**
	 * 账号或密码错误
	 */
	private static final int ACCOUNT_OR_PASSWORD_ERROR = 1;
	 /**
	 * 账号被禁用
	 */
	private static final int FORBIDDEN = 2;
	 /**
	 * 验证码错误
	 */
	private static final int VERIFICATION_ERROR = 3;
	/**
	 * 登录成功
	 */
	private static final int SUCCEED = 4;
	
	/**
	 * 账号可用
	 */
	private static final int USABLE=1;
	/**
	 * 账号不可用
	 */
	private static final int NOT_USABLE=0;
	 
	 @Autowired
	 private SysUserService userService;
	 
	 @RequestMapping("toLogin")
	 public String  toLogin() {
		return "login";
		
	}
	 
	 
	 /**
		 * 登录
		 */
		@RequestMapping("login")
		@ResponseBody
		public int login(SysUser sysUser, String remember, String validateCode, HttpSession session){
			String rand = (String) session.getAttribute(Constants.KAPTCHA_SESSION_KEY);
			int Num=0;
			if(!rand.equals(validateCode)){
				SysUser user = userService.get(sysUser);
				if(user==null){
					Num=ACCOUNT_OR_PASSWORD_ERROR;
					return Num;
				}else{
					
					if(user.getStatus()==Constant.STATUS_TWO){
						Num= FORBIDDEN;
						return Num;
					}
					//登录成功
					if(user.getStatus()==Constant.STATUS_ONE){
						session.setAttribute("eamil", user.getEmail());
						session.setAttribute("username", user.getUsername());
						if (remember != null) {
			                session.setAttribute("remember", remember);
			            }
						Num=SUCCEED;
						return Num;
					}
				}
			}else{
				Num=VERIFICATION_ERROR;
				return Num;
			}
			return Num;
		}
		
		 /**
		 * 到注册页面
		 */
		@RequestMapping("toRegister")
		 public String  toRegister() {
			return "register";
			
		}
		 
		 
		 /**
		 * 验证账号唯一性
		 * 
		 */
		@RequestMapping("validateEmail")
		 @ResponseBody
		 public int validateEmail(SysUser sysUser){
			 int Num=NOT_USABLE;
			 SysUser user = userService.get(sysUser);
			 if(user==null){
				 Num=USABLE;
				 return Num;
			 }else{
				 return Num; 
			 }
		 }
		
		 /**
		 * 新增账号
		 * 
		 */
		@RequestMapping("register")
		public String register(SysUser sysUser){
			 
			 String id = UUID.randomUUID().toString(); 
			 sysUser.setId(id);
			 sysUser.setStatus(1);
			 userService.addSysUser(sysUser);
			return "login";
			
		}
		
		
		@RequestMapping("logout")
		public String logout(HttpServletRequest request){
			// 让服务器中的Session对象失败
			 request.getSession().invalidate();
			return "index";
			
		}	
		/**
		 * 测试
		 */
		@RequestMapping("uu")
		public String uu(){
			return "uu";
			
		}
		
}
