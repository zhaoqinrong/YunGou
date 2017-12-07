package cn.yungou.commons.util;

import org.codehaus.jackson.map.ObjectMapper;
import org.codehaus.jackson.map.SerializationConfig;

import java.io.IOException;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.List;

public class JsonUtils {
    private static ObjectMapper mapper=new ObjectMapper();
    public static  String writeValueAsString(Object o) throws IOException {
       return mapper.writeValueAsString(o);
    }
    public static List readValue(String json) throws IOException {
        return mapper.readValue(json, List.class);
    }
    public static  void customConver(Timestamp tm){
        mapper.configure(SerializationConfig.Feature.WRITE_DATES_AS_TIMESTAMPS, false);
        SimpleDateFormat myDateFormat=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        mapper.getSerializationConfig().setDateFormat(myDateFormat);
    }
}
