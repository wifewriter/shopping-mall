package com.qf1801.group4.shop.contorller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("page")
public class PageController {

    @RequestMapping("main")
    public String toMainPage() {
        return "main";
    }

    @RequestMapping("toLoginPage")
    public String toLoginPage() {
        return "/sys/login";
    }

    @RequestMapping("/{datagram}")
    public String toDatagram(@PathVariable("datagram") String datagram) {
        return "datagram/" + datagram;
    }

}
