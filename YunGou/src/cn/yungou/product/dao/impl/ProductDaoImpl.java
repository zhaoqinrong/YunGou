package cn.yungou.product.dao.impl;

import cn.yungou.commons.baseDao.Basedao;
import cn.yungou.commons.entity.EasybuyProduct;
import cn.yungou.commons.entity.Page;
import cn.yungou.commons.util.ResultSetUtil;
import cn.yungou.product.dao.ProductDao;

import java.io.Serializable;
import java.sql.ResultSet;
import java.sql.SQLException;
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
        return 0;
    }

    @Override
    public int delete(Serializable id) {
        return 0;
    }

    @Override
    public Integer getCount() {
        String sql="select count(*) from easybuy_product";
        ResultSet query = Basedao.query(sql);
        try {
            if(query.next()){
                return query.getInt(1);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
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
}
