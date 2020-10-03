package cn.cjlu.dto;

import cn.cjlu.global.CommodityOperateType;

import java.io.Serializable;

public class CommodityDto implements Serializable {
    private int id;
    private String name;
    private String qrCode;
    private int num;
    private String description;
    private CommodityOperateType type;
    private double price;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getQrCode() {
        return qrCode;
    }

    public void setQrCode(String qrCode) {
        this.qrCode = qrCode;
    }

    public int getNum() {
        return num;
    }

    public void setNum(int num) {
        this.num = num;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public CommodityOperateType getType() {
        return type;
    }

    public void setType(CommodityOperateType type) {
        this.type = type;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }
}
