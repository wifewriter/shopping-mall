package com.qf1801.group4.shop.contorller;

import com.github.pagehelper.PageInfo;
import com.qf1801.group4.shop.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("page")
public class PageController {

    @Autowired
    private ProductService productService;

    public String mainPage(Model model,int pageNo,int pageSize) {
        PageInfo pageInfo = productService.get(pageNo, pageSize, null);
        model.addAttribute("pageInfo",pageInfo);
        return "index";
    }

}
