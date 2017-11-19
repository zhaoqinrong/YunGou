package cn.yungou.news.dao;

import cn.yungou.commons.entity.EasyBuyNewsAndClass;

import java.io.Serializable;
import java.util.List;

public interface EasyBuyNewsAndClassDao {
    public List<EasyBuyNewsAndClass> getAll();
    EasyBuyNewsAndClass getNewsBuyId(Serializable id);
}
