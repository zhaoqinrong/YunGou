package cn.yungou.news.dao;

import cn.yungou.commons.commonDao.CommonDao;
import cn.yungou.commons.entity.EasyBuyNewsAndClass;
import cn.yungou.commons.entity.Page;

import java.io.Serializable;
import java.util.List;

public interface EasyBuyNewsAndClassDao extends CommonDao{
    public List<EasyBuyNewsAndClass> getAll();
    EasyBuyNewsAndClass getNewsBuyId(Serializable id);

    List<EasyBuyNewsAndClass> getAllByPage(Page<EasyBuyNewsAndClass> page);
}
