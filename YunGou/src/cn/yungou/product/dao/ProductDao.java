package cn.yungou.product.dao;

import cn.yungou.commons.commonDao.CommonDao;
import cn.yungou.commons.entity.EasybuyProduct;
import cn.yungou.commons.entity.Page;
import cn.yungou.commons.entity.ProductCondition;

import java.util.List;

public interface ProductDao extends CommonDao {
    Page<EasybuyProduct> getAllByPage(Page page);


    Page<EasybuyProduct> getProductBycondition(ProductCondition productCondition, Page<EasybuyProduct> page);

    Integer getCountByContion(ProductCondition productCondition);

    EasybuyProduct getProductByid(Integer id);

    List<EasybuyProduct> getProBycate1(Integer id);

    List<EasybuyProduct> getProBycate2(Integer id2);

    List<EasybuyProduct> getProBycate3(Integer id1);

    List findByLike(String words);

    List<EasybuyProduct> searchPro(String words);

    void addHotNum(String words);

    EasybuyProduct getProductByName(String words);

}
