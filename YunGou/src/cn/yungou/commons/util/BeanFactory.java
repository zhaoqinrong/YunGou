package cn.yungou.commons.util;

import java.io.File;
import java.util.Map;

public class BeanFactory {
    public static Object getBean(String id, String path) {
        Class clazz = null;
        try {
            Map<String, String> beanMap = Configuration.config(path);

            String s = beanMap.get(id);
            System.out.println(s);
            clazz = Class.forName(s);
            return clazz.newInstance();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch (IllegalAccessException e) {
            e.printStackTrace();
        } catch (InstantiationException e) {
            e.printStackTrace();
        }
        return null;

    }

    public static Object getBean(String id) {

        String path = "E:\\MyEclipse 2017 CI\\Workspaces\\YunGou\\resources\\bean.xml";

        return getBean(id, path);
    }


}
