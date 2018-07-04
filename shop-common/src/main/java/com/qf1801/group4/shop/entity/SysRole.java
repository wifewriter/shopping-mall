package com.qf1801.group4.shop.entity;

import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

@Table(name = "sys_role")
public class SysRole {
    @Id
    @GeneratedValue(generator = "JDBC")
    private String id;

    private String name;

    /**
     * 1、启用；2、禁用
     */
    private Byte status;

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
}