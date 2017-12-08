package cn.yungou.commons.entity;

public class EasybuyCarDetail {
    private int id;
    private int cid;
    private Integer pid;
    private double price;
    private Integer pnum;
    private EasybuyCar car;
    private EasybuyProduct product;

    @Override
    public String toString() {
        return "EasybuyCarDetail{" +
                "id=" + id +
                ", cid=" + cid +
                ", pid=" + pid +
                ", price=" + price +
                ", pnum=" + pnum +
                ", car=" + car +
                ", product=" + product +
                '}';
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

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getCid() {
        return cid;
    }

    public void setCid(int cid) {
        this.cid = cid;
    }

    public Integer getPid() {
        return pid;
    }

    public void setPid(Integer pid) {
        this.pid = pid;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public Integer getPnum() {
        return pnum;
    }

    public void setPnum(Integer pnum) {
        this.pnum = pnum;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        EasybuyCarDetail carDetail = (EasybuyCarDetail) o;

        if (id != carDetail.id) return false;
        if (cid != carDetail.cid) return false;
        if (Double.compare(carDetail.price, price) != 0) return false;
        if (pid != null ? !pid.equals(carDetail.pid) : carDetail.pid != null) return false;
        if (pnum != null ? !pnum.equals(carDetail.pnum) : carDetail.pnum != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result;
        long temp;
        result = id;
        result = 31 * result + cid;
        result = 31 * result + (pid != null ? pid.hashCode() : 0);
        temp = Double.doubleToLongBits(price);
        result = 31 * result + (int) (temp ^ (temp >>> 32));
        result = 31 * result + (pnum != null ? pnum.hashCode() : 0);
        return result;
    }
}
