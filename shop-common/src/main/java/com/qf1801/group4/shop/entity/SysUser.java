package com.qf1801.group4.shop.entity;

import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

@Table(name = "sys_user")
public class SysUser {
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
}