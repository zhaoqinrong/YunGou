package cn.yungou.product.service.impl;

import cn.yungou.commons.constant.Constant;
import cn.yungou.commons.entity.EasybuyProductCategory;
import cn.yungou.commons.util.BeanFactory;
import cn.yungou.commons.util.JsonUtils;
import cn.yungou.commons.util.MemcachedUtil;
import cn.yungou.product.dao.CategoryDao;
import cn.yungou.product.service.CategoryService;

import java.io.Serializable;
import java.util.List;

/**
 * 商品分类
 */
public class CategoryServiceImpl implements CategoryService {
    private static final CategoryDao CGD= (CategoryDao) BeanFactory.getBean("categorydao");

    /**
     * 查找所有的一级分类
     * @return
     * @throws Exception
     */
    @Override
    public List<EasybuyProductCategory> findAllLevel(Serializable parentId) throws Exception {
        //到缓存中取
        String category = (String) MemcachedUtil.get("category");
        List<EasybuyProductCategory> list=null;
        if(category==null){
            Constant.LOGGER.debug("缓存中不存在");
            //如果缓存中不存在,1到数据库中取
            list =  CGD.findAllLevel(parentId);
            category = JsonUtils.writeValueAsString(list);
            MemcachedUtil.add("category",category);
        }else{
            list = JsonUtils.readValue(category);
            Constant.LOGGER.debug("缓存中存在");
        }
        return list;
    }

    @Override
    public List<EasybuyProductCategory> getlevel1() {
        return   CGD.getlevel1();

    }

    @Override
    public List<EasybuyProductCategory> getlevelParentId(Integer parentId) {

        return   CGD.getlevelParentId(parentId);

    }


}
