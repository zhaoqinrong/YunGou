package cn.yungou.commons.util;

import javax.mail.*;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import java.util.Properties;

/**
 * 邮件发送工具类
 */

public class EmailUtils {
    // 发件人的 邮箱 和 密码（替换为自己的邮箱和密码）
    // PS: 某些邮箱服务器为了增加邮箱本身密码的安全性，给 SMTP 客户端设置了独立密码（有的邮箱称为“授权码”）,
    //     对于开启了独立密码的邮箱, 这里的邮箱密码必需使用这个独立密码（授权码）。
   /* private static String myEmailAccount = "easybuy04@qq.com";
    private static String myEmailPassword = "825727zqr";*/
    private static String myEmailAccount = "zhaoqr9785@qq.com";
    private static String myEmailPassword = "sfucxnhvpmwscbeh";

    // 发件人邮箱的 SMTP 服务器地址, 必须准确, 不同邮件服务器地址不同, 一般(只是一般, 绝非绝对)格式为: smtp.xxx.com
    // 网易163邮箱的 SMTP 服务器地址为: smtp.163.com
   /* private static String myEmailSMTPHost = "smtp.163.com";//网易邮箱*/
    private static String myEmailSMTPHost = "smtp.qq.com";//QQ邮箱


    /**
     * 发送激活邮件或者找回密码邮件的工具类
     * @param email 接收人的邮件地址
     * @param content   发送邮件的内容
     *
     */
    public static void sendEmail(String email,String content){

// 1. 创建参数配置, 用于连接邮件服务器的参数配置
        Properties props = new Properties();                    // 参数配置
        props.setProperty("mail.transport.protocol", "smtp");   // 使用的协议（JavaMail规范要求）
        props.setProperty("mail.smtp.host", myEmailSMTPHost);   // 发件人的邮箱的 SMTP 服务器地址
        props.setProperty("mail.smtp.auth", "true");            // 需要请求认证

        // PS: 某些邮箱服务器要求 SMTP 连接需要使用 SSL 安全认证 (为了提高安全性, 邮箱支持SSL连接, 也可以自己开启),
        //     如果无法连接邮件服务器, 仔细查看控制台打印的 log, 如果有有类似 “连接失败, 要求 SSL 安全连接” 等错误,
        //     打开下面 /* ... */ 之间的注释代码, 开启 SSL 安全连接。
        /*
        // SMTP 服务器的端口 (非 SSL 连接的端口一般默认为 25, 可以不添加, 如果开启了 SSL 连接,
        //                  需要改为对应邮箱的 SMTP 服务器的端口, 具体可查看对应邮箱服务的帮助,
        //                  QQ邮箱的SMTP(SLL)端口为465或587, 其他邮箱自行去查看)*/
        final String smtpPort = "465";
        props.setProperty("mail.smtp.port", smtpPort);
        props.setProperty("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
        props.setProperty("mail.smtp.socketFactory.fallback", "false");
        props.setProperty("mail.smtp.socketFactory.port", smtpPort);




// 创建验证器
        Authenticator auth = new Authenticator() {
            public PasswordAuthentication getPasswordAuthentication() {
                //设置发送人的帐号和密码
                return new PasswordAuthentication(myEmailAccount, myEmailPassword);
            }
        };

        // 2. 根据配置创建会话对象, 用于和邮件服务器交互
        Session session = Session.getInstance(props,auth);
        session.setDebug(true);              // 设置为debug模式, 可以查看详细的发送 log
        // 1. 创建一封邮件
        MimeMessage message = new MimeMessage(session);

        try {
            //设置发送者
            message.setFrom(new InternetAddress(myEmailAccount));

            // 3. To: 收件人（可以增加多个收件人、抄送、密送）
            message.setRecipient(MimeMessage.RecipientType.TO, new InternetAddress(email));

            //设置邮件主题
            message.setSubject("用户激活");
            // message.setText("这是一封激活邮件，请<a href='#'>点击</a>");

            //设置邮件内容
            message.setContent(content, "text/html;charset=utf-8");

            // 3.创建 Transport用于将邮件发送
            Transport.send(message);
//            message.saveChanges();
        } catch (MessagingException e) {
            e.printStackTrace();
        }

//        return message;
    }
}
