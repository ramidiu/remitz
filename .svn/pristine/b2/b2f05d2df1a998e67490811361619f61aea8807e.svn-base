package com.kws.unitedfintech.helpers;

import java.util.Date;
import java.util.Properties;

import javax.activation.CommandMap;
import javax.activation.MailcapCommandMap;
import javax.mail.Authenticator;
import javax.mail.BodyPart;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Multipart;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;

public class SendMailBean1 {
	 public String send1(String p_from, String p_to, String p_cc, String p_bcc, String p_subject, String p_message, String p_smtpServer)
	  {
	    MailcapCommandMap mc = (MailcapCommandMap)CommandMap.getDefaultCommandMap();
	    mc.addMailcap("text/html;; x-java-content-handler=com.sun.mail.handlers.text_html");
	    mc.addMailcap("text/xml;; x-java-content-handler=com.sun.mail.handlers.text_xml");
	    mc.addMailcap("text/plain;; x-java-content-handler=com.sun.mail.handlers.text_plain");
	    mc.addMailcap("multipart/*;; x-java-content-handler=com.sun.mail.handlers.multipart_mixed");
	    mc.addMailcap("message/rfc822;; x-java-content-handler=com.sun.mail.handlers.message_rfc822");
	    CommandMap.setDefaultCommandMap(mc);
	    


//	    String username = "info@remitz.co.uk";
//	    String password = "1nf0$123";
	    
	    String l_result = "<BR><BR><BR><BR><BR><BR><BR>";
	    String l_host = p_smtpServer;
	    Properties l_props = System.getProperties();
	    l_props.put("mail.smtp.host", l_host);
	    l_props.put("mail.smtp.auth", "true");
	    l_props.put("mail.smtp.starttls.enable", "false");
	    l_props.put("mail.smtp.port", "25");
	    

	    Authenticator auth = new Authenticator()
	    {
	      protected PasswordAuthentication getPasswordAuthentication()
	      {
	        return new PasswordAuthentication("contact@remitz.co.uk", "9W2v6V3j");
	      }
	    };
	    Session l_session = Session.getDefaultInstance(l_props, auth);
	    l_session.setDebug(true);
	    try
	    {
	      MimeMessage l_msg = new MimeMessage(l_session);
	      l_msg.setFrom(new InternetAddress(p_from));
	      l_msg.setRecipients(Message.RecipientType.TO, InternetAddress.parse(p_to, false));
	      l_msg.setRecipients(Message.RecipientType.CC, InternetAddress.parse(p_cc, false));
	      l_msg.setRecipients(Message.RecipientType.BCC, InternetAddress.parse(p_bcc, false));
	      l_msg.setSubject(p_subject);
	      String total_message = "  " + p_message + "  ";
	      BodyPart l_mbp = new MimeBodyPart();
	      l_mbp.setContent(total_message, "text/html\r\n\r\n");
	      Multipart l_mp = new MimeMultipart();
	      l_mp.addBodyPart(l_mbp);
	      l_msg.setContent(l_mp);
	      l_msg.setSentDate(new Date());
	      
	      Transport transport = l_session.getTransport("smtp");
	      
	      transport.connect("68.169.55.168", 25, "contact@remitz.co.uk", "9W2v6V3j");
	      transport.sendMessage(l_msg, l_msg.getAllRecipients());
	      transport.close();
	      
	      l_result = l_result + "<FONT SIZE=4 COLOR=\"blue\"><B>Success!</B>" + "<FONT SIZE=4 COLOR=\"black\"> " + "<HR><FONT color=green><B>Mail was successfully sent to </B></FONT>: " + p_to + "<BR>";
	      if (!p_cc.equals("")) {
	        l_result = l_result + "<FONT color=green><B>CCed To </B></FONT>: " + p_cc + "<BR>";
	      }
	      if (!p_bcc.equals("")) {
	        l_result = l_result + "<FONT color=green><B>BCCed To </B></FONT>: " + p_bcc;
	      }
	      l_result = l_result + "<BR><HR>";
	    }
	    catch (MessagingException mex)
	    {
//	      mex = mex;

	      l_result = "MessagingException" + mex;
	    }
	    catch (Exception e)
	    {
//	      e = e;
	      
	      l_result = l_result + "<FONT SIZE=4 COLOR=\"blue\"> <B>Error : </B><BR><HR> " + "<FONT SIZE=3 COLOR=\"black\">" + e.toString() + "<BR><HR>";
	      
	      l_result = "MessagingException" + e.toString();
	      e.printStackTrace();
	    }
	    finally {}
	    return l_result;
	  }
	  
	  public String mail(String fromid, String toid, String subject, String content, String usrname, String pasword, String host, String port)
	    throws Exception
	  {
	//   String mes = "";
	    final String username = usrname;
	    final String password = pasword;
	    
	    Properties props = new Properties();
	    props.put("mail.smtp.auth", "true");
	    props.put("mail.smtp.starttls.enable", "true");
	    props.put("mail.smtp.host", host);
	    props.put("mail.smtp.port", port);
	    
	    Session session = Session.getInstance(props, 
	      new Authenticator()
	      {
	        protected PasswordAuthentication getPasswordAuthentication()
	        {
	          return new PasswordAuthentication(username, password);
	        }
	      });
	    try
	    {
	      Message message = new MimeMessage(session);
	      
	      message.setFrom(new InternetAddress(fromid));
	      message.setRecipients(Message.RecipientType.TO, 
	        InternetAddress.parse(toid));
	      message.setSubject(subject);
	      BodyPart l_mbp = new MimeBodyPart();
	      l_mbp.setContent(content, "text/html");
//	      BodyPart l_mbp2 = new MimeBodyPart();
	      Multipart l_mp = new MimeMultipart();
	      l_mp.addBodyPart(l_mbp);
	      message.setContent(l_mp);
	      message.setSentDate(new Date());
	      Transport.send(message);
	      
	      return "success";
	    }
	    catch (MessagingException e)
	    {
	      return e.toString();
	    }
	  }

}
