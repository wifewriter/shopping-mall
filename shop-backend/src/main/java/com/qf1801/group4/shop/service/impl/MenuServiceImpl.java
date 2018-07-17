package com.qf1801.group4.shop.service.impl;

import com.qf1801.group4.shop.common.Constant;
import com.qf1801.group4.shop.dao.SysMenuMapper;
import com.qf1801.group4.shop.entity.SysMenu;
import com.qf1801.group4.shop.service.MenuService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import tk.mybatis.mapper.util.StringUtil;

import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

@Service
public class MenuServiceImpl implements MenuService {

    @Autowired
    private SysMenuMapper sysMenuMapper;

    @Override
    public List<SysMenu> getMenu(String id) {
        return sysMenuMapper.selectMenu(id);
    }

    @Override
    public List<SysMenu> listByPid(String id) {
        return sysMenuMapper.selectMenu(id);
    }

    @Override
    public boolean addMenu(SysMenu sysMenu) {
        sysMenu.setId(UUID.randomUUID().toString());
        String pid = sysMenu.getPid();
        if (StringUtil.isEmpty(pid)) {
            sysMenu.setPid(null);
            sysMenu.setState(Constant.TREE_STATE_CLOSED);
        } else {
            SysMenu sysMenuParent = sysMenuMapper.selectByPrimaryKey(pid);
            sysMenuParent.setState(Constant.TREE_STATE_CLOSED);
            sysMenuMapper.updateByPrimaryKeySelective(sysMenuParent);
            sysMenu.setState(Constant.TREE_STATE_OPEN);
        }
        int row = sysMenuMapper.insert(sysMenu);
        return row == Constant.EFFECT_ONE_ROW ? true : false;
    }

    @Override
    public SysMenu getById(SysMenu sysMenu) {
        return sysMenuMapper.selectByPrimaryKey(sysMenu.getId());
    }

    @Override
    public int update(SysMenu sysMenu) {
        return sysMenuMapper.updateByPrimaryKeySelective(sysMenu);
    }

    @Override
    public int deleteById(String id) {
        return sysMenuMapper.deleteByPrimaryKey(id);
    }

    @Override
    public List<SysMenu> listUserMenu(String userId) {
        List<SysMenu> userMenuList = sysMenuMapper.listUserMenu(userId);

        // 确定顶层菜单
        List<SysMenu> parentUserMenuList = new ArrayList<>();
        for (SysMenu sysMenu : userMenuList) {
            String pid = sysMenu.getPid();
            if (StringUtil.isEmpty(pid)) {
                parentUserMenuList.add(sysMenu);
            }
        }

        // 循环顶层菜单
        for (SysMenu sysMenu : parentUserMenuList) {
            for (SysMenu menu : userMenuList) {
                String pid = menu.getPid();
                if (!StringUtil.isEmpty(pid)) {
                    if (pid.equals(sysMenu.getId())) {
                        menu.setState(Constant.TREE_STATE_OPEN);
                        sysMenu.getChildren().add(menu);
                    } else {
                        continue;
                    }
                }
            }
        }

        // 检查空顶层菜单的情况
        for (SysMenu sysMenu : parentUserMenuList) {
            if (sysMenu.getChildren().size() == 0) {
                sysMenu.setState(Constant.TREE_STATE_OPEN);
            }
        }

        return parentUserMenuList;
    }
}
