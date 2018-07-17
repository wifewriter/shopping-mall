package com.qf1801.group4.shop.entity;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

import javax.persistence.*;
import java.io.Serializable;
import java.util.Date;
import java.util.List;

@JsonIgnoreProperties(value = {"handler"})
@Table(name = "sys_user")
public class SysUser implements Serializable {
    private static final long serialVersionUID = 2585629042935386492L;
    @Id
    @GeneratedValue(generator = "JDBC")
    private String id;
    private String email;
    private String password;
    private String username;

    /**
     * 1、启用；2、禁用
     */
    private Integer status;

    @Transient
    private List<SysRole> sysRoles;
    @Column(name = "create_time")
    private Date createTime;

    public Date getCreateTime() {
        return createTime;
    }

    public SysUser setCreateTime(Date createTime) {
        this.createTime = createTime;

        return this;
    }

    /**
     * @return email
     */
    public String getEmail() {
        return email;
    }

    /**
     * @param email
     */
    public void setEmail(String email) {
        this.email = email;
    }

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
     * @return password
     */
    public String getPassword() {
        return password;
    }

    /**
     * @param password
     */
    public void setPassword(String password) {
        this.password = password;
    }

    /**
     * 获取1、启用；2、禁用
     *
     * @return status - 1、启用；2、禁用
     */
    public Integer getStatus() {
        return status;
    }

    /**
     * 设置1、启用；2、禁用
     *
     * @param status 1、启用；2、禁用
     */
    public void setStatus(Integer status) {
        this.status = status;
    }

    public List<SysRole> getSysRoles() {
        return sysRoles;
    }

    public SysUser setSysRoles(List<SysRole> sysRoles) {
        this.sysRoles = sysRoles;

        return this;
    }

    /**
     * @return username
     */
    public String getUsername() {
        return username;
    }

    /**
     * @param username
     */
    public void setUsername(String username) {
        this.username = username;
    }
}


//~ Formatted by Jindent --- http://www.jindent.com
