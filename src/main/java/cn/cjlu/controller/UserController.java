package cn.cjlu.controller;

import cn.cjlu.form.UserForm;
import cn.cjlu.global.MsgConstant;
import cn.cjlu.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * @create: 2020-10-03 08:53
 */
@Controller
@RequestMapping("/User")
public class UserController {

    @Autowired
    private UserService userService;

    @RequestMapping(value = "/login", method = RequestMethod.POST)
    public ModelAndView login(@RequestBody UserForm userForm, HttpServletRequest request, HttpServletResponse response){
        if(userService.checkUser(userForm)){
            //创建cookie并设置一天有效时间
            Cookie cookie = new Cookie("username", userForm.getUsername());
            cookie.setMaxAge(60*12);
            response.addCookie(cookie);

            //将cookie存储到本地服务器作为校验
            HttpSession session = request.getSession();
            session.setAttribute("loginUserCookie", cookie);

            //转发到商品管理视图
            ModelAndView mv = new ModelAndView("forward:/back/detail");
            return mv;
        }

        //出现错误返回到登录视图并传入数据
        ModelAndView mv = new ModelAndView();
        mv.addObject("msg", MsgConstant.LOGIN_ERROR);
        mv.setViewName("/login/login");
        return mv;
    }

    @RequestMapping(value = "/register", method = RequestMethod.POST)
    public ModelAndView register(@RequestBody UserForm userForm){
        String message = userService.registerUser(userForm);
        if(message.isEmpty()){
            ModelAndView mv = new ModelAndView("redirect:/login/login");
            return mv;
        }
        ModelAndView mv = new ModelAndView();
        mv.setViewName("/login/register");
        mv.addObject("msg", message);
        return mv;
    }



}
