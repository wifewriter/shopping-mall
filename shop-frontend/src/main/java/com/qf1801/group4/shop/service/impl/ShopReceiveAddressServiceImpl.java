package com.qf1801.group4.shop.service.impl;

import com.qf1801.group4.shop.dao.ShopReceiveAddressMapper;
import com.qf1801.group4.shop.entity.ShopReceiveAddress;
import com.qf1801.group4.shop.service.ShopReceiveAddressService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import tk.mybatis.mapper.entity.Example;

import java.util.List;

@Service
public class ShopReceiveAddressServiceImpl implements ShopReceiveAddressService {

    @Autowired
    private ShopReceiveAddressMapper shopReceiveAddressMapper;

    @Override
    public List<ShopReceiveAddress> getShopReceiveAddressByUserId(String UserId) {
        Example shopReceiveAddressExample = new Example(ShopReceiveAddress.class);
        Example.Criteria criteria = shopReceiveAddressExample.createCriteria();
        criteria.andEqualTo("sysUserId");
        return shopReceiveAddressMapper.selectByExample(shopReceiveAddressExample);
    }
}
