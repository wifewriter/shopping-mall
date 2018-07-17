package com.qf1801.group4.shop.contorller;

import com.qf1801.group4.shop.entity.SysUser;
import com.qf1801.group4.shop.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("validate")
public class ValidateController {

    @Autowired
    private UserService sysUserService;

    @RequestMapping("validateEmail")
    public boolean validateEmail(SysUser sysUser) {
        if (sysUserService.get(sysUser) == null) {
            return true;
        }
        return false;
    }
}
