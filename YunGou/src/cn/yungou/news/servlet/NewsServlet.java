package cn.yungou.news.servlet;

import cn.yungou.commons.baseServlet.BaseServlet;
import cn.yungou.commons.constant.Constant;
import cn.yungou.commons.entity.*;
import cn.yungou.commons.util.BeanFactory;
import cn.yungou.commons.util.FileUploadUtils;
import cn.yungou.news.Service.EasyBuyNewsAndClassService;
import cn.yungou.news.Service.EasyBuyNewsClassService;
import cn.yungou.news.Service.EasybuyNewsService;
import cn.yungou.news.dao.EasyBuyNewsClassDao;
import org.lxh.smart.SmartUpload;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.jsp.PageContext;
import java.util.Date;
import java.util.List;

@WebServlet("/news")
public class NewsServlet extends BaseServlet{
    private static final EasyBuyNewsAndClassService NEWSANDCLASSSERVICE= (EasyBuyNewsAndClassService) BeanFactory.getBean("newsandclassservice");
    private static final EasyBuyNewsClassService NEWS_CLASS_SERVICE= (EasyBuyNewsClassService) BeanFactory.getBean("newsclass");
    private static final EasybuyNewsService NEWS_SERVICE= (EasybuyNewsService) BeanFactory.getBean("newsservice");
    /**
     * 查询所有新闻,包括分页
     * @param requset
     * @param response
     * @return
     * @throws Exception
     */
    public String getAllNewsAndClass(HttpServletRequest requset, HttpServletResponse response) throws Exception{
        String currPage1 = requset.getParameter("currPage");
        Integer currPage =null;
        if(currPage1==null){
            currPage=1;
        }else {
            currPage  = Integer.parseInt(currPage1);
        }
        Page<EasyBuyNewsAndClass> all = NEWSANDCLASSSERVICE.getAllByPage(currPage);

        requset.setAttribute("newsPages",all);
        Constant.LOGGER.debug(all);



        return  requset.getContextPath()+"/jsp/admin/news/newsList.jsp";
    }

    /**
     * 通过id查看新闻的详情
     * @param requset
     * @param response
     * @return
     * @throws Exception
     */
    public String getNewsBuyId(HttpServletRequest requset, HttpServletResponse response) throws Exception{
        Integer id = Integer.parseInt(requset.getParameter("id"));
        EasyBuyNewsAndClass newsBuyId = NEWSANDCLASSSERVICE.getNewsBuyId(id);
        requset.setAttribute("newsAndClass",newsBuyId);
//        resp.sendRedirect("/back1/newsDetail.jsp");
        return requset.getContextPath()+"/jsp/admin/news/newsDetail.jsp";

    }

    /**
     * 获取所有的分类并分页
     * @param requset
     * @param response
     * @return
     * @throws Exception
     */
    public String getAllClassPages(HttpServletRequest requset, HttpServletResponse response) throws Exception{
        String currPage1 = requset.getParameter("currPage");
        Integer currPage =null;
        if(currPage1==null){
            currPage=1;
        }else {
            currPage  = Integer.parseInt(currPage1);
        }

        Page<EasyBuyNewsClass> all = NEWS_CLASS_SERVICE.getAllByPage(currPage);
//        System.out.println(all);
        requset.setAttribute("newsClass",all);
         return  requset.getContextPath()+"/jsp/admin/news/newsClass.jsp";
    }

    /**
     * 添加新闻时获取所有的分类
     * @param requset
     * @param response
     * @return
     * @throws Exception
     */
    public String getAllClass(HttpServletRequest requset, HttpServletResponse response) throws Exception{
        String page = requset.getParameter("page");

        List all = NEWS_CLASS_SERVICE.getAll();
        requset.setAttribute("newsClass",all);
        return requset.getContextPath()+"/jsp/admin/news/addnews.jsp";

    }

    /**
     * 添加新闻
     * @param requset
     * @param response
     * @return
     * @throws Exception
     */
    public String addnews(HttpServletRequest requset, HttpServletResponse response) throws Exception{
        //数据上传
        EasybuyNews upload = FileUploadUtils.upload(this.getServletConfig(), requset, response);
        SmartUpload smart=new SmartUpload();
        NEWS_SERVICE.add(upload);
        Constant.LOGGER.debug(upload);
        response.sendRedirect(requset.getContextPath()+"/news?action=getAllNewsAndClass");

        return null;
    }
}
