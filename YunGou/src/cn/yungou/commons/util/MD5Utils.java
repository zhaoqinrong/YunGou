package cn.yungou.commons.util;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

/**
 * MD5加密工具类
 */

public class MD5Utils {
    /**
     * MD5加密方法
     * @param plainText 需要加密的字符串
     * @return 加密后的字符串
     */
    public static String md5(String plainText){
        byte[] sereBytes=null;
        try {
            //加密方法
            sereBytes = MessageDigest.getInstance("md5").digest(plainText.getBytes());
        } catch (NoSuchAlgorithmException e) {
            throw new RuntimeException("MD5加密失败");
        }
        String result = "";
        for (byte b : sereBytes) {
            result = result + Integer.toHexString(b & 0xff);
            //b & 0xff 是为了取低8位

        }
        return result;

    }
}
