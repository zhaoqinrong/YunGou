package cn.yungou.product.service;

import cn.yungou.commons.entity.EasybuyProductCategory;

import java.io.Serializable;
import java.util.List;

public interface CategoryService {
    List<EasybuyProductCategory> findAllLevel(Serializable parentId) throws Exception;


    List<EasybuyProductCategory> getlevel1();

    List<EasybuyProductCategory> getlevelParentId(Integer parentId);
}
