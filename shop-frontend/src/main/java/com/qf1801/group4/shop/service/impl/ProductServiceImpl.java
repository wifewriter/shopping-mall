package com.qf1801.group4.shop.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.qf1801.group4.shop.dao.ShopProductMapper;
import com.qf1801.group4.shop.entity.ShopProduct;
import com.qf1801.group4.shop.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import tk.mybatis.mapper.entity.Example;

import java.util.List;
import java.util.Map;
import java.util.Set;

@Service
public class ProductServiceImpl implements ProductService {

    @Autowired
    private ShopProductMapper shopProductMapper;

    @Override
    public PageInfo get(int pageNo, int pagSize, Map<String, Object> params) {
        Example e = new Example(ShopProduct.class);
        Example.Criteria c = e.createCriteria();
        if (params != null) {
            //关键字查询部分
            Set<String> keySet = params.keySet();
            for (String key : keySet) {
                // 非id的字符串用模糊查询
                if (key.contains("String")&& !key.contains("id") && !key.contains("Id")) {
                    c.andLike(key, ((String) params.get(key)));
                } else {
                    c.andEqualTo(key, params.get(key));
                }
            }
        }
        e.and(c);
        e.setOrderByClause("flag");
        PageHelper.startPage(pageNo, pagSize);
        List<ShopProduct> shopProducts = shopProductMapper.selectByExample(e);
        return new PageInfo(shopProducts);
    }

    @Override
    public List<ShopProduct> getRecommendProducts() {
        Example e = new Example(ShopProduct.class);
        Example.Criteria criteria = e.createCriteria();
        criteria.andEqualTo("recommend", 1);
        e.and(criteria);
        return shopProductMapper.selectByExample(e);
    }

    @Override
    public ShopProduct getOne(String id) {
        return shopProductMapper.selectByPrimaryKey(id);
    }
}
