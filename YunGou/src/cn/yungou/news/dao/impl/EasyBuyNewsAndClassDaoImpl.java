package cn.yungou.news.dao.impl;

import cn.yungou.commons.baseDao.Basedao;
import cn.yungou.commons.constant.Constant;
import cn.yungou.commons.entity.EasyBuyNewsAndClass;
import cn.yungou.commons.entity.Page;
import cn.yungou.commons.util.ResultSetUtil;
import cn.yungou.news.dao.EasyBuyNewsAndClassDao;

import java.io.Serializable;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;


public  class EasyBuyNewsAndClassDaoImpl extends Basedao implements EasyBuyNewsAndClassDao{
    @Override
    public List<EasyBuyNewsAndClass> getAll() {
        String sql = "select id,title,content,createTime,classid,cid,className ,img from easybuy_news,easybuy_news_class where easybuy_news.classid=easybuy_news_class.cid";
        ResultSet query = query(sql);
        List<EasyBuyNewsAndClass> list = new ArrayList<>();
        try {
            list= ResultSetUtil.eachResult(query, EasyBuyNewsAndClass.class);
        } catch (Exception e) {
            Constant.LOGGER.error(e + "EasyBuyNewsDaoImpl类中gerAllEasyBuyNews有误");
        }


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

    @Override
    public EasyBuyNewsAndClass getNewsBuyId(Serializable id) {
        String sql = "select id,title,content,createTime,classid,cid,className from easybuy_news,easybuy_news_class where easybuy_news.classid=easybuy_news_class.cid and id=?";
        ResultSet query = query(sql,id);
        EasyBuyNewsAndClass easyBuyNewsAndClass=null;
        easyBuyNewsAndClass = ResultSetUtil.findOne(query, EasyBuyNewsAndClass.class);
        return easyBuyNewsAndClass;
    }

    @Override
    public List<EasyBuyNewsAndClass> getAllByPage(Page<EasyBuyNewsAndClass> page) {
        String sql = "select id,title,content,createTime,classid,cid,className ,img from easybuy_news,easybuy_news_class where easybuy_news.classid=easybuy_news_class.cid limit ?,?";
        Object[] param={page.getPageSize()*(page.getCurrPage()-1),page.getPageSize()};
        ResultSet query = query(sql,param);
        List<EasyBuyNewsAndClass> newsAndClasses = ResultSetUtil.eachResult(query, EasyBuyNewsAndClass.class);
        return newsAndClasses;
    }
}
