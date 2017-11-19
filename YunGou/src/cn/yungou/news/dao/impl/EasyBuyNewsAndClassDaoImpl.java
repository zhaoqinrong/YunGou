package cn.yungou.news.dao.impl;

import cn.yungou.commons.baseDao.Basedao;
import cn.yungou.commons.entity.EasyBuyNewsAndClass;
import cn.yungou.commons.util.ResultSetUtil;
import cn.yungou.news.dao.EasyBuyNewsAndClassDao;

import java.io.Serializable;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;


public class EasyBuyNewsAndClassDaoImpl extends Basedao implements EasyBuyNewsAndClassDao{
    private static org.apache.log4j.Logger logger= org.apache.log4j.Logger.getLogger(EasyBuyNewsAndClassDaoImpl.class);
    @Override
    public List<EasyBuyNewsAndClass> getAll() {
        String sql = "select id,title,content,createTime,classid,cid,className from easybuy_news,easybuy_news_class where easybuy_news.classid=easybuy_news_class.cid";
        ResultSet query = query(sql);
        List<EasyBuyNewsAndClass> list = new ArrayList<>();
        try {
            list= ResultSetUtil.eachResult(query, EasyBuyNewsAndClass.class);
        } catch (Exception e) {
            logger.error(e + "EasyBuyNewsDaoImpl类中gerAllEasyBuyNews有误");
        }


        return list;

    }

    @Override
    public EasyBuyNewsAndClass getNewsBuyId(Serializable id) {
        String sql = "select id,title,content,createTime,classid,cid,className from easybuy_news,easybuy_news_class where easybuy_news.classid=easybuy_news_class.cid and id=?";
        ResultSet query = query(sql,id);
        EasyBuyNewsAndClass easyBuyNewsAndClass=null;
        easyBuyNewsAndClass = ResultSetUtil.findOne(query, EasyBuyNewsAndClass.class);
        return easyBuyNewsAndClass;
    }
}
