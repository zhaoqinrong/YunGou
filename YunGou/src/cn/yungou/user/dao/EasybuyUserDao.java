package cn.yungou.user.dao;


import cn.yungou.user.entity.EasybuyUser;

import java.io.Serializable;
import java.sql.SQLException;

public interface EasybuyUserDao extends CommonDao<EasybuyUser> {
    EasybuyUser getUserByNameAndPassword(String loginName, String password);

    public EasybuyUser findByLoginName(String loginName);

    public EasybuyUser findById(Serializable id) throws SQLException;

}
