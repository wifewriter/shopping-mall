package com.qf1801.group4.shop.entity;

import javax.persistence.*;

@Table(name = "city")
public class City {
    @Id
    @GeneratedValue(generator = "JDBC")
    private Integer id;

    @Column(name = "cityID")
    private String cityid;

    private String city;

    private String father;

    /**
     * @return id
     */
    public Integer getId() {
        return id;
    }

    /**
     * @param id
     */
    public void setId(Integer id) {
        this.id = id;
    }

    /**
     * @return cityID
     */
    public String getCityid() {
        return cityid;
    }

    /**
     * @param cityid
     */
    public void setCityid(String cityid) {
        this.cityid = cityid;
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
     * @return father
     */
    public String getFather() {
        return father;
    }

    /**
     * @param father
     */
    public void setFather(String father) {
        this.father = father;
    }
}