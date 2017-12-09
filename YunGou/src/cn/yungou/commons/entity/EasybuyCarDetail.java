package cn.yungou.commons.entity;

import java.sql.Timestamp;

/**
 * 购物车中的每一项
 */
public class EasybuyCarDetail {
    private Integer id; //主键自动生成
    private Integer cid;//购物车id
    private Integer pid;//商品id
    private Integer pnum;//商品数量
    private float toprice;//商品小计
    private Timestamp createTime;//创建时间
    private Integer status;//商品状态
    private EasybuyProduct product;
    private EasybuyCar car;

    @Override
    public String toString() {
        return "EasybuyCarDetail{" +
                "id=" + id +
                ", cid=" + cid +
                ", pid=" + pid +
                ", pnum=" + pnum +
                ", toprice=" + toprice +
                ", createTime=" + createTime +
                ", status=" + status +
                ", product=" + product +
                ", car=" + car +
                '}';
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getCid() {
        return cid;
    }

    public void setCid(Integer cid) {
        this.cid = cid;
    }

    public Integer getPid() {
        return pid;
    }

    public void setPid(Integer pid) {
        this.pid = pid;
    }

    public Integer getPnum() {
        return pnum;
    }

    public void setPnum(Integer pnum) {
        this.pnum = pnum;
    }

    public float getToprice() {
        return toprice;
    }

    public void setToprice(float toprice) {
        this.toprice = toprice;
    }

    public Timestamp getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Timestamp createTime) {
        this.createTime = createTime;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    public EasybuyProduct getProduct() {
        return product;
    }

    public void setProduct(EasybuyProduct product) {
        this.product = product;
    }

    public EasybuyCar getCar() {
        return car;
    }

    public void setCar(EasybuyCar car) {
        this.car = car;
    }
}
