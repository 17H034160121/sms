package cn.cjlu.service.impl;

import cn.cjlu.dao.CommodityDao;
import cn.cjlu.dto.CommodityDto;
import cn.cjlu.dto.PageBean;
import cn.cjlu.form.CommodityForm;
import cn.cjlu.form.SearchForm;
import cn.cjlu.global.CommodityType;
import cn.cjlu.global.GlobalConstant;
import cn.cjlu.global.MsgConstant;
import cn.cjlu.service.CommodityService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @create: 2020-10-04 21:49
 */
@Service("commodityService")
public class CommodityServiceImpl implements CommodityService {

    @Autowired
    private CommodityDao commodityDao;

    @Override
    public PageBean findByPage(SearchForm searchForm) {
        List<CommodityDto> allCommodity = commodityDao.findByCommodity(searchForm);
        int totalNum = commodityDao.findTotalNum(searchForm);

        int pageSize = searchForm.getPageNum();
        PageBean page = new PageBean();
        page.setBeanList(allCommodity);
        page.setPageIndex(searchForm.getStartPage());
        page.setPageSize(pageSize);
        page.setTotalRecord(totalNum);
        page.setTotalPage((totalNum % pageSize == 0) ? totalNum / pageSize : totalNum / pageSize + 1);
        return page;
    }

    @Override
    public void deleteById(int id) {
        commodityDao.deleteById(id);
    }

    @Override
    public void delete(int[] list) {
        for (int i = 0; i < list.length; i++) {
            commodityDao.deleteById(list[i]);
        }
    }

    @Override
    public String add(CommodityForm commodityForm) {
        CommodityType type = getType(commodityForm.getQrCode());
        if(type == null){
            return MsgConstant.COMMODITY_TYPE_ERROR;
        }
        commodityDao.save(commodityForm, type);
        return MsgConstant.ADD_COMMODITY_SUCCESS;
    }

    @Override
    public String edit(CommodityForm commodityForm) {
        CommodityType type = getType(commodityForm.getQrCode());
        if(type == null){
            return MsgConstant.COMMODITY_TYPE_ERROR;
        }
        commodityDao.update(commodityForm, type);
        return MsgConstant.EDIT_COMMODITY_SUCCESS;
    }

    private CommodityType getType(String qrCode) {
        if("DL".equals(qrCode.substring(0,2))){
            return CommodityType.DL;
        }else if("FD".equals(qrCode.substring(0,2))){
            return CommodityType.FD;
        }else if("TL".equals(qrCode.substring(0,2))){
            return CommodityType.TL;
        }
        return null;
    }

    @Override
    public CommodityDto findById(int id) {
        return commodityDao.findById(id);
    }
}
