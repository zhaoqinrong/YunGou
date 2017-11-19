package cn.yungou.commons.util;

import org.apache.log4j.Logger;

import java.lang.reflect.Field;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ResultSetUtil {
	private static Logger logger=Logger.getLogger(ResultSetUtil.class);
    public static <T> List<T> eachResult(ResultSet resultSet, Class<T> clazz) {
        List<T> list = new ArrayList<T>();

        try {
            T object = null;
            //循环遍历ResultSet
            while (resultSet.next()) {

                object = clazz.newInstance();//创建clazz类型的对象
                Field[] declaredFields = clazz.getDeclaredFields(); //获取clazz类型对象中的所有属性
                for (int i = 0; i < declaredFields.length; i++) {//循环给clazz类型对象的所有属性赋值
                    declaredFields[i].setAccessible(true);
                    declaredFields[i].set(object, resultSet.getObject(declaredFields[i].getName()));


                }
                list.add(object);
            }
        } catch (SQLException e) {
        	logger.error(e+"ResultSetUtil1.eachResult()抛出SQLException异常");
        } catch (IllegalAccessException e) {
        	logger.error(e+"ResultSetUtil1.eachResult()抛出IllegalAccessException异常");
        } catch (InstantiationException e) {
        	logger.error(e+"ResultSetUtil1.eachResult()抛出InstantiationException异常");
        }
        return list;
    }

    public static <T> T findOne(ResultSet rs, Class<T> clazz) {
        T object = null;
        try {

            if (rs.next()) {
                object = clazz.newInstance();
                Field[] fields = clazz.getDeclaredFields();
                for (Field field : fields) {
                    field.setAccessible(true);
                    field.set(object, rs.getObject(field.getName()));
                }
            }
        } catch (SQLException e) {
        	logger.error(e+"ResultSetUtil1.findOne()抛出SQLException异常");
         
        } catch (IllegalAccessException e) {
        	logger.error(e+"ResultSetUtil1.findOne()抛出IllegalAccessException异常");
        } catch (InstantiationException e) {
        	logger.error(e+"ResultSetUtil1.findOne()抛出InstantiationException异常");
        }
        return object;
    }
}
