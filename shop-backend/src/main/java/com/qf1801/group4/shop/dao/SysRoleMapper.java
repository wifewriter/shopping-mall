package com.qf1801.group4.shop.dao;


import com.qf1801.group4.shop.entity.SysRole;
import tk.mybatis.mapper.common.Mapper;

import java.util.List;

public interface SysRoleMapper extends Mapper<SysRole> {
    List<SysRole> selectRolesByUserId(String UserId);

    SysRole selectRoleById(String roleId);
}
