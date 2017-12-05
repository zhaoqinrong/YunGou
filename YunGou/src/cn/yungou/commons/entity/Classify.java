package cn.yungou.commons.entity;

import java.util.List;

/**
 * 二级分类
 * @param <T>
 */
public class Classify<T> {
    private String name;
    private Integer id;
    private List<T> childs;//三级分类

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public List<T> getChilds() {
        return childs;
    }

    public void setChilds(List<T> childs) {
        this.childs = childs;
    }

    @Override
    public String toString() {
        return "Classify{" +
                "name='" + name + '\'' +
                ", id=" + id +
                ", childs=" + childs +
                '}';
    }
}
