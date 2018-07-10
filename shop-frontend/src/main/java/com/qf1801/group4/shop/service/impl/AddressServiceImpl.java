package com.qf1801.group4.shop.service.impl;

import com.qf1801.group4.shop.dao.CityMapper;
import com.qf1801.group4.shop.dao.ProvinceMapper;
import com.qf1801.group4.shop.entity.City;
import com.qf1801.group4.shop.entity.Province;
import com.qf1801.group4.shop.service.AddressService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class AddressServiceImpl implements AddressService {

    @Autowired
    private ProvinceMapper provinceMapper;
    @Autowired
    private CityMapper cityMapper;

    @Override
    public List<Province> getProvences() {
        return provinceMapper.selectAll();
    }

    @Override
    public List<City> getCities() {
        return cityMapper.selectAll();
    }
}
