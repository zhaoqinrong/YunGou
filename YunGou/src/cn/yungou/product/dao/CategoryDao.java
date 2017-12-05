package cn.yungou.product.dao;

import cn.yungou.commons.commonDao.CommonDao;
import cn.yungou.commons.entity.Classify;
import cn.yungou.commons.entity.EasybuyProductCategory;

import java.io.Serializable;
import java.util.List;

public interface CategoryDao extends CommonDao{
    //查找所有一级标题
    List<EasybuyProductCategory> findAllLevel(Serializable parentId) throws Exception;

    List<EasybuyProductCategory> getlevel1();

    List<EasybuyProductCategory> getlevelParentId(Integer parentId);

    List<EasybuyProductCategory> getAllByType(Integer i);



    EasybuyProductCategory getCategoryById(Integer id);

//   Classify<EasybuyProductCategory> getClassify(Integer parentId);
}
