package com.qf1801.group4.shop.contorller;

import com.qf1801.group4.shop.entity.SysUser;
import com.qf1801.group4.shop.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("user")
public class UserController {

    @Autowired
    private UserService userService;

    private String login(SysUser sysUser) {

        return null;
    }

}
