package cn.yungou.commons.entity;

import java.io.Serializable;
import java.sql.Timestamp;

public class EasybuyCar implements Serializable{
    private Integer id;//购物车id
    private Integer uid;//用户id
    private Integer pid;//商品id
    private Timestamp createTime; //加入购物车时间
    private Integer pnum;//商品数量
    EasybuyUser user;//用户

    public EasybuyUser getUser() {
        return user;
    }

    public void setUser(EasybuyUser user) {
        this.user = user;
    }

    @Override
    public String toString() {
        return "EasybuyCar{" +
                "id=" + id +
                ", uid=" + uid +
                ", pid=" + pid +
                ", createTime=" + createTime +
                ", pnum=" + pnum +
                ", user=" + user +
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

    public Integer getPid() {
        return pid;
    }

    public void setPid(Integer pid) {
        this.pid = pid;
    }

    public Timestamp getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Timestamp createTime) {
        this.createTime = createTime;
    }

    public Integer getPnum() {
        return pnum;
    }

    public void setPnum(Integer pnum) {
        this.pnum = pnum;
    }
}
