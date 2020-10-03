package cn.cjlu.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * @create: 2020-10-03 15:22
 */
@Controller
public class HomeController {

    @RequestMapping("/")
    public String loginPage(){
        return "/login/index";
    }
}
