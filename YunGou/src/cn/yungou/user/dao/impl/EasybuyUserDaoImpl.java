package cn.yungou.user.dao.impl;


import cn.yungou.commons.baseDao.Basedao;
import cn.yungou.commons.entity.EasybuyUser;
import cn.yungou.user.dao.EasybuyUserDao;
import org.apache.log4j.Logger;

import java.io.Serializable;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class EasybuyUserDaoImpl extends Basedao implements EasybuyUserDao {
    private static Logger logger = Logger.getLogger(EasybuyUserDaoImpl.class);
    @Override
    public List<EasybuyUser> getAll() {
        String sql = "select * from easybuy_user";
        ResultSet query = query(sql);
        List<EasybuyUser> list = new ArrayList<>();
        try {
            while (query.next()) {
                list.add(new EasybuyUser(query.getInt("id"),query.getString("loginName"),query.getString("userName"),query.getString("password"),query.getInt("sex"),query.getString("identityCode"),query.getString("email"),query.getString("mobile"),query.getInt("type")));
            }
        } catch (SQLException e) {
            logger.error(e +"EasybuyUserDaoImpl类中getAllEasybuyUser有误");
        }


        return list;

    }



    @Override
    public int add(EasybuyUser easyBuyUser) {
        String sql="insert into easybuy_user values(?,?,?,?,?,?,?,?,?)";
        Object[] params={easyBuyUser.getId(),easyBuyUser.getLoginName(),easyBuyUser.getUserName(),easyBuyUser.getPassword(),easyBuyUser.getSex(),easyBuyUser.getIdentityCode(),easyBuyUser.getEmail(),easyBuyUser.getMobile(),easyBuyUser.getType()};
        int rownums=update(sql,params);
        return rownums;
    }

    @Override
    public int update(EasybuyUser easybuyUser) {
        String sql="update easybuy_user set loginName=?,userName=?,password=?,sex=?,identityCode=?,`email`=?,mobile=?,type=? where id=?";
        Object[] params={easybuyUser.getLoginName(),easybuyUser.getUserName(),easybuyUser.getPassword(),easybuyUser.getSex(),easybuyUser.getIdentityCode(),easybuyUser.getEmail(),easybuyUser.getMobile(),easybuyUser.getType(),easybuyUser.getId()};
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
        EasybuyUser easybuyUser=null;
        try {
            if(query.next()){
                easybuyUser=new EasybuyUser(query.getInt("id"),query.getString("loginName"),query.getString("userName"),query.getString("password"),query.getInt("sex"),query.getString("identityCode"),query.getString("email"),query.getString("mobile"),query.getInt("type"))   ;
            }
        } catch (SQLException e) {
        	logger.error(e+"EasybuyUserDaoImpl中getUserByNameAndPassword有误");
            e.printStackTrace();
        }

        return easybuyUser;
    }
    @Override
    public EasybuyUser findByLoginName(String loginName) {
        String sql="select * from easybuy_user where loginName=?";
        ResultSet query = query(sql, loginName);
        EasybuyUser easybuyUser=null;
        try {
            if(query.next()){
                easybuyUser=new EasybuyUser(query.getInt("id"),query.getString("loginName"),query.getString("userName"),query.getString("password"),query.getInt("sex"),query.getString("identityCode"),query.getString("email"),query.getString("mobile"),query.getInt("type"))   ;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return easybuyUser;
    }

    @Override
    public EasybuyUser findById(Serializable id) throws SQLException {
        String sql="select * from easybuy_user where id=?";
        ResultSet query = Basedao.query(sql, id);
        EasybuyUser easybuyUser=null;
        if(query.next()){
            easybuyUser=new EasybuyUser(query.getInt("id"),query.getString("loginName"),query.getString("userName"),query.getString("password"),query.getInt("sex"),query.getString("identityCode"),query.getString("email"),query.getString("mobile"),query.getInt("type"))   ;
        }
        return easybuyUser;
    }


}
