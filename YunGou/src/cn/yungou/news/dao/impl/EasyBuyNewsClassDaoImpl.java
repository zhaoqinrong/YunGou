package cn.yungou.news.dao.impl;

import cn.yungou.commons.baseDao.Basedao;
import cn.yungou.commons.entity.EasyBuyNewsClass;
import cn.yungou.commons.entity.Page;
import cn.yungou.commons.util.ResultSetUtil;
import cn.yungou.news.dao.EasyBuyNewsClassDao;

import java.io.Serializable;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

public class EasyBuyNewsClassDaoImpl extends Basedao implements EasyBuyNewsClassDao {
    @Override
    public List getAll() {
        String sql="select * from easybuy_news_class";
        ResultSet query = query(sql);
        List<EasyBuyNewsClass> easyBuyNewsClasses = ResultSetUtil.eachResult(query, EasyBuyNewsClass.class);

        return easyBuyNewsClasses;
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
        String sql="select count(*) from easybuy_news_class";
        return  Basedao.getCount(sql);

    }

    @Override
    public List<EasyBuyNewsClass> getAllByPage(Page<EasyBuyNewsClass> page) {
        String sql="select * from easybuy_news_class limit ?,?";
        Object[] param={page.getPageSize()*(page.getCurrPage()-1),page.getPageSize()};
        ResultSet query = Basedao.query(sql, param);
        List<EasyBuyNewsClass> easyBuyNewsClasses = ResultSetUtil.eachResult(query, EasyBuyNewsClass.class);
        return easyBuyNewsClasses;
    }
}
