package cn.yungou.cart.servlet;

import cn.yungou.cart.service.CartService;
import cn.yungou.commons.baseServlet.BaseServlet;
import cn.yungou.commons.constant.Constant;
import cn.yungou.commons.entity.EasybuyCar;
import cn.yungou.commons.entity.EasybuyCarDetail;
import cn.yungou.commons.entity.EasybuyUser;
import cn.yungou.commons.util.BeanFactory;
import cn.yungou.commons.util.JsonUtils;
import org.apache.commons.beanutils.BeanUtils;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/cart")
public class CartServlet extends BaseServlet{
    private static final CartService CART_SERVICE= (CartService) BeanFactory.getBean("cartservice");
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
        //如果用户存在,则获取数据进行封装,前台传来pid和pum,封装到购物车项中
        EasybuyCarDetail carDetail=new EasybuyCarDetail();
        BeanUtils.populate(carDetail,request.getParameterMap());
        //给购物车设置信息
        EasybuyCar car=new EasybuyCar();
        car.setUid(user.getId());
        carDetail.setCar(car);
        //用户新加购物车默认不过期,设置为哦
        carDetail.setStatus(0);


//        car.setUid(user.getId());//设置用户id
        int car1=CART_SERVICE.add(carDetail);
        if(car1>0){
            response.getWriter().print("true");
        }else{
            response.getWriter().print("false");
        }
        return null;

    }

    /**
     * 获取用户购物车的数据,包括过期和不过期的
     * @param request
     * @param response
     * @return
     * @throws Exception
     */
    public String getMyAllCar(HttpServletRequest request, HttpServletResponse response) throws Exception {
//1.从session中得到用户的数据
        EasybuyUser user= (EasybuyUser) request.getSession().getAttribute("user");
//        CART_SERVICE.valideCarDe(user.getId());//是否过期
        EasybuyCar car=  CART_SERVICE.getMyAllCar(user);
        response.getWriter().print(JsonUtils.writeValueAsString(car));
        return null;
    }

    /**
     * 通过购物车项的id删除购物车项
     * @param request
     * @param response
     * @return
     * @throws Exception
     */
    public String delCartDetailById(HttpServletRequest request, HttpServletResponse response) throws Exception {
        String id = request.getParameter("id");
        PrintWriter writer = response.getWriter();
        if(id==null||"".equals(id.trim())){
            writer.print("false");
            return null;
        }
        int flag=CART_SERVICE.delCartDetailById(Integer.parseInt(id));
        if(flag>0){
            writer.print("true");
            return  null;
        }
        writer.print("false");
        return null;
    }

    /**
     * 清空购物车
     * @param request
     * @param response
     * @return
     * @throws Exception
     */
    public String delAllCarDetail(HttpServletRequest request, HttpServletResponse response) throws Exception {
        String ids = request.getParameter("ids");
        EasybuyUser user = (EasybuyUser) request.getSession().getAttribute("user");
        PrintWriter writer = response.getWriter();
        if(ids==null||"".equals(ids.trim())){//后台获取的数据为空
            writer.print("false");
            return null;
        }
        List<Integer> idss=new ArrayList<>();
        String[] split = ids.split("-");
        for (int i = 0; i <split.length ; i++) {//将String转为integer
          idss.add(Integer.parseInt(split[i]));
        }
        Constant.LOGGER.debug("idss"+idss);
      int flag=  CART_SERVICE.delAllCarDetail(idss,user.getId());
        if(flag>0){//如果删除成功
            writer.print("true");
            return null;
        }
        writer.print("flase");//删除失败

        return null;
    }

    /**
     * 检查用户的哪些购物车项失效
     * @param request
     * @param response
     * @return
     * @throws Exception
     */
    public String valide(HttpServletRequest request, HttpServletResponse response) throws Exception {
        EasybuyUser user = (EasybuyUser) request.getSession().getAttribute("user");
     List<EasybuyCarDetail> easybuyCarDetails=  CART_SERVICE.valideCarDe(user.getId());
        String s = JsonUtils.writeValueAsString(easybuyCarDetails);
        response.getWriter().print(s);
        return null;
    }

}
