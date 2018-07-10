package com.qf1801.group4.shop.contorller;

import com.qf1801.group4.shop.entity.City;
import com.qf1801.group4.shop.entity.Province;
import com.qf1801.group4.shop.entity.ShopOrder;
import com.qf1801.group4.shop.entity.ShopProduct;
import com.qf1801.group4.shop.service.AddressService;
import com.qf1801.group4.shop.service.ShopCartService;
import com.qf1801.group4.shop.service.ShopOrderService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.Date;
import java.util.List;

@Controller
@RequestMapping("order")
@ResponseBody
public class OrderController {

    /**
     * logger
     */
    private static final Logger LOGGER = LoggerFactory.getLogger(OrderController.class);

    @Autowired
    private ShopCartService shopCartService;
    @Autowired
    private ShopOrderService shopOrderService;
    @Autowired
    private AddressService addressService;

    @RequestMapping("getShopProductsByUserId")
    public List<ShopProduct> getShopProductsByUserId(String userId) {
        return shopCartService.getShopCartByUserId(userId);
    }

    @RequestMapping("addOrder")
    public String addOrder(ShopOrder shopOrder, String addressId, String state, HttpSession session) {
        shopOrder.setSysUserId(((String) session.getAttribute("sysUserId")));
        shopOrder.setReceiver(((String) session.getAttribute("username")));
        shopOrder.setCreateTime(new Date());
        shopOrder.setStateOperateTime(new Date());
        shopOrder.setState(Byte.valueOf(state));
        int i = 0;
        try {
            i = shopOrderService.addOrder(shopOrder, addressId);
        } catch (Exception e) {
            e.printStackTrace();
            LOGGER.info(e.getMessage());
            return "库存不足";
        }
        LOGGER.info(String.valueOf(i));
        if (i > 0) {
            return "success";
        }
        return "fail";
    }

    @RequestMapping("getProvences")
    public List<Province> getProvences() {
        return addressService.getProvences();
    }
    @RequestMapping("getCities")
    public List<City> getCities() {
        return addressService.getCities();
    }


}
