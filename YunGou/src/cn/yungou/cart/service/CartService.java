package cn.yungou.cart.service;

import cn.yungou.commons.commonService.CommonService;
import cn.yungou.commons.entity.EasybuyCar;
import cn.yungou.commons.entity.EasybuyCarDetail;
import cn.yungou.commons.entity.EasybuyUser;

import java.util.List;

public interface CartService extends CommonService{

    EasybuyCar getMyAllCar(EasybuyUser user);

    int delCartDetailById(int i);

    int delAllCarDetail(List<Integer> idss, Integer id);

    List<EasybuyCarDetail> valideCarDe(Integer id);
}
