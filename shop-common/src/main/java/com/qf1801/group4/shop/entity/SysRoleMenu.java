package com.qf1801.group4.shop.entity;

import javax.persistence.Column;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

@Table(name = "sys_role_menu")
public class SysRoleMenu {
    @Id
    @GeneratedValue(generator = "JDBC")
    private String id;

    @Column(name = "sys_menu_id")
    private String sysMenuId;

    @Column(name = "sys_role_id")
    private String sysRoleId;

    /**
     * @return id
     */
    public String getId() {
        return id;
    }

    /**
     * @param id
     */
    public void setId(String id) {
        this.id = id;
    }

    /**
     * @return sys_menu_id
     */
    public String getSysMenuId() {
        return sysMenuId;
    }

    /**
     * @param sysMenuId
     */
    public void setSysMenuId(String sysMenuId) {
        this.sysMenuId = sysMenuId;
    }

    /**
     * @return sys_role_id
     */
    public String getSysRoleId() {
        return sysRoleId;
    }

    /**
     * @param sysRoleId
     */
    public void setSysRoleId(String sysRoleId) {
        this.sysRoleId = sysRoleId;
    }
}