package cn.yungou.user.servlet;

import cn.yungou.commons.baseServlet.BaseServlet;
import cn.yungou.commons.constant.Constant;
import cn.yungou.commons.entity.EasybuyUser;
import cn.yungou.commons.entity.Page;
import cn.yungou.commons.util.BeanFactory;
import cn.yungou.user.Service.EasybuyUserService;
import org.apache.commons.beanutils.BeanUtils;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.sql.SQLException;
import java.util.List;

@WebServlet("/adminUser")
public class AdminUserServlet extends BaseServlet {
    public final static EasybuyUserService USERSERVICE = (EasybuyUserService) BeanFactory.getBean("userservice");

    /**
     * 请求到后台首页
     */
    public String indexUI(HttpServletRequest request, HttpServletResponse response) {
        return "/jsp/admin/index.jsp";
    }

 /*   public String getAlluser(HttpServletRequest request, HttpServletResponse response) {

        List<EasybuyUser> all = USERSERVICE.getAll();
        request.setAttribute("users", all);
        return request.getContextPath()+"/jsp/admin/user/usersList.jsp";
    }*/

    public String getPageUser(HttpServletRequest request, HttpServletResponse response) {
        Integer currPage = Integer.parseInt(request.getParameter("currPage"));
        Page<EasybuyUser> all = USERSERVICE.getAllByPage(currPage);
        request.setAttribute("userpage", all);
        System.out.println(all);
        return request.getContextPath()+"/jsp/admin/user/usersList.jsp";
    }

    public String modify(HttpServletRequest request, HttpServletResponse response) throws InvocationTargetException, IllegalAccessException {
        EasybuyUser user = new EasybuyUser();
        BeanUtils.populate(user, request.getParameterMap());
        EasybuyUser user1 = null;
        try {
            user1 = USERSERVICE.findById(user.getId());
            user.setPassword(user1.getPassword());
            user.setStatus(user1.getStatus());
            user.setCode(user1.getCode());
        } catch (SQLException e) {
            e.printStackTrace();
        }

        //通过用户名来查用户,如果用户不存在,说明名字没被使用,如果用户存在,说明名字被使用,判断是否是用户本人,还是其他人占用
        Constant.LOGGER.debug("进入了modify");
        try {//说明是用户本人,可以进行修改其他的信息
            int i = USERSERVICE.update(user);
                response.sendRedirect("/adminUser?action=getPageUser");
        } catch (IOException e) {
            e.printStackTrace();
        }
        return null;
    }

    /**
     * 后台修改时进行校验
     *
     * @param request
     * @param response
     * @return
     */
    public String valida(HttpServletRequest request, HttpServletResponse response) throws Exception {
        EasybuyUser user = new EasybuyUser();//前台传过来userid和loginName
        BeanUtils.populate(user, request.getParameterMap());
        EasybuyUser user1 = USERSERVICE.findByLoginName(user.getLoginName());
        System.out.println(user1.getId());
        System.out.println(user.getId());
//        Constant.LOGGER.debug(user);
        if (user1 != null && user1.getId() != null) {//说明用户名存在,需要判断是本人还是别人在使用
            if (!user.getId().equals(user1.getId())) {//前台传过来的用户id和数据库查询的一致,表明是同一人,即用户自己
                Constant.LOGGER.debug("id不相等");
                response.getWriter().write("false");
                return null;
            }
            Constant.LOGGER.debug("id=userid valida");
            response.getWriter().write("true");
            return null;

        } else {//用户名在后台不存在
//            user.setId(user1.getId());

            Constant.LOGGER.debug("进行了elsevalida");
            response.getWriter().write("true");

        }
        return null;
    }

    public String delById(HttpServletRequest request, HttpServletResponse response) throws Exception {
        Integer id = Integer.parseInt(request.getParameter("id"));
        int i = USERSERVICE.delete(id);
        if(i>0){
            response.getWriter().write("true");
        }
        return null;

    }
}
