package cn.yungou.news.Service.ServiceImpl;

import cn.yungou.news.Service.EasyBuyNewsAndClassService;
import cn.yungou.news.dao.EasyBuyNewsAndClassDao;
import cn.yungou.news.dao.impl.EasyBuyNewsAndClassDaoImpl;
import cn.yungou.commons.entity.EasyBuyNewsAndClass;

import java.io.Serializable;
import java.util.List;

public class EasyBuyNewsAndClassServiceImpl implements EasyBuyNewsAndClassService{
    private EasyBuyNewsAndClassDao easyBuyNewsAndClassDao=new EasyBuyNewsAndClassDaoImpl();

    @Override
    public List<EasyBuyNewsAndClass> getAll() {
        return easyBuyNewsAndClassDao.getAll();
    }
    @Override
    public EasyBuyNewsAndClass getNewsBuyId(Serializable id){
        return easyBuyNewsAndClassDao.getNewsBuyId(id);
    }
}
