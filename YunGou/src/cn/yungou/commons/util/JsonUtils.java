package cn.yungou.commons.util;

import org.codehaus.jackson.map.ObjectMapper;

import java.io.IOException;
import java.util.List;

public class JsonUtils {
    private static ObjectMapper mapper=new ObjectMapper();
    public static  String writeValueAsString(Object o) throws IOException {
       return mapper.writeValueAsString(o);
    }
    public static List readValue(String json) throws IOException {
        return mapper.readValue(json, List.class);
    }
}
