package cn.cjlu.controller;

import cn.cjlu.form.UserForm;
import cn.cjlu.global.GlobalConstant;
import cn.cjlu.global.MsgConstant;
import cn.cjlu.service.UserService;
import cn.cjlu.vo.MessageVo;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import sun.plugin2.message.Message;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

/**
 * @create: 2020-10-03 08:53
 */
@Controller
@RequestMapping("/user")
public class UserController {

    @Autowired
    private UserService userService;

    private static Logger logger = Logger.getLogger(UserController.class);

    @RequestMapping(value = "/login", method = RequestMethod.POST)
    @ResponseBody
    public MessageVo login(@RequestBody UserForm userForm, HttpServletRequest request, HttpServletResponse response) {
        logger.info("用户登录方法开始");
        if (userService.findUser(userForm)) {
            //创建cookie并设置一天有效时间
            Cookie cookie = new Cookie(GlobalConstant.ONLINE_COOKIE, userForm.getUsername());
            cookie.setMaxAge(60 * 12);
            response.addCookie(cookie);

            logger.info("用户[" + userForm.getUsername() + "]登录创建当天cookie");

            //将cookie存储到本地服务器作为校验
            HttpSession session = request.getSession();
            session.setAttribute(GlobalConstant.ONLINE_COOKIE, userForm.getUsername());
            logger.info("存储username进入session");

            //重定向到商品管理视图
            try {
                response.sendRedirect(request.getContextPath() + "/commodity/detail");
            } catch (IOException e) {
                e.printStackTrace();
            } finally {
                logger.error("登录重定向出现异常");
            }
        }

        MessageVo returnMessage = new MessageVo();
        returnMessage.setMessage(MsgConstant.LOGIN_ERROR);
        //返回用户错误信息
        return returnMessage;
    }

    @RequestMapping(value = "/register", method = RequestMethod.POST)
    @ResponseBody
    public MessageVo register(@RequestBody UserForm userForm, HttpServletRequest request, HttpServletResponse response) {
        logger.info("开始用户注册方法");
        String message = userService.registerUser(userForm);
        if (message.isEmpty()) {
            logger.info("新用户[" + userForm.getUsername() + "]注册成功");
            try {
                response.sendRedirect(request.getContextPath() + "/login");
            } catch (IOException e) {
                e.printStackTrace();
            } finally {
                logger.error("用户注册重定向出现异常");
            }
            return null;
        }

        MessageVo returnMessage = new MessageVo();
        returnMessage.setMessage(message);
        return returnMessage;
    }

    @RequestMapping(value = "/forget", method = RequestMethod.POST)
    @ResponseBody
    public MessageVo forget(@RequestBody UserForm userForm, HttpServletRequest request, HttpServletResponse response){
        logger.info("开始用户忘记密码方法");
        if(userService.findUser(userForm)){
            //重定向到重置密码页面
            try {
                response.sendRedirect(request.getContextPath() + "/reset");
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
        MessageVo returnMessage = new MessageVo();
        returnMessage.setMessage(MsgConstant.FORGET_CHECK_ERROR);
        return returnMessage;
    }

    @RequestMapping(value = "/reset", method = RequestMethod.POST)
    public String reset(@RequestBody UserForm userForm, HttpServletRequest request, HttpServletResponse response){
        logger.info("开始用户重置密码方法");
        userService.resetPassword(userForm);
        return "/login/login";
    }

}
