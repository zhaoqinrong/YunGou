package cn.yungou.commons.commonService;

import cn.yungou.commons.baseDao.Basedao;
import cn.yungou.commons.entity.EasybuyProduct;
import cn.yungou.commons.entity.Page;
import cn.yungou.user.dao.impl.EasybuyUserDaoImpl;

import java.io.Serializable;
import java.util.List;

public interface CommonService<T> {
 Page<T> getAllByPage(Integer id);
    int add(T t);
    int update(T t);
    int delete(Serializable id);
}
