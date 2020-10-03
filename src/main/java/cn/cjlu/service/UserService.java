package cn.cjlu.service;

import cn.cjlu.dto.UserDto;

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
     */
    public void registerUser();
}
