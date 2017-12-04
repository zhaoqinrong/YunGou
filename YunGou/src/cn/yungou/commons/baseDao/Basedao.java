package cn.yungou.commons.baseDao;



import cn.yungou.commons.constant.Constant;

import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ResourceBundle;

public class Basedao {
    private static ResourceBundle bundle = null;
    private static Connection conn = null;
    private static PreparedStatement stmt = null;
    private static ResultSet rs = null;
    public static String username;
    public static String password;
    public static String url;
    public static String driver;
    public static DataSource dataSource;

    static {

        try {
            InitialContext context = new InitialContext();
             dataSource = (DataSource) context.lookup("java:comp/env/jdbc.mysql");
            conn=dataSource.getConnection();
        } catch (NamingException e) {
            e.printStackTrace();
        } catch (SQLException e) {
            e.printStackTrace();
        }

      /*  bundle = ResourceBundle.getBundle("mysql");
        driver = bundle.getString("DRIVER");
        url = bundle.getString("URL");
        username = bundle.getString("USERNAME");
        password = bundle.getString("PASSWORD");
        try {
            Class.forName(driver);
            conn = DriverManager.getConnection(url, username, password);
        } catch (ClassNotFoundException e) {
            Constant.LOGGER.error(e + "BaseDao中驱动找不到");
        } catch (SQLException e) {
            Constant.LOGGER.error(e + "BaseDao中静态代码块 获取连接失败");
        }*/

    }

    public static Connection getConnection() {
        if (conn == null) {
            try {
                conn = dataSource.getConnection();
            } catch (SQLException e) {
               Constant.LOGGER.error(e + "getConnection方法内获取连接错误");
            }
        }
        return conn;
    }

    public static void closeAll() {
        if (rs != null) {
            try {
                rs.close();
            } catch (SQLException e) {
                Constant.LOGGER.error(e + "关闭ResultSet错误");
            }

        }
        if (stmt != null) {
            try {
                stmt.close();
            } catch (SQLException e) {
                Constant.LOGGER.error(e + "stmt关闭错误");
            }
        }
        if (conn != null) {
            try {
                conn.close();
            } catch (SQLException e) {
                Constant.LOGGER.error(e + "关闭conn出错");
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
           Constant.LOGGER.error(e+"basedao中update方法有问题");
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
          Constant.LOGGER.error(e+"baseDao通用查询有错");
        }
        return rs;
    }
    public static Integer getCount(String sql){
        ResultSet query = Basedao.query(sql);
        try {
            if (query.next()){
                int anInt = query.getInt(1);
                return anInt;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }
}
