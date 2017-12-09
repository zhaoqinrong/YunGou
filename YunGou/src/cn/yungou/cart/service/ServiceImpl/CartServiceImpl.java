package cn.yungou.cart.service.ServiceImpl;

import cn.yungou.cart.dao.CartDao;
import cn.yungou.cart.service.CartService;
import cn.yungou.commons.baseDao.Basedao;
import cn.yungou.commons.constant.Constant;
import cn.yungou.commons.entity.*;
import cn.yungou.commons.util.BeanFactory;
import cn.yungou.product.dao.ProductDao;

import java.io.Serializable;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

public class CartServiceImpl implements CartService {
    public static final CartDao CART_DAO = (CartDao) BeanFactory.getBean("cartdao");
    private static final ProductDao PRODUCT_DAO = (ProductDao) BeanFactory.getBean("productdao");

    @Override
    public Page getAllByPage(Integer id) {
        return null;
    }

    /**
     * 用户添加商品到购物车
     * 1.查询购物车表中是否存在用户的数据,如果没有就需要创建一个属于用户的购物车记录
     * 2.向购物车项的表中添加数据
     * 3.更新用户购物车表中的总数和总金额
     *
     * @param o
     * @return
     */
    @Override
    public int add(Object o) {
        Connection connection = null;
        EasybuyCarDetail carDetail = (EasybuyCarDetail) o;
        //先去商品表中查询商品的信息
        EasybuyProduct product = PRODUCT_DAO.getProductByid(carDetail.getPid());
        carDetail.setProduct(product);
        //因为一个用户对应一个购物车,所以利用用户的id去数据库查询,是否存在用户的购物车数据
        EasybuyCar car = CART_DAO.getCartByUserId(carDetail.getCar().getUid());
        if (car == null || car.getId() == null) {//如果查询用户对应的购物车不存在,说明用户首次添加,需要向购物车中添加属于用户的购物车
            int createCart = CART_DAO.createCart(carDetail.getCar());
            if (createCart <= 0) {
//                connection.rollback();
                return 0;
            }
            car = CART_DAO.getCartByUserId(carDetail.getCar().getUid());


        }

        carDetail.setCid(car.getId());
        carDetail.setToprice(carDetail.getPnum() * product.getPrice());
        try {
            connection = Basedao.getConnection();
            connection.setAutoCommit(false);


            //将加入购物车的商品添加到购物车项中
            //先查询用户的购物车中是否已经有该商品
            EasybuyCarDetail carDetail1 = CART_DAO.getAllCarDetailByCidAndPid(car.getId(), carDetail.getPid());
            int add1 = 0;
            if (carDetail1 == null || carDetail1.getId() == null) {//用户首次添加这个商品
                add1 = CART_DAO.addCarDetail(carDetail);
            } else {//用户之前已经添加过这个商品
                //查询用户之前添加的记录
                carDetail1.setPnum(carDetail1.getPnum() + carDetail.getPnum());
                carDetail1.setToprice(carDetail1.getToprice() + carDetail.getPnum() * product.getPrice());
                add1 = CART_DAO.updateCarDetail(carDetail1);
            }


            if (add1 <= 0) {
                connection.rollback();
                return 0;
            }
            //如果加入到购物车项中成功,则更新购物车的数据包中的数据
            if (car.getCount() == null || car.getCount() == 0) {
                car.setCount(0);
            }
            car.setCount(car.getCount() + carDetail.getPnum());
            car.setToprice(car.getToprice() + carDetail.getPnum() * product.getPrice());
            int updatecar = CART_DAO.updateCart(car);
            if (updatecar <= 0) {
                connection.rollback();
                return 0;
            }
            connection.commit();
        } catch (SQLException e) {
            try {
                connection.rollback();
            } catch (SQLException e1) {
                e1.printStackTrace();
            }
            e.printStackTrace();
//        }


        }
        return 1;
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
     * 获取用户所有的购物车项
     *
     * @param user
     * @return
     */
    @Override
    public EasybuyCar getMyAllCar(EasybuyUser user) {
        EasybuyCar car = CART_DAO.getCartByUserId(user.getId());
        Constant.LOGGER.debug(" EasybuyCar car==" + car);
        List<EasybuyCarDetail> carDetails = CART_DAO.getAllCarDetailByCid(car.getId());
        for (int i = 0; i < carDetails.size(); i++) {
            EasybuyProduct product = PRODUCT_DAO.getProductByid(carDetails.get(i).getPid());
            carDetails.get(i).setProduct(product);
        }

        Constant.LOGGER.debug(" List<EasybuyCarDetail> carDetails==" + carDetails);
        car.setCarDetailList(carDetails);
        return car;
    }

    /**
     * 用户删除根据id删除购物车项
     * 1.查询购物车项
     * 2.删除购物车项
     * 3,更新购物车中的数量和金额
     *
     * @param i
     * @return
     */
    @Override
    public int delCartDetailById(int i) {
        //通过id查询购物车项
        EasybuyCarDetail carDetail = CART_DAO.getCartDetailById(i);
        Connection conn = null;
        //开启事务
        try {
            conn = Basedao.getConnection();
            conn.setAutoCommit(false);
            //删除购物车项
            int del = CART_DAO.delById(i);
            if (del <= 0) {
                return 0;
            }
            //查询购物车
            EasybuyCar car = CART_DAO.getCartById(carDetail.getCid());
            if (car == null || car.getId() == null) {
                return 0;
            }
            car.setCount(car.getCount() - carDetail.getPnum());
            car.setToprice(car.getToprice() - carDetail.getToprice());
            int i1 = CART_DAO.updateCart(car);
            if (i1 <= 0) {
                conn.rollback();
                return 0;
            }
            conn.commit();
        } catch (SQLException e) {
            try {
                conn.rollback();
                return 0;
            } catch (SQLException e1) {
                e1.printStackTrace();
            }
            e.printStackTrace();
        }
        return 1;
    }

    /**
     * 清空购物车或删除选中购物车项
     *
     * @param idss 商品id集合
     * @param id   用户id
     * @return
     */
    @Override
    public int delAllCarDetail(List<Integer> idss, Integer id) {
        Connection conn = Basedao.getConnection();
//            先将用户的购物车查询出来
        EasybuyCar cartByUserId = CART_DAO.getCartByUserId(id);
        int flag = 0;
        try {
            conn.setAutoCommit(false);
            //先将要删除的商品查询出来,后面更新购物车表需要用,统计删除商品的总价和数量
            int count = 0;
            float toprice = 0;
            for (int i = 0; i < idss.size(); i++) {
                Constant.LOGGER.debug(idss.get(i));
                EasybuyCarDetail cart = CART_DAO.getCartDetailById(idss.get(i));
                count += cart.getPnum();
                toprice += cart.getToprice();
                flag = CART_DAO.delCarDetailById(idss.get(i));//清空用户id为id的购物车项
                if (flag <= 0) {
                    conn.rollback();
                    return 0;
                }
            }

            //更新购物车表中用户id为id的信息

            //统计删除商品的数量和总价
            cartByUserId.setCount(cartByUserId.getCount()-count);
            cartByUserId.setToprice(cartByUserId.getToprice()-toprice);
           CART_DAO.updateCart(cartByUserId);
            conn.commit();
        } catch (SQLException e) {
            try {
                conn.rollback();
            } catch (SQLException e1) {


            }
        }
        return flag;
    }

    /**
     * 购物车失效查询,并将status改为1
     * @param id
     * @return
     */
    @Override
    public List<EasybuyCarDetail> valideCarDe(Integer id) {
        List<EasybuyCarDetail> carDetails = CART_DAO.valideCarDe(id);
        if(carDetails.size()<=0){
            return null;
        }
        Connection conn=null ;
        try {
            conn = Basedao.getConnection();
            conn.setAutoCommit(false);

            int num=0;
            float toprice=0;
            for (int i = 0; i < carDetails.size(); i++) {//修改失效状态
                EasybuyCarDetail carDetail = carDetails.get(i);
                        carDetail.setStatus(1);
                       num+= carDetail.getPnum();
                toprice+=carDetail.getToprice();
                int i1 = CART_DAO.updateCarDetail(carDetail);
                if(i1<=0){
                    conn.rollback();
                    return  null;

                }
            }
//        EasybuyCar car=new EasybuyCar();
//        car.setCount();
            EasybuyCar car=CART_DAO.getCartById(carDetails.get(0).getCid());
            car.setCount(car.getCount()-num);
            car.setToprice(car.getToprice()-toprice);
            int i = CART_DAO.updateCart(car);
            if (i<=0){
                conn.rollback();
                return null;
            }
            conn.commit();
        } catch (SQLException e) {
            try {
                conn.rollback();
            } catch (SQLException e1) {
                e1.printStackTrace();
            }
            e.printStackTrace();
        }
        //修改购物车中的信息
        return   carDetails;
    }
}
