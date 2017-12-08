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
        EasybuyCarDetail carDetail = (EasybuyCarDetail) o;
        //先去商品表中查询商品的信息
        EasybuyProduct product = PRODUCT_DAO.getProductByid(carDetail.getPid());
        carDetail.setProduct(product);
        //然后进行数据库的储存
        Connection connection = null;
        try {
            connection = Basedao.getConnection();
            connection.setAutoCommit(false);

            int add1 = ORDER_DAO.add(carDetail.getCar());
            if(add1<=0){
                connection.rollback();
            return 0;
            }
                carDetail.setCid(add1);

            int add = ORDER_DAO.add(carDetail);


          if(add>0){
              connection.commit();
              return 1;
          }
            connection.rollback();

        } catch (SQLException e) {
            try {
                connection.rollback();
            } catch (SQLException e1) {
                e1.printStackTrace();
            }
            e.printStackTrace();
//        }



        }
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

    /**
     * 通过用户信息查询用户的购物车信息
     * @param user
     * @return
     */
    @Override
    public EasybuyCar getMyCar(EasybuyUser user) {
        EasybuyCar easybuyCar=new EasybuyCar();
        //获取了用户的购物车信息
       List<EasybuyCar> cars= ORDER_DAO.getCarByUserId(user.getId());
       //通过购物车的id去获取购物车的每一项的信息
        List<EasybuyCarDetail> carDetails=new ArrayList<>();
        for (EasybuyCar car:cars){
//        EasybuyCarDetail carDetail=   ORDER_DAO.getCarDetailByCid(car.getId());
//           carDetails.add(carDetail);
        }
        easybuyCar.setCarDetailList(carDetails);
        return null;
    }
}