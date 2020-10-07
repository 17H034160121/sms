package cn.cjlu.dao;

import cn.cjlu.dto.CommodityDto;
import cn.cjlu.form.CommodityForm;
import cn.cjlu.form.SearchForm;
import cn.cjlu.global.CommodityType;
import org.apache.ibatis.annotations.*;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface CommodityDao {

    /**
     * Description : 根据搜索条件分页查找商品信息
     * @param page
     * @return
     */
    List<CommodityDto> findByCommodity(SearchForm page);

    /**
     * Description : 根据条件获取总的记录数
     * @param searchForm
     * @return
     */
    int findTotalNum(SearchForm searchForm);

    /**
     * Description : 根据id删除商品
     * @param id
     */
    @Delete("delete from commodity where id = #{id}")
    void deleteById(int id);

    /**
     * Description : 根据id查询商品信息
     * @param id
     * @return
     */
    @Select("select * from commodity where id = #{id}")
    CommodityDto findById(int id);

    /**
     * Description : 增加新的商品
     * @param commodityForm
     * @param type
     */
    @Insert("insert into commodity(name,qrCode,num, description,type,price) values (#{cf.name},#{cf.qrCode},#{cf.num},#{cf.description},#{type},#{cf.price})")
    void save(@Param("cf") CommodityForm commodityForm, @Param("type") CommodityType type);

    /**
     * Description : 修改商品信息
     * @param commodityForm
     * @param type
     */
    @Update("update commodity set name = #{cf.name}, qrCode = #{cf.qrCode}, num = #{cf.num}, description = #{cf.description}, price = #{cf.price}, type = #{type} where id = #{cf.id}")
    void update(@Param("cf") CommodityForm commodityForm, @Param("type") CommodityType type);
}
