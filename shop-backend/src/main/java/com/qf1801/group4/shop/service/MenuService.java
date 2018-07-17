package com.qf1801.group4.shop.service;

import com.qf1801.group4.shop.entity.SysMenu;

import java.util.List;

public interface MenuService {
    List<SysMenu> getMenu(String pid);

    List<SysMenu> listByPid(String id);

    boolean addMenu(SysMenu sysMenu);

    SysMenu getById(SysMenu sysMenu);

    int update(SysMenu sysMenu);

    int deleteById(String id);

    List<SysMenu> listUserMenu(String userId);
}
