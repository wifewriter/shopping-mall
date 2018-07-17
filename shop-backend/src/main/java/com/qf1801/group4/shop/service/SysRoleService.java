package com.qf1801.group4.shop.service;

import com.qf1801.group4.shop.entity.SysRole;

import java.util.List;

public interface SysRoleService {
    List<SysRole> listAll();

    boolean add(SysRole sysRole);

    boolean deleteByIds(String ids);

    SysRole getSysRoleById(String id);

    boolean validateName(SysRole sysRole);

    boolean update(SysRole sysRole, String[] menuIds);
}
