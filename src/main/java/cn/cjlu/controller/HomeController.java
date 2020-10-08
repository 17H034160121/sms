package cn.cjlu.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * @create: 2020-10-03 15:22
 */
@Controller
public class HomeController {

    @RequestMapping("/")
    public String homePage(){
        return "/login/login";
    }          

    @RequestMapping("/login")
    public String loginPage(){
        return "/login/login";
    }

    @RequestMapping("/register")
    public String registerPage(){
        return "/login/register";
    }

    @RequestMapping("/reset")
    public String resetPage(){
        return "/login/reset";
    }

    @RequestMapping("/forget")
    public String forgetPage(){
        return "/login/forget";
    }
}
