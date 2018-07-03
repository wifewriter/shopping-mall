package com.qf1801.group4.shop.service.impl;

import com.qf1801.group4.shop.dao.UserMapper;
import com.qf1801.group4.shop.entity.User;
import com.qf1801.group4.shop.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class UserServiceImpl implements UserService {

    @Autowired
    private UserMapper userMapper;

    @Override
    public List<User> list() {
        return userMapper.selectAll();
    }

    @Override
    public User getUser(Integer id) {
        return userMapper.selectByPrimaryKey(id);
    }

    @Override
    public User get(User user) {
        return userMapper.selectOne(user);
    }

}
