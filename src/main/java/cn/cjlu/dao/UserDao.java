package cn.cjlu.dao;

import cn.cjlu.dto.UserDto;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
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
    public List<UserDto> findAll();

    /**
     * Description : 保存新用户信息
     * @param userDto
     */
    @Insert("insert into user(username, password, authority) values (#{username}, #{password}, '2')")
    public void saveUser(UserDto userDto);
}
