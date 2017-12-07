package cn.yungou.user.dao.impl;


import cn.yungou.commons.baseDao.Basedao;
import cn.yungou.commons.entity.EasybuyUser;
import cn.yungou.commons.entity.Page;
import cn.yungou.commons.util.ResultSetUtil;
import cn.yungou.user.dao.EasybuyUserDao;

import java.io.Serializable;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

public class EasybuyUserDaoImpl extends Basedao implements EasybuyUserDao {
    @Override
    public List<EasybuyUser> getAll() {
        String sql = "select * from easybuy_user";
        ResultSet query = query(sql);

        List<EasybuyUser> easybuyUsers = ResultSetUtil.eachResult(query, EasybuyUser.class);

        return easybuyUsers;

    }



    @Override
    public int add(EasybuyUser easyBuyUser) {
        String sql="insert into easybuy_user values(?,?,?,?,?,?,?,?,?,?,?,)";
        Object[] params={easyBuyUser.getId(),easyBuyUser.getLoginName(),easyBuyUser.getUserName(),easyBuyUser.getPassword(),easyBuyUser.getSex(),easyBuyUser.getIdentityCode(),easyBuyUser.getEmail(),easyBuyUser.getMobile(),easyBuyUser.getType(),easyBuyUser.getCode(),easyBuyUser.getStatus()};
        int rownums=update(sql,params);
        return rownums;
    }

    @Override
    public int update(EasybuyUser easybuyUser) {
        String sql="update easybuy_user set loginName=?,userName=?,password=?,sex=?,identityCode=?,`email`=?,mobile=?,type=?,code=?,status=? where id=?";
        Object[] params={easybuyUser.getLoginName(),easybuyUser.getUserName(),easybuyUser.getPassword(),easybuyUser.getSex(),easybuyUser.getIdentityCode(),easybuyUser.getEmail(),easybuyUser.getMobile(),easybuyUser.getType(), easybuyUser.getCode(),easybuyUser.getStatus(),easybuyUser.getId()};
        int rownums=update(sql,params);
        return rownums;

    }

    @Override
    public int delete(Serializable id) {
        String sql="delete from easybuy_user where id=?";
        int rowsnum=update(sql,id);

        return rowsnum;
    }

    @Override
    public  EasybuyUser getUserByNameAndPassword(String loginName, String password) {
        String sql="select * from easybuy_user where loginName=? and password=?";
        Object[] params={loginName,password};
        ResultSet query = query(sql, params);

        EasybuyUser easybuyUser = ResultSetUtil.findOne(query, EasybuyUser.class);

        return easybuyUser;
    }
    @Override
    public EasybuyUser findByLoginName(String loginName) {
        String sql="select * from easybuy_user where loginName=?";
        ResultSet query = query(sql, loginName);
        EasybuyUser   easybuyUser= ResultSetUtil.findOne(query,EasybuyUser.class);
        return easybuyUser;
    }

    @Override
    public EasybuyUser findById(Serializable id) throws SQLException {
        String sql="select * from easybuy_user where id=?";
        ResultSet query = Basedao.query(sql, id);

        EasybuyUser easybuyUser = ResultSetUtil.findOne(query, EasybuyUser.class);
        return easybuyUser;
    }

    /**
     * 根据激活码去找用户
     * @param code 激活码
     * @return  一个用户
     */
    @Override
    public EasybuyUser getByCode(String code) {
        String sql="select * from easybuy_user where code=?";
        ResultSet query = Basedao.query(sql, code);
        EasybuyUser one = ResultSetUtil.findOne(query, EasybuyUser.class);
        return one;
    }

    @Override
    public Integer getCount() {
        String sql="select count(1) from easybuy_user";
        ResultSet query = Basedao.query(sql);
        Integer num=null;
        try {
            if (query.next()){
              num=  query.getInt(1);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return num;
    }

    @Override
    public List<EasybuyUser> getAllByPage(Page<EasybuyUser> page) {
        String sql="select * from easybuy_user limit ?,?";
        Object[] param={page.getPageSize()*(page.getCurrPage()-1),page.getPageSize()};
        ResultSet query = Basedao.query(sql, param);
        List<EasybuyUser> easybuyUsers = ResultSetUtil.eachResult(query, EasybuyUser.class);
        return easybuyUsers;
    }

    @Override
    public EasybuyUser findByCode(String code) {
        String sql="select * from easybuy_user where code=?";
        ResultSet query = Basedao.query(sql, code);

        return ResultSetUtil.findOne(query,EasybuyUser.class);
    }


}
