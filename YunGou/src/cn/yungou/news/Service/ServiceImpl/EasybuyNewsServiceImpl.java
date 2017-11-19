package cn.yungou.news.Service.ServiceImpl;


import cn.yungou.commons.entity.EasybuyNews;
import cn.yungou.news.Service.EasybuyNewsService;
import cn.yungou.news.dao.impl.EasyBuyNewsDaoImpl;
import com.sun.istack.internal.logging.Logger;

import java.io.Serializable;
import java.util.List;

public class EasybuyNewsServiceImpl implements EasybuyNewsService {
	private Logger logger=Logger.getLogger(EasybuyNewsServiceImpl.class);
    @Override
    public List<EasybuyNews> getAllNews() {
        return     new EasyBuyNewsDaoImpl().getAll();

    }

    @Override
    public void  addNews(EasybuyNews easybuyNews) {
       int rownum= new EasyBuyNewsDaoImpl().add(easybuyNews);
       if(rownum>0){
    	   logger.info("增加成功");
        }else {
        	logger.info("增加失败");
       }
    }

    @Override
    public void updateNews(EasybuyNews easybuyNews) {
       int rowsnum= new EasyBuyNewsDaoImpl().update(easybuyNews);
       if(rowsnum>0){
           logger.info("修改成功");
       }else{
           logger.info("修改失败");
       }

    }

    @Override
    public void deleNews(Serializable id) {
     int rownum = new EasyBuyNewsDaoImpl().delete(id);
     if(rownum>0){
    	 logger.info("删除成功");
     }else{
    	 logger.info("删除失败");
     }
    }
}
