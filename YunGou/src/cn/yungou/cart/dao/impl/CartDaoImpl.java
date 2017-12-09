package cn.yungou.cart.dao.impl;

import cn.yungou.cart.dao.CartDao;
import cn.yungou.commons.baseDao.Basedao;
import cn.yungou.commons.entity.EasybuyCar;
import cn.yungou.commons.entity.EasybuyCarDetail;

import java.io.Serializable;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class CartDaoImpl extends Basedao implements CartDao{
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
     * 通过用户id查询属于用户的购物车
     * @param id
     * @return
     */

    @Override
    public EasybuyCar getCartByUserId(Integer id) {
        EasybuyCar car=new EasybuyCar();
        String sql="select * from easybuy_car where uid=?";
        ResultSet query = Basedao.query(sql, id);
        cartQuery(car, query);

        return car;
    }

    /**
     * 给用户创建购物车
     * @param car
     * @return
     */
    @Override
    public int createCart(EasybuyCar car) {
        String sql="insert into easybuy_car(`id`,uid,count,toprice) values(?,?,?,?)";
        Object[] param ={car.getId(),car.getUid(),car.getCount(),car.getToprice()};
        return update(sql,param);
    }

    /**
     * 添加购物车项
     * @param carDetail
     * @return
     */
    @Override
    public int addCarDetail(EasybuyCarDetail carDetail) {
        String sql="insert into easybuy_car_detail(cid,pid,pnum,toprice) values(?,?,?,?)";
        Object[] param={carDetail.getCid(),carDetail.getPid(),carDetail.getPnum(),
        carDetail.getToprice()};
        return  update(sql,param);
    }

    /**
     * 更新购物车的数量和总价
     * @param car
     * @return
     */
    @Override
    public int updateCart(EasybuyCar car) {
        String sql="update easybuy_car set count=?,toprice=? where id=?";
        Object[] param={car.getCount(),car.getToprice(),car.getId()};
        return   update(sql,param);
    }

    /**
     * 获取用户的所有购物车项
     * @param id
     * @return
     */
    @Override
    public List<EasybuyCarDetail> getAllCarDetailByCid(Integer id) {
        String sql="select * from easybuy_car_detail where cid=?";
        ResultSet query = Basedao.query(sql, id);
        List<EasybuyCarDetail> carDetails = getEasybuyCarDetails(query);
        return carDetails;
    }

    /**通过id获取购物车项的信息
     *
     * @param i
     * @return
     */
    @Override
    public EasybuyCarDetail getCartDetailById(int i) {
        String sql="select * from easybuy_car_detail where id=?";
        ResultSet query = Basedao.query(sql, i);
        EasybuyCarDetail carDetail=null;
        try {
            if (query.next()){
               carDetail=new EasybuyCarDetail();
                carDetail.setId( (int)query.getObject("id"));
                carDetail.setCid((int)query.getObject("cid"));
                carDetail.setPid((int)query.getObject("pid"));
                carDetail.setPnum((int)query.getObject("pnum"));
                carDetail.setToprice((Float) query.getObject("toprice"));
                carDetail.setCreateTime((Timestamp) query.getObject("createTime"));
                carDetail.setStatus((int)query.getObject("status"));
            }
        } catch (SQLException e) {


        }
        return carDetail;
    }

    /**
     * 通过id删除购物车项
     * @param i
     * @return
     */
    @Override
    public int delById(int i) {
        String sql="delete  from easybuy_car_detail where id=?";
        return   Basedao.update(sql,i);
    }

    /**
     * 通过id查询购物车
     * @param id
     * @return
     */
    @Override
    public EasybuyCar getCartById(Integer id) {
        EasybuyCar car=new EasybuyCar();
        String sql="select * from easybuy_car where id=?";
        ResultSet query = Basedao.query(sql, id);
       cartQuery(car, query);

        return car;
    }

    /**
     * 通过用户id和商品id获取购物车项
     * @param cid
     * @param pid
     * @return
     */
    @Override
    public EasybuyCarDetail getAllCarDetailByCidAndPid(Integer cid, Integer pid) {

        String sql="select * from easybuy_car_detail where cid=? and pid=? and status=0";
        Object[] param={cid,pid};
        ResultSet query = Basedao.query(sql, param);
        EasybuyCarDetail carDetail = getEasybuyCarDetail(query);
        return carDetail;
    }

    /**
     * 更新购物车项信息
     * @param carDetail1
     * @return
     */

    @Override
    public int updateCarDetail(EasybuyCarDetail carDetail1) {
        String sql="update easybuy_car_detail set pnum=?, toprice=?,createtime=CURRENT_TIMESTAMP  where cid=? and pid=?";
        Object[] param={carDetail1.getPnum(),carDetail1.getToprice(),carDetail1.getCid(),carDetail1.getPid()};
        return   Basedao.update(sql,param);
    }

    /**
     * 清空购物车
     * @param idss
     * @param id
     * @return
     */
    @Override
    public int delAllCarDetailByIds(List<Integer> idss, Integer id) {
        String condition=null;
        StringBuffer sb=new StringBuffer();
        for (int i = 0; i < idss.size(); i++) {
            if(i==0){
                sb.append("(?");
            }
            sb.append(",?");
        }
        sb.append(")");
        String sql="delete from easybuy_car_detail where pid in"+sb+" and uid=?";
         idss.add(id);
        Object[] param =idss.toArray();
        return Basedao.update(sql,param);

    }

    @Override
    public int delCarDetailById(Integer integer) {
        String sql="delete from easybuy_car_detail where id=? ";

        return Basedao.update(sql,integer);
    }

    /**
     * 获取失效的购物车项
     * @param id
     * @return
     */
    @Override
    public List<EasybuyCarDetail> valideCarDe(Integer id) {
        String sql="SELECT * FROM easybuy_car_detail WHERE ( SELECT DATEDIFF(NOW(),(SELECT `createTime` FROM `easybuy_car_detail` WHERE id=?)))>3 AND id=?";
        Object[] param={id,id};
        ResultSet query = Basedao.query(sql, param);
        List<EasybuyCarDetail> easybuyCarDetails = getEasybuyCarDetails(query);
        return easybuyCarDetails;
    }


    private EasybuyCarDetail getEasybuyCarDetail(ResultSet query) {
        EasybuyCarDetail carDetail=new EasybuyCarDetail();
        try {
            if(query.next()){
                carDetail.setId(query.getInt(1));
                carDetail.setCid(query.getInt(2));
                carDetail.setPid(query.getInt(3));
                carDetail.setPnum(query.getInt(4));
                carDetail.setToprice(query.getFloat(5));
                carDetail.setCreateTime(query.getTimestamp(6));
                carDetail.setStatus(query.getInt(7));

            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return carDetail;
    }

    private List<EasybuyCarDetail> getEasybuyCarDetails(ResultSet query) {
        List<EasybuyCarDetail> carDetails=new ArrayList<>();
        try {
            while (query.next()){
                EasybuyCarDetail carDetail=new EasybuyCarDetail();
                carDetail.setId( (int)query.getObject("id"));
                carDetail.setCid((int)query.getObject("cid"));
                carDetail.setPid((int)query.getObject("pid"));
                carDetail.setPnum((int)query.getObject("pnum"));
                carDetail.setToprice((Float) query.getObject("toprice"));
                carDetail.setCreateTime((Timestamp) query.getObject("createTime"));
                carDetail.setStatus((int)query.getObject("status"));
                carDetails.add(carDetail);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return carDetails;
    }

    /**
     *
     * @param car
     * @param query
     */
    private void cartQuery(EasybuyCar car, ResultSet query) {
        try {
            if (query.next()){
                car.setId(query.getInt(1));
                car.setUid(query.getInt(2));
                car.setCount(query.getInt(3));
                car.setToprice(query.getFloat(4));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
