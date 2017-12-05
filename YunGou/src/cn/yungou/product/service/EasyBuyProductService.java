package cn.yungou.product.service;

import cn.yungou.commons.commonService.CommonService;
import cn.yungou.commons.entity.EasybuyProduct;
import cn.yungou.commons.entity.EasybuyProductCategory;
import cn.yungou.commons.entity.Page;
import cn.yungou.commons.entity.ProductCondition;

import java.util.List;

public interface EasyBuyProductService extends CommonService{
    Page<EasybuyProduct> getProductBycondition(ProductCondition productCondition);

    EasybuyProduct getProductByid(Integer id);

    Integer modify(EasybuyProduct productupload);

    List<EasybuyProduct> getProBycate1(Integer id1);

    List<EasybuyProduct> getProBycate2(Integer id2);

    List<EasybuyProduct> getProBycate3(Integer id1);

    String findByLike(String words);

    List<EasybuyProduct> searchPro(String words);

    EasybuyProduct getProductByName(String words);
}
