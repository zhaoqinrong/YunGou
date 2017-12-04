package cn.yungou.news.dao;

import cn.yungou.commons.commonDao.CommonDao;
import cn.yungou.commons.entity.EasyBuyNewsClass;
import cn.yungou.commons.entity.Page;

import java.util.List;

public interface EasyBuyNewsClassDao extends CommonDao {


    List<EasyBuyNewsClass> getAllByPage(Page<EasyBuyNewsClass> page);
}
