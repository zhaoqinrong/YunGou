package cn.yungou.news.Service;

import cn.yungou.commons.entity.EasyBuyNewsAndClass;

import java.io.Serializable;
import java.util.List;

public interface EasyBuyNewsAndClassService {
    public List<EasyBuyNewsAndClass> getAll();

    EasyBuyNewsAndClass getNewsBuyId(Serializable id);
}
