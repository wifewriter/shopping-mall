package com.qf1801.group4.shop.entity;

import javax.persistence.*;
import java.math.BigDecimal;
import java.util.Date;
import java.util.List;

@Table(name = "shop_order")
public class ShopOrder {
    @Id
    @GeneratedValue(generator = "JDBC")
    private String id;

    @Column(name = "sys_user_id")
    private String sysUserId;

    private String receiver;

    private String province;

    private String city;

    private String area;

    private String address;

    private String phone;

    private BigDecimal total;

    private String msg;

    /**
     * 如果不用开发票就指定为空，如果需要开发票就指定发票表的id
     */
    private String ticket;

    @Column(name = "shop_order_product_id")
    private String shopOrderProductId;

    /**
     * 1、未支付；2、支付成功；3、订单取消；4、待发货；5、已发货；6、交易成功
     */
    private Byte state;

    /**
     * 订单刚创建为未支付状态，未支持状态的操作时间等同于订单创建时间
     */
    @Column(name = "state_operate_time")
    private Date stateOperateTime;

    @Column(name = "create_time")
    private Date createTime;

    @Transient
    private List<ShopOrderProduct> shopOrderProducts;

    /**
     * 一个订单有多个商品
     */
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

    /**
     * @return receiver
     */
    public String getReceiver() {
        return receiver;
    }

    /**
     * @param receiver
     */
    public void setReceiver(String receiver) {
        this.receiver = receiver;
    }

    /**
     * @return province
     */
    public String getProvince() {
        return province;
    }

    /**
     * @param province
     */
    public void setProvince(String province) {
        this.province = province;
    }

    /**
     * @return city
     */
    public String getCity() {
        return city;
    }

    /**
     * @param city
     */
    public void setCity(String city) {
        this.city = city;
    }

    /**
     * @return area
     */
    public String getArea() {
        return area;
    }

    /**
     * @param area
     */
    public void setArea(String area) {
        this.area = area;
    }

    /**
     * @return address
     */
    public String getAddress() {
        return address;
    }

    /**
     * @param address
     */
    public void setAddress(String address) {
        this.address = address;
    }

    /**
     * @return phone
     */
    public String getPhone() {
        return phone;
    }

    /**
     * @param phone
     */
    public void setPhone(String phone) {
        this.phone = phone;
    }

    /**
     * @return total
     */
    public BigDecimal getTotal() {
        return total;
    }

    /**
     * @param total
     */
    public void setTotal(BigDecimal total) {
        this.total = total;
    }

    /**
     * @return msg
     */
    public String getMsg() {
        return msg;
    }

    /**
     * @param msg
     */
    public void setMsg(String msg) {
        this.msg = msg;
    }

    /**
     * 获取如果不用开发票就指定为空，如果需要开发票就指定发票表的id
     *
     * @return ticket - 如果不用开发票就指定为空，如果需要开发票就指定发票表的id
     */
    public String getTicket() {
        return ticket;
    }

    /**
     * 设置如果不用开发票就指定为空，如果需要开发票就指定发票表的id
     *
     * @param ticket 如果不用开发票就指定为空，如果需要开发票就指定发票表的id
     */
    public void setTicket(String ticket) {
        this.ticket = ticket;
    }

    /**
     * @return shop_order_product_id
     */
    public String getShopOrderProductId() {
        return shopOrderProductId;
    }

    /**
     * @param shopOrderProductId
     */
    public void setShopOrderProductId(String shopOrderProductId) {
        this.shopOrderProductId = shopOrderProductId;
    }

    /**
     * 获取1、未支付；2、支付成功；3、订单取消；4、待发货；5、已发货；6、交易成功
     *
     * @return state - 1、未支付；2、支付成功；3、订单取消；4、待发货；5、已发货；6、交易成功
     */
    public Byte getState() {
        return state;
    }

    /**
     * 设置1、未支付；2、支付成功；3、订单取消；4、待发货；5、已发货；6、交易成功
     *
     * @param state 1、未支付；2、支付成功；3、订单取消；4、待发货；5、已发货；6、交易成功
     */
    public void setState(Byte state) {
        this.state = state;
    }

    /**
     * 获取订单刚创建为未支付状态，未支持状态的操作时间等同于订单创建时间
     *
     * @return state_operate_time - 订单刚创建为未支付状态，未支持状态的操作时间等同于订单创建时间
     */
    public Date getStateOperateTime() {
        return stateOperateTime;
    }

    /**
     * 设置订单刚创建为未支付状态，未支持状态的操作时间等同于订单创建时间
     *
     * @param stateOperateTime 订单刚创建为未支付状态，未支持状态的操作时间等同于订单创建时间
     */
    public void setStateOperateTime(Date stateOperateTime) {
        this.stateOperateTime = stateOperateTime;
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

    public List<ShopOrderProduct> getShopOrderProducts() {
        return shopOrderProducts;
    }

    public ShopOrder setShopOrderProducts(List<ShopOrderProduct> shopOrderProducts) {
        this.shopOrderProducts = shopOrderProducts;
        return this;
    }

    public List<ShopProduct> getShopProducts() {
        return shopProducts;
    }

    public ShopOrder setShopProducts(List<ShopProduct> shopProducts) {
        this.shopProducts = shopProducts;
        return this;
    }
}