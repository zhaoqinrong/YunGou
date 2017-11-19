package cn.yungou.user.Service;


import cn.yungou.commons.entity.EasybuyUser;

import java.io.Serializable;
import java.sql.SQLException;
import java.util.List;

public interface EasybuyUserService {
    //查询
    public List<EasybuyUser> getAllUser();
    //增加用户
    public int addUser(EasybuyUser easybuyUser);
    //修改用户
    public int updateUser(EasybuyUser easybuyUser);
    //删除用户
    public int deleUser(Serializable id);
    //用户登录
    public EasybuyUser login(String loginName, String password);

    public EasybuyUser findByLoginName(String loginName);

    public EasybuyUser findById(Serializable id) throws SQLException;
}
