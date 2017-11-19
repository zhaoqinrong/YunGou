package cn.yungou.commons.entity;

import java.io.Serializable;

public class EasybuyProduct implements Serializable {
    private Integer id;
    private String name;
    private String description;
    private Double price;
    private Integer stock;
    private Integer categorygoryLevel1;
    private Integer categorygoryLevel2;
    private Integer categorygoryLevel3;
    private String fileName;
    private Integer isDelete;

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

    public Double getPrice() {
        return price;
    }

    public void setPrice(Double price) {
        this.price = price;
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

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        EasybuyProduct that = (EasybuyProduct) o;

        if (id != null ? !id.equals(that.id) : that.id != null) return false;
        if (name != null ? !name.equals(that.name) : that.name != null) return false;
        if (description != null ? !description.equals(that.description) : that.description != null) return false;
        if (price != null ? !price.equals(that.price) : that.price != null) return false;
        if (stock != null ? !stock.equals(that.stock) : that.stock != null) return false;
        if (categorygoryLevel1 != null ? !categorygoryLevel1.equals(that.categorygoryLevel1) : that.categorygoryLevel1 != null)
            return false;
        if (categorygoryLevel2 != null ? !categorygoryLevel2.equals(that.categorygoryLevel2) : that.categorygoryLevel2 != null)
            return false;
        if (categorygoryLevel3 != null ? !categorygoryLevel3.equals(that.categorygoryLevel3) : that.categorygoryLevel3 != null)
            return false;
        if (fileName != null ? !fileName.equals(that.fileName) : that.fileName != null) return false;
        return isDelete != null ? isDelete.equals(that.isDelete) : that.isDelete == null;
    }

    @Override
    public int hashCode() {
        int result = id != null ? id.hashCode() : 0;
        result = 31 * result + (name != null ? name.hashCode() : 0);
        result = 31 * result + (description != null ? description.hashCode() : 0);
        result = 31 * result + (price != null ? price.hashCode() : 0);
        result = 31 * result + (stock != null ? stock.hashCode() : 0);
        result = 31 * result + (categorygoryLevel1 != null ? categorygoryLevel1.hashCode() : 0);
        result = 31 * result + (categorygoryLevel2 != null ? categorygoryLevel2.hashCode() : 0);
        result = 31 * result + (categorygoryLevel3 != null ? categorygoryLevel3.hashCode() : 0);
        result = 31 * result + (fileName != null ? fileName.hashCode() : 0);
        result = 31 * result + (isDelete != null ? isDelete.hashCode() : 0);
        return result;
    }

    public EasybuyProduct(Integer id, String name, String description, Double price, Integer stock, Integer categorygoryLevel1, Integer categorygoryLevel2, Integer categorygoryLevel3, String fileName, Integer isDelete) {
        this.id = id;
        this.name = name;
        this.description = description;
        this.price = price;
        this.stock = stock;
        this.categorygoryLevel1 = categorygoryLevel1;
        this.categorygoryLevel2 = categorygoryLevel2;
        this.categorygoryLevel3 = categorygoryLevel3;
        this.fileName = fileName;
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
                '}';
    }
}
