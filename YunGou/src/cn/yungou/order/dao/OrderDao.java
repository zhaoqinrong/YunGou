package cn.yungou.order.dao;

import cn.yungou.commons.commonDao.CommonDao;
import cn.yungou.commons.entity.EasybuyCar;
import cn.yungou.commons.entity.EasybuyCarDetail;

import java.util.List;

public interface OrderDao extends CommonDao {
    List<EasybuyCar> getCarByUserId(Integer id);
}
