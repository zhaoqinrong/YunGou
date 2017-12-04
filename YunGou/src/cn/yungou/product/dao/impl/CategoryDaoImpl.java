package cn.yungou.product.dao.impl;

import cn.yungou.commons.baseDao.Basedao;
import cn.yungou.commons.entity.EasybuyProduct;
import cn.yungou.commons.entity.EasybuyProductCategory;
import cn.yungou.commons.util.ResultSetUtil;
import cn.yungou.product.dao.CategoryDao;

import java.io.Serializable;
import java.sql.ResultSet;
import java.util.List;

public class CategoryDaoImpl implements CategoryDao{
    /**
     * 查询所有分类
     * @return
     */
    @Override
    public List<EasybuyProductCategory> findAllLevel(Serializable parentId) {
        String sql=null;
        ResultSet query=null;
        List<EasybuyProductCategory> easybuyProductCategories=null;
        if((int)parentId==0){
            //获取所有的一级标题
           sql="select * from  easybuy_product_category where type=1";
            query = Basedao.query(sql);
        }else{
            //获取所有的2-3及标题
             sql="SELECT e1.`id`,e1.`name`,e1.`parentId`,e1.`type` FROM `easybuy_product_category` e2," +
                    "`easybuy_product_category` e1 WHERE e1.parentId=e2.`id` and e1.parentId=?";
            query = Basedao.query(sql,parentId);
        }

       if(query!=null){

            easybuyProductCategories = ResultSetUtil.eachResult(query, EasybuyProductCategory.class);
       }

        return easybuyProductCategories;
    }

    @Override
    public List<EasybuyProductCategory> getlevel1() {
        String sql="select * from easybuy_product_category where type=1";
        ResultSet query = Basedao.query(sql);
        List<EasybuyProductCategory> easybuyProductCategories = ResultSetUtil.eachResult(query, EasybuyProductCategory.class);
        return easybuyProductCategories;
    }

    @Override
    public List<EasybuyProductCategory> getlevelParentId(Integer parentId) {
    String sql ="select * from easybuy_product_category where parentId=?";
        ResultSet query = Basedao.query(sql, parentId);
        List<EasybuyProductCategory> easybuyProductCategories = ResultSetUtil.eachResult(query, EasybuyProductCategory.class);
        return easybuyProductCategories;
    }


}
