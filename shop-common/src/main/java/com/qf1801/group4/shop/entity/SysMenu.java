package com.qf1801.group4.shop.entity;

import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;
import java.util.ArrayList;
import java.util.List;

@Table(name = "sys_menu")
public class SysMenu {
    @Id
    @GeneratedValue(generator = "JDBC")
    private String id;

    /**
     * 指定当前菜单的上一级
     */
    private String pid;

    private String text;

    private String url;

    private String state;

    private List<SysMenu> children = new ArrayList<>();

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
    public String getText() {
        return text;
    }

    /**
     * @param text
     */
    public void setText(String text) {
        this.text = text;
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

    public String getState() {
        return state;
    }

    public SysMenu setState(String state) {
        this.state = state;
        return this;
    }

    public List<SysMenu> getChildren() {
        return children;
    }

    public SysMenu setChildren(List<SysMenu> children) {
        this.children = children;
        return this;
    }
}