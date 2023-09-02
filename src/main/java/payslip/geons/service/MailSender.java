package payslip.geons.service;
import javax.mail.*;
import javax.mail.internet.*;
import java.util.Properties;

public class MailSender {

    public boolean  mailSender(String to,String userPassword) {
    	 // Recipient's email ID needs to be mentioned.
         

        // Sender's email ID needs to be mentioned
        String from = "rjegan713@gmail.com";//change accordingly
        final String username = "rjegan713@gmail.com";//change accordingly
        final String password = "coyxoillkbpdlhji";//change accordingly

        // Assuming you are sending email through relay.jangosmtp.net
        String host = "smtp.gmail.com";

        Properties props = new Properties();
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.starttls.enable", "true");
        props.put("mail.smtp.host", host);
        props.put("mail.smtp.port", "587");

        // Get the Session object.
        Session session = Session.getInstance(props,
        new javax.mail.Authenticator() {
           protected PasswordAuthentication getPasswordAuthentication() {
              return new PasswordAuthentication(username, password);
           }
        });

        try {
           // Create a default MimeMessage object.
           Message message = new MimeMessage(session);

           // Set From: header field of the header.
           message.setFrom(new InternetAddress(from));

           // Set To: header field of the header.
           message.setRecipients(Message.RecipientType.TO,
           InternetAddress.parse(to));

           // Set Subject: header field
           message.setSubject("New password");

           // Now set the actual message
           message.setText("Welcome to geons logix  \n your new password is "+userPassword);

           // Send message
           Transport.send(message);
           
           System.out.println("Sent message successfully....");
          return true;
        } catch (MessagingException e) {
         return false;
             
        }
       
    }
}
