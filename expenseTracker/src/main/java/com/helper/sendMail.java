package com.helper;

import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;



public class sendMail {
  
	public boolean sendingMail(String to, String from, String subject, String text) {
		boolean f = false;
		
		Properties props = new Properties();
    	props.put("mail.smtp.auth", true);
    	props.put("mail.smtp.starttls.enable", true);
    	props.put("mail.smtp.port", "587");
    	props.put("mail.smtp.host", "smtp.gmail.com");
		
    	String uName = "emailmanagement1234";
    	String password = "lebfnqqqfwuxrgxp";
    	
    	Session s = Session.getInstance(props, new Authenticator() {

			@Override
			protected PasswordAuthentication getPasswordAuthentication() {
				// TODO Auto-generated method stub
				return  new PasswordAuthentication(uName, password);
			}
    		
		});
    	
    	try {
			Message m = new MimeMessage(s);
			m.setRecipient(Message.RecipientType.TO, new InternetAddress(to));
			m.setFrom(new InternetAddress(from));
			m.setSubject(subject);
			m.setText(text);
			
			Transport.send(m);
			
			f=true;
		} catch (Exception e) {
			e.printStackTrace();
			// TODO: handle exception
		}
    	
		return f;
	}
	
}
