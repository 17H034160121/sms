package cn.cjlu.dao;

import cn.cjlu.dto.UserDto;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Description : 用户相关操作
 */
@Repository
public interface UserDao {

    /**
     * Description : 查询所有用户信息，暂时无用，前期测试也留做后期用户管理
     * @return
     */
    @Select("select * from user")
    List<UserDto> findAll();

    /**
     * Description : 保存新用户信息
     * @param userDto
     */
    @Insert("insert into user(username, password, authority) values (#{username}, #{password}, #{authority})")
    void saveUser(UserDto userDto);

    /**
     * Description : 检查用户是否存在
     * @param username
     * @param password
     * @return
     */
    @Select("select count(1) from user where username = #{username} and password = #{password}")
    boolean checkUser(@Param("username") String username, @Param("password") String password);

    /**
     * Description : 检查用户名是否重名
     * @param username
     * @return
     */
    @Select("select count(1) from user where username = #{username}")
    boolean checkUsername(@Param("username") String username);

    /**
     * Description : 重置用户密码
     * @param username
     * @param password
     */
    @Update("update user set password = #{password} where username = #{username}")
    void updatePassword(@Param("username") String username, @Param("password") String password);
}
