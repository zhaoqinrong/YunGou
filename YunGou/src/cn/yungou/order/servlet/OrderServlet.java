package cn.yungou.order.servlet;

import cn.yungou.commons.baseServlet.BaseServlet;
import cn.yungou.commons.util.BeanFactory;
import cn.yungou.order.service.OrderService;

import javax.servlet.annotation.WebServlet;

@WebServlet("/order")
public class OrderServlet extends BaseServlet {
 public static final   OrderService ORDER_SERVICE= (OrderService) BeanFactory.getBean("orderService");


}
