package cn.lnj.project.car.util;

import org.springframework.stereotype.Service;

import java.util.Properties;
import java.util.Random;
import javax.mail.*;
import javax.mail.Message.RecipientType;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

/**
 * 邮件类
 * sendMail是发送邮件的方法，其他方法根据不同情境，改变传入的参数
 * @author 刘乃杰
 */
@Service
public class SendMail {

    /**
     * 发送邮件，不同情况分别传入不同参数
     * 只在本类内调用，不在其他类中调用
     * @param address 收件人地址
     * @param title 邮件主题
     * @param content 具体内容
     */

    private static final String SMTP_HOST = "";
    private static final String USER_MAIL_ADDRESS = "";
    private static final String USER_PASSWORD = "";

    private void sendMail(String address, String title, String content) {
        // 配置发送邮件的环境属性
        final Properties props = new Properties();
        // 表示SMTP发送邮件，需要进行身份验证
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.host", SMTP_HOST);
        props.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
        props.put("mail.smtp.socketFactory.port", "465");
        props.put("mail.smtp.port", "465");
        // 发件人的账号
        props.put("mail.user", USER_MAIL_ADDRESS);
        // 访问SMTP服务时需要提供的密码
        props.put("mail.password", USER_PASSWORD);
        // 构建授权信息，用于进行SMTP进行身份验证
        Authenticator authenticator = new Authenticator() {
            @Override
            protected PasswordAuthentication getPasswordAuthentication() {
                // 用户名、密码
                String userName = props.getProperty("mail.user");
                String password = props.getProperty("mail.password");
                return new PasswordAuthentication(userName, password);
            }
        };
        // 使用环境属性和授权信息，创建邮件会话
        Session mailSession = Session.getInstance(props, authenticator);
//        mailSession.setDebug(true);
        // 创建邮件消息
        MimeMessage message = new MimeMessage(mailSession);
        try {
            // 设置发件人
            InternetAddress from = new InternetAddress("");
            message.setFrom(from);
            Address[] a = new Address[1];
            a[0] = new InternetAddress("");
            message.setReplyTo(a);
            // 设置收件人
            InternetAddress to = new InternetAddress(address);
            message.setRecipient(MimeMessage.RecipientType.TO, to);
            // 设置邮件标题
            message.setSubject(title);
            // 设置邮件的内容体
            message.setContent(content, "text/html;charset=UTF-8");
            // 发送邮件
            Transport.send(message);
        }
        catch (MessagingException e) {
            String err = e.getMessage();
            // 在这里处理message内容， 格式是固定的
            System.out.println(err);
        }
    }

    /**
     * 用户激活
     * @param address 邮箱地址
     * @param id 用户的id
     */
    public void active(String address,String id){
        String content = "<html lang='zh-CN'><head><meta charset='utf-8'></head>" +
                "请点击下面的链接进行激活，如果不是本人操作，请不要点击。<br>" +
                "<a href='www.liunaijie.cn/car/jsp/active.jsp?userId="+id+"'>激活账户</a><br>" +
                "如果链接无效，请将下面的链接复制到浏览器地址栏中<br>"+
                "www.liunaijie.cn/car/jsp/active.jsp?userId="+id+"<br>"+
                "如果不是本人操作，请忽略此邮件！"+
                "如有问题，请联系管理员：0531-123456789" +
                "</body></html>";
        sendMail(address,"激活账号",content);
    }



    public void successInform(String userAddress,String userName,String shopAddress,String shopName,String shopPhone){
        sendMail(userAddress,"成功租赁车辆",""+userName+"，您好，您刚才在滴滴租车平台成功租赁了车辆，请您尽快取车，商家邮箱为"+shopAddress+",电话为"+shopPhone+"。\n如果不是本人操作请尽快联系<a href=\"mailto:ytulnj@163.com\">管理员</a>,联系电话：0531-123456789");
        sendMail(shopAddress,"您有新的订单",""+shopName+"，您好，刚才有顾客在滴滴租车平台成功租赁了车辆，请尽快落实，顾客邮箱为"+userAddress+"。\n如有问题请联系<a href=\"mailto:ytulnj@163.com\">管理员</a>,联系电话：0531-123456789");
    }

    public void shopRegist(String shopAddress,String shopName){
        sendMail(shopAddress,"成功注册商家",""+shopName+"，您好，恭喜您已成功注册为滴滴租车的商家。\n如有问题请联系<a href=\"mailto:ytulnj@163.com\">管理员</a>,联系电话：0531-123456789。滴滴租车随时为您服务。");
    }
}