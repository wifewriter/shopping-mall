package com.qf1801.group4.shop.entity;

import javax.persistence.Column;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;
import java.math.BigDecimal;

@Table(name = "shop_order_product")
public class ShopOrderProduct {
    @Id
    @GeneratedValue(generator = "JDBC")
    private String id;

    @Column(name = "shop_product_id")
    private String shopProductId;

    @Column(name = "shop_order_id")
    private String shopOrderId;

    private Integer count;

    private BigDecimal subtotal;

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
     * @return shopOrderId
     */
    public String getShopOrderId() {
        return shopOrderId;
    }

    /**
     * @param shopOrderId
     */
    public void setShopOrderId(String shopOrderId) {
        this.shopOrderId = shopOrderId;
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
     * @return subtotal
     */
    public BigDecimal getSubtotal() {
        return subtotal;
    }

    /**
     * @param subtotal
     */
    public void setSubtotal(BigDecimal subtotal) {
        this.subtotal = subtotal;
    }
}