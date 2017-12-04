package cn.yungou.user.servlet;

import cn.yungou.commons.baseServlet.BaseServlet;
import cn.yungou.commons.constant.Constant;
import cn.yungou.commons.entity.EasybuyUser;
import cn.yungou.commons.myconvert.Myconvet;
import cn.yungou.commons.util.BeanFactory;
import cn.yungou.commons.util.MD5Utils;
import cn.yungou.commons.util.UUIDUtils;
import cn.yungou.user.Service.EasybuyUserService;
import org.apache.commons.beanutils.BeanUtils;
import org.apache.commons.beanutils.ConvertUtils;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.util.Date;

@WebServlet("/user")
public class UserServlet extends BaseServlet {
    public  final static EasybuyUserService USERSERVICE= (EasybuyUserService) BeanFactory.getBean("userservice");

    /**
     * 跳转到用户的注册页面
     *
     * @return 页面注册地址
     */
    public String registerUI(HttpServletRequest request, HttpServletResponse response) {
        return "/jsp/register.jsp";
    }

    /**
     * 跳转到登录页面
     */
    public String loginUI(HttpServletRequest request, HttpServletResponse response) {
        return "/jsp/login.jsp";
    }

    /**
     * 用户注册
     */
    public String regist(HttpServletRequest request, HttpServletResponse response) throws InvocationTargetException, IllegalAccessException, IOException {
        EasybuyUser user = new EasybuyUser();
        //注册自定义转换类型
        ConvertUtils.register(new Myconvet(), Date.class);
        //封装user
        BeanUtils.populate(user, request.getParameterMap());
        //将密码加密
        user.setPassword(MD5Utils.md5(user.getPassword()));
        user.setStatus(0);
        user.setCode(UUIDUtils.getUUID());


        //用户添加到数据库
        int i = USERSERVICE.add(user);
        if (i > 0)
            Constant.LOGGER.debug("用户注册成功");
        else
            Constant.LOGGER.debug("用户注册失败");
        request.setAttribute("msg", "恭喜您注册成功,请到邮箱进行激活~~~~~~~~~~~~~");
        return "/jsp/msg.jsp";
    }

    /**
     * 用户激活
     */
    public String active(HttpServletRequest request, HttpServletResponse response) {
        //获取激活码
        String code = request.getParameter("code");
        //调用service完成激活
        EasybuyUser user = USERSERVICE.active(code);
        if (user == null||user.getStatus()!=1) {
            request.setAttribute("msg", "用户激活失败,请重新注册");
        } else {
            request.setAttribute("msg", "恭喜您激活成功");
        }
        return "/jsp/msg.jsp";


    }

    /**
     * 用户登录
     */
    public String login(HttpServletRequest request, HttpServletResponse response) throws InvocationTargetException, IllegalAccessException, IOException {
        Constant.LOGGER.debug("进入登录");
        //获取用户输入的数据
        String loginName = request.getParameter("loginName"); //用户名
        String password = request.getParameter("password"); //密码
        String cookie = request.getParameter("cookie"); //是否记住密码
        //md5加密密码
        password=MD5Utils.md5(password);

        //用户登录
        EasybuyUser user = USERSERVICE.login(loginName, password);
        //判断用户名和密码是否正确
        if (user==null||user.getId()==null){
            Constant.LOGGER.debug("用户名和密码不匹配");
            //用户名和密码不正确
            request.setAttribute("msg","用户名和密码不匹配");
            return "/jsp/login.jsp";
        }else{
            //如果用户名和密码输入正确,判断用户是否激活
            if(Constant.USER_IS_ACTIVE!=user.getStatus()){
                Constant.LOGGER.debug("用户未激活");
                request.setAttribute("msg","用户未激活");
                return "/jsp/login.jsp";

            }else{
                //用户已激活,可以登录保存session
                request.getSession().setAttribute("user",user);
                //如果用户点击了保存密码,则将用户的登录名和密码保存在本地
                if (Constant.COOKID.equals(cookie)){

                }
                Constant.LOGGER.debug("用户登录成功");
                response.sendRedirect(request.getContextPath()+"/");
            }
        }

        return null;
    }
    /**
     * 用户退出logout
     */
    public String logout(HttpServletRequest request, HttpServletResponse response) throws IOException {
        //session失效
        request.getSession().invalidate();
        Constant.LOGGER.debug("session被干掉");
        //重定向
        response.sendRedirect(request.getContextPath()+"/");
        Constant.LOGGER.debug("退出后,重定向到首页");
        //处理自动登录

        return null;
    }

    /**
     * 用户注册时验证用户名是否被注册
     * @param request
     * @param response
     * @return
     * @throws Exception
     */
  public String valida(HttpServletRequest request, HttpServletResponse response) throws Exception{
        String loginName = request.getParameter("loginName");
        EasybuyUser user = USERSERVICE.findByLoginName(loginName);
        if(user!=null&&user.getId()!=null){
            response.getWriter().print("false");
        }else{
            response.getWriter().print("true");
        }
        return null;

    }
}
