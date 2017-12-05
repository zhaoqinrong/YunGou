package cn.yungou.product.dao.impl;

import cn.yungou.commons.baseDao.Basedao;
import cn.yungou.commons.constant.Constant;
import cn.yungou.commons.entity.EasybuyProduct;
import cn.yungou.commons.entity.Page;
import cn.yungou.commons.entity.ProductCondition;
import cn.yungou.commons.util.ResultSetUtil;
import cn.yungou.product.dao.ProductDao;

import java.io.Serializable;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.List;

public class ProductDaoImpl implements ProductDao {
    @Override
    public List getAll() {
        return null;
    }

    @Override
    public int add(Object o) {
        String sql="insert into easybuy_product values(?,?,?,?,?,?,?,?,?,?)";
        EasybuyProduct product = (EasybuyProduct) o;
        Object[] param={product.getId(),product.getName(),product.getDescription(),
                product.getPrice(),product.getStock(),product.getCategorygoryLevel1()
                ,product.getCategorygoryLevel2(),product.getCategorygoryLevel3()
                ,product.getFileName(),product.getIsDelete()};

        return Basedao.update(sql,param);
    }

    @Override
    public int update(Object o) {
        EasybuyProduct product = (EasybuyProduct) o;
        Constant.LOGGER.debug("商品"+product);
        String sql="update easybuy_product set `name`=?,`description`=?,`price`=?,stock=?,categorygoryLevel1=?," +
                "categorygoryLevel2=?,categorygoryLevel3=?,fileName=?,isDelete=? where id=?";
        Object[] param={product.getName(),product.getDescription(),product.getPrice(),product.getStock(),product.getCategorygoryLevel1()
        ,product.getCategorygoryLevel2(),product.getCategorygoryLevel3(),product.getFileName(),product.getIsDelete(),product.getId()};
        int query = Basedao.update(sql, param);
        return query;
    }

    @Override
    public int delete(Serializable id) {
        return 0;
    }

    @Override
    public Integer getCount() {
        String sql="select count(*) from easybuy_product";
        ResultSet query = Basedao.query(sql);

        return ResultSetUtil.getInt(query);
    }

    @Override
    public Page<EasybuyProduct> getAllByPage(Page page) {
        String sql="select * from easybuy_product limit ?,?";
        Object[] param={page.getPageSize()*(page.getCurrPage()-1),page.getPageSize()};
        ResultSet query = Basedao.query(sql, param);
        List<EasybuyProduct> easybuyProducts = ResultSetUtil.eachResult(query, EasybuyProduct.class);
        page.setList(easybuyProducts);
        return page;
    }

    @Override
    public Page<EasybuyProduct> getProductBycondition(ProductCondition pc, Page<EasybuyProduct> page) {
        StringBuffer sb=new StringBuffer("select * from easybuy_product where 1=1");
        List<Object> list=new ArrayList<>();
       if(pc.getCategorygoryLevel1()!=null&&pc.getCategorygoryLevel1()!=0){
           sb.append(" and categorygoryLevel1=?");
           list.add(pc.getCategorygoryLevel1());
       }
       if(pc.getCategorygoryLevel2()!=null&&pc.getCategorygoryLevel2()!=0){
           sb.append(" and categorygoryLevel2=?");
           list.add(pc.getCategorygoryLevel2());
       }
       if(pc.getCategorygoryLevel3()!=null&&pc.getCategorygoryLevel3()!=0){
           sb.append(" and categorygoryLevel3=?");
           list.add(pc.getCategorygoryLevel3());

       }
       if(pc.getSerachWords()!=null&&!"".equals(pc.getSerachWords().trim())){
           sb.append(" and  `name` like concat('%',?,'%')");
           list.add(pc.getSerachWords());
       }
       sb.append(" limit ?,?");
       Constant.LOGGER.debug("sql语句"+sb);

        Constant.LOGGER.debug("page"+page);
       list.add(page.getPageSize()*(page.getCurrPage()-1));
       list.add(page.getPageSize());
        Object[] objects = list.toArray();
        Constant.LOGGER.debug("list"+list);
        ResultSet query = Basedao.query(sb.toString(), objects);
        List<EasybuyProduct> list1 = ResultSetUtil.eachResult(query, EasybuyProduct.class);
        page.setList(list1);

        return page;
    }

    @Override
    public Integer getCountByContion(ProductCondition pc) {
        StringBuffer sb=new StringBuffer("select count(*) from easybuy_product where 1=1");
        List<Object> list=new ArrayList<>();
        if(pc.getCategorygoryLevel1()!=null&&pc.getCategorygoryLevel1()!=0){
            sb.append(" and categorygoryLevel1=?");
            list.add(pc.getCategorygoryLevel1());
        }
        if(pc.getCategorygoryLevel2()!=null&&pc.getCategorygoryLevel2()!=0){
            sb.append(" and categorygoryLevel2=?");
            list.add(pc.getCategorygoryLevel2());
        }
        if(pc.getCategorygoryLevel3()!=null&&pc.getCategorygoryLevel3()!=0){
            sb.append(" and categorygoryLevel3=?");
            list.add(pc.getCategorygoryLevel3());

        }
        if(pc.getSerachWords()!=null&&!"".equals(pc.getSerachWords().trim())){
            sb.append(" and  `name` like concat('%',?,'%')");
            list.add(pc.getSerachWords());
        }
        Constant.LOGGER.debug("sql查询总条数的语句"+sb);
        ResultSet query = Basedao.query(sb.toString(), list.toArray());
      return ResultSetUtil.getInt(query);
    }

    @Override
    public EasybuyProduct getProductByid(Integer id) {
        String  sql="select * from easybuy_product where id=?";
        ResultSet query = Basedao.query(sql, id);
        EasybuyProduct product = ResultSetUtil.findOne(query, EasybuyProduct.class);
        return product;
    }


}
