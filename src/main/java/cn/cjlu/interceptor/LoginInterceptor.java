package cn.cjlu.interceptor;

import cn.cjlu.global.GlobalConstant;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * @create: 2020-10-05 13:17
 */
public class LoginInterceptor implements HandlerInterceptor {
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {

        //获取session中存储的登录cookie
        HttpSession session = request.getSession();
        String cookie = (String) session.getAttribute(GlobalConstant.ONLINE_COOKIE);

        //获取请求中的cookie进行登录匹配
        Cookie[] cookies = request.getCookies();

        //没有cookie则拦截请求
        if(cookie == null || cookies == null){
            request.getRequestDispatcher("/").forward(request, response);
            return false;
        }

        for(int i=0; i< cookies.length; i++){
            Cookie one = cookies[i];
            if(GlobalConstant.ONLINE_COOKIE.equals(one.getName())){
                return true;
            }
        }

        return false;
    }

    @Override
    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception {

    }

    @Override
    public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex) throws Exception {

    }
}
