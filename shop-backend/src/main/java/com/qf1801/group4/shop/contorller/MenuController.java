package com.qf1801.group4.shop.contorller;

import com.qf1801.group4.shop.common.Constant;
import com.qf1801.group4.shop.common.JsonResult;
import com.qf1801.group4.shop.entity.SysMenu;
import com.qf1801.group4.shop.service.MenuService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("menu")
public class MenuController {

    @Autowired
    private MenuService menuService;

    @RequestMapping("mainMenu")
    public List<SysMenu> getMenu(String id) {
        return menuService.getMenu(id);
    }


    @RequestMapping("listByPid")
    public List<SysMenu> listByPid(String id) {
        return menuService.listByPid(id);
    }

    @RequestMapping("add")
    public boolean add(SysMenu sysMenu) {
        return menuService.addMenu(sysMenu);
    }


    @RequestMapping("getById")
    public JsonResult getById(SysMenu sysMenu) {
        SysMenu menu = menuService.getById(sysMenu);
        if (menu == null) {
            return JsonResult.error();
        }
        return JsonResult.success(menu);
    }

    @RequestMapping("update")
    public boolean update(SysMenu sysMenu) {
        int row = menuService.update(sysMenu);
        return row == Constant.EFFECT_ONE_ROW ? true : false;
    }

    @RequestMapping("deleteById")
    public boolean deleteById(String id) {
        int row = menuService.deleteById(id);
        return row == Constant.EFFECT_ONE_ROW ? true : false;
    }
}
