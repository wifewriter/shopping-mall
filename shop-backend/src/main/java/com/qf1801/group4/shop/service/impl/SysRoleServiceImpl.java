package com.qf1801.group4.shop.service.impl;

import com.qf1801.group4.shop.common.Constant;
import com.qf1801.group4.shop.dao.SysRoleMapper;
import com.qf1801.group4.shop.dao.SysRoleMenuMapper;
import com.qf1801.group4.shop.entity.SysRole;
import com.qf1801.group4.shop.entity.SysRoleMenu;
import com.qf1801.group4.shop.service.SysRoleService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import tk.mybatis.mapper.entity.Example;
import tk.mybatis.mapper.util.StringUtil;

import java.util.Date;
import java.util.List;
import java.util.UUID;

@Service
public class SysRoleServiceImpl implements SysRoleService {
    /**
     * logger
     */
    private static final Logger logger = LoggerFactory.getLogger(SysRoleServiceImpl.class);

    @SuppressWarnings("SpringJavaInjectionPointsAutowiringInspection")
    @Autowired
    private SysRoleMapper sysRoleMapper;
    @Autowired
    private SysRoleMenuMapper sysRoleMenuMapper;

    @Override
    public List<SysRole> listAll() {
        return sysRoleMapper.selectAll();
    }

    @Override
    public boolean add(SysRole sysRole) {
        sysRole.setId(UUID.randomUUID().toString());
        sysRole.setStatus((byte) Constant.STATUS_VALID);
        sysRole.setCreateTime(new Date());
        return sysRoleMapper.insert(sysRole) > 0 ? true : false;
    }

    @Override
    public boolean deleteByIds(String ids) {
        try {
            String[] idArray = ids.split(",");
            for (String id : idArray) {
                SysRole sysRole = new SysRole();
                sysRole.setId(id);
                sysRole.setStatus(((byte) Constant.STATUS_INVALID));
                sysRoleMapper.updateByPrimaryKeySelective(sysRole);
            }
            return true;
        } catch (Exception e) {
            logger.error("修改用户失败！", e);
        }
        return false;
    }

    @Override
    public SysRole getSysRoleById(String id) {
        SysRole sysRole = new SysRole();
        sysRole.setId(id);
        return sysRoleMapper.selectOne(sysRole);
    }

    @Override
    public boolean validateName(SysRole sysRole) {
        Example example = new Example(SysRole.class);
        Example.Criteria criteria = example.createCriteria();
        String id = sysRole.getId();
        if (StringUtil.isNotEmpty(id)) {
            criteria.andNotEqualTo("id", id);
        }
        String name = sysRole.getName();
        criteria.andEqualTo("name", name);
        SysRole role = sysRoleMapper.selectOneByExample(example);
        return role == null ? true : false;
    }

    @Override
    public boolean update(SysRole sysRole, String[] menuIds) {
        String sysRoleId = sysRole.getId();
        sysRoleMapper.updateByPrimaryKeySelective(sysRole);

        SysRoleMenu sysRoleMenu = new SysRoleMenu();
        sysRoleMenu.setSysRoleId(sysRoleId);
        sysRoleMenuMapper.delete(sysRoleMenu);

        if (menuIds != null) {
            for (String menuId : menuIds) {
                SysRoleMenu roleMenu = new SysRoleMenu();
                roleMenu.setId(UUID.randomUUID().toString());
                roleMenu.setSysMenuId(menuId);
                roleMenu.setSysRoleId(sysRole.getId());
                sysRoleMenuMapper.insert(roleMenu);
            }
        }
        return true;
    }

}
