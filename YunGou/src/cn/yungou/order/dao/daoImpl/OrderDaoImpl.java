package cn.yungou.order.dao.daoImpl;

import cn.yungou.commons.baseDao.Basedao;
import cn.yungou.commons.constant.Constant;
import cn.yungou.commons.entity.EasybuyCar;
import cn.yungou.commons.entity.EasybuyCarDetail;
import cn.yungou.commons.util.ResultSetUtil;
import cn.yungou.order.dao.OrderDao;

import java.io.Serializable;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.List;

public class OrderDaoImpl extends Basedao implements OrderDao {
    @Override
    public List getAll() {
        return null;
    }


    @Override
    public int update(Object o) {
        return 0;
    }

    @Override
    public int delete(Serializable id) {
        return 0;
    }

    @Override
    public Integer getCount() {
        return null;
    }

    @Override
    public int add(Object o) {
   if(o instanceof EasybuyCarDetail){
      return add((EasybuyCarDetail)o);
   }
   if(o instanceof EasybuyCar){
       return add((EasybuyCar)o);
   }
   return 0;

    }

    /**
     * 添加购物车项
     * @param carDetail
     * @return
     */
    public int add(EasybuyCarDetail carDetail){
      String sql="insert into easybuy_car_detail(`cid`,pid,price,pnum) values(?,?,?,?)";
        Object[] param={carDetail.getCid(),carDetail.getPid(),carDetail.getProduct().getPrice(),carDetail.getPnum()};
        int update = Basedao.update(sql, param);
        return update;

    }

    /**
     * 添加购物车的重载
     * @param car
     * @return
     */
    public int add(EasybuyCar car){

        String sql="insert into easybuy_car(`uid`,`status`) values(?,?)";
        try {
            PreparedStatement preparedStatement = getConnection().prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
            preparedStatement.setObject(1,car.getUid());
            preparedStatement.setObject(2,car.getStatus());
            preparedStatement.executeUpdate();
            ResultSet keys = preparedStatement.getGeneratedKeys();
            if (keys.next()){//如果正常执行,返回主键,如果执行失败,返回0
                Constant.LOGGER.debug("主键值为"+keys.getInt(1));
              return   keys.getInt(1);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return 0;
    }

    /**
     * 获取用户的所有购物车项
     * @param id
     * @return
     */
    @Override
    public List<EasybuyCar> getCarByUserId(Integer id) {
        String sql="select * from easybuy_car where uid=?";
        ResultSet query = Basedao.query(sql, id);

        return  ResultSetUtil.eachResult(query,EasybuyCar.class);
    }
}
