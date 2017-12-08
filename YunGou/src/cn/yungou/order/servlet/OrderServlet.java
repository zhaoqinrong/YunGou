package cn.yungou.order.servlet;

import cn.yungou.commons.baseServlet.BaseServlet;
import cn.yungou.commons.entity.EasybuyCar;
import cn.yungou.commons.entity.EasybuyCarDetail;
import cn.yungou.commons.entity.EasybuyProduct;
import cn.yungou.commons.entity.EasybuyUser;
import cn.yungou.commons.util.BeanFactory;
import cn.yungou.order.service.OrderService;
import org.apache.commons.beanutils.BeanUtils;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/order")
public class OrderServlet extends BaseServlet {
 public static final   OrderService ORDER_SERVICE= (OrderService) BeanFactory.getBean("orderService");

    /**
     * 添加购物车
     * @param request
     * @param response
     * @return
     * @throws Exception
     */
    public String addCar(HttpServletRequest request, HttpServletResponse response) throws Exception {
      //从session获取用户数据,如果不存在,则返回登录界面,让用户进行登录
        EasybuyUser user = (EasybuyUser) request.getSession().getAttribute("user");
        if(user==null){
            response.getWriter().print("login");
            return null;
        }
        //如果用户存在,则获取数据进行封装
        EasybuyCarDetail carDetail=new EasybuyCarDetail();
        BeanUtils.populate(carDetail,request.getParameterMap());
        //给购物车设置信息
        EasybuyCar car=new EasybuyCar();
        car.setUid(user.getId());
        carDetail.setCar(car);
        //用户新加购物车默认不过期,设置为哦
        carDetail.getCar().setStatus(0);


//        car.setUid(user.getId());//设置用户id
        int car1=ORDER_SERVICE.add(carDetail);
        if(car1>0){
            response.getWriter().print("true");
        }else{
            response.getWriter().print("false");
        }
        return null;

    }

    /**
     * 获取用户购物车的数据
     * @param request
     * @param response
     * @return
     * @throws Exception
     */
    public String getMyCar(HttpServletRequest request, HttpServletResponse response) throws Exception {
//1.从session中得到用户的数据
   EasybuyUser user= (EasybuyUser) request.getSession().getAttribute("user");
     EasybuyCar car=  ORDER_SERVICE.getMyCar(user);
        return null;
    }
}
