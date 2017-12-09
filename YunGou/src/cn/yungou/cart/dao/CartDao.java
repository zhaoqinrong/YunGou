package cn.yungou.cart.dao;

import cn.yungou.commons.baseDao.Basedao;
import cn.yungou.commons.commonDao.CommonDao;
import cn.yungou.commons.entity.EasybuyCar;
import cn.yungou.commons.entity.EasybuyCarDetail;

import java.util.List;

public interface CartDao extends CommonDao{
    EasybuyCar getCartByUserId(Integer id);

    int createCart(EasybuyCar car);

    int addCarDetail(EasybuyCarDetail carDetail);

    int updateCart(EasybuyCar car);

    List<EasybuyCarDetail> getAllCarDetailByCid(Integer id);

    EasybuyCarDetail getCartDetailById(int i);

    int delById(int i);

    EasybuyCar getCartById(Integer cid);

    EasybuyCarDetail getAllCarDetailByCidAndPid(Integer cid, Integer pid);

    int updateCarDetail(EasybuyCarDetail carDetail1);

    int delAllCarDetailByIds(List<Integer> idss, Integer id);

//    EasybuyCarDetail  getAllCarDetailById(Integer id);

    int delCarDetailById(Integer integer);

    List<EasybuyCarDetail> valideCarDe(Integer id);
}
