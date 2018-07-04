package com.qf1801.group4.shop.common;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import tk.mybatis.mapper.common.Mapper;

import java.util.List;

public abstract class CommonService<T> {

    @Autowired
    private Mapper<T> mapper;

    public int add(T t) {
        return mapper.insert(t);
    }

    public int delete(T t) {
        return mapper.delete(t);
    }

    public int deleteById(Object id) {
        return mapper.deleteByPrimaryKey(id);
    }

    public int update(T t) {
        return mapper.updateByPrimaryKeySelective(t);
    }

    public List<T> list(T t) {
        return mapper.select(t);
    }

    public List<T> listAll() {
        return mapper.selectAll();
    }

    public PageInfo<T> listByPage(T t, int pageNo, int pageSize) {
        PageHelper.startPage(pageNo, pageSize);
        List<T> list = mapper.select(t);
        PageInfo<T> pageInfo = new PageInfo<T>(list);
        return pageInfo;
    }

    public PageInfo<T> listAllByPage(int pageNo, int pageSize) {
        PageHelper.startPage(pageNo, pageSize);
        List<T> list = mapper.selectAll();
        PageInfo<T> pageInfo = new PageInfo<T>(list);
        return pageInfo;
    }

    public T getById(Object id) {
        return mapper.selectByPrimaryKey(id);
    }

    public T get(T t) {
        return mapper.selectOne(t);
    }

    public int getCount(T t) {
        return mapper.selectCount(t);
    }

    public int getCount() {
        return mapper.selectCount(null);
    }

    // ...
}
