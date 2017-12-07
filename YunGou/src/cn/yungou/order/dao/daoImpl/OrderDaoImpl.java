package cn.yungou.order.dao.daoImpl;

import cn.yungou.commons.baseDao.Basedao;
import cn.yungou.commons.entity.EasybuyCar;
import cn.yungou.order.dao.OrderDao;
import org.codehaus.jackson.map.ObjectMapper;

import java.io.Serializable;
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
        String sql="insert into easybuy_car values(?,?,?,?,?)";
        EasybuyCar car= (EasybuyCar)o;
        Object[] param={car.getId(),car.getUser().getId(),car.getPid(),car.getCreateTime(),car.getPnum()};
        int update = Basedao.update(sql, param);
        return update;
    }
}
