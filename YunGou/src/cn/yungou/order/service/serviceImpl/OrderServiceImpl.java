package cn.yungou.order.service.serviceImpl;

import cn.yungou.commons.baseDao.Basedao;
import cn.yungou.commons.constant.Constant;
import cn.yungou.commons.entity.*;
import cn.yungou.commons.util.BeanFactory;
import cn.yungou.order.dao.OrderDao;
import cn.yungou.product.dao.ProductDao;

import java.io.Serializable;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class OrderServiceImpl implements cn.yungou.order.service.OrderService {
    public static final OrderDao ORDER_DAO = (OrderDao) BeanFactory.getBean("orderdao");
    private static final ProductDao PRODUCT_DAO = (ProductDao) BeanFactory.getBean("productdao");


    @Override
    public Page getAllByPage(Integer id) {
        return null;
    }

    @Override
    public int add(Object o) {
        return 0;
    }

    @Override
    public int update(Object o) {
        return 0;
    }

    @Override
    public int delete(Serializable id) {
        return 0;
    }
}