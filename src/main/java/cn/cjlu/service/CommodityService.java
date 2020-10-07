package cn.cjlu.service;

import cn.cjlu.dto.CommodityDto;
import cn.cjlu.dto.PageBean;
import cn.cjlu.form.CommodityForm;
import cn.cjlu.form.SearchForm;

import java.util.List;

public interface CommodityService {
    /**
     * Description : 分页多条件组合查找
     * @param page
     * @return
     */
    PageBean findByPage(SearchForm page);

    /**
     * Description : 根据id删除商品
     * @param id
     */
    void deleteById(int id);

    /**
     * Description : 批量删除商品
     * @param list
     */
    void delete(int[] list);

    /**
     * Description : 增加商品
     * @param commodityForm
     */
    String add(CommodityForm commodityForm);

    /**
     * Description : 修改商品
     * @param commodityForm
     */
    String edit(CommodityForm commodityForm);

    /**
     * Description : 根据id查找商品
     * @param id
     * @return
     */
    CommodityDto findById(int id);
}
