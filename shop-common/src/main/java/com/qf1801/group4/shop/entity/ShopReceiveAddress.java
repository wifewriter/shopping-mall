package com.qf1801.group4.shop.entity;

import javax.persistence.Column;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

@Table(name = "shop_receive_address")
public class ShopReceiveAddress {
    @Id
    @GeneratedValue(generator = "JDBC")
    private String id;

    private String receiver;

    private String province;

    private String city;

    private String area;

    private String address;

    private String phone;

    @Column(name = "sys_user_id")
    private String sysUserId;

    /**
     * 1、是；2、否
     */
    @Column(name = "is_default")
    private Byte isDefault;

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
     * 获取1、是；2、否
     *
     * @return is_default - 1、是；2、否
     */
    public Byte getIsDefault() {
        return isDefault;
    }

    /**
     * 设置1、是；2、否
     *
     * @param isDefault 1、是；2、否
     */
    public void setIsDefault(Byte isDefault) {
        this.isDefault = isDefault;
    }
}