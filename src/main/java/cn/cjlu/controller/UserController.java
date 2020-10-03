package cn.cjlu.controller;

import cn.cjlu.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * @create: 2020-10-03 08:53
 */
@Controller
@RequestMapping("/User")
public class UserController {

    @Autowired
    private UserService userService;



}
