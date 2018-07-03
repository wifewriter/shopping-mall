package com.qf1801.group4.shop.entity;

import javax.persistence.Column;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

@Table(name = "shop_product_category")
public class ShopProductCategory {
    @Id
    @GeneratedValue(generator = "JDBC")
    private String id;

    private String pid;

    @Column(name = "category_name")
    private String categoryName;

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
     * @return pid
     */
    public String getPid() {
        return pid;
    }

    /**
     * @param pid
     */
    public void setPid(String pid) {
        this.pid = pid;
    }

    /**
     * @return category_name
     */
    public String getCategoryName() {
        return categoryName;
    }

    /**
     * @param categoryName
     */
    public void setCategoryName(String categoryName) {
        this.categoryName = categoryName;
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