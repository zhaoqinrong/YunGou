package cn.yungou.product.service.impl;

import cn.yungou.commons.constant.Constant;
import cn.yungou.commons.entity.Classify;
import cn.yungou.commons.entity.EasybuyProduct;
import cn.yungou.commons.entity.EasybuyProductCategory;
import cn.yungou.commons.util.BeanFactory;
import cn.yungou.commons.util.JsonUtils;
import cn.yungou.commons.util.MemcachedUtil;
import cn.yungou.product.dao.CategoryDao;
import cn.yungou.product.dao.ProductDao;
import cn.yungou.product.service.CategoryService;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

/**
 * 商品分类
 */
public class CategoryServiceImpl implements CategoryService {
    private static final CategoryDao CGD = (CategoryDao) BeanFactory.getBean("categorydao");
    private static final ProductDao PRODUCT_DAO = (ProductDao) BeanFactory.getBean("productdao");

    /**
     * 查找所有的一级分类
     *
     * @return
     * @throws Exception
     */
    @Override
    public List<EasybuyProductCategory> findAllLevel(Serializable parentId) throws Exception {
        //到缓存中取
        String category = (String) MemcachedUtil.get("category");
        List<EasybuyProductCategory> list = null;
        if (category == null) {
            Constant.LOGGER.debug("缓存中不存在");
            //如果缓存中不存在,1到数据库中取
            list = CGD.findAllLevel(parentId);
            category = JsonUtils.writeValueAsString(list);
            MemcachedUtil.add("category", category);
        } else {
            list = JsonUtils.readValue(category);
            Constant.LOGGER.debug("缓存中存在");
        }
        return list;
    }

    @Override
    public List<EasybuyProductCategory> getlevel1() {
        return CGD.getlevel1();

    }

    @Override
    public List<EasybuyProductCategory> getAllClass() {

        return CGD.getAll();
    }

    @Override
    public List<EasybuyProductCategory> getlevelParentId(Integer parentId) {

        return CGD.getlevelParentId(parentId);

    }

    @Override
    public List<EasybuyProductCategory> getAllByType(Integer i) {

        return CGD.getAllByType(i);
    }

    @Override
    public List<Classify<EasybuyProductCategory>> getClassify(Integer parentId) {
        List<Classify<EasybuyProductCategory>> listClass = new ArrayList<>();
        List<EasybuyProductCategory> list = CGD.getlevelParentId(parentId);
        for (int i = 0; i < list.size(); i++) {
            Classify<EasybuyProductCategory> classify = new Classify();
            classify.setId(list.get(i).getId());
            classify.setName(list.get(i).getName());
            List<EasybuyProductCategory> list1 = CGD.getlevelParentId(list.get(i).getId());//获取的是二级分类
            classify.setChilds(list1);
            listClass.add(classify);
        }
        return listClass;
    }

    /**
     * 通过商品的id查询一二三级分类,并封装成为对象,放在数组中
     *
     * @param id 商品的id
     * @return
     */
    @Override
    public EasybuyProductCategory[] getEasybuyProduct(Integer id) {
        //查询商品
        EasybuyProductCategory[] cates = new EasybuyProductCategory[3];
        EasybuyProduct product = PRODUCT_DAO.getProductByid(id);
        EasybuyProductCategory cate1 = CGD.getCategoryById(product.getCategorygoryLevel1());
        EasybuyProductCategory cate2 = CGD.getCategoryById(product.getCategorygoryLevel2());
        EasybuyProductCategory cate3 = CGD.getCategoryById(product.getCategorygoryLevel3());
        cates[0] = cate1;
        cates[1] = cate2;
        cates[2] = cate3;

        return cates;
    }


}
