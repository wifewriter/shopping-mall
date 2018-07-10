package com.qf1801.group4.shop.service;

import com.qf1801.group4.shop.entity.City;
import com.qf1801.group4.shop.entity.Province;

import java.util.List;

public interface AddressService {
    List<Province> getProvences();

    List<City> getCities();
}
