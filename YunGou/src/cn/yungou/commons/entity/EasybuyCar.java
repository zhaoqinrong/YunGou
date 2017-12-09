package cn.yungou.commons.entity;


import java.util.List;

/**
 * 购物车 一个用户对应一个购物车
 */
public class EasybuyCar {
    private Integer id;//购物车id
    private Integer uid;//用户id
    private Integer count=0;//购物车中的总数量
    private float toprice=0;//购物车中的总金额

    public List<EasybuyCarDetail> getCarDetailList() {
        return carDetailList;
    }

    public void setCarDetailList(List<EasybuyCarDetail> carDetailList) {
        this.carDetailList = carDetailList;
    }

    List<EasybuyCarDetail> carDetailList;

    @Override
    public String toString() {
        return "EasybuyCar{" +
                "id=" + id +
                ", uid=" + uid +
                ", count=" + count +
                ", toprice=" + toprice +
                ", carDetailList=" + carDetailList +
                '}';
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getUid() {
        return uid;
    }

    public void setUid(Integer uid) {
        this.uid = uid;
    }

    public Integer getCount() {
        return count;
    }

    public void setCount(Integer count) {
        this.count = count;
    }


    public float getToprice() {
        return toprice;
    }

    public void setToprice(float toprice) {
        this.toprice = toprice;
    }
}
