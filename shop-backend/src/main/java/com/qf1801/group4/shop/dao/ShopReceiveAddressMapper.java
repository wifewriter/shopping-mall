package com.qf1801.group4.shop.dao;


import com.qf1801.group4.shop.entity.ShopReceiveAddress;
import org.apache.ibatis.annotations.Select;
import tk.mybatis.mapper.common.Mapper;

import java.util.List;

public interface ShopReceiveAddressMapper extends Mapper<ShopReceiveAddress> {
	@Select("select * from shop_receive_address where sys_user_id=#{sysUserId}")
	List<ShopReceiveAddress> getAddressList(String sysUserId);
	
}
