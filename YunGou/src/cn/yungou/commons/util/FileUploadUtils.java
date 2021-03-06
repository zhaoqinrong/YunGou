package cn.yungou.commons.util;

import cn.yungou.commons.constant.Constant;
import cn.yungou.commons.entity.EasybuyNews;
import cn.yungou.commons.entity.EasybuyProduct;
import org.lxh.smart.Request;
import org.lxh.smart.SmartUpload;

import javax.servlet.ServletConfig;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.util.Date;


public class FileUploadUtils {
    /**
     * 新闻文件上传,使用smartUpload
     *
     * @return
     */
    public static EasybuyNews upload(ServletConfig config, HttpServletRequest request, HttpServletResponse response) throws Exception {
        //1.实例化SmartUpload对象
        SmartUpload smart = new SmartUpload();
        //2.初始化上传操作
        smart.initialize(config, request, response);
        //3.文件上传
        smart.upload();
        //为了避免重复上传后文件覆盖,可以加上一个随机的时间戳
        //1.获取客户端的ip地址
        String ipaddr = request.getRemoteAddr();
        String fileName = fileName(ipaddr);
        //获取文件的后缀名
        String fileExt = smart.getFiles().getFile(0).getFileExt();
        //拼接文件名:
        fileName = fileName + "." + fileExt;
        //文件保存
        System.out.println(request.getServletContext().getRealPath("/") + "upload" + File.separator + fileName);
        smart.getFiles().getFile(0).saveAs("E:\\MyEclipse 2017 CI\\Workspaces\\YunGou\\WebRoot\\upload" + File.separator + fileName);
        EasybuyNews news = new EasybuyNews();
        //获取数据
        Request request1 = smart.getRequest();
        String title = request1.getParameter("title");
        String aClassid = request1.getParameter("classid");
        String content = request1.getParameter("content");
        //封装数据
        news.setClassid(Integer.parseInt(aClassid));
        news.setContent(charset(content));
        news.setCreateTime(new Date());
        news.setImg(charset(fileName));
        news.setTitle(charset(title));
        Constant.LOGGER.debug("开始调用add添加新闻");
        return news;
    }

    /**
     * 宝贝新增上传
     *
     * @param config
     * @param request
     * @param response
     * @return
     * @throws Exception
     */
    public static EasybuyProduct productupload(ServletConfig config, HttpServletRequest request, HttpServletResponse response) throws Exception {
        EasybuyProduct product = new EasybuyProduct();
        //1.实例化SmartUpload对象
        SmartUpload smart = new SmartUpload();

        //2.初始化上传操作
        smart.initialize(config, request, response);
        //3.文件上传
        Constant.LOGGER.debug("上传文件名"+request.getParameter("fileName"));
        smart.upload();
        //为了避免重复上传后文件覆盖,可以加上一个随机的时间戳
        //1.获取客户端的ip地址
        String ipaddr = request.getRemoteAddr();
        String fileName = fileName(ipaddr);
        //获取文件的后缀名


        String fileName1 = smart.getFiles().getFile(0).getFileName();
        if(fileName1!=null&&!"".equals(fileName1.trim())&&!"null".equals(fileName1.trim())){
            String fileExt = smart.getFiles().getFile(0).getFileExt();
            //拼接文件名:
            fileName = fileName + "." + fileExt;
            Constant.LOGGER.debug("上传文件名"+fileName);
            //文件保存
//        System.out.println(request.getServletContext().getRealPath("/")+"productImg"+ File.separator+fileName);
            smart.getFiles().getFile(0).saveAs("E:\\MyEclipse 2017 CI\\Workspaces\\YunGou\\WebRoot\\productImg" + File.separator + fileName);
            product.setFileName(fileName);
        }


        //获取数据
        String id = request.getParameter("id");

        Request request1 = smart.getRequest();

        String categorygoryLevel1 = request1.getParameter("categorygoryLevel1");
        String categorygoryLevel2 = request1.getParameter("categorygoryLevel2");
        String categorygoryLevel3 = request1.getParameter("categorygoryLevel3");
        String name = request1.getParameter("name");
        String description = request1.getParameter("description");
        String price = request1.getParameter("price");
        String stock = request1.getParameter("stock");
        //封装数据

        product.setCategorygoryLevel1(Integer.parseInt(categorygoryLevel1));
        product.setCategorygoryLevel2(Integer.parseInt(categorygoryLevel2));
        product.setCategorygoryLevel3(Integer.parseInt(categorygoryLevel3));
        //解决中文乱码
        Constant.LOGGER.debug("name"+name);
        Constant.LOGGER.debug("description"+description);
        Constant.LOGGER.debug("name转换后"+charset(name));
        Constant.LOGGER.debug("description转换后"+charset(description));
        product.setName( charset(name));
        product.setDescription( charset(description));
        product.setPrice(Float.parseFloat(price));
        product.setStock(Integer.parseInt(stock));
        product.setIsDelete(0);
        Constant.LOGGER.debug("开始调用add添加商品");
        return product;
    }

    public static String fileName(String ip) {
        //获取当前的时间戳
        long time = new Date().getTime();
        String num = "";
        //生成三位随机数
        for (int i = 0; i < 3; i++) {
            double floor = Math.floor(Math.random() * 10);
            num += floor;
        }
        return (time + num + ip).replace(".", "");
    }

    public static String charset(String str) throws UnsupportedEncodingException {
        return new String(str.trim().getBytes(), "UTF-8");
    }

}
