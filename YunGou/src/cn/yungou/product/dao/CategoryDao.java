package cn.yungou.product.dao;

import cn.yungou.commons.entity.EasybuyProductCategory;

import java.io.Serializable;
import java.util.List;

public interface CategoryDao {
    //查找所有一级标题
    List<EasybuyProductCategory> findAllLevel(Serializable parentId) throws Exception;

    List<EasybuyProductCategory> getlevel1();

    List<EasybuyProductCategory> getlevelParentId(Integer parentId);
}
