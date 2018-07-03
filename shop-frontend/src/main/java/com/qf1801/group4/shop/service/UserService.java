package com.qf1801.group4.shop.service;


import com.qf1801.group4.shop.entity.User;

import java.util.List;

public interface UserService {

    List<User> list();

    User getUser(Integer id);

    User get(User user);
}
