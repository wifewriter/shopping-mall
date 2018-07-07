package com.qf1801.group4.shop.contorller;

import com.qf1801.group4.shop.service.ProductService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("page")
public class PageController {

    /**
     * logger
     */
    private static final Logger LOGGER = LoggerFactory.getLogger(PageController.class);
    public static final int FIST_PAGE_NO = 1;
    public static final int DEFULT_PAGE_SIZE = 5;

    @Autowired
    private ProductService productService;

    @RequestMapping("toMainPage")
    public String toMainPage() {
        return "index";
    }

    @RequestMapping(value = "info/{productId}")
    public String gotoInfoPage(Model model, @PathVariable("productId") String productId) {
        model.addAttribute("productId", productId);
        return "product/info";
    }

    @RequestMapping("productCategory")
    public String gotoProductCategory() {
        return "product/product-category";
    }

    @RequestMapping("{sysUserId}/toOrderList")
    public String gotoOrderList(Model model, @PathVariable("sysUserId") String sysUserId) {
        model.addAttribute("sysUserId", sysUserId);
        return "order/orderList";
    }

}
