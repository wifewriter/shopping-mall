package com.qf1801.group4.shop.contorller;

import com.qf1801.group4.shop.common.Constant;
import com.qf1801.group4.shop.common.EasyUIPageInfo;
import com.qf1801.group4.shop.common.JsonResult;
import com.qf1801.group4.shop.entity.SysMenu;
import com.qf1801.group4.shop.entity.SysRole;
import com.qf1801.group4.shop.entity.SysUser;
import com.qf1801.group4.shop.service.MenuService;
import com.qf1801.group4.shop.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import tk.mybatis.mapper.util.StringUtil;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping("user")
public class UserController {

    @Autowired
    private UserService userService;
    private MenuService menuService;

    @RequestMapping("login")
    @ResponseBody
    private String login(SysUser sysUser, String validateCode, String remember, HttpSession session) {
        if (sysUser == null) {
            return "nullUser";
        }
        // 验证码验证
        // todo 已屏蔽验证码
        // if (StringUtil.isEmpty(validateCode)) {
        //     return "nullValidateCode";
        // }
        // if (session.getAttribute(Constants.KAPTCHA_SESSION_KEY).equals(validateCode)) {
        //     return "errValidateCode";
        // }
        // 用户名信息非空验证
        String email = sysUser.getEmail();
        if (StringUtil.isEmpty(email)) {
            return "nullEmail";
        }
        if (StringUtil.isEmpty(sysUser.getPassword())) {
            return "nullPassword";
        }
        // 判断是邮箱登录还是用户名登录
        if (!email.contains("@")) {
            sysUser.setUsername(email);
            sysUser.setEmail(null);
        }
        SysUser loginSysUser = userService.login(sysUser);
        if (loginSysUser == null) {
            return "fail";
        }
        if (verifyStatus(loginSysUser)) {
            return "forbidden";
        }
        session.setAttribute("username", loginSysUser.getUsername());
        // // 记住密码
        // if (StringUtil.isEmpty(remember)) {
        //     Cookie username = new Cookie("username", loginSysUser.getUsername());
        //     username.setMaxAge(7 * 24 * 60 * 60);
        // } else {
        //     Cookie username = new Cookie("username", null);
        //     username.setMaxAge(0);
        // }

        return "main";
    }

    private boolean verifyStatus(SysUser loginSysUser) {
        // 检查用户是否被禁用
        if (loginSysUser.getStatus() > 1) { // 账号是否被禁用
            return true;
        } else {
            int numOfForbidden = 0;
            List<SysRole> sysRoles = loginSysUser.getSysRoles();
            for (SysRole sysRole : sysRoles) { // 该用户对应的所有的角色是否被禁用
                if (sysRole.getStatus() > 1) {
                    numOfForbidden += 1;
                }
            }
            if (numOfForbidden == sysRoles.size()) {
                return true;
            }
        }
        return false;
    }

    @RequestMapping("logout")
    public String logout() {
        return "redirect:/page/toLoginPage";
    }


    @RequestMapping(value = "list", produces = "application/json")
    @ResponseBody
    public EasyUIPageInfo<SysUser> list(int page, int rows,SysUser sysUser) {
        return userService.list(page, rows, sysUser);
    }

    @RequestMapping("add")
    @ResponseBody
    public boolean add(SysUser sysUser, String[] roleIds) {
        return userService.add(sysUser, roleIds);
    }

    @RequestMapping("getById")
    @ResponseBody
    public JsonResult getById(String id) {
        SysUser user = userService.getUserById(id);
        if (user == null) {
            return JsonResult.error();
        }
        return JsonResult.success(user);
    }

    @RequestMapping("listUserMenu")
    public List<SysMenu> listUserMenu(HttpSession session) {
        String userId = (String) session.getAttribute(Constant.SESSION_USER_ID);
        return menuService.listUserMenu(userId);
    }

    @ResponseBody
    @RequestMapping("update")
    public boolean update(SysUser sysUser, String[] roleIds) {
        return userService.update(sysUser, roleIds);
    }

    @ResponseBody
    @RequestMapping("deleteByIds")
    public boolean deleteByIds(String ids) {
        return userService.deleteByIds(ids);
    }
}
