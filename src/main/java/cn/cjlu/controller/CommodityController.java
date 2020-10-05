package cn.cjlu.controller;

import cn.cjlu.service.CommodityService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * @create: 2020-10-04 21:48
 */
@Controller
@RequestMapping("/commodity")
public class CommodityController {

    @Autowired
    private CommodityService commodityService;

    @RequestMapping
    public String homePage(){
        return "/back/detail";
    }

}
