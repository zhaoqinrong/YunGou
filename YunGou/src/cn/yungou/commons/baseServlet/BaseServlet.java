package cn.yungou.commons.baseServlet;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.lang.reflect.Method;

public class BaseServlet extends HttpServlet {


    @Override
    public void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            //获取子类的字节码文件
            Class clazz = this.getClass();
            //获取请求方法
            String action = req.getParameter("action");
            if (action == null) {
                action = "index";
            }
            //获取方法对象
            Method method = clazz.getMethod(action, HttpServletRequest.class, HttpServletResponse.class);
            //让方法执行,返回请求的路径

            String path = (String) method.invoke(this, req, resp);

            //判断s是否为空
            if (path != null) {
                req.getRequestDispatcher(path).forward(req, resp);
            }
        } catch (Exception e) {
            e.printStackTrace();
            throw new RuntimeException();
        }

    }

    public String index(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        return null;
    }
}
