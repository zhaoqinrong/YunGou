package cn.yungou.product.service;

import cn.yungou.commons.entity.Classify;
import cn.yungou.commons.entity.EasybuyProductCategory;

import java.io.Serializable;
import java.util.List;

public interface CategoryService {
    List<EasybuyProductCategory> findAllLevel(Serializable parentId) throws Exception;


    List<EasybuyProductCategory> getlevel1();


    List<EasybuyProductCategory> getAllClass();
    List<EasybuyProductCategory> getlevelParentId(Integer parentId);

    List<EasybuyProductCategory> getAllByType(Integer i);

    List<Classify<EasybuyProductCategory>> getClassify(Integer parentId);
}
