package cn.cjlu.dto;

import cn.cjlu.global.UserOperateType;

import java.io.Serializable;
import java.util.Date;

public class UserOperateLogDto implements Serializable {
    private int id;
    private int operatorId;
    private Date date;
    private UserOperateType operate;

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

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public UserOperateType getOperate() {
        return operate;
    }

    public void setOperate(UserOperateType operate) {
        this.operate = operate;
    }
}
