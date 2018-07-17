package com.qf1801.group4.shop.dao;

import com.qf1801.group4.shop.entity.SysMenu;
import com.qf1801.group4.shop.entity.SysUser;
import tk.mybatis.mapper.common.Mapper;

import java.util.List;

public interface SysUserMapper extends Mapper<SysUser> {
    SysUser selectUser(SysUser sysUser);

    List<SysUser> selectUsersByRoleId(String roleId);

    List<SysUser> selectUsers(SysUser sysUser);

    List<SysMenu> listUserMenu(String userId);

}
