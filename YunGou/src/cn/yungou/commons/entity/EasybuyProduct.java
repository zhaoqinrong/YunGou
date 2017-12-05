package cn.yungou.commons.entity;

import java.io.Serializable;

public class EasybuyProduct implements Serializable {
    private Integer id;
    private String name;
    private String description;
    private float price;
    private Integer stock;
    private Integer categorygoryLevel1;
    private Integer categorygoryLevel2;
    private Integer categorygoryLevel3;
    private String fileName;
    private Integer isDelete;
    private Integer hotNum;

    public Integer getHotNum() {
        return hotNum;
    }

    public void setHotNum(Integer hotNum) {
        this.hotNum = hotNum;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public void setPrice(float price) {
        this.price = price;
    }

    public float getPrice() {
        return price;
    }

    public Integer getStock() {
        return stock;
    }

    public void setStock(Integer stock) {
        this.stock = stock;
    }

    public Integer getCategorygoryLevel1() {
        return categorygoryLevel1;
    }

    public void setCategorygoryLevel1(Integer categorygoryLevel1) {
        this.categorygoryLevel1 = categorygoryLevel1;
    }

    public Integer getCategorygoryLevel2() {
        return categorygoryLevel2;
    }

    public void setCategorygoryLevel2(Integer categorygoryLevel2) {
        this.categorygoryLevel2 = categorygoryLevel2;
    }

    public Integer getCategorygoryLevel3() {
        return categorygoryLevel3;
    }

    public void setCategorygoryLevel3(Integer categorygoryLevel3) {
        this.categorygoryLevel3 = categorygoryLevel3;
    }

    public String getFileName() {
        return fileName;
    }

    public void setFileName(String fileName) {
        this.fileName = fileName;
    }

    public Integer getIsDelete() {
        return isDelete;
    }

    public void setIsDelete(Integer isDelete) {
        this.isDelete = isDelete;
    }



    public EasybuyProduct() {

    }

    @Override
    public String toString() {
        return "EasybuyProduct{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", description='" + description + '\'' +
                ", price=" + price +
                ", stock=" + stock +
                ", categorygoryLevel1=" + categorygoryLevel1 +
                ", categorygoryLevel2=" + categorygoryLevel2 +
                ", categorygoryLevel3=" + categorygoryLevel3 +
                ", fileName='" + fileName + '\'' +
                ", isDelete=" + isDelete +
                ", hotNum=" + hotNum +
                '}';
    }
}
