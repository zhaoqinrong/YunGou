package bdqn.servlet.util;

import java.io.UnsupportedEncodingException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

public class Md5Util {
    public static String SetMd5(String username, String password) throws NoSuchAlgorithmException, UnsupportedEncodingException {
        MessageDigest md5 = MessageDigest.getInstance("MD5");
        //MD5加盐,我这里在密码的基础上加上用户的姓名
        byte[] bytes1 = (username + password).getBytes();
        byte[] bytes = md5.digest(bytes1);
        String result = "";
        for (byte b : bytes) {
            result = result + Integer.toHexString(b & 0xff);
            //b & 0xff 是为了取低8位

        }


        return result;
    }


}