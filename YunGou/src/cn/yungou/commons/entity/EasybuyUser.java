package cn.yungou.commons.entity;

import java.io.Serializable;
import java.util.List;

public class EasybuyUser implements Serializable {
    private Integer id; //用户id
    private String loginName; //用户登录名
    private String userName; //用户真实姓名
    private String password;    //用户的密码
    private Integer sex;    //用户的性别 0 表示女,1表示男
    private String identityCode;    //用户的身份证号
    private String email;   //用户的邮箱
    private String mobile;  //用户的电话号码
    private Integer type;   //用户的类型 ,1为普通用户,2为管理员
    private String code;    //用户的激活码
    private Integer status; //用户的状态 0表示未激活,1表示激活
    List<EasybuyCar> cars;

    public List<EasybuyCar> getCars() {
        return cars;
    }

    public void setCars(List<EasybuyCar> cars) {
        this.cars = cars;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getLoginName() {
        return loginName;
    }

    public void setLoginName(String loginName) {
        this.loginName = loginName;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public Integer getSex() {
        return sex;
    }

    public void setSex(Integer sex) {
        this.sex = sex;
    }

    public String getIdentityCode() {
        return identityCode;
    }

    public void setIdentityCode(String identityCode) {
        this.identityCode = identityCode;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getMobile() {
        return mobile;
    }

    public void setMobile(String mobile) {
        this.mobile = mobile;
    }

    public Integer getType() {
        return type;
    }

    public void setType(Integer type) {
        this.type = type;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }



    public EasybuyUser() {
    }

    @Override
    public String toString() {
        return "EasybuyUser{" +
                "id=" + id +
                ", loginName='" + loginName + '\'' +
                ", userName='" + userName + '\'' +
                ", password='" + password + '\'' +
                ", sex=" + sex +
                ", identityCode='" + identityCode + '\'' +
                ", email='" + email + '\'' +
                ", mobile='" + mobile + '\'' +
                ", type=" + type +
                ", code='" + code + '\'' +
                ", status=" + status +
                ", cars=" + cars +
                '}';
    }
}
