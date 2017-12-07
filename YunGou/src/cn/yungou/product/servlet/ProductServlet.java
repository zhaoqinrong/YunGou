package cn.yungou.product.servlet;

import cn.yungou.commons.baseServlet.BaseServlet;
import cn.yungou.commons.constant.Constant;
import cn.yungou.commons.entity.*;
import cn.yungou.commons.util.BeanFactory;
import cn.yungou.commons.util.FileUploadUtils;
import cn.yungou.commons.util.JsonUtils;
import cn.yungou.product.service.CategoryService;
import cn.yungou.product.service.EasyBuyProductService;
import org.apache.commons.beanutils.BeanUtils;
import org.codehaus.jackson.mrbean.BeanUtil;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.sql.Timestamp;
import java.util.Arrays;
import java.util.Date;
import java.util.List;

@WebServlet("/product")
public class ProductServlet extends BaseServlet {

    private static final EasyBuyProductService PRODUCT_SERVICE = (EasyBuyProductService) BeanFactory.getBean("productservice");
    private static final CategoryService CATEGORY_SERVICE = (CategoryService) BeanFactory.getBean("categoryservice");

    /**
     * 查询所有的一级分类
     *
     * @param req
     * @param resp
     * @return
     */
    public String getAllByPage(HttpServletRequest req, HttpServletResponse resp) {
        String parameter = req.getParameter("currPage");
        Integer page = 1;
        if (parameter != null && !"".equals(parameter.trim())) {
            page = Integer.parseInt(parameter);
        }
//        Page products = PRODUCT_SERVICE.getAllByPage(page);
        List<EasybuyProductCategory> list = CATEGORY_SERVICE.getlevel1();

//        req.setAttribute("products",products);
        req.setAttribute("category", list);
//        Constant.LOGGER.debug("list的值为"+list);

        return req.getContextPath() + "/jsp/admin/product/productList.jsp";
    }

    /**
     * 通过条件查询商品,并分页显示
     *
     * @param request
     * @param response
     * @return
     */
    public String getProductBy(HttpServletRequest request, HttpServletResponse response) throws InvocationTargetException, IllegalAccessException, IOException {
        ProductCondition productCondition = new ProductCondition();
        BeanUtils.populate(productCondition, request.getParameterMap());
        Integer parameter = productCondition.getCurrPage();

        if (parameter == null) {
            productCondition.setCurrPage(1);
        }
        Page<EasybuyProduct> page = PRODUCT_SERVICE.getProductBycondition(productCondition);

//        request.setAttribute("products",page);
        String page1 = JsonUtils.writeValueAsString(page);
        response.getWriter().print(page1);

        return null;
    }

    /**
     * 添加商品
     *
     * @param request
     * @param response
     * @return
     * @throws Exception
     */
    public String addProduct(HttpServletRequest request, HttpServletResponse response) throws Exception {
        EasybuyProduct productupload = FileUploadUtils.productupload(this.getServletConfig(), request, response);
        int add = PRODUCT_SERVICE.add(productupload);
        response.sendRedirect("/product?action=getAllByPage");

        return null;
    }

    /**
     * 通过商品id查询商品
     *
     * @param request
     * @param response
     * @return
     * @throws Exception
     */
    public String getProductByid(HttpServletRequest request, HttpServletResponse response) throws Exception {
        String id = request.getParameter("id");
        if (id == null) {
            return null;
        }
        EasybuyProduct product = PRODUCT_SERVICE.getProductByid(Integer.parseInt(id));
        //获取所有的分类信息
        List<EasybuyProductCategory> list1 = CATEGORY_SERVICE.getAllByType(1);
        List<EasybuyProductCategory> list2 = CATEGORY_SERVICE.getAllByType(2);
        List<EasybuyProductCategory> list3 = CATEGORY_SERVICE.getAllByType(3);


//        List<EasybuyProductCategory> list=CATEGORY_SERVICE.getlevel1();
        request.setAttribute("product", product);
        request.setAttribute("allClass1", list1);
        request.setAttribute("allClass2", list2);
        request.setAttribute("allClass3", list3);

        return request.getContextPath() + "/jsp/admin/product/modifyProduct.jsp";
    }

    public String getProductByName(HttpServletRequest request, HttpServletResponse response) throws Exception {
        EasybuyProduct product = PRODUCT_SERVICE.getProductByName(request.getParameter("words"));
        EasybuyProductCategory[] cates = CATEGORY_SERVICE.getEasybuyProduct(product.getId());
        request.setAttribute("product", product);
        request.setAttribute("cates", Arrays.asList(cates));
        return request.getContextPath() + "/jsp/page.jsp";
    }

    /**
     * 修改商品
     *
     * @param request
     * @param response
     * @return
     * @throws Exception
     */
    public String modify(HttpServletRequest request, HttpServletResponse response) throws Exception {
        String id = request.getParameter("id");
        Integer id1 = null;
        if (id != null) {
            id1 = Integer.parseInt(id);
        } else {
            Constant.LOGGER.debug("修改失败");
            return request.getRequestURL().toString();
        }
        EasybuyProduct productupload = FileUploadUtils.productupload(this.getServletConfig(), request, response);
        productupload.setId(id1);
        int add = PRODUCT_SERVICE.modify(productupload);
        if (add > 0) {
            Constant.LOGGER.debug("修改成功");
            response.sendRedirect("/product?action=getAllByPage");
            return null;
        }

        Constant.LOGGER.debug("修改失败");


        return request.getRequestURL().toString();
    }

    /**
     * 商品详情页面
     *
     * @param request
     * @param response
     * @return
     * @throws Exception
     */
    public String getProductByidView(HttpServletRequest request, HttpServletResponse response) throws Exception {
        String id = request.getParameter("id");
        if (id == null) {
            return null;
        }
        //获取商品的一二三级分类名称,并放入数组
        EasybuyProductCategory[] cates = CATEGORY_SERVICE.getEasybuyProduct(Integer.parseInt(id));
        EasybuyProduct product = PRODUCT_SERVICE.getProductByid(Integer.parseInt(id));
        //获取所有的分类信息
//        List<EasybuyProductCategory> list=CATEGORY_SERVICE.getlevel1();
        request.setAttribute("product", product);
        request.setAttribute("cates", Arrays.asList(cates));
        return request.getContextPath() + "/jsp/page.jsp";
    }

    /**
     * 通过一级分类id查询商品
     *
     * @param request
     * @param response
     * @return
     * @throws Exception
     */
    public String getProBycate1(HttpServletRequest request, HttpServletResponse response) throws Exception {
        String id = request.getParameter("id");

        Integer id1 = null;
        if (id != null) {
            id1 = Integer.parseInt(id);
        }
        List<EasybuyProduct> list = PRODUCT_SERVICE.getProBycate1(id1);

        Constant.LOGGER.debug("list" + list);
        request.setAttribute("products", list);
        return request.getContextPath() + "/jsp/search.jsp";
    }

    /**
     * 通过二级分类id查询商品
     *
     * @param request
     * @param response
     * @return
     * @throws Exception
     */
    public String getProBycate2(HttpServletRequest request, HttpServletResponse response) throws Exception {
        String id = request.getParameter("id");

        Integer id1 = null;
        if (id != null) {
            id1 = Integer.parseInt(id);
        }
        List<EasybuyProduct> list = PRODUCT_SERVICE.getProBycate2(id1);

        Constant.LOGGER.debug("list" + list);
        request.setAttribute("products", list);
        return request.getContextPath() + "/jsp/search.jsp";
    }

    /**
     * 通过三级分类id查询商品
     *
     * @param request
     * @param response
     * @return
     * @throws Exception
     */
    public String getProBycate3(HttpServletRequest request, HttpServletResponse response) throws Exception {
        String id = request.getParameter("id");

        Integer id1 = null;
        if (id != null) {
            id1 = Integer.parseInt(id);
        }
        List<EasybuyProduct> list = PRODUCT_SERVICE.getProBycate3(id1);

        Constant.LOGGER.debug("list" + list);
        request.setAttribute("products", list);
        return request.getContextPath() + "/jsp/search.jsp";
    }

    /**
     * 联想功能实现
     *
     * @param request
     * @param response
     * @return
     * @throws Exception
     */
    public String search(HttpServletRequest request, HttpServletResponse response) throws Exception {
        String words = request.getParameter("words");
        String json = PRODUCT_SERVICE.findByLike(words);
        response.getWriter().print(json);
        return null;
    }

    /**
     * 模糊查询
     *
     * @param request
     * @param response
     * @return
     * @throws Exception
     */
    public String searchPro(HttpServletRequest request, HttpServletResponse response) throws Exception {
        String words = request.getParameter("words");
        List<EasybuyProduct> list = PRODUCT_SERVICE.searchPro(words);
        Constant.LOGGER.debug("list" + list);
        request.setAttribute("products", list);
        return request.getContextPath() + "/jsp/search.jsp";
    }




}
