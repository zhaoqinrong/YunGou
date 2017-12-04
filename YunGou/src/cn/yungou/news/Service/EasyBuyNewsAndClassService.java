package cn.yungou.news.Service;

import cn.yungou.commons.commonService.CommonService;
import cn.yungou.commons.entity.EasyBuyNewsAndClass;
import cn.yungou.commons.entity.Page;

import java.io.Serializable;

public interface EasyBuyNewsAndClassService extends CommonService {

    EasyBuyNewsAndClass getNewsBuyId(Serializable id);

}
