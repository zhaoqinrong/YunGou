package cn.yungou.commons.entity;

import java.io.Serializable;

/**
 * 商品列表页面,可以按条件查询的分页
 */
public class ProductCondition implements Serializable{
    private Integer categorygoryLevel1;//一级分类
    private Integer categorygoryLevel2;//二级分类
    private Integer categorygoryLevel3;//三级分类
    private String serachWords;//搜索关键字
    private Integer currPage;//当前页

    @Override
    public String toString() {
        return "ProductCondition{" +
                "categorygoryLevel1=" + categorygoryLevel1 +
                ", categorygoryLevel2=" + categorygoryLevel2 +
                ", categorygoryLevel3=" + categorygoryLevel3 +
                ", serachWords='" + serachWords + '\'' +
                ", currPage=" + currPage +
                '}';
    }

    public Integer getCurrPage() {
        return currPage;
    }

    public void setCurrPage(Integer currPage) {
        this.currPage = currPage;
    }

    public ProductCondition() {
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

    public String getSerachWords() {
        return serachWords;
    }

    public void setSerachWords(String serachWords) {
        this.serachWords = serachWords;
    }
}
