package com.qf1801.group4.shop.dao;

import com.qf1801.group4.shop.entity.SysMenu;
import tk.mybatis.mapper.common.Mapper;

import java.util.List;

public interface SysMenuMapper extends Mapper<SysMenu> {
    List<SysMenu> selectMenu(String pid);

    List<SysMenu> listUserMenu(String userId);

}
