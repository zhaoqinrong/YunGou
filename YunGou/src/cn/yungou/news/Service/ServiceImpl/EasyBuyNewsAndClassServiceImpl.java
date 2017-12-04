package cn.yungou.news.Service.ServiceImpl;

import cn.yungou.commons.constant.Constant;
import cn.yungou.commons.entity.Page;
import cn.yungou.commons.util.BeanFactory;
import cn.yungou.news.Service.EasyBuyNewsAndClassService;
import cn.yungou.news.dao.EasyBuyNewsAndClassDao;
import cn.yungou.news.dao.EasybuyNewsDao;
import cn.yungou.news.dao.impl.EasyBuyNewsAndClassDaoImpl;
import cn.yungou.commons.entity.EasyBuyNewsAndClass;

import java.io.Serializable;
import java.util.List;

public class EasyBuyNewsAndClassServiceImpl implements EasyBuyNewsAndClassService{
    private static  final EasyBuyNewsAndClassDaoImpl EASYBUYNEWSANDCLASSDAO= (EasyBuyNewsAndClassDaoImpl) BeanFactory.getBean("newsandclassdao");
    private static final EasybuyNewsDao NEWS_DAO= (EasybuyNewsDao) BeanFactory.getBean("newsdao");




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
    public EasyBuyNewsAndClass getNewsBuyId(Serializable id){
        return EASYBUYNEWSANDCLASSDAO.getNewsBuyId(id);
    }

    /**
     * 新闻列表分页
     * @param id
     * @return
     */
    @Override
    public Page<EasyBuyNewsAndClass> getAllByPage(Integer id) {
        Page<EasyBuyNewsAndClass> page=new Page();
        page.setPageSize(6);
        page.setTotal(NEWS_DAO.getCount());
        page.setCurrPage((Integer) id);
        Constant.LOGGER.debug("EASYBUYNEWSANDCLASSDAO"+EASYBUYNEWSANDCLASSDAO);
        List<EasyBuyNewsAndClass> allByPage = EASYBUYNEWSANDCLASSDAO.getAllByPage(page);
        page.setList(allByPage);
        Constant.LOGGER.debug(page);
        return page;
    }
}
