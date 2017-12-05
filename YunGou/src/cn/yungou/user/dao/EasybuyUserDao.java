package cn.yungou.user.dao;


import cn.yungou.commons.commonDao.CommonDao;
import cn.yungou.commons.entity.EasybuyUser;
import cn.yungou.commons.entity.Page;

import java.io.Serializable;
import java.sql.SQLException;
import java.util.List;

public interface EasybuyUserDao extends CommonDao<EasybuyUser> {
    EasybuyUser getUserByNameAndPassword(String loginName, String password);

    public EasybuyUser findByLoginName(String loginName);

    public EasybuyUser findById(Serializable id) throws SQLException;

    EasybuyUser getByCode(String code);


    List<EasybuyUser> getAllByPage(Page<EasybuyUser> page);

    EasybuyUser findByCode(String code);
}
