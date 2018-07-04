package com.qf1801.group4.shop.entity;

import javax.persistence.Column;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;
import java.math.BigDecimal;
import java.util.Date;

@Table(name = "shop_product")
public class ShopProduct {
    @Id
    @GeneratedValue(generator = "JDBC")
    private String id;

    @Column(name = "pic_url")
    private String picUrl;

    /**
     * 1、热销；2、新品；3、普通
     */
    private Byte flag;

    private String name;

    /**
     * 1、有效；2、无效
     */
    private String introduction;

    private BigDecimal price;

    /**
     * 1、推荐商品（显示在顶部并滚动的大图）；2、非推荐商品
     */
    private Byte recommend;

    private Integer number;

    @Column(name = "create_time")
    private Date createTime;

    @Column(name = "shop_product_category_id")
    private String shopProductCategoryId;

    private String description;

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
     * @return pic_url
     */
    public String getPicUrl() {
        return picUrl;
    }

    /**
     * @param picUrl
     */
    public void setPicUrl(String picUrl) {
        this.picUrl = picUrl;
    }

    /**
     * 获取1、热销；2、新品；3、普通
     *
     * @return flag - 1、热销；2、新品；3、普通
     */
    public Byte getFlag() {
        return flag;
    }

    /**
     * 设置1、热销；2、新品；3、普通
     *
     * @param flag 1、热销；2、新品；3、普通
     */
    public void setFlag(Byte flag) {
        this.flag = flag;
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
     * 获取1、有效；2、无效
     *
     * @return introduction - 1、有效；2、无效
     */
    public String getIntroduction() {
        return introduction;
    }

    /**
     * 设置1、有效；2、无效
     *
     * @param introduction 1、有效；2、无效
     */
    public void setIntroduction(String introduction) {
        this.introduction = introduction;
    }

    /**
     * @return price
     */
    public BigDecimal getPrice() {
        return price;
    }

    /**
     * @param price
     */
    public void setPrice(BigDecimal price) {
        this.price = price;
    }

    /**
     * 获取1、推荐商品（显示在顶部并滚动的大图）；2、非推荐商品
     *
     * @return recommend - 1、推荐商品（显示在顶部并滚动的大图）；2、非推荐商品
     */
    public Byte getRecommend() {
        return recommend;
    }

    /**
     * 设置1、推荐商品（显示在顶部并滚动的大图）；2、非推荐商品
     *
     * @param recommend 1、推荐商品（显示在顶部并滚动的大图）；2、非推荐商品
     */
    public void setRecommend(Byte recommend) {
        this.recommend = recommend;
    }

    /**
     * @return number
     */
    public Integer getNumber() {
        return number;
    }

    /**
     * @param number
     */
    public void setNumber(Integer number) {
        this.number = number;
    }

    /**
     * @return create_time
     */
    public Date getCreateTime() {
        return createTime;
    }

    /**
     * @param createTime
     */
    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    /**
     * @return shop_product_category_id
     */
    public String getShopProductCategoryId() {
        return shopProductCategoryId;
    }

    /**
     * @param shopProductCategoryId
     */
    public void setShopProductCategoryId(String shopProductCategoryId) {
        this.shopProductCategoryId = shopProductCategoryId;
    }

    /**
     * @return description
     */
    public String getDescription() {
        return description;
    }

    /**
     * @param description
     */
    public void setDescription(String description) {
        this.description = description;
    }

    @Override
    public String toString() {
        final StringBuilder sb = new StringBuilder("{");
        sb.append("\"id\":\"")
                .append(id).append('\"');
        sb.append(",\"picUrl\":\"")
                .append(picUrl).append('\"');
        sb.append(",\"flag\":")
                .append(flag);
        sb.append(",\"name\":\"")
                .append(name).append('\"');
        sb.append(",\"introduction\":\"")
                .append(introduction).append('\"');
        sb.append(",\"price\":")
                .append(price);
        sb.append(",\"recommend\":")
                .append(recommend);
        sb.append(",\"number\":")
                .append(number);
        sb.append(",\"createTime\":\"")
                .append(createTime).append('\"');
        sb.append(",\"shopProductCategoryId\":\"")
                .append(shopProductCategoryId).append('\"');
        sb.append(",\"description\":\"")
                .append(description).append('\"');
        sb.append('}');
        return sb.toString();
    }
}