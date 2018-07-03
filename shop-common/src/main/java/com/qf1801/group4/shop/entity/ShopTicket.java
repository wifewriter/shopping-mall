package com.qf1801.group4.shop.entity;

import javax.persistence.Column;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

@Table(name = "shop_ticket")
public class ShopTicket {
    @Id
    @GeneratedValue(generator = "JDBC")
    private String id;

    /**
     * 1、单位；2、个人
     */
    @Column(name = "title_type")
    private Byte titleType;

    private String title;

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
     * 获取1、单位；2、个人
     *
     * @return title_type - 1、单位；2、个人
     */
    public Byte getTitleType() {
        return titleType;
    }

    /**
     * 设置1、单位；2、个人
     *
     * @param titleType 1、单位；2、个人
     */
    public void setTitleType(Byte titleType) {
        this.titleType = titleType;
    }

    /**
     * @return title
     */
    public String getTitle() {
        return title;
    }

    /**
     * @param title
     */
    public void setTitle(String title) {
        this.title = title;
    }
}