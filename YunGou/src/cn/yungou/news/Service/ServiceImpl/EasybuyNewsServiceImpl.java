package cn.yungou.news.Service.ServiceImpl;


import cn.yungou.commons.constant.Constant;
import cn.yungou.commons.entity.EasybuyNews;
import cn.yungou.commons.entity.Page;
import cn.yungou.news.Service.EasybuyNewsService;
import cn.yungou.news.dao.impl.EasyBuyNewsDaoImpl;

import java.io.Serializable;
import java.util.List;

public class EasybuyNewsServiceImpl implements EasybuyNewsService {





    @Override
    public Page getAllByPage(Integer id) {
        return null;
    }

    @Override
    public  int add(Object easybuyNews) {
       int rownum= new EasyBuyNewsDaoImpl().add((EasybuyNews) easybuyNews);
       if(rownum>0){
    	   Constant.LOGGER.info("增加成功");
        }else {
           Constant.LOGGER.info("增加失败");
       }
       return rownum;
    }

    @Override
    public int update(Object easybuyNews) {
       int rowsnum= new EasyBuyNewsDaoImpl().update((EasybuyNews) easybuyNews);
       if(rowsnum>0){
           Constant.LOGGER.info("修改成功");
       }else{
           Constant.LOGGER.info("修改失败");
       }
       return rowsnum;

    }

    @Override
    public int delete(Serializable id) {
     int rownum = new EasyBuyNewsDaoImpl().delete(id);
     if(rownum>0){
         Constant.LOGGER.info("删除成功");
     }else{
         Constant.LOGGER.info("删除失败");
     }
        return rownum;
    }
}
