package cn.cjlu.dto;

import cn.cjlu.global.CommodityOperateType;

import java.io.Serializable;
import java.util.Date;

public class CommodityLogDto implements Serializable {
    private int id;
    private int operatorId;
    private int commodityId;
    private Date date;
    private CommodityOperateType operate;
    private int num;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getOperatorId() {
        return operatorId;
    }

    public void setOperatorId(int operatorId) {
        this.operatorId = operatorId;
    }

    public int getCommodityId() {
        return commodityId;
    }

    public void setCommodityId(int commodityId) {
        this.commodityId = commodityId;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public CommodityOperateType getOperate() {
        return operate;
    }

    public void setOperate(CommodityOperateType operate) {
        this.operate = operate;
    }

    public int getNum() {
        return num;
    }

    public void setNum(int num) {
        this.num = num;
    }
}
