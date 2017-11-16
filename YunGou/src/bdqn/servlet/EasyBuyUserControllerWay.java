package bdqn.servlet;

import bdqn.Service.EasybuyUserService;
import bdqn.Service.ServiceImpl.EasybuyUserServiceImpl;
import bdqn.entity.EasybuyUser;
import bdqn.servlet.util.Md5Util;

import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.security.NoSuchAlgorithmException;


public class EasyBuyUserControllerWay {
    private static EasybuyUserService easybuyUserService = new EasybuyUserServiceImpl();

    /**
     * 注册
     *
     * @param req
     * @param resp
     * @throws IOException 
     */
    public static void add(HttpServletRequest req, HttpServletResponse resp, EasybuyUser user) throws NoSuchAlgorithmException, IOException {
    	StringBuffer sb = new StringBuffer(req.getScheme() + "://" + req.getServerName() + ":"+req.getServerPort()+req.getContextPath()+"/");
    	
        //使用md5加密
        String md5Password = Md5Util.SetMd5(user.getLoginName(), user.getPassword());
        EasybuyUser user1 = user;//将user复制一份,然后为复制的对象的密码加密进行保存
        user1.setPassword(md5Password);
        int i = easybuyUserService.addUser(user1);
        if (i > 0) {
            setSession(req, resp, user);
            if(user.getType()!=null&&user.getType()!=1){
                resp.sendRedirect("/EasyBuyUser?action=gtAllUser");
                return ;
            }
            resp.sendRedirect(sb + "index.jsp");

        } else {
            return;
        }

    }

    private static void setSession(HttpServletRequest req, HttpServletResponse resp, EasybuyUser user) {
        HttpSession session = req.getSession();
        session.setAttribute("user", user);
//        session.setAttribute("password", user.getPassword());

    }

    /**
     * 保存用户信息到本地Cookie中
     *
     * @param req
     * @param resp
     * @param user
     */
    public static void setCookie(HttpServletRequest req, HttpServletResponse resp, EasybuyUser user) throws UnsupportedEncodingException {
        //用户cookie存储中文Cookie userName = new Cookie("userName", URLEncoder.encode(user.getLoginName(), "UTF-8") );
        Cookie userName = new Cookie("username", user.getLoginName() );
        Cookie password = new Cookie("password", user.getPassword());
        //设置cookie的有效时间
        userName.setMaxAge(60 * 60 * 24 * 7);
        password.setMaxAge(60 * 60 * 24 * 7);

        resp.addCookie(userName);
        resp.addCookie(password);



    }

    public static EasybuyUser eachCookie(HttpServletRequest req, HttpServletResponse resp) throws UnsupportedEncodingException {
        EasybuyUser user = null;
        Cookie[] cookies = req.getCookies();
        if (cookies != null) {
            user = new EasybuyUser();
            for (Cookie item : cookies) {
                if (("username").equals(item.getName())) {

//                    user.setLoginName(URLDecoder.decode(item.getValue(), "UTF-8"));
                    user.setLoginName(item.getValue());

                }
                if ("password".equals(item.getName())) {
                    user.setPassword(item.getValue());
                }

            }
        }
        return user;
    }

    /**
     * 前台要求保存到cookie中
     * @param req
     * @param resp
     * @param user
     * @param isCookie 是否保存到本地cookie
     * @throws IOException
     * @throws NoSuchAlgorithmException
     */

    public static void login(HttpServletRequest req, HttpServletResponse resp, EasybuyUser user,boolean isCookie) throws IOException, NoSuchAlgorithmException, ServletException {
    		
        StringBuffer sb = new StringBuffer(req.getScheme() + "://" + req.getServerName() + ":"+req.getServerPort()+req.getContextPath()+"/");

        //将前台传过来的密码进行加密,与数据库中的进行比对
        String password = Md5Util.SetMd5(user.getLoginName(), user.getPassword());

        EasybuyUser easybuyUser = easybuyUserService.login(user.getLoginName(), password);
        if (easybuyUser.getLoginName()!=null) {


            setSession(req, resp, easybuyUser);
            if(isCookie){EasyBuyUserControllerWay.setCookie(req,resp,user);}
            Integer type = easybuyUser.getType();

            /*if (type==2){
//                 req.getRequestDispatcher("/EasyBuyUser?action=gtAllUser").forward(req,resp);

               resp.sendRedirect("/EasyBuyUser?action=gtAllUser");
                    return ;

            }*/


            resp.sendRedirect(sb + "index.jsp");
            return;
        }
            resp.sendRedirect(sb + "login.jsp");

    }





}