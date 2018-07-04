package com.qf1801.group4.shop.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.qf1801.group4.shop.dao.SysUserMapper;
import com.qf1801.group4.shop.entity.SysUser;
import com.qf1801.group4.shop.service.SysUserService;



@Service
public class SysUserServiceImpl implements SysUserService {
	@Autowired
	private SysUserMapper sysUserMapper;
	

	@Override
	public SysUser get(SysUser user) {
		SysUser sysUser = sysUserMapper.selectOne(user);
		return sysUser;
	}

}
