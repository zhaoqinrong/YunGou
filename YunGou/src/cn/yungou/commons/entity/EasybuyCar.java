package cn.yungou.commons.entity;

import java.sql.Timestamp;
import java.util.List;

public class EasybuyCar {
    private int id;
    private Timestamp createTime;
    private Integer uid;
    private Integer status;
    private List<EasybuyCarDetail> carDetailList;
    private List<EasybuyProduct> products;

    @Override
    public String toString() {
        return "EasybuyCar{" +
                "id=" + id +
                ", createTime=" + createTime +
                ", uid=" + uid +
                ", status=" + status +
                ", carDetailList=" + carDetailList +
                ", products=" + products +
                '}';
    }

    public List<EasybuyProduct> getProducts() {
        return products;
    }

    public void setProducts(List<EasybuyProduct> products) {
        this.products = products;
    }

    public List<EasybuyCarDetail> getCarDetailList() {
        return carDetailList;
    }

    public void setCarDetailList(List<EasybuyCarDetail> carDetailList) {
        this.carDetailList = carDetailList;
    }




    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Timestamp getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Timestamp createTime) {
        this.createTime = createTime;
    }

    public Integer getUid() {
        return uid;
    }

    public void setUid(Integer uid) {
        this.uid = uid;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        EasybuyCar car = (EasybuyCar) o;

        if (id != car.id) return false;
        if (createTime != null ? !createTime.equals(car.createTime) : car.createTime != null) return false;
        if (uid != null ? !uid.equals(car.uid) : car.uid != null) return false;
        if (status != null ? !status.equals(car.status) : car.status != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = id;
        result = 31 * result + (createTime != null ? createTime.hashCode() : 0);
        result = 31 * result + (uid != null ? uid.hashCode() : 0);
        result = 31 * result + (status != null ? status.hashCode() : 0);
        return result;
    }
}
