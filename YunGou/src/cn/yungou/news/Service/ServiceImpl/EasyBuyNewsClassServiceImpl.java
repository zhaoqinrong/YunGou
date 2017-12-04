package cn.yungou.news.Service.ServiceImpl;

import cn.yungou.commons.entity.EasyBuyNewsClass;
import cn.yungou.commons.entity.Page;
import cn.yungou.commons.util.BeanFactory;
import cn.yungou.news.Service.EasyBuyNewsClassService;
import cn.yungou.news.dao.EasyBuyNewsClassDao;
import cn.yungou.news.dao.impl.EasyBuyNewsClassDaoImpl;

import java.io.Serializable;
import java.util.List;

public class EasyBuyNewsClassServiceImpl implements EasyBuyNewsClassService {
  private static final EasyBuyNewsClassDaoImpl NEWS_CLASS_DAO= (EasyBuyNewsClassDaoImpl) BeanFactory.getBean("newsclassdao");


    @Override
    public int add(Object o) {
        return 0;
    }

    @Override
    public int update(Object o) {
        return 0;
    }

    @Override
    public int delete(Serializable id) {
        return 0;
    }

    @Override
    public Page<EasyBuyNewsClass> getAllByPage(Integer currPage) {
        Page<EasyBuyNewsClass> page = new Page<>();
        page.setCurrPage(currPage);
        page.setTotal(NEWS_CLASS_DAO.getCount());
        page.setPageSize(6);
        page.setList(NEWS_CLASS_DAO.getAllByPage(page));

        return page;
    }

    @Override
    public List getAll() {

        return NEWS_CLASS_DAO.getAll();
    }
}
