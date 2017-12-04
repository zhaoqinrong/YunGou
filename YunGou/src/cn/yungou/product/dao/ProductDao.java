package cn.yungou.product.dao;

import cn.yungou.commons.commonDao.CommonDao;
import cn.yungou.commons.entity.EasybuyProduct;
import cn.yungou.commons.entity.Page;

public interface ProductDao extends CommonDao {
    Page<EasybuyProduct> getAllByPage(Page page);

}
