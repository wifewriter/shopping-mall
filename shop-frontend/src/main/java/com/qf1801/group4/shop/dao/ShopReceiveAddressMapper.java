package com.qf1801.group4.shop.dao;


import java.util.List;

import org.apache.ibatis.annotations.Select;

import com.qf1801.group4.shop.entity.ShopReceiveAddress;


import tk.mybatis.mapper.common.Mapper;

public interface ShopReceiveAddressMapper extends Mapper<ShopReceiveAddress> {
	@Select("select * from shop_receive_address where sys_user_id=#{sysUserId}")
	List<ShopReceiveAddress> getAddressList(String sysUserId);
	
}
