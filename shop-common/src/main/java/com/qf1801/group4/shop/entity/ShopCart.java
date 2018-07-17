package com.qf1801.group4.shop.entity;

import javax.persistence.*;
import java.util.List;

@Table(name = "shop_cart")
public class ShopCart {
    @Id
    @GeneratedValue(generator = "JDBC")
    private String id;

    @Column(name = "shop_product_id")
    private String shopProductId;

    private Integer count;

    @Column(name = "sys_user_id")
    private String sysUserId;

    @Transient
    private List<ShopProduct> shopProducts;

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
     * @return shop_product_id
     */
    public String getShopProductId() {
        return shopProductId;
    }

    /**
     * @param shopProductId
     */
    public void setShopProductId(String shopProductId) {
        this.shopProductId = shopProductId;
    }

    /**
     * @return count
     */
    public Integer getCount() {
        return count;
    }

    /**
     * @param count
     */
    public void setCount(Integer count) {
        this.count = count;
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

    public List<ShopProduct> getShopProducts() {
        return shopProducts;
    }

    public ShopCart setShopProducts(List<ShopProduct> shopProducts) {
        this.shopProducts = shopProducts;
        return this;
    }
}