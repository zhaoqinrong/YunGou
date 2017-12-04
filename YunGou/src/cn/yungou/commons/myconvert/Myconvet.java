package cn.yungou.commons.myconvert;

import org.apache.commons.beanutils.Converter;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class Myconvet implements Converter {
    /**
     * 时间格式转换
     * @param aClass 目标类型
     * @param o  前台页面传入的值
     * @return  转换后的日期
     */
    @Override
    public Object convert(Class aClass, Object o) {
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        try {
            Date parse = sdf.parse((String)o);
            return parse;
        } catch (ParseException e) {
            e.printStackTrace();
        }
        return null;
    }
}
