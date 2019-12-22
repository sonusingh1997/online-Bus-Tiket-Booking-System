package project.com;
import java.util.Properties;

import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class Mail2 {

	public Mail2() {
		// TODO Auto-generated constructor stub
	}
	public static boolean sendotp (String email,String MSG) throws Exception{
		
		//System.out.println(email);
       //System.out.println(otp);
		final String from = "sonu952383@gmail.com";
		final String password = "jitendrasingh@123456789";
		final String to =email;
		System.out.println("Reading Password...");
		Properties props = new Properties();
		props.put("mail.smtp.auth", true);
		props.put("mail.smtp.starttls.enable", true);
		props.put("mail.smtp.host", "smtp.gmail.com");
		props.put("mail.smtp.port", "587");
		System.out.println("Sending Message...");
		
		Session emailsession = Session.getInstance(props,new javax.mail.Authenticator()
				{
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(from,password);
			}
				});
		Message msg = new MimeMessage(emailsession);
		msg.setFrom(new InternetAddress(from));
		msg.setRecipients(Message.RecipientType.TO, InternetAddress.parse(to));
		msg.setSubject("WELCOME Blue Bird Travels");
//		msg.setText("YOUR ATM CARD NUMBER :"+cardNo+ " AND YOUR  OTP : "+otp+" Time: "+new Date());
		msg.setText(""+MSG);
		Transport.send(msg);
		return true;
	}					
}
 


