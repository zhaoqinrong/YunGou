package bdqn.entity;

import java.io.Serializable;

public class EasybuyOrderDetail implements Serializable {
    private Integer id;
    private Integer orderid;
    private Integer productid;
    private Integer quantity;
    private Double cost;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getOrderid() {
        return orderid;
    }

    public void setOrderid(int orderid) {
        this.orderid = orderid;
    }

    public int getProductid() {
        return productid;
    }

    public void setProductid(int productid) {
        this.productid = productid;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public double getCost() {
        return cost;
    }

    public void setCost(double cost) {
        this.cost = cost;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public void setOrderid(Integer orderid) {
        this.orderid = orderid;
    }

    public void setProductid(Integer productid) {
        this.productid = productid;
    }

    public void setQuantity(Integer quantity) {
        this.quantity = quantity;
    }

    public void setCost(Double cost) {
        this.cost = cost;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        EasybuyOrderDetail that = (EasybuyOrderDetail) o;

        if (id != null ? !id.equals(that.id) : that.id != null) return false;
        if (orderid != null ? !orderid.equals(that.orderid) : that.orderid != null) return false;
        if (productid != null ? !productid.equals(that.productid) : that.productid != null) return false;
        if (quantity != null ? !quantity.equals(that.quantity) : that.quantity != null) return false;
        return cost != null ? cost.equals(that.cost) : that.cost == null;
    }

    @Override
    public int hashCode() {
        int result = id != null ? id.hashCode() : 0;
        result = 31 * result + (orderid != null ? orderid.hashCode() : 0);
        result = 31 * result + (productid != null ? productid.hashCode() : 0);
        result = 31 * result + (quantity != null ? quantity.hashCode() : 0);
        result = 31 * result + (cost != null ? cost.hashCode() : 0);
        return result;
    }

    public EasybuyOrderDetail(Integer id, Integer orderid, Integer productid, Integer quantity, Double cost) {
        this.id = id;
        this.orderid = orderid;
        this.productid = productid;
        this.quantity = quantity;
        this.cost = cost;
    }

    public EasybuyOrderDetail() {
    }

    @Override
    public String toString() {
        return "EasybuyOrderDetail{" +
                "id=" + id +
                ", orderid=" + orderid +
                ", productid=" + productid +
                ", quantity=" + quantity +
                ", cost=" + cost +
                '}';
    }

}
