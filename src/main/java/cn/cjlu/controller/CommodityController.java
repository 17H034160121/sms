package cn.cjlu.controller;

import cn.cjlu.dto.CommodityDto;
import cn.cjlu.dto.PageBean;
import cn.cjlu.form.CommodityForm;
import cn.cjlu.form.SearchForm;
import cn.cjlu.global.MsgConstant;
import cn.cjlu.service.CommodityService;
import cn.cjlu.vo.MessageVo;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;



/**
 * @create: 2020-10-04 21:48
 */
@Controller
@RequestMapping("/commodity")
public class CommodityController {

    @Autowired
    private CommodityService commodityService;

    private static org.apache.log4j.Logger logger = Logger.getLogger(CommodityController.class);

    @RequestMapping(value = "/detail")
    public String detail(Model model){
        logger.info("商品详情无条件查询方法开始");
        SearchForm searchForm = new SearchForm();
        searchForm.setStartPage(1);
        searchForm.setStartIndex(0);
        searchForm.setPageNum(10);
        PageBean pageBean = commodityService.findByPage(searchForm);
        model.addAttribute("page",pageBean);

        return "/back/detail";
    }

    @RequestMapping(value = "/search", method = RequestMethod.POST)
    public ModelAndView search(String name, String qrCode, String description){
        logger.info("商品详情多条件查询方法开始");
        SearchForm searchForm = new SearchForm();
        searchForm.setName(name);
        searchForm.setDescription(description);
        searchForm.setQrCode(qrCode);
        searchForm.setStartPage(1);
        searchForm.setStartIndex(0);
        searchForm.setPageNum(10);
        PageBean pageBean = commodityService.findByPage(searchForm);
        ModelAndView modelAndView = new ModelAndView("/back/detail");
        modelAndView.addObject("page", pageBean);
        return modelAndView;
    }

    @RequestMapping(value = "/delete", method = RequestMethod.POST)
    public String delete(int[] uid, Model model){
        logger.info("删除批量商品方法开始");
        commodityService.delete(uid);

        SearchForm searchForm = new SearchForm();
        searchForm.setStartPage(1);
        searchForm.setStartIndex(0);
        searchForm.setPageNum(10);
        PageBean pageBean = commodityService.findByPage(searchForm);
        model.addAttribute("page",pageBean);
        return "/back/detail";
    }

    @RequestMapping(value = "/move", method = RequestMethod.GET)
    public String move(int index, Model model){
        logger.info("移动指定页数方法开始");
        SearchForm searchForm = new SearchForm();
        searchForm.setStartPage(index);
        searchForm.setStartIndex((index-1)*10);
        searchForm.setPageNum(10);
        PageBean pageBean = commodityService.findByPage(searchForm);
        model.addAttribute("page",pageBean);

        return "/back/detail";
    }

    @RequestMapping(value = "deleteById", method = RequestMethod.GET)
    @ResponseBody
    public MessageVo deleteById(int id){
        logger.info("单条商品删除方法开始");
        commodityService.deleteById(id);
        MessageVo messageVo = new MessageVo();
        messageVo.setMessage(MsgConstant.DELETE_COMMODITY_SUCCESS);
        return messageVo;
    }

    @RequestMapping(value = "/edit", method = RequestMethod.POST)
    @ResponseBody
    public MessageVo edit(@RequestBody CommodityForm commodityForm){
        logger.info("商品增加或者修改方法开始");
        String message = null;
        if(commodityForm.getId() == 0){
            message = commodityService.add(commodityForm);
        }else {
            message = commodityService.edit(commodityForm);
        }
        MessageVo messageVo = new MessageVo();
        messageVo.setMessage(message);
        return messageVo;
    }

    @RequestMapping(value = "/findById", method = RequestMethod.GET)
    @ResponseBody
    public CommodityDto findById(int id){
        logger.info("为编辑信息提供的单条商品查询方法开始");
        return commodityService.findById(id);
    }

}
