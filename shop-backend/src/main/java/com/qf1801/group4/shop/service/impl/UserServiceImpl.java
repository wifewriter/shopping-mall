package com.qf1801.group4.shop.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.qf1801.group4.shop.common.Constant;
import com.qf1801.group4.shop.common.EasyUIPageInfo;
import com.qf1801.group4.shop.dao.SysUserMapper;
import com.qf1801.group4.shop.dao.SysUserRoleMapper;
import com.qf1801.group4.shop.entity.SysUser;
import com.qf1801.group4.shop.entity.SysUserRole;
import com.qf1801.group4.shop.service.UserService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import tk.mybatis.mapper.util.StringUtil;

import java.util.Date;
import java.util.List;
import java.util.UUID;

@Service
public class UserServiceImpl implements UserService {

    /** logger */
    private static final Logger logger = LoggerFactory.getLogger(UserServiceImpl.class);

    @SuppressWarnings("SpringJavaInjectionPointsAutowiringInspection")
    @Autowired
    private SysUserMapper sysUserMapper;
    @SuppressWarnings("SpringJavaInjectionPointsAutowiringInspection")
    @Autowired
    private SysUserRoleMapper sysUserRoleMapper;

    @Override
    public SysUser login(SysUser sysUser) {
        return sysUserMapper.selectUser(sysUser);
    }

    @Override
    public EasyUIPageInfo<SysUser> list(int page, int rows, SysUser sysUser) {
        EasyUIPageInfo<SysUser> sysUserEasyUIPageInfo = new EasyUIPageInfo<>();
        PageHelper.startPage(page, rows);
        List<SysUser> sysUsers = sysUserMapper.selectUsers(sysUser);
        PageInfo<SysUser> sysUserPageInfo = new PageInfo<>(sysUsers);
        sysUserEasyUIPageInfo.setRows(sysUsers);
        sysUserEasyUIPageInfo.setTotal(sysUserPageInfo.getTotal());
        return sysUserEasyUIPageInfo;
    }

    @Override
    public SysUser get(SysUser sysUser) {
        return sysUserMapper.selectOne(sysUser);
    }

    @Override
    public boolean add(SysUser sysUser, String[] roleIds) {
        try {
            sysUser.setId(UUID.randomUUID().toString());
            sysUser.setPassword(Constant.DEFAULT_PASSWORD);
            sysUser.setStatus(Constant.STATUS_VALID);
            sysUser.setCreateTime(new Date());
            sysUserMapper.insert(sysUser);
            if (roleIds != null) {
                for (String roleId : roleIds) {
                    if (StringUtil.isEmpty(roleId)) {
                        continue;
                    }
                    SysUserRole sysUserRole = new SysUserRole();
                    sysUserRole.setId(UUID.randomUUID().toString());
                    sysUserRole.setSysUserId(sysUser.getId());
                    sysUserRole.setSysRoleId(roleId);
                    sysUserRoleMapper.insert(sysUserRole);
                }
            }
            return true;
        } catch (Exception e) {
            logger.error("新增用户失败！", e);
        }

        return false;
    }

    @Override
    public SysUser getUserById(String id) {
        SysUser sysUser = new SysUser();
        sysUser.setId(id);
        return sysUserMapper.selectUser(sysUser);
    }

    @Override
    public boolean update(SysUser sysUser, String[] roleIds) {
        try {
            sysUserMapper.updateByPrimaryKeySelective(sysUser);
            String id = sysUser.getId();
            SysUserRole sysUserRole = new SysUserRole();
            sysUserRole.setSysUserId(id);
            sysUserRoleMapper.delete(sysUserRole);
            if (roleIds != null) {
                for (String roleId : roleIds) {
                    if (StringUtil.isEmpty(roleId)) {
                        continue;
                    }
                    SysUserRole userRole = new SysUserRole();
                    userRole.setId(UUID.randomUUID().toString());
                    userRole.setSysUserId(id);
                    userRole.setSysRoleId(roleId);
                    sysUserRoleMapper.insert(userRole);
                }
            }
            return true;
        } catch (Exception e) {
            logger.error("修改用户失败！", e);
        }
        return false;
    }

    @Override
    public boolean deleteByIds(String ids) {
        try {
            String[] idArray = ids.split(",");
            for (String id : idArray) {
                SysUser sysUser = new SysUser();
                sysUser.setId(id);
                sysUser.setStatus(Constant.STATUS_INVALID);
                sysUserMapper.updateByPrimaryKeySelective(sysUser);
            }
            return true;
        } catch (Exception e) {
            logger.error("修改用户失败！", e);
        }
        return false;
    }
}
