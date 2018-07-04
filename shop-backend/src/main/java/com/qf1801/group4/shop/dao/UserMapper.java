package com.qf1801.group4.shop.dao;

import com.qf1801.group4.shop.entity.User;
import tk.mybatis.mapper.common.Mapper;

public interface UserMapper extends Mapper<User> {
    User getUser(String username, String password);
}