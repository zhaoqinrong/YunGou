package cn.yungou.order.servlet;

import cn.yungou.commons.baseServlet.BaseServlet;
import cn.yungou.commons.entity.EasybuyCar;
import cn.yungou.commons.entity.EasybuyUser;
import cn.yungou.commons.util.BeanFactory;
import cn.yungou.order.service.OrderService;
import org.apache.commons.beanutils.BeanUtils;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.Timestamp;
import java.util.Date;
@WebServlet("/order")
public class OrderServlet extends BaseServlet {
 public static final   OrderService ORDER_SERVICE= (OrderService) BeanFactory.getBean("orderService");
    public String addCar(HttpServletRequest request, HttpServletResponse response) throws Exception {
        EasybuyUser user = (EasybuyUser) request.getSession().getAttribute("user");
        if(user==null){
            response.getWriter().print("login");
            return null;
        }
        EasybuyCar car=new EasybuyCar();
        BeanUtils.populate(car,request.getParameterMap());
        car.setCreateTime(new Timestamp(new Date().getTime()));
        car.setUser(user);
        int car1=ORDER_SERVICE.add(car);
        if(car1>0){
            response.getWriter().print("true");
        }else{
            response.getWriter().print("false");
        }
        return null;

    }
}
