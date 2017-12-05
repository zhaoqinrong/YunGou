package cn.yungou.product.dao.impl;

import cn.yungou.commons.baseDao.Basedao;
import cn.yungou.commons.entity.Classify;
import cn.yungou.commons.entity.EasybuyProduct;
import cn.yungou.commons.entity.EasybuyProductCategory;
import cn.yungou.commons.util.ResultSetUtil;
import cn.yungou.product.dao.CategoryDao;

import java.io.Serializable;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class CategoryDaoImpl implements CategoryDao{
    /**
     * 查询所有分类,根据分类级别,不是父类id
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

    /**
     * 获取所有的一级分类
     * @return
     */
    @Override
    public List<EasybuyProductCategory> getlevel1() {
        String sql="select * from easybuy_product_category where type=1";
        ResultSet query = Basedao.query(sql);
        List<EasybuyProductCategory> easybuyProductCategories = ResultSetUtil.eachResult(query, EasybuyProductCategory.class);
        return easybuyProductCategories;
    }

    /**
     * 根据上一级的id来查询下一级的分类
     * @param parentId
     * @return
     */
    @Override
    public List<EasybuyProductCategory> getlevelParentId(Integer parentId) {
    String sql ="select * from easybuy_product_category where parentId=?";
        ResultSet query = Basedao.query(sql, parentId);
        List<EasybuyProductCategory> easybuyProductCategories = ResultSetUtil.eachResult(query, EasybuyProductCategory.class);
        return easybuyProductCategories;
    }

    @Override
    public List<EasybuyProductCategory> getAllByType(Integer i) {
        String sql="select * from easybuy_product_category where type=?";
        ResultSet query = Basedao.query(sql, i);
        return  ResultSetUtil.eachResult(query,EasybuyProductCategory.class);

    }

    /**
     * 传入一级分类的id获取所有二级三级的分类,并封装成为一个list
     * @param parentId
     * @return
     */

    @Override
    public List<Classify<EasybuyProductCategory>> getClassify(Integer parentId) {
        List<Classify<EasybuyProductCategory>> listClass=new ArrayList<>();
        String sql="select * from easybuy_product_category where parentId=?";
        ResultSet query = Basedao.query(sql, parentId);
        List<EasybuyProductCategory> list = ResultSetUtil.eachResult(query, EasybuyProductCategory.class);//获取二级分类
        for (int i = 0; i <list.size() ; i++) {
            Classify<EasybuyProductCategory> classify=new Classify();
            classify.setId(list.get(i).getId());
            classify.setName(list.get(i).getName());
            List<EasybuyProductCategory> list1 = getlevelParentId(list.get(i).getId());//获取的是二级分类
            classify.setChilds(list1);
            listClass.add(classify);
        }
        return listClass;
    }


    @Override
    public List getAll() {
        List<EasybuyProductCategory> list=new ArrayList<>();
        String sql="select * from easybuy_product_category";
        ResultSet query = Basedao.query(sql);
        list= ResultSetUtil.eachResult(query,EasybuyProductCategory.class);
        return list;
    }

    @Override
    public int add(Object o) {
        return 0;
    }

    @Override
    public int update(Object o) {
        return 0;
    }

    @Override
    public int delete(Serializable id) {
        return 0;
    }

    @Override
    public Integer getCount() {
        return null;
    }
}
