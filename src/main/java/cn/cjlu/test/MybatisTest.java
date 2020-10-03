package cn.cjlu.test;

import cn.cjlu.dao.UserDao;
import cn.cjlu.dto.UserDto;
import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import org.junit.After;
import org.junit.Before;
import org.junit.Test;

import java.io.IOException;
import java.io.InputStream;
import java.util.List;

/**
 * @create: 2020-10-03 10:57
 */
public class MybatisTest {

    private InputStream in;
    private SqlSession sqlSession;

    @Before
    public void getConnection() throws IOException {
        in = Resources.getResourceAsStream("SqlMapConfig.xml");
        SqlSessionFactory sqlSessionFactory = new SqlSessionFactoryBuilder().build(in);
        sqlSession = sqlSessionFactory.openSession();
    }

    @After
    public void close() throws IOException {
        sqlSession.close();
        in.close();
    }

    @Test
    public void connectionTest(){
        UserDao dao = sqlSession.getMapper(UserDao.class);
        List<UserDto> all = dao.findAll();
        for (UserDto one : all) {
            System.out.println(one.getUsername());
        }
    }

    @Test
    public void saveTest(){
        UserDao dao = sqlSession.getMapper(UserDao.class);
        UserDto userDto = new UserDto();
        userDto.setUsername("cct001");
        userDto.setPassword("123456");
        dao.saveUser(userDto);
        sqlSession.commit();
    }
}
