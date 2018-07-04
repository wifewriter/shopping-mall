/**
 * 
 */
package com.qf1801.group4.shop.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import tk.mybatis.mapper.entity.Example;




import com.qf1801.group4.shop.dao.ShopReceiveAddressMapper;
import com.qf1801.group4.shop.dao.SysUserMapper;
import com.qf1801.group4.shop.entity.ShopReceiveAddress;
import com.qf1801.group4.shop.entity.SysUser;
import com.qf1801.group4.shop.service.UserService;

/**
 * @author 王明山
 * @date   2018年7月3日-下午5:53:55
 *
 */
@Service
public class UserServiceImpl implements UserService {
	@Autowired
	private SysUserMapper sysUserMapper;
	@Autowired
	private ShopReceiveAddressMapper shopReceiveAddressMapper;
	@Override
	public SysUser getUser(String userName) {
		Example example = new Example(SysUser.class);
		example.createCriteria().andEqualTo("userName", userName);
		List<SysUser> list = sysUserMapper.selectByExample(example);
		return list.get(0);
	}
	
	public int save(ShopReceiveAddress shopReceiveAddress){
		int row = shopReceiveAddressMapper.insert(shopReceiveAddress);
		return row;
	}
	
	public List<ShopReceiveAddress> getAddressList(String sysUserId){
		List<ShopReceiveAddress> addressList = shopReceiveAddressMapper.getAddressList(sysUserId);
		return addressList;
	}
}
