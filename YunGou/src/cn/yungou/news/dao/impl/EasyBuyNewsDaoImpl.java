package cn.yungou.news.dao.impl;


import cn.yungou.commons.baseDao.Basedao;
import cn.yungou.commons.constant.Constant;
import cn.yungou.commons.entity.EasybuyNews;
import cn.yungou.commons.util.ResultSetUtil;
import cn.yungou.news.dao.EasybuyNewsDao;

import java.io.Serializable;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class EasyBuyNewsDaoImpl extends Basedao implements EasybuyNewsDao {


    @Override
    public List<EasybuyNews> getAll() {
        String sql = "select * from easybuy_news";
        ResultSet query = query(sql);
        List<EasybuyNews> list = new ArrayList<>();
        try {
            list= ResultSetUtil.eachResult(query,EasybuyNews.class);
        } catch (Exception e) {
            Constant.LOGGER.error(e + "EasyBuyNewsDaoImpl类中gerAllEasyBuyNews有误");
        }


        return list;

    }

    @Override
    public int add(EasybuyNews easybuyNews) {
        String sql = "insert into easybuy_news values(?,?,?,?,?,?)";
        Object[] params = {easybuyNews.getId(), easybuyNews.getTitle(), easybuyNews.getContent(), easybuyNews.getCreateTime(),easybuyNews.getClassid(),easybuyNews.getImg()};
        int rownum = update(sql, params);
        return rownum;
    }

    @Override
    public int update(EasybuyNews easybuyNews) {
        String sql = "update easybuy_news set title=?,content=?,createTime=? ,classid=?,img=? where id=?";
        Object[] params={easybuyNews.getTitle(),easybuyNews.getContent(),easybuyNews.getCreateTime(),easybuyNews.getClassid(),easybuyNews.getImg(),easybuyNews.getId()};
        int rownum=update(sql,params);
        return rownum;
    }

    @Override
    public int delete(Serializable id) {
        String sql="delete easybuy_news where id=?";
        int num=update(sql,id);
        return num;
    }


    @Override
    public Integer getCount() {
        String sql="select count(*) from  easybuy_news";
        return Basedao.getCount(sql);
    }
}
