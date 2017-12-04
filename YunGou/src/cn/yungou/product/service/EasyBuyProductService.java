package cn.yungou.product.service;

import cn.yungou.commons.commonService.CommonService;
import cn.yungou.commons.entity.EasybuyProduct;
import cn.yungou.commons.entity.Page;
import cn.yungou.commons.entity.ProductCondition;

import java.util.List;

public interface EasyBuyProductService extends CommonService{
    Page<EasybuyProduct> getProductBycondition(ProductCondition productCondition);
}
