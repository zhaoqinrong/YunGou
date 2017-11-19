package cn.yungou.news.servlet;

import cn.yungou.news.Service.EasyBuyNewsAndClassService;
import cn.yungou.news.Service.EasybuyNewsService;
import cn.yungou.news.Service.ServiceImpl.EasyBuyNewsAndClassServiceImpl;
import cn.yungou.news.Service.ServiceImpl.EasybuyNewsServiceImpl;
import cn.yungou.commons.entity.EasyBuyNewsAndClass;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;
@WebServlet("/EasyBuyNews")
public class EasyBuyNewsControllerCenter extends HttpServlet{
    private static EasybuyNewsService easybuyNewsService=new EasybuyNewsServiceImpl();
    private static EasyBuyNewsAndClassService easyBuyNewsAndClassService=new EasyBuyNewsAndClassServiceImpl();

    @Override
    public  void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req,resp);
    }

    @Override
    public void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String id = req.getParameter("id");
        String title = req.getParameter("title");
        String content = req.getParameter("content");
        String createTime = req.getParameter("createTime");
        String cid = req.getParameter("cid");
        String className = req.getParameter("className");
        Integer id1=null;
        if (id!=null){
            id1 = Integer.parseInt(id);
        }

        String action = req.getParameter("action");
       /* if("getAllNews".equals(action)){
            List<EasybuyNews> allNews = easybuyNewsService.getAllNews();
            HttpSession session = req.getSession();
            session.setAttribute("allNews",allNews);
            resp.sendRedirect("/back1/newsList.jsp");
        }*/
        if("getAllNewsAndClass".equals(action)){
            List<EasyBuyNewsAndClass> allNewsAndClass = easyBuyNewsAndClassService.getAll();
            HttpSession session = req.getSession();
            session.setAttribute("allNewsAndClass",allNewsAndClass);
            resp.sendRedirect("/back1/newsList.jsp");
        }
        if("getNewsBuyId".equals(action)){
            EasyBuyNewsAndClass newsBuyId = easyBuyNewsAndClassService.getNewsBuyId(id1);
            System.out.println(newsBuyId);
            req.getSession().setAttribute("newsAndClass",newsBuyId);
            resp.sendRedirect("/back1/newsDetail.jsp");

        }
    }
}
