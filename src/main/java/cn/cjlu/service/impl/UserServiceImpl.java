package cn.cjlu.service.impl;

import cn.cjlu.dao.UserDao;
import cn.cjlu.dto.UserDto;
import cn.cjlu.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @create: 2020-10-03 08:53
 */
@Service("userService")
public class UserServiceImpl implements UserService {

    @Autowired
    private UserDao userDao;

    @Override
    public List<UserDto> findAllUsers() {
        System.out.println("查找所有用户信息");
        return null;
    }

    @Override
    public void registerUser() {

    }
}
