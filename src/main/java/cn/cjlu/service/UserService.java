package cn.cjlu.service;

import cn.cjlu.dto.UserDto;
import cn.cjlu.form.UserForm;

import java.util.List;

/**
 * Description : 用户相关操作service层接口
 */
public interface UserService {

    /**
     * Description : 查找所有用户信息，测试使用
     * @return
     */
    public List<UserDto> findAllUsers();

    /**
     * Description : 注册新用户
     * @return  错误信息
     * @param userForm
     */
    public String registerUser(UserForm userForm);

    /**
     * Description : 检查用户正确性
     * @param userForm
     * @return
     */
    boolean checkUser(UserForm userForm);
}
