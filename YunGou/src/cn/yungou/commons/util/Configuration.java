package cn.yungou.commons.util;

import org.dom4j.Attribute;
import org.dom4j.Document;
import org.dom4j.DocumentException;
import org.dom4j.Element;
import org.dom4j.io.SAXReader;

import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

public class Configuration {
    public static Map<String ,String > config(String file)  {
        Map beanMap=new HashMap();
        SAXReader reader=new SAXReader();
        Document read = null;
        try {
            read = reader.read(file);
        } catch (DocumentException e) {
            e.printStackTrace();
        }
        Element rootElement = read.getRootElement();
        Iterator<Element> iterator = rootElement.elementIterator();
        while (iterator.hasNext()){
            Element   next = iterator.next();
            List<Attribute> attributes = next.attributes();
           if(attributes==null){
               continue;
           }
            String id=null;
            String clazz=null;
            for(Attribute attr:attributes){

               if ("id".equals(attr.getName())){
                    id=attr.getValue();
                    continue;
               }else{
                   clazz=attr.getValue();
               }
                beanMap.put(id,clazz);
            }
        }
        System.out.println(beanMap);
        return beanMap;


    }
}
