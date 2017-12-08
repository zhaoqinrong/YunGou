package cn.yungou.order.service;

import cn.yungou.commons.commonService.CommonService;
import cn.yungou.commons.entity.EasybuyCar;
import cn.yungou.commons.entity.EasybuyUser;

public interface OrderService extends CommonService {
    EasybuyCar getMyCar(EasybuyUser user);
}
