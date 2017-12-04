package cn.yungou.product.servlet;

import cn.yungou.commons.baseServlet.BaseServlet;
import cn.yungou.commons.constant.Constant;
import cn.yungou.commons.entity.EasybuyProduct;
import cn.yungou.commons.entity.EasybuyProductCategory;
import cn.yungou.commons.entity.Page;
import cn.yungou.commons.entity.ProductCondition;
import cn.yungou.commons.util.BeanFactory;
import cn.yungou.commons.util.FileUploadUtils;
import cn.yungou.commons.util.JsonUtils;
import cn.yungou.product.service.CategoryService;
import cn.yungou.product.service.EasyBuyProductService;
import org.apache.commons.beanutils.BeanUtils;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.util.List;

@WebServlet("/product")
public class ProductServlet extends BaseServlet {

    private static final EasyBuyProductService PRODUCT_SERVICE= (EasyBuyProductService) BeanFactory.getBean("productservice");
    private static final CategoryService CATEGORY_SERVICE= (CategoryService) BeanFactory.getBean("categoryservice");

    /**
     * 查询所有商品,并分页显示
     * @param req
     * @param resp
     * @return
     */
    public String getAllByPage(HttpServletRequest req, HttpServletResponse resp) {
        String parameter = req.getParameter("currPage");
        Integer page=1;
        if(parameter!=null&&!"".equals(parameter.trim())){
            page = Integer.parseInt(parameter);
        }
        Page products = PRODUCT_SERVICE.getAllByPage(page);
        List<EasybuyProductCategory> list=CATEGORY_SERVICE.getlevel1();

        req.setAttribute("products",products);
        req.setAttribute("category",list);
//        Constant.LOGGER.debug("list的值为"+list);

        return req.getContextPath()+"/jsp/admin/product/productList.jsp";
    }

    /**
     * 通过条件查询商品,并分页显示
     * @param request
     * @param response
     * @return
     */
    public String getProductBy(HttpServletRequest request, HttpServletResponse response) throws InvocationTargetException, IllegalAccessException, IOException {
        ProductCondition productCondition=new ProductCondition();
        BeanUtils.populate(productCondition,request.getParameterMap());
        Integer parameter = productCondition.getCurrPage();

        if(parameter==null){
            productCondition.setCurrPage(1);
        }
        Page<EasybuyProduct> page = PRODUCT_SERVICE.getProductBycondition(productCondition);

//        request.setAttribute("products",page);
        String page1 = JsonUtils.writeValueAsString(page);
        response.getWriter().print(page1);

        return null;
    }
    public  String addProduct(HttpServletRequest request, HttpServletResponse response) throws Exception {
        EasybuyProduct productupload = FileUploadUtils.productupload(this.getServletConfig(), request, response);
        int add = PRODUCT_SERVICE.add(productupload);
        response.sendRedirect("/product?action=getAllByPage");

        return null;
    }
}
