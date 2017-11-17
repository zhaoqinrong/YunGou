package cn.yungou.user.entity;

import java.io.Serializable;
import java.sql.Timestamp;

public class EasybuyOrder implements Serializable {
    private Integer id;
    private Integer userid;
    private String loginname;
    private String useraddress;
    private Timestamp createTime;
    private double cost;
    private Integer status;
    private Integer type;
    private String serialNumber;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getUserid() {
        return userid;
    }

    public void setUserid(Integer userid) {
        this.userid = userid;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    public Integer getType() {
        return type;
    }

    public void setType(Integer type) {
        this.type = type;
    }

    public String getLoginname() {
        return loginname;
    }

    public void setLoginname(String loginname) {
        this.loginname = loginname;
    }

    public String getUseraddress() {
        return useraddress;
    }

    public void setUseraddress(String useraddress) {
        this.useraddress = useraddress;
    }

    public Timestamp getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Timestamp createTime) {
        this.createTime = createTime;
    }

    public double getCost() {
        return cost;
    }

    public void setCost(double cost) {
        this.cost = cost;
    }



    public String getSerialNumber() {
        return serialNumber;
    }

    public void setSerialNumber(String serialNumber) {
        this.serialNumber = serialNumber;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        EasybuyOrder that = (EasybuyOrder) o;

        if (Double.compare(that.cost, cost) != 0) return false;
        if (id != null ? !id.equals(that.id) : that.id != null) return false;
        if (userid != null ? !userid.equals(that.userid) : that.userid != null) return false;
        if (loginname != null ? !loginname.equals(that.loginname) : that.loginname != null) return false;
        if (useraddress != null ? !useraddress.equals(that.useraddress) : that.useraddress != null) return false;
        if (createTime != null ? !createTime.equals(that.createTime) : that.createTime != null) return false;
        if (status != null ? !status.equals(that.status) : that.status != null) return false;
        if (type != null ? !type.equals(that.type) : that.type != null) return false;
        return serialNumber != null ? serialNumber.equals(that.serialNumber) : that.serialNumber == null;
    }

    @Override
    public int hashCode() {
        int result;
        long temp;
        result = id != null ? id.hashCode() : 0;
        result = 31 * result + (userid != null ? userid.hashCode() : 0);
        result = 31 * result + (loginname != null ? loginname.hashCode() : 0);
        result = 31 * result + (useraddress != null ? useraddress.hashCode() : 0);
        result = 31 * result + (createTime != null ? createTime.hashCode() : 0);
        temp = Double.doubleToLongBits(cost);
        result = 31 * result + (int) (temp ^ (temp >>> 32));
        result = 31 * result + (status != null ? status.hashCode() : 0);
        result = 31 * result + (type != null ? type.hashCode() : 0);
        result = 31 * result + (serialNumber != null ? serialNumber.hashCode() : 0);
        return result;
    }

    public EasybuyOrder(Integer id, Integer userid, String loginname, String useraddress, Timestamp createTime, double cost, Integer status, Integer type, String serialNumber) {
        this.id = id;
        this.userid = userid;
        this.loginname = loginname;
        this.useraddress = useraddress;
        this.createTime = createTime;
        this.cost = cost;
        this.status = status;
        this.type = type;
        this.serialNumber = serialNumber;
    }

    public EasybuyOrder() {
    }

    @Override
    public String toString() {
        return "EasybuyOrder{" +
                "id=" + id +
                ", userid=" + userid +
                ", loginname='" + loginname + '\'' +
                ", useraddress='" + useraddress + '\'' +
                ", createTime=" + createTime +
                ", cost=" + cost +
                ", status=" + status +
                ", type=" + type +
                ", serialNumber='" + serialNumber + '\'' +
                '}';
    }
}
