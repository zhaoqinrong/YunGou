package cn.yungou.user.servlet;

import cn.yungou.user.Service.ServiceImpl.EasybuyUserServiceImpl;
import cn.yungou.commons.entity.EasybuyUser;
import org.apache.log4j.Logger;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.security.NoSuchAlgorithmException;
import java.sql.SQLException;
import java.util.List;

@WebServlet({"/EasyBuyUser"})
public class EasyBuyUserControllerCenter extends HttpServlet {

    private static EasybuyUserServiceImpl easybuyUserService =null;
    private static Logger logger=null;
    static {
        easybuyUserService=new EasybuyUserServiceImpl();
        logger = Logger.getLogger(EasyBuyUserControllerCenter.class);
    }

    @Override
    public void doGet(HttpServletRequest req, HttpServletResponse resp) {
        doPost(req, resp);
    }

    @Override
    public void doPost(HttpServletRequest req, HttpServletResponse resp) {
        StringBuffer sb = new StringBuffer(req.getScheme() + "://" + req.getServerName() + ":" + req.getServerPort() + req.getContextPath() + "/");


        //从页面接收数据并进行封装
        String userid = req.getParameter("userid");


        String loginName = req.getParameter("loginName");
        String email = req.getParameter("email");
        String phone = req.getParameter("phone");

        String password = req.getParameter("password");
        String isCookie = req.getParameter("cookie");
        String userName = req.getParameter("userName");

        String sex = req.getParameter("sex1");

        String identityCode = req.getParameter("identityCode");
        String type = req.getParameter("type");

        StringBuffer requestURL = req.getRequestURL();
        EasybuyUser user = new EasybuyUser();
        user.setLoginName(loginName);
        user.setEmail(email);
        user.setMobile(phone);
        user.setPassword(password);
        user.setUserName(userName);
        user.setIdentityCode(identityCode);

        Integer userid1 = null;

        if (userid != null) {
            userid1 = Integer.parseInt(userid);
            user.setId(userid1);
        }
        if (sex != null)
            user.setSex(new Integer(sex));


        user.setIdentityCode(identityCode);
        if (type != null)
            user.setType(Integer.parseInt(type));


        String action = req.getParameter("action");
      
   /*     //获取用户发起请求的url
        StringBuffer requestURL = req.getRequestURL();
        //http://localhost/EasyBuyUser/add 拆分用户请求的url
        String url = requestURL.substring(requestURL.toString().lastIndexOf("/") + 1);*/
        //用户注册
        if ("add".equals(action)) {
            addServlet(req, resp, user);
            //用户登录
        } else if ("login".equals(action)) {
            loginServlet(req, resp, loginName, password, isCookie, user);


        } else if ("findByLoginName".equals(action)) {
            findByLoginName(resp, loginName);

            //后台获取用户所有数据
        } else if ("gtAllUser".equals(action) ) {
            getAllUserServlet(req, resp);


//根据用户id删除用户信息
        } else if ("delById".equals(action)) {

            delByIdServlet(resp, userid);


        } else if ("modify".equals(action)) {
            modifyServlet(resp, user, userid1);


        } else if ("valida".equals(action)) {
            validaServlet(resp, loginName, user, userid1);
        }else if("loginOut".equals(action)){
            loginOut(req, resp);
        }


    }

    private void loginOut(HttpServletRequest req, HttpServletResponse resp) {
        req.getSession().invalidate();
        try {
            resp.sendRedirect("login.jsp");
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    /**
     * 用户在修改信息的时候,验证用户名
     * @param resp
     * @param loginName
     * @param user
     * @param userid1
     */
    private void validaServlet(HttpServletResponse resp, String loginName, EasybuyUser user, Integer userid1) {
        EasybuyUser user1 = easybuyUserService.findByLoginName(loginName);
        System.out.println(user1);
        System.out.println(userid1);
        logger.debug(user1);
        if (user1 != null) {

            user.setId(userid1);
            if (userid1 == user1.getId()) {
                try {
                    logger.debug("id=userid valida");
                    resp.getWriter().write("true");

                } catch (IOException e) {
                    e.printStackTrace();
                }
                return;
            }
            try {
                logger.debug("id不相等");
                resp.getWriter().write("false");
            } catch (IOException e) {
                e.printStackTrace();
            }


        } else {//也可以修改信息
            user.setId(userid1);
            try {
                logger.debug("进行了elsevalida");
                resp.getWriter().write("true");
            } catch (IOException e) {
                e.printStackTrace();
            }

        }
    }

    /**
     * 修改用户信息
     * @param resp
     * @param user
     * @param userid1
     */
    private void modifyServlet(HttpServletResponse resp, EasybuyUser user, Integer userid1) {
        EasybuyUser user1 = null;
        try {
            user1 = easybuyUserService.findById(userid1);
            user.setPassword(user1.getPassword());
        } catch (SQLException e) {
            e.printStackTrace();
        }

        //通过用户名来查用户,如果用户不存在,说明名字没被使用,如果用户存在,说明名字被使用,判断是否是用户本人,还是其他人占用
        logger.debug("进入了modify");
        try {//说明是用户本人,可以进行修改其他的信息
            int i = easybuyUserService.updateUser(user);
            if (i > 0) {
                logger.debug(user);
                resp.sendRedirect("EasyBuyUser?action=gtAllUser&flag=true");
                return;
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    /**
     * 通过id删除用户
     * @param resp
     * @param userid
     */
    private void delByIdServlet(HttpServletResponse resp, String userid) {
        if (userid == null) {
            return;
        }
        int id = new Integer(userid);
        int i = easybuyUserService.deleUser(id);
        boolean flag = false;

        if (i > 0)
            flag = true;


        if (flag) {
            try {


                resp.sendRedirect("/EasyBuyUser?action=gtAllUser&flag=" + flag);

            } catch (IOException e) {
                logger.error(e + "\"delById\".equals(action)抛出IOException异常======未被注册");
            }
        }
    }

    /**
     * 获取所有用户
     * @param req
     * @param resp
     */
    private void getAllUserServlet(HttpServletRequest req, HttpServletResponse resp) {
        String flag = req.getParameter("flag");

        List<EasybuyUser> allUser = easybuyUserService.getAllUser();
        HttpSession session = req.getSession();
        session.removeAttribute("users");
//            session.invalidate();
        session.setAttribute("users", allUser);
        if (flag != null) {
            try {
                resp.getWriter().write(flag);
            } catch (IOException e) {
                e.printStackTrace();
            }
            return;
        }
        try {
//                StringBuffer sb1 = new StringBuffer(req.getScheme() + "://" + req.getServerName() + ":"+req.getServerPort()+req.getContextPath()+"/");
//                req.getRequestDispatcher("/back/users.jsp").forward(req,resp);
            resp.sendRedirect("/back1/usersList.jsp");
        } catch (IOException e) {
            logger.error(e + "\"gtAllUser\".equals(action)抛出IOException异常======未被注册");

        }
    }

    /**
     * 通过用户名来查找用户
     * @param resp
     * @param loginName
     */
    private void findByLoginName(HttpServletResponse resp, String loginName) {
        if (loginName.trim() != null && loginName.trim() != "") {

            EasybuyUser user1 = easybuyUserService.findByLoginName(loginName);
            //已经被注册


            if (user1!=null&&user1.getLoginName() != null) {

                try {
                    resp.getWriter().write("false");
                } catch (IOException e) {
                    logger.error(e + "\"findByLoginName\".equals(action)抛出IOException异常======已经被注册");
                }
            } else {
                try {
                    resp.getWriter().write("true");
                } catch (IOException e) {
                    logger.error(e + "\"findByLoginName\".equals(action)抛出IOException异常======未被注册");
                }
            }
        }
    }

    /**
     * 登录的Servlet
     * @param req
     * @param resp
     * @param loginName
     * @param password
     * @param isCookie
     * @param user
     */
    private void loginServlet(HttpServletRequest req, HttpServletResponse resp, String loginName, String password, String isCookie, EasybuyUser user) {
        //对用户的用户名和密码进行判断
        if (loginName != null && loginName.trim() != "") {
            if (password != null && password.trim() != "") {
                boolean flag = isCookie != null ? true : false;

                try {
                    EasyBuyUserControllerWay.login(req, resp, user, flag);
                } catch (IOException e) {
                    logger.error(e + "EasyBuyUserControllerCenter.doPost()中 if ('login'.equals(url))抛出IOException异常");
                } catch (NoSuchAlgorithmException e) {
                    logger.error(e + "EasyBuyUserControllerCenter.doPost()中 if ('login'.equals(url))抛出NoSuchAlgorithmException异常");
                } catch (ServletException e) {
                    logger.error(e + "EasyBuyUserControllerCenter.doPost()中 if ('login'.equals(url))抛出ServletException异常");
                }
            }
        }
    }

    /**
     * 新增用户
     * @param req
     * @param resp
     * @param user
     */

    private void addServlet(HttpServletRequest req, HttpServletResponse resp, EasybuyUser user) {
        try {
            EasyBuyUserControllerWay.add(req, resp, user);
        } catch (UnsupportedEncodingException e) {
            logger.error(e + "EasyBuyUserControllerCenter.doPost()中 if ('add'.equals(url))抛出UnsupportedEncodingException异常");

        } catch (NoSuchAlgorithmException e) {
            logger.error(e + "EasyBuyUserControllerCenter.doPost()中 if ('add'.equals(url))抛出NoSuchAlgorithmException异常");

        } catch (IOException e) {

            logger.error(e + "EasyBuyUserControllerCenter.doPost()中 if ('add'.equals(url))抛出IOException异常");

        }
    }



}
