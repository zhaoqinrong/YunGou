package cn.yungou.commons.entity;

import java.util.List;

public class Page<T> {
    private Integer pageSize;//页大小
    private Integer total; //总记录数
    private Integer currPage;//当前页
    private Integer pages;//总页数
    private List<T> list; //user or news or pruducts

    public Page() {
    }
    public List<T> getList() {
        return list;
    }
    public void setList(List<T> list) {
        this.list = list;
    }

    public Integer getPageSize() {
        return pageSize;
    }

    public void setPageSize(Integer pageSize) {
        this.pageSize = pageSize;
    }

    public Integer getTotal() {
        return total;
    }

    public void setTotal(Integer total) {
        this.total = total;
    }

    public Integer getPages() {
        return (int)Math.ceil(total*1.0/pageSize);
    }


    public Integer getCurrPage() {
        return currPage;
    }

    public void setCurrPage(Integer currPage) {
        this.currPage = currPage;
    }

    @Override
    public String toString() {
        return "Page{" +
                "pageSize=" + pageSize +
                ", total=" + total +
                ", currPage=" + currPage +
                ", pages=" + pages +
                ", list=" + list +
                '}';
    }
}
