package cn.yungou.commons.baseDao;



import org.apache.log4j.Logger;

import java.sql.*;
import java.util.ResourceBundle;

public class Basedao {
    private static ResourceBundle bundle = null;
    private static Connection conn = null;
    private static PreparedStatement stmt = null;
    private static ResultSet rs = null;
    private static Logger logger = Logger.getLogger(Basedao.class);
    public static String username;
    public static String password;
    public static String url;
    public static String driver;

    static {

        bundle = ResourceBundle.getBundle("mysql");
        driver = bundle.getString("DRIVER");
        url = bundle.getString("URL");
        username = bundle.getString("USERNAME");
        password = bundle.getString("PASSWORD");
        try {
            Class.forName(driver);
            conn = DriverManager.getConnection(url, username, password);
        } catch (ClassNotFoundException e) {
            logger.error(e + "BaseDao中驱动找不到");
        } catch (SQLException e) {
            logger.error(e + "BaseDao中静态代码块 获取连接失败");
        }

    }

    public static Connection getConnection() {
        if (conn == null) {
            try {
                conn = DriverManager.getConnection(url, username, password);
            } catch (SQLException e) {
                logger.error(e + "getConnection方法内获取连接错误");
            }
        }
        return conn;
    }

    public static void closeAll() {
        if (rs != null) {
            try {
                rs.close();
            } catch (SQLException e) {
                logger.error(e + "关闭ResultSet错误");
            }

        }
        if (stmt != null) {
            try {
                stmt.close();
            } catch (SQLException e) {
                logger.error(e + "stmt关闭错误");
            }
        }
        if (conn != null) {
            try {
                conn.close();
            } catch (SQLException e) {
                logger.error(e + "关闭conn出错");
            }
        }
    }

    public static int update(String sql, Object... param) {
        int rownum = 0;
        try {
            stmt = getConnection().prepareStatement(sql);
            for (int i = 0; i < param.length; i++) {
                stmt.setObject(i+1,param[i]);
            }
            rownum=stmt.executeUpdate();

        } catch (SQLException e) {
           logger.error(e+"basedao中update方法有问题");
        }
        return rownum;
    }
    public static ResultSet query(String sql,Object...param){
        try {
            stmt= getConnection().prepareStatement(sql);
            for (int i = 0; i < param.length; i++) {
                stmt.setObject(i+1,param[i]);
            }
            rs=stmt.executeQuery();
        } catch (SQLException e) {
          logger.error(e+"baseDao通用查询有错");
        }
        return rs;
    }
}
