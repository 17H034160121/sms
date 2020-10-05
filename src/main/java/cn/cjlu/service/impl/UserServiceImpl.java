package cn.cjlu.service.impl;

import cn.cjlu.dao.UserDao;
import cn.cjlu.dto.UserDto;
import cn.cjlu.form.UserForm;
import cn.cjlu.global.GlobalConstant;
import cn.cjlu.global.MsgConstant;
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
    public String registerUser(UserForm userForm) {
        if(userDao.checkUsername(userForm.getUsername())){
            return MsgConstant.USERNAME_ERROR;
        }
        UserDto userDto = new UserDto();
        userDto.setUsername(userForm.getUsername());
        userDto.setPassword(userForm.getPassword());
        userDto.setAuthority(GlobalConstant.DEFAULT_USER_AUTHORITY);
        userDao.saveUser(userDto);
        return "";
    }

    @Override
    public boolean findUser(UserForm userForm) {
        return userDao.checkUser(userForm.getUsername(), userForm.getPassword());
    }

    @Override
    public void resetPassword(UserForm userForm) {
        userDao.updatePassword(userForm.getUsername(),userForm.getPassword());
    }
}
