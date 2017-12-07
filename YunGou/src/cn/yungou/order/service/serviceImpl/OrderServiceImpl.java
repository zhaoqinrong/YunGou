package cn.yungou.order.service.serviceImpl;

import cn.yungou.commons.entity.EasybuyCar;
import cn.yungou.commons.entity.Page;
import cn.yungou.commons.util.BeanFactory;
import cn.yungou.order.dao.OrderDao;

import java.io.Serializable;

public class OrderServiceImpl implements cn.yungou.order.service.OrderService {
    public static final OrderDao ORDER_DAO= (OrderDao) BeanFactory.getBean("orderdao");
    @Override
    public Page getAllByPage(Integer id) {
        return null;
    }

    @Override
    public int add(Object o) {
        return ORDER_DAO.add(o);
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
