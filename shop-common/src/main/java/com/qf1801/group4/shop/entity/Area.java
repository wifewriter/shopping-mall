package com.qf1801.group4.shop.entity;

import javax.persistence.*;

@Table(name = "area")
public class Area {
    @GeneratedValue(generator = "JDBC")
    private Integer id;

    @Column(name = "areaID")
    private String areaid;

    private String area;

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
     * @return areaID
     */
    public String getAreaid() {
        return areaid;
    }

    /**
     * @param areaid
     */
    public void setAreaid(String areaid) {
        this.areaid = areaid;
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