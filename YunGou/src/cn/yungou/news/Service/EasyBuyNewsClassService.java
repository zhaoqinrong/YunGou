package cn.yungou.news.Service;

import cn.yungou.commons.commonService.CommonService;
import cn.yungou.commons.entity.EasyBuyNewsClass;
import cn.yungou.commons.entity.Page;

import java.util.List;

public interface EasyBuyNewsClassService extends CommonService {

    List getAll();
}
