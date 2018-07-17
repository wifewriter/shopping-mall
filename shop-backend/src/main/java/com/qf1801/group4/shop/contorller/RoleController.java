package com.qf1801.group4.shop.contorller;

import com.qf1801.group4.shop.common.JsonResult;
import com.qf1801.group4.shop.entity.SysRole;
import com.qf1801.group4.shop.service.SysRoleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("role")
public class RoleController {

    @Autowired
    private SysRoleService sysRoleService;

    @RequestMapping("listAll")
    public List<SysRole> listAll() {
        return sysRoleService.listAll();
    }

    @RequestMapping("add")
    public boolean add(SysRole sysRole) {
        return sysRoleService.add(sysRole);
    }

    @RequestMapping("deleteByIds")
    public boolean delete(String ids) {
        return sysRoleService.deleteByIds(ids);
    }

    @RequestMapping("getById")
    public JsonResult getById(String id) {
        SysRole sysRole = sysRoleService.getSysRoleById(id);
        if (sysRole == null) {
            return JsonResult.error();
        }
        return JsonResult.success(sysRole);
    }

    @RequestMapping("validateName")
    public boolean validateName(SysRole sysRole) {
        return sysRoleService.validateName(sysRole);
    }

    @RequestMapping("update")
    public boolean update(SysRole sysRole, String[] menuIds) {
        return sysRoleService.update(sysRole, menuIds);
    }
}
