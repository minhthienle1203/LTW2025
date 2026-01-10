package com.colami.ltw2025.control;

import jakarta.mail.*;
import jakarta.mail.internet.InternetAddress;
import jakarta.mail.internet.MimeMessage;

import java.io.IOException;
import java.util.Date;
import java.util.Properties;

public class EmailUtil {

    // khởi tạo mail cua shop để gửi
    static final String FROM_EMAIL = "concocon197thien@gmail.com";
    static final String PASS_WORD = "prnc xspz dtog cvlz";

    public static boolean sendEmail(String toEmail, String subject, String body) {
        //cấu hình Properties cho Gamil (TLS 587)
        Properties props = new Properties();
        props.put("mail.smtp.host", "smtp.gmail.com"); //smtp host
        props.put("mail.smtp.port", "587"); //tls port
        props.put("mail.smtp.auth", "true"); // enable auth
        props.put("mail.smtp.starttls.enable", "true"); // enable startTLS

        //Tạo Auth để đăng nhập
        Authenticator auth = new Authenticator() {
            @Override
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(FROM_EMAIL, PASS_WORD);
            }
        };
        Session session = Session.getInstance(props, auth);

        try {
            MimeMessage msg = new MimeMessage(session);

            //Set thoong tin header
            msg.addHeader("Content-type", " text/html; charset=UTF-8");
            msg.addHeader("format", "flowed");
            msg.setFrom(new InternetAddress(FROM_EMAIL, "Colami Shop")); //Tên người hiển thị
            msg.setReplyTo(InternetAddress.parse(FROM_EMAIL, false));
            msg.setSubject(subject, "UTF-8");
            msg.setSentDate(new Date());
            //Set người nhận
            msg.setRecipients(Message.RecipientType.TO, InternetAddress.parse(toEmail, false));
            // Set nội dung (HTML)
            msg.setContent(body, "text/html; charset=UTF-8");
            // 5. Gửi email
            Transport.send(msg);
            System.out.println("Gửi email thành công đến: " + toEmail);
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("Gửi email thất bại!");
            return false;
        }
    }

    public static void main(String[] args) {
        // Gọi hàm này khi người dùng yêu cầu
        String emailKhach = "concocon199thien@gmail.com";
        String tieuDe = "Xác nhận đơn hàng #123";
        String noiDung = "<h1>Cảm ơn bạn đã đặt hàng!</h1><p>Đơn hàng của bạn đang được xử lý.</p>";

        boolean daGui = EmailUtil.sendEmail(emailKhach, tieuDe, noiDung);

        if(daGui) {
            // Thông báo thành công
        } else {
            // Thông báo lỗi
        }
    }
}
