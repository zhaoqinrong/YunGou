package cn.yungou.user.servlet;

import cn.yungou.commons.baseServlet.BaseServlet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * 和首页相关的servlet
 */
@WebServlet("/index")
public class IndexServlet extends BaseServlet {
    public String index(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    	System.out.println(req.getContextPath()+"/jsp/index.jsp");

        return req.getContextPath()+"/jsp/";//到baseServlet中转发到首页
    }
}
