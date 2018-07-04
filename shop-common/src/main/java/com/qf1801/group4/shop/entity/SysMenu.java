package com.qf1801.group4.shop.entity;

import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

@Table(name = "sys_menu")
public class SysMenu {
    @Id
    @GeneratedValue(generator = "JDBC")
    private String id;

    /**
     * 指定当前菜单的上一级
     */
    private String pid;

    private String name;

    private String url;

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
     * 获取指定当前菜单的上一级
     *
     * @return pid - 指定当前菜单的上一级
     */
    public String getPid() {
        return pid;
    }

    /**
     * 设置指定当前菜单的上一级
     *
     * @param pid 指定当前菜单的上一级
     */
    public void setPid(String pid) {
        this.pid = pid;
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
     * @return url
     */
    public String getUrl() {
        return url;
    }

    /**
     * @param url
     */
    public void setUrl(String url) {
        this.url = url;
    }
}