package com.qf1801.group4.shop.entity;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

import javax.persistence.*;
import java.io.Serializable;
import java.util.Date;
import java.util.List;

@JsonIgnoreProperties(value = {"handler"})
@Table(name = "sys_role")
public class SysRole implements Serializable {
    private static final long serialVersionUID = -6665390067605697568L;
    @Id
    @GeneratedValue(generator = "JDBC")
    private String id;

    private String name;

    /**
     * 1、启用；2、禁用
     */
    private Byte status;

    @Column(name = "create_time")
    private Date createTime;

    @Transient
    private List<SysUser> sysUsers;

    // 扩展字段
    @Transient
    private List<String> menuIds;

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
     * @return name
     */
    public String getName() {
        return name;
    }

    /**
     * @param name
     */
    public void setName(String name) {
        this.name = name;
    }

    /**
     * 获取1、启用；2、禁用
     *
     * @return status - 1、启用；2、禁用
     */
    public Byte getStatus() {
        return status;
    }

    /**
     * 设置1、启用；2、禁用
     *
     * @param status 1、启用；2、禁用
     */
    public void setStatus(Byte status) {
        this.status = status;
    }

    public List<SysUser> getSysUsers() {
        return sysUsers;
    }

    public SysRole setSysUsers(List<SysUser> sysUsers) {
        this.sysUsers = sysUsers;
        return this;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public SysRole setCreateTime(Date createTime) {
        this.createTime = createTime;
        return this;
    }

    public List<String> getMenuIds() {
        return menuIds;
    }

    public SysRole setMenuIds(List<String> menuIds) {
        this.menuIds = menuIds;
        return this;
    }
}