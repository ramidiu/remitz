package com.kws.unitedfintech.controller;

import java.net.InetAddress;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.kws.unitedfintech.entities.Admin;
import com.kws.unitedfintech.entities.Country;
import com.kws.unitedfintech.entities.EmailTemplate;
import com.kws.unitedfintech.entities.InternetBankTransferMop;
import com.kws.unitedfintech.entities.RealationShips1;
import com.kws.unitedfintech.entities.ReasonForTransfer;
import com.kws.unitedfintech.entities.SenderIds;
import com.kws.unitedfintech.entities.SourceOfFunds1;
import com.kws.unitedfintech.entities.Zone;
import com.kws.unitedfintech.helpers.SendMail;
import com.kws.unitedfintech.helpers.SendMailBean;
import com.kws.unitedfintech.service.AdminService;
import com.kws.unitedfintech.service.BranchPaymentTypeDetailsService;
import com.kws.unitedfintech.service.CountryService;
import com.kws.unitedfintech.service.CountryZonService;
import com.kws.unitedfintech.service.EmailTemplateService;
import com.kws.unitedfintech.service.InternetBankTransferMopService;
import com.kws.unitedfintech.service.ModeOfPaymentsService;
import com.kws.unitedfintech.service.NsanoService;
import com.kws.unitedfintech.service.PaymentTypesService;
import com.kws.unitedfintech.service.RealationShips1Service;
import com.kws.unitedfintech.service.ReasonForTransferService;
import com.kws.unitedfintech.service.SenderIdTypeService;
import com.kws.unitedfintech.service.SessionDataService;
import com.kws.unitedfintech.service.SourceOfFundsService;
import com.kws.unitedfintech.service.SuperadminService;
import com.kws.unitedfintech.service.UserService;

@Controller
public class RemitAdminController {
	@Autowired
	private SenderIdTypeService senderIdTypeService;
	@Autowired
	private InternetBankTransferMopService internetBankTransferMopService;
	
	@Autowired
	private RealationShips1Service realationShips1Service;
	
	@Autowired
	private SuperadminService superAdminService;
	@Autowired
private SourceOfFundsService sourceOfFundsService;

	@Autowired
	private CountryZonService countryZonService;
	@Autowired
	private NsanoService ns;
	
	@Autowired
	private EmailTemplateService emailTemplateService;
	@Autowired
	private SessionDataService sessionDataService;
	@Autowired
	private PaymentTypesService paymentTypesService;
	@Autowired
	private ModeOfPaymentsService modeOfPaymentsService;
	@Autowired
	private CountryService countryService;
	@Autowired
	private CountryZonService zoneService;
	@Autowired
	private AdminService adminService;
@Autowired
private ReasonForTransferService reasonForTransferService;
	@Autowired
	private BranchPaymentTypeDetailsService bPaymentService;
	@Autowired
	private UserService userService;
SendMail sendMail=new SendMail();
@RequestMapping(value = "/saveremitadmin")
public ResponseEntity<String> saveRemitAdminDetails(@RequestBody Admin admin) {
	Country country = countryService.getCountryBasedOnIso(admin.getISO());
	Zone zone = countryZonService.getZoneBasedOnZoneId(admin.getZId());
	admin.setCountry(country);
	admin.setZone(zone);
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
//admin.setMyIP(myipaddress);
	
	Admin a = new Admin();
 a=adminService.saveRemitAdmin(admin);
	String adminId=a.getAdminId();
	List<EmailTemplate> list = emailTemplateService.getEmailTemplatesBasedOnAdmin(adminId);
	EmailTemplate emailTemplate = new EmailTemplate();
	if (list.size() > 0) {
		emailTemplate = list.get(0);
		System.out.println("emailTemplate....."+list.get(0));
	}								else {
		EmailTemplate EmailTemplate=new EmailTemplate();
		for(int i=0;i<11;i++) {
			
			if(i==0) {
				System.out.println("firstloop emails");
			
				EmailTemplate.setAdmin(a);
				EmailTemplate.setBccEmail(admin.getEmailId());
				EmailTemplate.setCcEmail(admin.getEmailId());
				EmailTemplate.setDemo("");
				EmailTemplate.setReplyEmail(admin.getEmailId());
				EmailTemplate.setSubject("Reset Password Link"
					);
				EmailTemplate.setTemplate("<span style=\"color: rgb(34, 34, 34); font-family: Arial, Helvetica, sans-serif; font-size: small;\">Hi {FIRST_NAME},</span><br style=\"color: rgb(34, 34, 34); font-family: Arial, Helvetica, sans-serif; font-size: small;\"><span style=\"color: rgb(34, 34, 34); font-family: Arial, Helvetica, sans-serif; font-size: small;\">To initiate the password reset process for your member account, click the link below:</span><br style=\"color: rgb(34, 34, 34); font-family: Arial, Helvetica, sans-serif; font-size: small;\"><span style=\"color: rgb(34, 34, 34); font-family: Arial, Helvetica, sans-serif; font-size: small;\">{PASSWORD_RESET_LINK}</span><br>");
				EmailTemplate.setTitle("Reset Password Link");
			}
			if(i==1) {
				EmailTemplate.setAdmin(a);
				EmailTemplate.setBccEmail(admin.getEmailId());
				EmailTemplate.setCcEmail(admin.getEmailId());
				EmailTemplate.setDemo("");
				EmailTemplate.setReplyEmail(admin.getEmailId());
				EmailTemplate.setSubject("Manual id verification done by Admin"
					);
				EmailTemplate.setTemplate("Manual id verification done by Admin");
				EmailTemplate.setTitle("Manual id verification done by Admin");

			}
			if(i==2) {
				EmailTemplate.setAdmin(a);
				EmailTemplate.setBccEmail(admin.getEmailId());
				EmailTemplate.setCcEmail(admin.getEmailId());
				EmailTemplate.setDemo(" ");
				EmailTemplate.setReplyEmail(admin.getEmailId());
				EmailTemplate.setSubject("Email to customer about auto id verififcation fail"
					);
				EmailTemplate.setTemplate("Email to customer about auto id verififcation fail");
				EmailTemplate.setTitle("Email to customer about auto id verififcation fail");

			}
			if(i==3) {
				EmailTemplate.setAdmin(a);
				EmailTemplate.setBccEmail(admin.getEmailId());
				EmailTemplate.setCcEmail(admin.getEmailId());
				EmailTemplate.setDemo("");
				EmailTemplate.setReplyEmail(admin.getEmailId());
				EmailTemplate.setSubject("Alert to customer about expiry of PHOTO ID"
					);
				EmailTemplate.setTemplate("<span style=\"color: rgb(34, 34, 34); font-family: Arial, Helvetica, sans-serif; font-size: small;\">Hi {FIRST_NAME},</span><br style=\"color: rgb(34, 34, 34); font-family: Arial, Helvetica, sans-serif; font-size: small;\"><br style=\"color: rgb(34, 34, 34); font-family: Arial, Helvetica, sans-serif; font-size: small;\"><span style=\"color: rgb(34, 34, 34); font-family: Arial, Helvetica, sans-serif; font-size: small;\">This email is to notify you that your {ID_TYPE} will expire on {ID_EXPIRY_DATE}.</span><br style=\"color: rgb(34, 34, 34); font-family: Arial, Helvetica, sans-serif; font-size: small;\"><span style=\"color: rgb(34, 34, 34); font-family: Arial, Helvetica, sans-serif; font-size: small;\">Please upload a copy of a valid passport and proof of address, or drivers licence ID by clicking on the link below.</span><br style=\"color: rgb(34, 34, 34); font-family: Arial, Helvetica, sans-serif; font-size: small;\"><span style=\"color: rgb(34, 34, 34); font-family: Arial, Helvetica, sans-serif; font-size: small;\">{PROFILE_LINK}</span><br style=\"color: rgb(34, 34, 34); font-family: Arial, Helvetica, sans-serif; font-size: small;\"><span style=\"color: rgb(34, 34, 34); font-family: Arial, Helvetica, sans-serif; font-size: small;\">We look forward to serving you again!.</span><br>");
				EmailTemplate.setTitle("Alert to customer about expiry of PHOTO ID");

			}
			if(i==4) {
				EmailTemplate.setAdmin(a);
				EmailTemplate.setBccEmail(admin.getEmailId());
				EmailTemplate.setCcEmail(admin.getEmailId());
				EmailTemplate.setDemo("");
				EmailTemplate.setReplyEmail(admin.getEmailId());
				EmailTemplate.setSubject("Email to sender on complete transaction"
					);
				EmailTemplate.setTemplate("<span style=\"color: rgb(34, 34, 34); font-family: Arial, Helvetica, sans-serif; font-size: small;\">Hi {FIRST_NAME},</span><br style=\"color: rgb(34, 34, 34); font-family: Arial, Helvetica, sans-serif; font-size: small;\"><br style=\"color: rgb(34, 34, 34); font-family: Arial, Helvetica, sans-serif; font-size: small;\"><span style=\"color: rgb(34, 34, 34); font-family: Arial, Helvetica, sans-serif; font-size: small;\">Your money transfer of {SENDING_AMOUNT} for reference number {TRANSACTION_NUMBER} to {RECEIVING_COUNTRY_NAME} is now complete.</span><br style=\"color: rgb(34, 34, 34); font-family: Arial, Helvetica, sans-serif; font-size: small;\"><span style=\"color: rgb(34, 34, 34); font-family: Arial, Helvetica, sans-serif; font-size: small;\">Thank you for using Remitz.</span><br>");
				EmailTemplate.setTitle("Email to sender on complete transaction");

			}
			if(i==5) {
				EmailTemplate.setAdmin(a);
				EmailTemplate.setBccEmail(admin.getEmailId());
				EmailTemplate.setCcEmail(admin.getEmailId());
				EmailTemplate.setDemo("");
				EmailTemplate.setReplyEmail(admin.getEmailId());
				EmailTemplate.setSubject("Email to sender on order initiate"
					);
				EmailTemplate.setTemplate("<span style=\"color: rgb(34, 34, 34); font-family: Arial, Helvetica, sans-serif; font-size: small;\">Hi {FIRST_NAME},</span><br style=\"color: rgb(34, 34, 34); font-family: Arial, Helvetica, sans-serif; font-size: small;\"><br style=\"color: rgb(34, 34, 34); font-family: Arial, Helvetica, sans-serif; font-size: small;\"><span style=\"color: rgb(34, 34, 34); font-family: Arial, Helvetica, sans-serif; font-size: small;\">Your money transfer of {SENDING_AMOUNT} for reference number {TRANSACTION_NUMBER} to {RECEIVING_COUNTRY_NAME} is initiated.</span><br style=\"color: rgb(34, 34, 34); font-family: Arial, Helvetica, sans-serif; font-size: small;\"><span style=\"color: rgb(34, 34, 34); font-family: Arial, Helvetica, sans-serif; font-size: small;\">Thank you for using CurrencyRemitApp.</span><br>");
				EmailTemplate.setTitle("Email to sender on order initiate");

			}
			if(i==6) {
				EmailTemplate.setAdmin(a);
				EmailTemplate.setBccEmail(admin.getEmailId());
				EmailTemplate.setCcEmail(admin.getEmailId());
				EmailTemplate.setDemo("");
				EmailTemplate.setReplyEmail(admin.getEmailId());
				EmailTemplate.setSubject("Password Changed Notification"
					);
				EmailTemplate.setTemplate("<span style=\"color: rgb(34, 34, 34); font-family: Arial, Helvetica, sans-serif; font-size: small;\">Hi {FIRST_NAME},</span><br style=\"color: rgb(34, 34, 34); font-family: Arial, Helvetica, sans-serif; font-size: small;\"><span style=\"color: rgb(34, 34, 34); font-family: Arial, Helvetica, sans-serif; font-size: small;\">Your login password has been changed successfully as per request sent on {DATE_TIME}.</span><br>");
				EmailTemplate.setTitle("Password Changed Notification");

			}
			if(i==7) {
				EmailTemplate.setAdmin(a);
				EmailTemplate.setBccEmail(admin.getEmailId());
				EmailTemplate.setCcEmail(admin.getEmailId());
				EmailTemplate.setDemo("");
				EmailTemplate.setReplyEmail(admin.getEmailId());
				EmailTemplate.setSubject("Thanks to customer about manual upload IDS"
					);
				EmailTemplate.setTemplate("<span style=\"color: rgb(34, 34, 34); font-family: Arial, Helvetica, sans-serif; font-size: small;\">Hi {FIRST_NAME},</span><br style=\"color: rgb(34, 34, 34); font-family: Arial, Helvetica, sans-serif; font-size: small;\"><span style=\"color: rgb(34, 34, 34); font-family: Arial, Helvetica, sans-serif; font-size: small;\">Thank you for uploading your documents, this will now be manually reviewed by our team and you should be expect contact from us within 1 hour during office hours (9am - 5pm Mon-Sat AEST) or first thing on the following working day.</span><br>");
				EmailTemplate.setTitle("Thanks to customer about manual upload IDS");

			}
			if(i==8) {
				EmailTemplate.setAdmin(a);
				EmailTemplate.setBccEmail(admin.getEmailId());
				EmailTemplate.setCcEmail(admin.getEmailId());
				EmailTemplate.setDemo("");
				EmailTemplate.setReplyEmail(admin.getEmailId());
				EmailTemplate.setSubject("Pay Now Pending Reminder"
					);
				EmailTemplate.setTemplate("<span style=\"color: rgb(34, 34, 34); font-family: Arial, Helvetica, sans-serif; font-size: small;\">Hi {FIRST_NAME},</span><br style=\"color: rgb(34, 34, 34); font-family: Arial, Helvetica, sans-serif; font-size: small;\"><span style=\"color: rgb(34, 34, 34); font-family: Arial, Helvetica, sans-serif; font-size: small;\">Thank you for visiting&nbsp;</span><a href=\"http://www.currencyremitapp.com/\" target=\"_blank\" data-saferedirecturl=\"https://www.google.com/url?q=http://www.CurrencyRemitApp.com&amp;source=gmail&amp;ust=1579756825990000&amp;usg=AFQjCNG4d10_pMmsmBkBTJk-syTjyU6KJQ\" style=\"color: rgb(17, 85, 204); font-family: Arial, Helvetica, sans-serif; font-size: small; background-color: rgb(255, 255, 255);\">www.CurrencyRemitApp.com</a><span style=\"color: rgb(34, 34, 34); font-family: Arial, Helvetica, sans-serif; font-size: small;\">.</span><br style=\"color: rgb(34, 34, 34); font-family: Arial, Helvetica, sans-serif; font-size: small;\"><span style=\"color: rgb(34, 34, 34); font-family: Arial, Helvetica, sans-serif; font-size: small;\">We noticed that you didn't get a chance to finish your transaction {TRANSACTION_NUMBER} so we're holding your transaction until {ORDER_EXPIRE_DATE_TIME}. Your transfer of {SENDING_AMOUNT} to {RECEIVER_SHORT_INFO} is ready to go.</span><br style=\"color: rgb(34, 34, 34); font-family: Arial, Helvetica, sans-serif; font-size: small;\"><span style=\"color: rgb(34, 34, 34); font-family: Arial, Helvetica, sans-serif; font-size: small;\">Pay online now, it's quick and secure.</span><br style=\"color: rgb(34, 34, 34); font-family: Arial, Helvetica, sans-serif; font-size: small;\"><span style=\"color: rgb(34, 34, 34); font-family: Arial, Helvetica, sans-serif; font-size: small;\">{PAY_NOW_BUTTON}</span><br style=\"color: rgb(34, 34, 34); font-family: Arial, Helvetica, sans-serif; font-size: small;\"><span style=\"color: rgb(34, 34, 34); font-family: Arial, Helvetica, sans-serif; font-size: small;\">Important information</span><br style=\"color: rgb(34, 34, 34); font-family: Arial, Helvetica, sans-serif; font-size: small;\"><span style=\"color: rgb(34, 34, 34); font-family: Arial, Helvetica, sans-serif; font-size: small;\">Payment must be made by {ORDER_EXPIRE_DATE_TIME} or the transaction will be cancelled. Once a payment is processed, your transaction will be released immediately. The transaction fees have not changed from your original enquiry.</span><br>");
				EmailTemplate.setTitle("Pay Now Pending Reminder");

			}

			if(i==9) {
				EmailTemplate.setAdmin(a);
				EmailTemplate.setBccEmail(admin.getEmailId());
				EmailTemplate.setCcEmail(admin.getEmailId());
				EmailTemplate.setDemo("");
				EmailTemplate.setReplyEmail(admin.getEmailId());
				EmailTemplate.setSubject("first signup messages"
					);
				EmailTemplate.setTemplate("<span style=\"color: rgb(34, 34, 34); font-family: Arial, Helvetica, sans-serif; font-size: small;\">Hi {FIRST_NAME},</span><br style=\"color: rgb(34, 34, 34); font-family: Arial, Helvetica, sans-serif; font-size: small;\"><span style=\"color: rgb(34, 34, 34); font-family: Arial, Helvetica, sans-serif; font-size: small;\">Thank you for choosing Remitz. We are happy to have you on board!</span><div><br style=\"color: rgb(34, 34, 34); font-family: Arial, Helvetica, sans-serif; font-size: small;\"><span style=\"color: rgb(34, 34, 34); font-family: Arial, Helvetica, sans-serif; font-size: small;\">Here is your new account information with us. Please keep this&nbsp;</span><span class=\"il\" style=\"color: rgb(34, 34, 34); font-family: Arial, Helvetica, sans-serif; font-size: small;\">email</span><span style=\"color: rgb(34, 34, 34); font-family: Arial, Helvetica, sans-serif; font-size: small;\">&nbsp;for future reference.</span></div><div><br style=\"color: rgb(34, 34, 34); font-family: Arial, Helvetica, sans-serif; font-size: small;\"><b><span style=\"color: rgb(34, 34, 34); font-family: Arial, Helvetica, sans-serif; font-size: small;\">Your username is your&nbsp;</span><span class=\"il\" style=\"color: rgb(34, 34, 34); font-family: Arial, Helvetica, sans-serif; font-size: small;\">email</span><span style=\"color: rgb(34, 34, 34); font-family: Arial, Helvetica, sans-serif; font-size: small;\">&nbsp;address: {SENDER_EMAIL_ID}</span><br style=\"color: rgb(34, 34, 34); font-family: Arial, Helvetica, sans-serif; font-size: small;\"><span style=\"color: rgb(34, 34, 34); font-family: Arial, Helvetica, sans-serif; font-size: small;\">Your unique Customer Number is: {CUSTOMER_NUMBER}</span></b></div><div><br style=\"color: rgb(34, 34, 34); font-family: Arial, Helvetica, sans-serif; font-size: small;\"><span style=\"color: rgb(34, 34, 34); font-family: Arial, Helvetica, sans-serif; font-size: small;\">Great news! As a thank you for joining our great team, here is a welcome gift. Enjoy your first transfer with Remitz free of charge! Simply enter the promo code during the transaction process. Let's go!</span></div><div><br style=\"color: rgb(34, 34, 34); font-family: Arial, Helvetica, sans-serif; font-size: small;\"><span style=\"color: rgb(34, 34, 34); font-family: Arial, Helvetica, sans-serif; font-size: small;\"><b>Promo Code: LOVE</b></span></div><div><br style=\"color: rgb(34, 34, 34); font-family: Arial, Helvetica, sans-serif; font-size: small;\"><span style=\"color: rgb(34, 34, 34); font-family: Arial, Helvetica, sans-serif; font-size: small;\"><b>Please note:</b> Remitz will never send you an&nbsp;</span><span class=\"il\" style=\"color: rgb(34, 34, 34); font-family: Arial, Helvetica, sans-serif; font-size: small;\">email</span><span style=\"color: rgb(34, 34, 34); font-family: Arial, Helvetica, sans-serif; font-size: small;\">&nbsp;or SMS asking you to provide your password.</span></div><div><br style=\"color: rgb(34, 34, 34); font-family: Arial, Helvetica, sans-serif; font-size: small;\"><span style=\"color: rgb(34, 34, 34); font-family: Arial, Helvetica, sans-serif; font-size: small;\">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; Phishing&nbsp;</span><span class=\"il\" style=\"color: rgb(34, 34, 34); font-family: Arial, Helvetica, sans-serif; font-size: small;\">emails</span><span style=\"color: rgb(34, 34, 34); font-family: Arial, Helvetica, sans-serif; font-size: small;\">&nbsp;are increasing in number and sophistication. It?s important to remain vigilant and wary of unexpected&nbsp;</span><span class=\"il\" style=\"color: rgb(34, 34, 34); font-family: Arial, Helvetica, sans-serif; font-size: small;\">emails</span><span style=\"color: rgb(34, 34, 34); font-family: Arial, Helvetica, sans-serif; font-size: small;\">&nbsp;or unfamiliar senders. If you have clicked on any links or noticed any unusual activities, report this to Remitz immediately at info@remitz.com.au</span><span style=\"color: rgb(34, 34, 34); font-family: Arial, Helvetica, sans-serif; font-size: small;\">. remitz is committed to working with our customers to stay safe online.</span></div><div><br></div><div><br style=\"color: rgb(34, 34, 34); font-family: Arial, Helvetica, sans-serif; font-size: small;\"><br></div> ");
				EmailTemplate.setTitle("first signup messages");

			}
			if(i==10) {
				EmailTemplate.setAdmin(a);
				EmailTemplate.setBccEmail(admin.getEmailId());
				EmailTemplate.setCcEmail(admin.getEmailId());
				EmailTemplate.setDemo("");
				EmailTemplate.setReplyEmail(admin.getEmailId());
				EmailTemplate.setSubject("Thanks for payment received"
					);
				EmailTemplate.setTemplate("<span style=\"color: rgb(34, 34, 34); font-family: Arial, Helvetica, sans-serif; font-size: small;\">Hi {FIRST_NAME},</span><br style=\"color: rgb(34, 34, 34); font-family: Arial, Helvetica, sans-serif; font-size: small;\"><span style=\"color: rgb(34, 34, 34); font-family: Arial, Helvetica, sans-serif; font-size: small;\">You have successfully made a payment to CurrencyRemitApp on {PAYMENT_DATE}.</span><br style=\"color: rgb(34, 34, 34); font-family: Arial, Helvetica, sans-serif; font-size: small;\"><span style=\"color: rgb(34, 34, 34); font-family: Arial, Helvetica, sans-serif; font-size: small;\">Your transaction number is {TRANSACTION_NUMBER}.</span><br style=\"color: rgb(34, 34, 34); font-family: Arial, Helvetica, sans-serif; font-size: small;\"><span style=\"color: rgb(34, 34, 34); font-family: Arial, Helvetica, sans-serif; font-size: small;\">We will notify you again as soon as we have confirmation that your recipient's account is credited.</span><br style=\"color: rgb(34, 34, 34); font-family: Arial, Helvetica, sans-serif; font-size: small;\"><span style=\"color: rgb(34, 34, 34); font-family: Arial, Helvetica, sans-serif; font-size: small;\">If you need to talk to us, our Care team at customerservice@</span><wbr style=\"color: rgb(34, 34, 34); font-family: Arial, Helvetica, sans-serif; font-size: small;\"><span style=\"color: rgb(34, 34, 34); font-family: Arial, Helvetica, sans-serif; font-size: small;\">CurrencyRemitApp.com will help you along.</span><br style=\"color: rgb(34, 34, 34); font-family: Arial, Helvetica, sans-serif; font-size: small;\"><span style=\"color: rgb(34, 34, 34); font-family: Arial, Helvetica, sans-serif; font-size: small;\">Thank you for using CurrencyRemitApp.</span><br>");
				EmailTemplate.setTitle("Thanks for payment received");

			}
		
			emailTemplateService.insertTemplate(EmailTemplate);
		}

	}
	SourceOfFunds1 sourceOfFunds = new SourceOfFunds1();

	for(int i=0;i<15;i++) {
		
		if(i==0) {
			System.out.println("sourceof fund===");
			sourceOfFunds.setAdmin(a);
			sourceOfFunds.setSourceOfFund("Business Income");
		}
		if(i==1) {
			sourceOfFunds.setAdmin(a);

			sourceOfFunds.setSourceOfFund("Salary / Saving");
		}
		
		if(i==2) {
			sourceOfFunds.setAdmin(a);

			sourceOfFunds.setSourceOfFund("Financial supports from Spouse");
		}
		if(i==3) {
			sourceOfFunds.setAdmin(a);

			sourceOfFunds.setSourceOfFund("Property investment");
		}
		if(i==4) {
			sourceOfFunds.setAdmin(a);

			sourceOfFunds.setSourceOfFund("Shares investment");
		}
		if(i==5) {
			sourceOfFunds.setAdmin(a);

			sourceOfFunds.setSourceOfFund("Donation/Gift");
		}
		if(i==6) {
			sourceOfFunds.setAdmin(a);

			sourceOfFunds.setSourceOfFund("Freelance income");
		}
		if(i==7) {
			sourceOfFunds.setAdmin(a);

			sourceOfFunds.setSourceOfFund("Loans");
		}
		if(i==8) {
			sourceOfFunds.setAdmin(a);

			sourceOfFunds.setSourceOfFund("Retirement fund");
		}
		if(i==9) {
			sourceOfFunds.setAdmin(a);

			sourceOfFunds.setSourceOfFund("Rental/leasing income");
		}
		if(i==10) {
			sourceOfFunds.setAdmin(a);

			sourceOfFunds.setSourceOfFund("Data is not required to be collected by local jurisdiction");
		}
		if(i==11) {
			sourceOfFunds.setAdmin(a);

			sourceOfFunds.setSourceOfFund("Tax Refund");
		}
		if(i==12) {
			sourceOfFunds.setAdmin(a);

			sourceOfFunds.setSourceOfFund("Venture Capital");
		}
		if(i==13) {
			sourceOfFunds.setAdmin(a);

			sourceOfFunds.setSourceOfFund("Claims/Compensation");
		}
		if(i==14) {
			sourceOfFunds.setAdmin(a);

			sourceOfFunds.setSourceOfFund("Sales Assets");
		}
		
		sourceOfFundsService.insertSourceOfFunds(sourceOfFunds);
	}
	RealationShips1 rp = new RealationShips1();

	for(int i=0;i<20;i++) {
		
		if(i==0) {
			System.out.println("relations==");
			rp.setAdmin(a);
			rp.setRelationShip("Spouse");
		}
		if(i==1) {
			rp.setAdmin(a);
			rp.setRelationShip("Children");
		}
		if(i==2) {
			rp.setAdmin(a);
			rp.setRelationShip("Parent");
		}
		if(i==3) {
			rp.setAdmin(a);
			rp.setRelationShip("Sibling/brother/sister");
		}
		if(i==4) {
			rp.setAdmin(a);
			rp.setRelationShip("Relative/uncle/auntie/cousin");
		}
		if(i==5) {
			rp.setAdmin(a);
			rp.setRelationShip("Self");
		}
		if(i==6) {
			rp.setAdmin(a);
			rp.setRelationShip("Ex-spouse");
		}
		if(i==7) {
			rp.setAdmin(a);
			rp.setRelationShip("Friend");
		}
		if(i==8) {
			rp.setAdmin(a);
			rp.setRelationShip("Business partner");
		}
		if(i==9) {
			rp.setAdmin(a);
			rp.setRelationShip("Customer");
		}
		if(i==10) {
			rp.setAdmin(a);
			rp.setRelationShip("Employee");
		}
		if(i==11) {
			rp.setAdmin(a);
			rp.setRelationShip("Branch/Representative office");
		}
		if(i==12) {
			rp.setAdmin(a);
			rp.setRelationShip("Subsidiary company");
		}
		if(i==13) {
			rp.setAdmin(a);
			rp.setRelationShip("Holding compnay");
		}
		if(i==14) {
			rp.setAdmin(a);
			rp.setRelationShip("Supplier");
		}
		if(i==15) {
			rp.setAdmin(a);
			rp.setRelationShip("Creditor");
		}
		if(i==16) {
			rp.setAdmin(a);
			rp.setRelationShip("Debtor");
		}
		if(i==17) {
			rp.setAdmin(a);
			rp.setRelationShip("Franchisee/Franchisor");
		}
		if(i==18) {
			rp.setAdmin(a);
			rp.setRelationShip("Non Related");
		}
		if(i==19) {
			rp.setAdmin(a);
			rp.setRelationShip("Data is not required to be collected by local jurisdiction");
		}
		realationShips1Service.insertRelationships(rp);
	}
	ReasonForTransfer rt = new ReasonForTransfer();

	for(int i=0;i<10;i++) {
		
		if(i==0) {
			System.out.println("reson or transer");
			rt.setAdmin(a);
			rt.setReasonForTransfer("Freight");
		}
		if(i==1) {
			rt.setAdmin(a);
			rt.setReasonForTransfer("Passenger Fare");
		}
		if(i==2) {
			rt.setAdmin(a);
			rt.setReasonForTransfer("Goods and Services");
		}
		if(i==3) {
			rt.setAdmin(a);
			rt.setReasonForTransfer("Legal Services");
		}
		if(i==4) {
			rt.setAdmin(a);
			rt.setReasonForTransfer("Health Services");
		}
		if(i==5) {
			rt.setAdmin(a);
			rt.setReasonForTransfer("Education Services");
		}
		if(i==6) {
			rt.setAdmin(a);
			rt.setReasonForTransfer("Other Personal Services");
		}
		if(i==7) {
			rt.setAdmin(a);
			rt.setReasonForTransfer("Grants and Gifts");
		}
		if(i==8) {
			rt.setAdmin(a);
			rt.setReasonForTransfer("Worker's Remitances/Family maintainance");
		}
		if(i==9) {
			rt.setAdmin(a);
			rt.setReasonForTransfer("Social Contributions and Benefits(Private Sector");
		}
		reasonForTransferService.insertReasonForTransfer(rt);
			
	}
	InternetBankTransferMop rt1 = new InternetBankTransferMop();

	
	rt1.setAdmin(a);
	rt1.setAccountNumber("12345");
	rt1.setBankCode("123");
	rt1.setBankName("ABC");
	rt1.setPayeeName("payeeName");
	internetBankTransferMopService.save(rt1);

	SenderIds st=new SenderIds();
	for(int i=0;i<6;i++) {
		if(i==0) {
			System.out.println("idvalues==");
			st.setAdmin(a);
			st.setSenderType("Work Permit");
			st.setIssuingAuthority("state");
			st.setIdValue("1");

		}
		if(i==1) {
			st.setAdmin(a);
			st.setIssuingAuthority("country");
			st.setSenderType("International Passport");
			st.setIdValue("2");
		}
		if(i==2) {
			st.setAdmin(a);
			st.setIssuingAuthority("state");
			st.setSenderType("Identification/National ID");
			st.setIdValue("3");
		}
		if(i==3) {
			st.setAdmin(a);
			st.setIssuingAuthority("none");
			st.setSenderType("Social Security");
			st.setIdValue("6");
		}
		if(i==4) {
			st.setAdmin(a);
			st.setIssuingAuthority("state");
			st.setSenderType("Residence Permit");
			st.setIdValue("4");
		}
		if(i==5) {
			st.setAdmin(a);
			st.setIssuingAuthority("state");
			st.setSenderType("Passport");
			st.setIdValue("5");

		}
		if(i==6) {
			st.setAdmin(a);
			st.setIssuingAuthority("state");
			st.setSenderType("Driver Licence");
			st.setIdValue("01");
			
		}
		//senderIdTypeService.Save(st);

	}
	List<SenderIds> sd=senderIdTypeService.findByAdmin(adminId);
	List<EmailTemplate> et=emailTemplateService.getEmailTemplatesBasedOnAdmin(adminId);
	List<RealationShips1> rs=realationShips1Service.RelationshipsListBasedOnAdmin(adminId);
	List<SourceOfFunds1> sr=sourceOfFundsService.SourceOfFundsListBasedOnAdmin(adminId);
	List<ReasonForTransfer> rf=reasonForTransferService.findByAdmin(adminId);
	System.out.println("senderIds===="+sd.size());
	System.out.println("emailtemplates===="+et.size());
	System.out.println("relationshipes======"+rs.size());
	System.out.println("reasonfotransfer===="+rf.size());
	System.out.println("soucrsofund===="+sr.size());
	try {
		SendMailBean sendMailBean=new SendMailBean();
		 
		  String message = "FirstName:" + admin.getFirstName() + "<br/>LastName: " +
				  admin.getLastName()+"<br/>MobileNumber: "+admin.getMobileNumber()+"<br/>EmailId: "+admin.getEmailId()+"<br/>Country:"+admin.getCountry().getCountryISO()+", "+admin.getCountry().getCountryName()+", "+admin.getCountry().getDalingCode();
		  
		  System.out.println("message==="+message);
		  
String userMessge ="Greetings from Remitz,<br/><br/>";
userMessge=userMessge+"Thank you for requesting a demo.<br/>";
userMessge=userMessge+"We're writing to find out the best date and time to give you a demonstration of our software Remitz- Money Transfer Software.\r\n" + 
		"<br/>";
userMessge=userMessge+"You may also contact us on what's app @ +447459926167. skype @ ramidiu\r\n" + 
		"<br/>";
userMessge=userMessge+"Would you like to get started on a quote? Reply to this email and let me know:<br>";
userMessge=userMessge+"1. How many source countries? (This is where the transactions originate)\r\n" + 
		"<br/>";
userMessge=userMessge+"2. How many destination countries? (This is where the beneficiaries will receive the money.)\r\n" + 
		"<br/>";
userMessge=userMessge+"3. How many transactions per month you will be performing?<br/>";
userMessge=userMessge+"4. What is your best (direct) phone line?<br/>";
userMessge=userMessge+"As soon as we hear back, We will give you a quick call to review your needs: we will work and get you the most competitive quotes.\r\n" + 
		"<br/>";
userMessge=userMessge+"Want to know more about our software? Here is a video below explaining all features of the Money Transfer Software - Remitz.\r\n" + 
		"<br/>";
userMessge=userMessge+"How to set up the software after you sign up for the trail. <br/>" + 
		"https://www.youtube.com/watch?v=NZjuoMIugqQ<br/>";
userMessge=userMessge+"How the customer will use the money transfer software <br/>" + 
		"https://www.youtube.com/watch?v=_ue8rdjsET4&t=25s<br/><br/>";

userMessge=userMessge+"Umesh.<br/>";
userMessge=userMessge+"Remitz<br/>";
userMessge=userMessge+"--<br/>";
userMessge=userMessge+"Warm Regards,<br/>";
userMessge=userMessge+"Umesh Ramidi  | Business Development Manager\r\n" + 
		"<br/>";
userMessge=userMessge+"Kreativ Web Solutions | Web And Custom Software Solutions...<br/>";
userMessge=userMessge+"Web Design| Web Development | Web Solutions | SEO<br/>";
userMessge=userMessge+"Whats app  on +44 7459926167<br/>";
userMessge=userMessge+"Web site: www.kreativwebsolutions.com | ramidiu@kreativwebsolutions.com<br/>";
		 
           sendMailBean.send1("info@remitz.co.uk", admin.getEmailId(), "", "",
		  "Demo for Money Transfer Software and How to operate Remitz software video link inside", userMessge, "68.169.55.168");
		  sendMailBean.send1("info@remitz.co.uk", "ramidiu@kreativwebsolutions.com", "", "",
		  "New registration from remitz ,"+admin.getEmailId()
		  , message, "68.169.55.168"); 
		}
		catch (Exception e) { 
			e.printStackTrace();
			}
		

	return new ResponseEntity<String>(a.getAdminId(), HttpStatus.OK);
}

@RequestMapping("checkexistAdmin")
public ResponseEntity<String> checkUsersEmails(@RequestParam String emailId) {
	System.out.println("emailId===" + emailId);
	String result = userService.getUserListBasedOnEmailId(emailId);
	System.out.println("result::::" + result);
	return new ResponseEntity<>(result, HttpStatus.OK);
}



}
