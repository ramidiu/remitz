package com.kws.unitedfintech.controller;


import java.net.InetAddress;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.kws.unitedfintech.entities.Country;
import com.kws.unitedfintech.entities.DemoRequest;
import com.kws.unitedfintech.entities.DemoSpringootAdmin;
import com.kws.unitedfintech.entities.GetInTouch;
import com.kws.unitedfintech.helpers.SendMailBean;
import com.kws.unitedfintech.service.CountryService;
import com.kws.unitedfintech.service.DemoRequestService;
import com.kws.unitedfintech.service.DemoService;
import com.kws.unitedfintech.service.GetInTouchService;


@RestController
public class DemoController {
	@Autowired
	private CountryService countryService;
	@Autowired
	private DemoService demoService; 
	@Autowired
	private DemoRequestService demoRequestService;
@Autowired
private GetInTouchService getInTouchService;
	
	  	
	@RequestMapping(value="/saveReqDemo",method = RequestMethod.POST)
	
	 public String requestDemo(@RequestBody DemoRequest demoRequest,HttpServletRequest request) {
		System.out.println("hii working from RemitzAdmin controller 1"+demoRequest);
		
	Country country=countryService.getCountryBasedOnIso(demoRequest.getISO());
	 String dc=country.getDalingCode();
			demoRequest.setCountry(country);
			String countryname=country.getCountryName();
	demoRequest.setDialingCode(dc);
	demoRequest.setCountryName(countryname);

	String myipaddress="";		
	try {
	InetAddress myIP=InetAddress.getLocalHost();
	System.out.println("myIp===="+myIP);
	myipaddress=myIP.getHostAddress();
	System.out.println("myipaddress===="+myipaddress);
	HttpServletRequest httpRequest = (HttpServletRequest) request;
	String userIpAddress = httpRequest.getHeader("X-Forwarded-For");
System.out.println("userIpAddress.........."+userIpAddress);
	}
	catch(Exception e){
		e.printStackTrace();
		System.out.println("ip error");
	}
	//demoRequest.setMyIp(request.getRemoteAddr());
	//demoRequest.setMyIp(myipaddress);		
	String ss="";
	
	
	demoRequestService.demoSave(demoRequest);

	
	try {
		SendMailBean sendMailBean=new SendMailBean();
		
String message = "Name:" + demoRequest.getFirstName() + "<br>EmailId: " +
	demoRequest.getEmailId()+"<br>MobileNumber: "+demoRequest.getPhoneNumber() +"<br/>Country: "+demoRequest.getCountry().getCountryISO()+", "+demoRequest.getCountry().getCountryName()+", "+demoRequest.getCountry().getDalingCode();
		  
		  System.out.println("message==="+message);
		  
		  String userMessge =
		  "Dear"+"  "+demoRequest.getFirstName()+",<br>";
		  userMessge=userMessge+"we have received a request from you to arrange a demo for remitz Money Transfer software<br>";
		  userMessge=userMessge+"We will schedule a date and time and reply back to you.<br>";
		  userMessge=userMessge+"Thank you,<br>";
		  userMessge=userMessge+"Umesh.";
		  
		  sendMailBean.send1("info@remitz.co.uk", demoRequest.getEmailId(), "", "",
		  "Remitz Software demo", userMessge, "68.169.55.168");
		  
		  sendMailBean.send1("info@remitz.co.uk", "ramidiu@kreativwebsolutions.com", "", "",
		  "Demo requested from ,"+"  "+demoRequest.getEmailId()+" "  , message, "68.169.55.168"); 
		}
		catch (Exception e) { 
			e.printStackTrace();
			}


		
		
		return "success";
		//return "re\saveReqDemodirect:/login";
		}
@RequestMapping("/getIIIp")
	public String getIp() {
	return "";
}
	
	@RequestMapping(value="/saveReqDemo1",method = RequestMethod.POST)
	
	 public String requestDemo2(@RequestBody DemoSpringootAdmin demo) {
		
		demoService.saveUser(demo);
		return "returning";
		
	}
	
	
	@RequestMapping("checkexistdemos")
	public ResponseEntity<String> checkUsersEmails(@RequestParam String emailId) {
		System.out.println("emailId===" + emailId);
		String result = demoRequestService.getUserListBasedOnEmailIds(emailId);
		System.out.println("result::::" + result);
		return new ResponseEntity<>(result, HttpStatus.OK);
	}

	@RequestMapping(value="/saveContactUs",method = RequestMethod.POST)
	
	 public String saveContacts(@RequestBody GetInTouch getInTouch) {
		System.out.println("hii working from RemitzAdmin controller 1"+getInTouch);
		String myipaddress="";		
		try {
		InetAddress myIP=InetAddress.getLocalHost();
		System.out.println("myIp===="+myIP);
		myipaddress=myIP.getHostAddress();
		System.out.println("myipaddress===="+myipaddress);
		}
		catch(Exception e){
			e.printStackTrace();
			System.out.println("ip error");
		}
		//getInTouch.setMyIp(myipaddress);
	
	
	
	getInTouchService.contactSave(getInTouch);

	
	try {
		SendMailBean sendMailBean=new SendMailBean();
		
String message = "Name:" + getInTouch.getFirstName() +" "+getInTouch.getLastName() +"<br>EmailId: " +
		getInTouch.getEmailId()+"<br>Description: "+getInTouch.getDescription();
		  
		  System.out.println("message==="+message);
		  
		  String userMessge =
		  "Dear"+"  "+getInTouch.getFirstName()+" "+getInTouch.getLastName();
		  userMessge=userMessge+"<br>";
		  userMessge=userMessge+"thank you for registering with us we will get back to you soon.<br>";
		  userMessge=userMessge+"Thank you,<br>";
		  userMessge=userMessge+"Umesh.";
		  
		  sendMailBean.send1("info@remitz.co.uk", getInTouch.getEmailId(), "", "",
		  "Remitz Software demo", userMessge, "68.169.55.168");
		  
		  sendMailBean.send1("info@remitz.co.uk", "ramidiu@kreativwebsolutions.com", "", "",
		  "contact us from ,"+"  "+getInTouch.getEmailId()+" "  , message, "68.169.55.168"); 
		}
		catch (Exception e) { 
			e.printStackTrace();
			}

		return "success";
		//return "redirect:/login";
		}

	@RequestMapping("checkExistContactUs")
	public ResponseEntity<String> checkUsersBaesOnContactUs(@RequestParam String emailId) {
		System.out.println("emailId===" + emailId);
		String result = getInTouchService.getUserListBasedOnContactUs(emailId);
		System.out.println("result::::" + result);
		return new ResponseEntity<>(result, HttpStatus.OK);
	}


	
	
	

}
