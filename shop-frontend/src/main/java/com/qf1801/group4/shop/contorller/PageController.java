package com.qf1801.group4.shop.contorller;

import com.qf1801.group4.shop.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

@Controller
public class PageController {

    @Autowired
    private ProductService productService;


}
