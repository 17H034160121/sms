package cn.cjlu.test;

import cn.cjlu.service.UserService;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

/**
 * @create: 2020-10-03 09:02
 */
public class SpringTest {

    @Test
    public void beanCheck(){
        ApplicationContext applicationContext = new ClassPathXmlApplicationContext("classpath:DEV/applicationContext.xml");
        UserService userService = (UserService) applicationContext.getBean("userService");
        userService.findAllUsers();
    }
}
