package cn.yungou.product.servlet;

import cn.yungou.commons.baseServlet.BaseServlet;
import cn.yungou.commons.constant.Constant;
import cn.yungou.commons.entity.Classify;
import cn.yungou.commons.entity.EasybuyProductCategory;
import cn.yungou.commons.util.BeanFactory;
import cn.yungou.commons.util.JsonUtils;
import cn.yungou.product.service.CategoryService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/category")
public class CategoryServlet extends BaseServlet {
    public  final static CategoryService CATEGORYSERVICE = (CategoryService) BeanFactory.getBean("categoryservice");

    /**
     * 查询一级查单
     * @param req
     * @param resp
     * @return
     * @throws ServletException
     * @throws IOException
     */
    public String findAllCategory(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        try {
            Integer parentId = Integer.parseInt(req.getParameter("parentId"));
            List<EasybuyProductCategory> categoryList=CATEGORYSERVICE.findAllLevel(parentId);
            String json =  JsonUtils.writeValueAsString(categoryList);
            resp.getWriter().print(json);
        } catch (Exception e) {
            e.printStackTrace();
        }


        return null;
    }
    public String getlevelParentId(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int parentId = Integer.parseInt(req.getParameter("parentId"));
        List<EasybuyProductCategory> easybuyProductCategories = CATEGORYSERVICE.getlevelParentId(parentId);
        String s = JsonUtils.writeValueAsString(easybuyProductCategories);
        resp.getWriter().print(s);
        return null;
    }

    public String getClassify(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        try {
            Integer parentId = Integer.parseInt(req.getParameter("parentId"));
            List<Classify<EasybuyProductCategory>> categoryList=CATEGORYSERVICE.getClassify(parentId);
            String json =  JsonUtils.writeValueAsString(categoryList);
            Constant.LOGGER.debug(json);
            resp.getWriter().print(json);

        } catch (Exception e) {
            e.printStackTrace();
        }


        return null;
    }
    
}
