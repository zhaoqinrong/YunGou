package cn.yungou.commons.entity;

public class EasyBuyNewsClass {
    private Integer cid;
    private String className;

    public Integer getCid() {
        return cid;
    }

    public void setCid(Integer cid) {
        this.cid = cid;
    }

    public String getClassName() {
        return className;
    }

    public void setClassName(String className) {
        this.className = className;
    }

    public EasyBuyNewsClass() {
    }

    public EasyBuyNewsClass(Integer cid, String className) {
        this.cid = cid;
        this.className = className;
    }

    @Override
    public String toString() {
        return "EasyBuyNewsClass{" +
                "cid=" + cid +
                ", className='" + className + '\'' +
                '}';
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        EasyBuyNewsClass that = (EasyBuyNewsClass) o;

        if (cid != null ? !cid.equals(that.cid) : that.cid != null) return false;
        return className != null ? className.equals(that.className) : that.className == null;
    }

    @Override
    public int hashCode() {
        int result = cid != null ? cid.hashCode() : 0;
        result = 31 * result + (className != null ? className.hashCode() : 0);
        return result;
    }
}
