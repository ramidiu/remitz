package com.kws.unitedfintech.helpers;

import java.io.IOException;

import com.sendgrid.Method;
import com.sendgrid.Request;
import com.sendgrid.Response;
import com.sendgrid.SendGrid;
import com.sendgrid.helpers.mail.Mail;
import com.sendgrid.helpers.mail.objects.Content;
import com.sendgrid.helpers.mail.objects.Email;

public class SendMail {

	
    public static void send(String fromEmail,String toEmail,String subjectTemplete,String bodyContent) throws IOException { 
    Email from = new Email(fromEmail);
    String subject = subjectTemplete;
    Email to = new Email(toEmail);
    Content content = new Content("text/html",bodyContent);
    Mail mail = new Mail(from, subject, to, content);
    SendGrid sg=new SendGrid("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");

 // SendGrid sg = new SendGrid("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");
    Request request = new Request();
    try {
      request.setMethod(Method.POST);
      request.setEndpoint("mail/send");
      request.setBody(mail.build());
      Response response = sg.api(request);
      System.out.println(response.getStatusCode());
      System.out.println(response.getBody());
      System.out.println(response.getHeaders());
    } catch (IOException ex) {
      throw ex;
    }
  }

}
