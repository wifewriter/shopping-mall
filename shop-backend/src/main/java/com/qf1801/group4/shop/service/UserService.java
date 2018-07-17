package com.qf1801.group4.shop.service;

import com.qf1801.group4.shop.common.EasyUIPageInfo;
import com.qf1801.group4.shop.entity.SysUser;

public interface UserService {
    SysUser login(SysUser sysUser);

    EasyUIPageInfo<SysUser> list(int page, int rows, SysUser sysUser);

    SysUser get(SysUser sysUser);

    boolean add(SysUser sysUser, String[] roleIds);

    SysUser getUserById(String id);

    boolean update(SysUser sysUser, String[] roleIds);

    boolean deleteByIds(String ids);
}
