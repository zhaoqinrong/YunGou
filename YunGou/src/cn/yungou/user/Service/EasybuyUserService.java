package cn.yungou.user.Service;


import cn.yungou.commons.commonService.CommonService;
import cn.yungou.commons.entity.EasybuyUser;
import cn.yungou.commons.entity.Page;

import java.io.Serializable;
import java.sql.SQLException;

public interface EasybuyUserService extends CommonService<EasybuyUser>{

    //增加用户
    //修改用户
    //删除用户
    //用户登录
    public EasybuyUser login(String loginName, String password);

    public EasybuyUser findByLoginName(String loginName);

    public EasybuyUser findById(Serializable id) throws SQLException;

    EasybuyUser active(String code);

    EasybuyUser findByCode(String code);
}
