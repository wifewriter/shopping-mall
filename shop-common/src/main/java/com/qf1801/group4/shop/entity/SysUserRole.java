package com.qf1801.group4.shop.entity;

import javax.persistence.Column;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

@Table(name = "sys_user_role")
public class SysUserRole {
    @Id
    @GeneratedValue(generator = "JDBC")
    private String id;

    @Column(name = "sys_user_id")
    private String sysUserId;

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
     * @return sys_user_id
     */
    public String getSysUserId() {
        return sysUserId;
    }

    /**
     * @param sysUserId
     */
    public void setSysUserId(String sysUserId) {
        this.sysUserId = sysUserId;
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