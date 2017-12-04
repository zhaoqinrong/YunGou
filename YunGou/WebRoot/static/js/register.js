

var flag = false;


$(function () {
    $.validator.addMethod(
        "Vmobile", function (value, element, param) {


            var regExp = new RegExp(/^1[3|5|6|8][0-9]{9}$/);

            return regExp.test(value);
        });

    flag = $("#tab").validate({

        //验证规则
        rules: {
            loginName: {
                required: true,
                minlength: 6,
                /*向后台发送ajax请求验证姓名是否被使用*/
                remote: {
                    type: "post",
                    url: "../EasyBuyUser",//servlet的url
                    data: {//发送的数据
                        loginName: function () {
                            return $("[name=loginName]").val();
                        },
                        action: "findByLoginName"
                    },
                    dataType: "html",
                    dataFilter: function (data, type) {//只能返回true,false

                        if (data == "true") {
                            return true;
                        }
                        return false;

                    }


                }
            },
            userName:{
                required:true
            },
            identityCode:{
                required:true
            },
            email: {
                required: true,
                email: true
            },
            mobile: {
                required: true,
                Vmobile: $("[name=mobile]").val()

            },
            password: {
                required: true,
                minlength: 6,
                maxlength: 10
            },
            reppassword: {
                required: true,
                minlength: 6,
                maxlength: 10,
                equalTo: "#pwd"
            },
            context: {
                required: true
            }
        },//rules end
        //不符合验证规则的提示信息
        messages: {

            loginName: {
                required: "请输入用户名",
                minlength: "长度不能小于6位",
                remote: "用户名已被注册"
            },
            userName:{
                required:"请输入真实姓名"
            },
            identityCode:{
                required:"请输入身份证号"
            },
            password: {
                required: "请输入密码",
                minlength: "长度不能小于6位",
                maxlength: "长度不能大于10位"
            },
            reppassword: {
                required: "请再次输入密码",
                minlength: "长度不能小于6位",
                maxlength: "长度不能大于10位",
                equalTo: "两次密码输入不一致"
            },
            email: {
                required: "请输入邮箱",
                email: "邮箱格式不正确"
            },
            mobile: {
                required: "请输入手机号",
                Vmobile: "电话号码格式不正确"
            },
            context: {
                required: "您没有同意此协议"
            }
        },//messages end
        onfocusout: function (element) {
            $(element).valid();
        }

    });
});


