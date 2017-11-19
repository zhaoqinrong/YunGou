package bdqn.dao.impl;


import bdqn.dao.EasybuyNewsDao;
import bdqn.dao.baseDao.Basedao;
import bdqn.dao.util.ResultSetUtil;
import bdqn.entity.EasybuyNews;
import org.apache.log4j.Logger;

import java.io.Serializable;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class EasyBuyNewsDaoImpl extends Basedao implements EasybuyNewsDao {
    private static Logger logger = Logger.getLogger(EasyBuyNewsDaoImpl.class);


    @Override
    public List<EasybuyNews> getAll() {
        String sql = "select * from easybuy_news";
        ResultSet query = query(sql);
        List<EasybuyNews> list = new ArrayList<>();
        try {
            list= ResultSetUtil.eachResult(query,EasybuyNews.class);
        } catch (Exception e) {
            logger.error(e + "EasyBuyNewsDaoImpl类中gerAllEasyBuyNews有误");
        } finally {
            closeAll();
        }


        return list;

    }

    @Override
    public int add(EasybuyNews easybuyNews) {
        String sql = "insert into easybuy_news values(?,?,?,?)";
        Object[] params = {easybuyNews.getId(), easybuyNews.getTitle(), easybuyNews.getContent(), easybuyNews.getCreateTime()};
        int rownum = update(sql, params);
        return rownum;
    }

    @Override
    public int update(EasybuyNews easybuyNews) {
        String sql = "update easybuy_news set title=?,content=?,createTime=? where id=?";
        Object[] params={easybuyNews.getTitle(),easybuyNews.getContent(),easybuyNews.getCreateTime(),easybuyNews.getId()};
        int rownum=update(sql,params);
        return rownum;
    }

    @Override
    public int delete(Serializable id) {
        String sql="delete easybuy_news where id=?";
        int num=update(sql,id);
        return num;
    }


}
