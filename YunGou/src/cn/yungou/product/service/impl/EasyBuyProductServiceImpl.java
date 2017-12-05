package cn.yungou.product.service.impl;

import cn.yungou.commons.constant.Constant;
import cn.yungou.commons.entity.EasybuyProduct;
import cn.yungou.commons.entity.EasybuyProductCategory;
import cn.yungou.commons.entity.Page;
import cn.yungou.commons.entity.ProductCondition;
import cn.yungou.commons.util.BeanFactory;
import cn.yungou.product.dao.ProductDao;
import cn.yungou.product.service.EasyBuyProductService;

import java.io.Serializable;
import java.util.List;

public class EasyBuyProductServiceImpl implements EasyBuyProductService {
    private static final ProductDao PRODUCT_DAO= (ProductDao) BeanFactory.getBean("productdao");




    @Override
    public int add(Object o) {
        int add = PRODUCT_DAO.add(o);
        if (add>0){
            Constant.LOGGER.debug("商品添加成功");
            return add;
        }
        Constant.LOGGER.debug("商品添加失败");
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
    public Page<EasybuyProduct> getAllByPage(Integer id){
        Page<EasybuyProduct> page=new Page<>();
        page.setCurrPage(id);
        page.setTotal(PRODUCT_DAO.getCount());
        page.setPageSize(6);
        PRODUCT_DAO.getAllByPage(page);

        return page;
    }

    @Override
    public Page<EasybuyProduct> getProductBycondition(ProductCondition productCondition) {
        Page<EasybuyProduct> page=new Page<>();
        page.setCurrPage(productCondition.getCurrPage());
        page.setPageSize(6);
        page.setTotal(PRODUCT_DAO.getCountByContion(productCondition));
        return  PRODUCT_DAO.getProductBycondition(productCondition,page);
    }

    @Override
    public EasybuyProduct getProductByid(Integer id) {

        return PRODUCT_DAO.getProductByid(id);
    }

    @Override
    public Integer modify(EasybuyProduct productupload) {

        return PRODUCT_DAO.update(productupload);
    }


}
