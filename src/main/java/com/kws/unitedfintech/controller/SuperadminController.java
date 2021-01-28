package com.kws.unitedfintech.controller;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.kws.unitedfintech.entities.Admin;
import com.kws.unitedfintech.entities.AuditTrail;
import com.kws.unitedfintech.entities.Country;
import com.kws.unitedfintech.entities.EmailTemplate;
import com.kws.unitedfintech.entities.InternetBankTransferMop;
import com.kws.unitedfintech.entities.MajorHead;
import com.kws.unitedfintech.entities.MinorHead;
import com.kws.unitedfintech.entities.ModeOfPayments;
import com.kws.unitedfintech.entities.Nasano;
import com.kws.unitedfintech.entities.PaymentTypes;
import com.kws.unitedfintech.entities.RealationShips1;
import com.kws.unitedfintech.entities.ReasonForTransfer;
import com.kws.unitedfintech.entities.SenderIds;
import com.kws.unitedfintech.entities.SourceOfFunds1;
import com.kws.unitedfintech.entities.Zone;
import com.kws.unitedfintech.helpers.FileURLs;
import com.kws.unitedfintech.service.AdminService;
import com.kws.unitedfintech.service.AuditTrailService;
import com.kws.unitedfintech.service.BranchPaymentTypeDetailsService;
import com.kws.unitedfintech.service.CountryService;
import com.kws.unitedfintech.service.CountryZonService;
import com.kws.unitedfintech.service.EmailTemplateService;
import com.kws.unitedfintech.service.InternetBankTransferMopService;
import com.kws.unitedfintech.service.MajorHeadService;
import com.kws.unitedfintech.service.MinorHeadService;
import com.kws.unitedfintech.service.ModeOfPaymentsService;
import com.kws.unitedfintech.service.NsanoService;
import com.kws.unitedfintech.service.PaymentTypesService;
import com.kws.unitedfintech.service.RealationShips1Service;
import com.kws.unitedfintech.service.ReasonForTransferService;
import com.kws.unitedfintech.service.SenderIdTypeService;
import com.kws.unitedfintech.service.SessionDataService;
import com.kws.unitedfintech.service.SourceOfFundsService;
import com.kws.unitedfintech.service.SuperadminService;


@Controller
public class SuperadminController {
	@Autowired
	private AuditTrailService auditTrailService;
	@Autowired
	private MajorHeadService majorHeadService;
	@Autowired
	private MinorHeadService minorHeadService;
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
	/*
	 * @GetMapping("/") public String returnIndexPage() { return "superadmin/index";
	 * }
	 * 
	 * @RequestMapping(value = "/validate", method = RequestMethod.POST) public
	 * String validate(HttpServletRequest request, HttpServletResponse response) {
	 * String userName = request.getParameter("userName"); String password =
	 * request.getParameter("password"); SuperAdmin superAdmin = new SuperAdmin();
	 * 
	 * superAdmin = superAdminService.validate(userName, password);
	 * System.out.println(superAdmin);
	 * 
	 * if (superAdmin != null) {
	 * System.out.println("superadmin:"+superAdmin.getUserName());
	 * sessionDataService.storeSuperAdminName(request.getSession(),
	 * superAdmin.getFirstName()); return "/superadmin/adminRegistration1"; } else {
	 * return "redirect:/"; } }
	 */	@PostMapping("getallcountrys")
	public @ResponseBody List<Country> getAllCountries() {
		
		return countryService.getAllCountries();
	}
	
	 @RequestMapping(value="checkadminemailid", method=RequestMethod.POST)
	 public @ResponseBody String getAgentByAdmin(HttpServletRequest request , @RequestParam String emailId){
		 String result=adminService.validateAdminBasedOnEmailId(emailId);
		 return result;
	 }

	@PostMapping("getTimeZones")
	public @ResponseBody List<Zone> getTimeZones(@RequestParam String countryISO) {
		return zoneService.getTimeZonesBasedOnCountry(countryISO);
	}
	
	
	@RequestMapping(value = "/adminRegistration", method = RequestMethod.GET)
	public String getadminRegistration(HttpServletRequest request, HttpServletResponse response,ModelMap map) {
		ModelAndView mav = null;
		List<PaymentTypes> pTypesList = null;
		List<ModeOfPayments> pModes = null;
		pTypesList = new ArrayList<PaymentTypes>();
		pTypesList = paymentTypesService.getAllPaymentTypes();
		pTypesList.forEach(pt->pt.getPaymentType());
		pModes = new ArrayList<ModeOfPayments>();
		pModes = modeOfPaymentsService.getAllModeOfPaymets();
		
		map.addAttribute("pTypesList", pTypesList);
		map.addAttribute("pModes", pModes);
		return "adminRegistration";
	}
	@RequestMapping(value = "/insertAdmin", method = RequestMethod.POST)
	public @ResponseBody ModelAndView insertAdmin(@ModelAttribute Admin admin,HttpServletRequest request, HttpServletResponse response,ModelMap map,MultipartHttpServletRequest multiPartrequest) {
ModelAndView mav=new ModelAndView();
		/* String fromPage = request.getParameter("fromPage"); */
String superadminid=request.getParameter("superAdminId");
String countryiso=request.getParameter("countryIso");
System.out.println("admin detials:"+admin.getFirstName());
System.out.println("admin status:"+admin.getAdminStatus());
System.out.println("package status:"+admin.getPackages());
		  Country country =countryService.getCountryBasedOnIso(countryiso); 
		  String zonename=request.getParameter("timeZone");
		  admin.setCountry(country); 
		  String zoneid =
				  zoneService.getZoneIdBasedOnZoneName(zonename);
		  Zone zone=
		  zoneService.getZoneBasedOnZoneId(request.getParameter("zoneId")); 
		String profitMode = request.getParameter("pMode");
		String modeOfPayments = request.getParameter("modeOfPayments");
		String pTypes = request.getParameter("pTypes");
		String toCountryDetails = request.getParameter("toCountryDetails");
		admin.setBusinessCountries(toCountryDetails);
		admin.setProfitMode(profitMode);
		admin.setPaymentTypes(pTypes);
		  admin.setModeOfPayments(modeOfPayments);
			admin.setStatus("active");
		
		  admin.setZone(zone); 
		 
	admin.setFlag("false");
	String url=adminService.insertAdmin(admin,multiPartrequest);
	mav.addObject("adminId", admin.getAdminId());
	String adminId=admin.getAdminId();
	mav.addObject("adminId", adminId);
	System.out.println("adminId==="+adminId);
	Admin admin1=adminService.getAdminDetailsBasedOnAdminId(adminId);
	String myIp=request.getParameter("myIp");
	AuditTrail a=new AuditTrail();
	a.setAgent("-");
	a.setMessage("new admin createed");
	a.setUserId("SADM100001");
	a.setUserType("ROLE_SUPERADMIN");
	a.setOriginalData("-");
	a.setChangedData("New adminId is:"+admin1.getAdminId());
	a.setIpAddress(myIp);
	a.setTransaction("-");
	a.setSourceCountry("-");
	a.setAdminId(admin1.getAdminId());
	a.setUserName(admin1.getEmailId());
	a.setCategory("new admin created");
	auditTrailService.save(a);
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
			
				EmailTemplate.setAdmin(admin1);
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
				EmailTemplate.setAdmin(admin1);
				EmailTemplate.setBccEmail(admin.getEmailId());
				EmailTemplate.setCcEmail(admin.getEmailId());
				EmailTemplate.setDemo("");
				EmailTemplate.setReplyEmail(admin.getEmailId());
				EmailTemplate.setSubject("Manual id verification done by Admin"
					);
				EmailTemplate.setTemplate("<span style=\"color: rgb(34, 34, 34); font-family: Arial, Helvetica, sans-serif; font-size: small;\">Hi {FIRST_NAME},</span><br style=\"color: rgb(34, 34, 34); font-family: Arial, Helvetica, sans-serif; font-size: small;\"><br><font color=\"#222222\" face=\"Arial, Helvetica, sans-serif\" size=\"2\">Your ID is verified manually by admin.</font><div><br></div>");
				EmailTemplate.setTitle("Manual id verification done by Admin");

			}
			if(i==2) {
				EmailTemplate.setAdmin(admin1);
				EmailTemplate.setBccEmail(admin.getEmailId());
				EmailTemplate.setCcEmail(admin.getEmailId());
				EmailTemplate.setDemo(" ");
				EmailTemplate.setReplyEmail(admin.getEmailId());
				EmailTemplate.setSubject("Email to customer about auto id verififcation fail"
					);
				EmailTemplate.setTemplate("<span style=\"color: rgb(34, 34, 34); font-family: Arial, Helvetica, sans-serif; font-size: small;\">Hi {FIRST_NAME},</span><div><br style=\"color: rgb(34, 34, 34); font-family: Arial, Helvetica, sans-serif; font-size: small;\"><font color=\"#222222\" face=\"Arial, Helvetica, sans-serif\" size=\"2\">Unfortunately&nbsp; your ID verification is failed and you are now requested to upload your ID Proofs manually . to upload your ID proof you click on the link below. if you have already uploaded , please ignore.</font></div><div><font color=\"#222222\" face=\"Arial, Helvetica, sans-serif\" size=\"2\"><br></font></div><div><font color=\"#222222\" face=\"Arial, Helvetica, sans-serif\" size=\"2\">{link}</font></div>");
				EmailTemplate.setTitle("Email to customer about auto id verififcation fail");

			}
			if(i==3) {
				EmailTemplate.setAdmin(admin1);
				EmailTemplate.setBccEmail(admin.getEmailId());
				EmailTemplate.setCcEmail(admin.getEmailId());
				EmailTemplate.setTemplate("<span style=\"color: rgb(34, 34, 34); font-family: Arial, Helvetica, sans-serif; font-size: small;\">Hi {FIRST_NAME},</span><br style=\"color: rgb(34, 34, 34); font-family: Arial, Helvetica, sans-serif; font-size: small;\"><br style=\"color: rgb(34, 34, 34); font-family: Arial, Helvetica, sans-serif; font-size: small;\"><span style=\"color: rgb(34, 34, 34); font-family: Arial, Helvetica, sans-serif; font-size: small;\">This email is to notify you that your {ID_TYPE} expired on {ID_EXPIRY_DATE}.</span><br style=\"color: rgb(34, 34, 34); font-family: Arial, Helvetica, sans-serif; font-size: small;\"><span style=\"color: rgb(34, 34, 34); font-family: Arial, Helvetica, sans-serif; font-size: small;\">Please upload a copy of a valid passport and proof of address, or drivers licence ID by clicking on the link below.</span><br style=\"color: rgb(34, 34, 34); font-family: Arial, Helvetica, sans-serif; font-size: small;\"><span style=\"color: rgb(34, 34, 34); font-family: Arial, Helvetica, sans-serif; font-size: small;\">{PROFILE_LINK}</span><br style=\"color: rgb(34, 34, 34); font-family: Arial, Helvetica, sans-serif; font-size: small;\"><span style=\"color: rgb(34, 34, 34); font-family: Arial, Helvetica, sans-serif; font-size: small;\">We look forward to serving you again!.</span><br>");
				EmailTemplate.setReplyEmail(admin.getEmailId());
				EmailTemplate.setSubject("Your Photo Id is expired");
				EmailTemplate.setDemo("");
				EmailTemplate.setTitle("Alert to customer about expiry of PHOTO ID");

			}
			if(i==4) {
				EmailTemplate.setAdmin(admin1);
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
				EmailTemplate.setAdmin(admin1);
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
				EmailTemplate.setAdmin(admin1);
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
				EmailTemplate.setAdmin(admin1);
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
				EmailTemplate.setAdmin(admin1);
				EmailTemplate.setBccEmail(admin.getEmailId());
				EmailTemplate.setCcEmail(admin.getEmailId());
				EmailTemplate.setDemo("");
				EmailTemplate.setReplyEmail(admin.getEmailId());
				EmailTemplate.setSubject(" Reminder about payment for your recent transaction"
					);
				EmailTemplate.setTemplate("<span style=\"color: rgb(34, 34, 34); font-family: Arial, Helvetica, sans-serif; font-size: small;\">Hi {FIRST_NAME},</span><br style=\"color: rgb(34, 34, 34); font-family: Arial, Helvetica, sans-serif; font-size: small;\"><br style=\"color: rgb(34, 34, 34); font-family: Arial, Helvetica, sans-serif; font-size: small;\"><span style=\"color: rgb(34, 34, 34); font-family: Arial, Helvetica, sans-serif; font-size: small;\">We noticed that you didn't get a chance to finish your transaction {TRANSACTION_NUMBER} so we're holding your transaction until {ORDER_EXPIRE_DATE_TIME}. Your transfer of {SENDING_AMOUNT} </span><span style=\"color: rgb(34, 34, 34); font-family: Arial, Helvetica, sans-serif; font-size: small;\">&nbsp;is ready to go.</span><br style=\"color: rgb(34, 34, 34); font-family: Arial, Helvetica, sans-serif; font-size: small;\"><span style=\"color: rgb(34, 34, 34); font-family: Arial, Helvetica, sans-serif; font-size: small;\">Pay online now, it's quick and secure.</span><br style=\"color: rgb(34, 34, 34); font-family: Arial, Helvetica, sans-serif; font-size: small;\"><span style=\"color: rgb(34, 34, 34); font-family: Arial, Helvetica, sans-serif; font-size: small;\">{PAY_NOW_BUTTON}</span><br style=\"color: rgb(34, 34, 34); font-family: Arial, Helvetica, sans-serif; font-size: small;\"><span style=\"color: rgb(34, 34, 34); font-family: Arial, Helvetica, sans-serif; font-size: small;\">Important information</span><br style=\"color: rgb(34, 34, 34); font-family: Arial, Helvetica, sans-serif; font-size: small;\"><span style=\"color: rgb(34, 34, 34); font-family: Arial, Helvetica, sans-serif; font-size: small;\">Payment must be made by {with in 4 hours } or the transaction will be cancelled. Once a payment is processed, your transaction will be released immediately. The transaction fees have not changed from your original enquiry.</span><br>");
				EmailTemplate.setTitle("Pay Now Pending Reminder");

			}

			if(i==9) {
				EmailTemplate.setAdmin(admin1);
				EmailTemplate.setBccEmail(admin.getEmailId());
				EmailTemplate.setCcEmail(admin.getEmailId());
				EmailTemplate.setDemo("");
				EmailTemplate.setReplyEmail(admin.getEmailId());
				EmailTemplate.setSubject("first signup messages"
					);
				EmailTemplate.setTemplate("<div><span style=\"color: rgb(34, 34, 34); font-family: Arial, Helvetica, sans-serif; font-size: small;\">Hi {FIRST_NAME},</span><br style=\"color: rgb(34, 34, 34); font-family: Arial, Helvetica, sans-serif; font-size: small;\"><span style=\"color: rgb(34, 34, 34); font-family: Arial, Helvetica, sans-serif; font-size: small;\">Thank you for choosing Remitz. We are happy to have you on board!</span><div><br style=\"color: rgb(34, 34, 34); font-family: Arial, Helvetica, sans-serif; font-size: small;\"><span style=\"color: rgb(34, 34, 34); font-family: Arial, Helvetica, sans-serif; font-size: small;\">Here is your new account information with us. Please keep this&nbsp;</span><span class=\"il\" style=\"color: rgb(34, 34, 34); font-family: Arial, Helvetica, sans-serif; font-size: small;\">email</span><span style=\"color: rgb(34, 34, 34); font-family: Arial, Helvetica, sans-serif; font-size: small;\">&nbsp;for future reference.</span></div><div><br style=\"color: rgb(34, 34, 34); font-family: Arial, Helvetica, sans-serif; font-size: small;\"><span style=\"font-weight: bolder;\"><span style=\"color: rgb(34, 34, 34); font-family: Arial, Helvetica, sans-serif; font-size: small;\">Your username is your&nbsp;</span><span class=\"il\" style=\"color: rgb(34, 34, 34); font-family: Arial, Helvetica, sans-serif; font-size: small;\">email</span><span style=\"color: rgb(34, 34, 34); font-family: Arial, Helvetica, sans-serif; font-size: small;\">&nbsp;address: {SENDER_EMAIL_ID}</span><br style=\"color: rgb(34, 34, 34); font-family: Arial, Helvetica, sans-serif; font-size: small;\"><span style=\"color: rgb(34, 34, 34); font-family: Arial, Helvetica, sans-serif; font-size: small;\">Your unique Customer Number is: {CUSTOMER_NUMBER}</span></span></div><div><br style=\"color: rgb(34, 34, 34); font-family: Arial, Helvetica, sans-serif; font-size: small;\"><span style=\"color: rgb(34, 34, 34); font-family: Arial, Helvetica, sans-serif; font-size: small;\"><span style=\"font-weight: bolder;\">Please note:</span>&nbsp;Remitz will never send you an&nbsp;</span><span class=\"il\" style=\"color: rgb(34, 34, 34); font-family: Arial, Helvetica, sans-serif; font-size: small;\">email</span><span style=\"color: rgb(34, 34, 34); font-family: Arial, Helvetica, sans-serif; font-size: small;\">&nbsp;or SMS asking you to provide your password.</span><br></div><div><br style=\"color: rgb(34, 34, 34); font-family: Arial, Helvetica, sans-serif; font-size: small;\"></div></div><div><br></div><div><br style=\"color: rgb(34, 34, 34); font-family: Arial, Helvetica, sans-serif; font-size: small;\"><br></div> ");
				EmailTemplate.setTitle("first signup messages");

			}
			if(i==10) {
				EmailTemplate.setAdmin(admin1);
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
	

	MajorHead m=new MajorHead();
	for(int i=0;i<16;i++) {
		if(i==0) {
	    	   m.setAdmin(admin1);
	    	   m.setHeadOfAccount(adminId);
	    	   m.setMajorHeadName("Current Assets");
	    	   m.setAccNo("101");
	    	   m.setDescription("new Assets account Current Assets");
	    	   m.setMajorHeadNature("Assets");
	    	   m.setLevel("2");
	    	   m.setFlag("yes");
			}
		 if(i==1) { 
			   
			   m.setAdmin(admin1); 
			   m.setHeadOfAccount(adminId);
			   m.setMajorHeadName("Direct Incomes"); 
			   m.setAccNo("102");
			   m.setDescription("new Assets account Direct Incomes");
			   m.setMajorHeadNature("Assets"); 
			   m.setLevel("2");
			   m.setFlag("yes");
			   }
				 
	       if(i==2) {
	    	   m.setAdmin(admin1);
	    	   m.setHeadOfAccount(adminId);
	    	   m.setMajorHeadName("Fixed Assets");
	    	   m.setAccNo("103");
	    	   m.setDescription("new Assets account Fixed Assets");
	    	   m.setMajorHeadNature("Assets");
	    	   m.setLevel("2");
	    	   m.setFlag("yes");		}
	       if(i==3) {
	    	   m.setAdmin(admin1);
	    	   m.setHeadOfAccount(adminId);
	    	   m.setMajorHeadName("Investments");
	    	   m.setAccNo("104");
	    	   m.setDescription("new Assets account Investments");
	    	   m.setMajorHeadNature("Assets");
	    	   m.setLevel("2");
	    	   m.setFlag("yes");
			}
	       if(i==4) { 
			   System.out.println("jjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjj");
			   m.setAdmin(admin1); 
			   m.setHeadOfAccount(adminId);
			   m.setMajorHeadName("Branch/Divisons"); 
			   m.setAccNo("105");
			   m.setDescription("new Assets account On Branch/Divisons");
			   m.setMajorHeadNature("Assets"); 
			   m.setLevel("2");
			   m.setFlag("yes");
			   }
				 
	       if(i==5) {
	    	   m.setAdmin(admin1);
	    	   m.setHeadOfAccount(adminId);
	    	   m.setMajorHeadName("Capital Account");
	    	   m.setAccNo("106");
	    	   m.setDescription("new Assets account On Capital Account");
	    	   m.setMajorHeadNature("Assets");
	    	   m.setLevel("2");
	    	   m.setFlag("yes");		}
	       if(i==6) {
	    	   m.setAdmin(admin1);
	    	   m.setHeadOfAccount(adminId);
	    	   m.setMajorHeadName("Suspense Account(Assets)");
	    	   m.setAccNo("107");
	    	   m.setDescription("new Assets account On Suspense Account");
	    	   m.setMajorHeadNature("Assets");
	    	   m.setLevel("2");
	    	   m.setFlag("yes");
			}
	       if(i==7) {
	    	   m.setAdmin(admin1);
	    	   m.setHeadOfAccount(adminId);
	    	   m.setMajorHeadName("Loans (Liability)");
	    	   m.setAccNo("201");
	    	   m.setDescription("new Liabilities account Loans (Liability)");
	    	   m.setMajorHeadNature("Liabilities");
	    	   m.setLevel("2");
	    	   m.setFlag("yes");
			}
	       if(i==8) {
	    	   m.setAdmin(admin1);
	    	   m.setHeadOfAccount(adminId);
	    	   m.setMajorHeadName("Current Liabilities");
	    	   m.setAccNo("202");
	    	   m.setDescription("new Liabilities account Current Liabilities");
	    	   m.setMajorHeadNature("Liabilities");
	    	   m.setLevel("2");
	    	   m.setFlag("yes");
			}
	       if(i==9) {
	    	   m.setAdmin(admin1);
	    	   m.setHeadOfAccount(adminId);
	    	   m.setMajorHeadName("Suspense Account(Liability)");
	    	   m.setAccNo("203");
	    	   m.setDescription("new Liabilities account Suspense Account");
	    	   m.setMajorHeadNature("Liabilities");
	    	   m.setLevel("2");
	    	   m.setFlag("yes");
			}
	       if(i==10) {
	    	   m.setAdmin(admin1);
	    	   m.setHeadOfAccount(adminId);
	    	   m.setMajorHeadName("Misc. Expenses");
	    	   m.setAccNo("301");
	    	   m.setDescription("new Expenses account Misc. Expenses");
	    	   m.setMajorHeadNature("Expenses");
	    	   m.setLevel("2");
	    	   m.setFlag("yes");
			}
	       if(i==11) {
	    	   m.setAdmin(admin1);
	    	   m.setHeadOfAccount(adminId);
	    	   m.setMajorHeadName("Direct Expenses");
	    	   m.setAccNo("302");
	    	   m.setDescription("new Expenses account Direct Expenses");
	    	   m.setMajorHeadNature("Expenses");
	    	   m.setLevel("2");
	    	   m.setFlag("yes");
			}
	       if(i==12) {
	    	   m.setAdmin(admin1);
	    	   m.setHeadOfAccount(adminId);
	    	   m.setMajorHeadName("Indirect Expenses");
	    	   m.setAccNo("303");
	    	   m.setDescription("new Expenses account Indirect Expenses");
	    	   m.setMajorHeadNature("Expenses");
	    	   m.setLevel("2");
	    	   m.setFlag("yes");		
	    	}
	    
	       if(i==13) {
			 m.setAdmin(admin1);
	    	   m.setHeadOfAccount(adminId);
	    	   m.setMajorHeadName("Indirect Incomes");
	    	   m.setAccNo("401");
	    	   m.setDescription("new revenue account indirect incomes");
	    	   m.setMajorHeadNature("Revenue");
	    	   m.setLevel("2");
	    	   m.setFlag("yes");
		   }
	       if(i==14) {
				 m.setAdmin(admin1);
		    	   m.setHeadOfAccount(adminId);
		    	   m.setMajorHeadName("Purchase Account");
		    	   m.setAccNo("402");
		    	   m.setDescription("new revenue account Purchase Account");
		    	   m.setMajorHeadNature("Revenue");
		    	   m.setLevel("2");
		    	   m.setFlag("yes");
			   }
	       if(i==15) {
				 m.setAdmin(admin1);
		    	   m.setHeadOfAccount(adminId);
		    	   m.setMajorHeadName("Sales Account");
		    	   m.setAccNo("403");
		    	   m.setDescription("new revenue account Sales Account");
		    	   m.setMajorHeadNature("Revenue");
		    	   m.setLevel("2");
		    	   m.setFlag("yes");
	       }
       majorHeadService.insertMajorHead(m);
	}
	
	

	MinorHead mh=new MinorHead();
	MajorHead mh1=new MajorHead();
	for(int i=0;i<13;i++) {
		String Assets="Assets";
		String Liabilities="Liabilities";
		String Expenses="Expenses";
		System.out.println("mh1==========="+mh1);
		 DateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	       Date dateobj = new Date();
	       System.out.println(df.format(dateobj));
	       Calendar calobj = Calendar.getInstance();
	       System.out.println(df.format(calobj.getTime()));

		
		if(i==0) {
		
			mh1=majorHeadService.getMajorHeadBasedOnAccNo1("101",adminId,Assets);	
			System.out.println("mhi========="+mh1+"============="+adminId);
			mh.setAdmin(admin1);
			mh.setAccNo("101001");
			mh.setAccCode("NBAOCA");
			mh.setDescription("Bank Accounts on current assests");
			mh.setApprovalStatus("Approval");
			mh.setLevel("3");
			mh.setHeadOfAccount(adminId);//setadminId
			mh.setMinorHeadName("Bank_Accounts");
			mh.setNature("Assets");
			mh.setMajorHead(mh1);
			mh.setCreatedDate(df.format(dateobj));
		    mh.setFlag("yes");
		    mh.setType("Current Assets");
		    mh.setCreatedBy(adminId);
			System.out.println("mh1==================="+mh1);
		//Current date time
		//MajorHeadId	
		}
        if(i==1) {
    		mh1=majorHeadService.getMajorHeadBasedOnAccNo1("101",adminId,Assets);
        	mh.setAdmin(admin1);
    		mh.setAccNo("101002");
    		mh.setAccCode("NCIHOCA");
    		mh.setDescription("Cash-in-hand on current assests");
    		mh.setApprovalStatus("Approval");
    		mh.setLevel("3");
    		mh.setHeadOfAccount(adminId);
    		mh.setMinorHeadName("Cash_In_Hand");
    		mh.setNature("Assets");
    		mh.setMajorHead(mh1);
    		mh.setCreatedDate(df.format(dateobj));	
    		mh.setFlag("yes");
    		mh.setCreatedBy(adminId);
    		mh.setType("Current Assets");
		}
        if(i==2) {
    		mh1=majorHeadService.getMajorHeadBasedOnAccNo1("101",adminId,Assets);
        	mh.setAdmin(admin1);
    		mh.setAccNo("101003");
    		mh.setAccCode("NDOCA");
    		mh.setDescription("Deposits (Asset) on current assests");
    		mh.setApprovalStatus("Approval");
    		mh.setLevel("3");
    		mh.setHeadOfAccount(adminId);
    		mh.setMinorHeadName("Deposits");
    		mh.setNature("Assets");
    		mh.setMajorHead(mh1);
    		mh.setCreatedDate(df.format(dateobj));
    		mh.setFlag("yes");
    		mh.setCreatedBy(adminId);
    		mh.setType("Current Assets");
			
		}
        if(i==3) {
    		mh1=majorHeadService.getMajorHeadBasedOnAccNo1("101",adminId,Assets);
        	mh.setAdmin(admin1);
    		mh.setAccNo("101004");
    		mh.setAccCode("NLAOCA");
    		mh.setDescription("Loans & Advances (Asset) on current assests");
    		mh.setApprovalStatus("Approval");
    		mh.setLevel("3");
    		mh.setHeadOfAccount(adminId);
    		mh.setMinorHeadName("Loans & Advances");
    		mh.setNature("Assets");
    		mh.setMajorHead(mh1);
    		mh.setCreatedDate(df.format(dateobj));
    		mh.setFlag("yes");
    		mh.setCreatedBy(adminId);
    		mh.setType("Current Assets");
		}
        if(i==4) {
    		mh1=majorHeadService.getMajorHeadBasedOnAccNo1("101",adminId,Assets);
        	mh.setAdmin(admin1);
    		mh.setAccNo("101005");
    		mh.setAccCode("NSIHOCA");
    		mh.setDescription("Stock-in-hand on current assests");
    		mh.setApprovalStatus("Approval");
    		mh.setLevel("3");
    		mh.setHeadOfAccount(adminId);
    		mh.setMinorHeadName("Stock_In_Hand");
    		mh.setNature("Assets");
    		mh.setMajorHead(mh1);
    		mh.setCreatedDate(df.format(dateobj));
    		mh.setFlag("yes");
    		mh.setCreatedBy(adminId);
    		mh.setType("Current Assets");
		}
        if(i==5) {
    		mh1=majorHeadService.getMajorHeadBasedOnAccNo1("101",adminId,Assets);
        	mh.setAdmin(admin1);
    		mh.setAccNo("101006");
    		mh.setAccCode("NSDOCA");
    		mh.setDescription("Sundry Debtors on Current Assets");
    		mh.setApprovalStatus("Approval");
    		mh.setLevel("3");
    		mh.setHeadOfAccount(adminId);
    		mh.setMinorHeadName("Sundry_Debtors");
    		mh.setNature("Assets");
    		mh.setMajorHead(mh1);
    		mh.setCreatedDate(df.format(dateobj));
    		mh.setFlag("yes");
    		mh.setCreatedBy(adminId);
    		mh.setType("Current Assets");
		}
        if(i==6) {
    		mh1=majorHeadService.getMajorHeadBasedOnAccNo1("201",adminId,Liabilities);
        	mh.setAdmin(admin1);
    		mh.setAccNo("201001");
    		mh.setAccCode("NBOAOLL");
    		mh.setDescription("Bank OD A/c on Loans (Liability)");
    		mh.setApprovalStatus("Approval");
    		mh.setLevel("3");
    		mh.setHeadOfAccount(adminId);
    		mh.setMinorHeadName("Bank_OD_A/C");
    		mh.setNature("Liabilities");
    		mh.setMajorHead(mh1);
    		mh.setCreatedDate(df.format(dateobj));
    		mh.setFlag("yes");
    		mh.setCreatedBy(adminId);
    		mh.setType("Loans (Liability)");
		}
        if(i==7) {
        	mh1=majorHeadService.getMajorHeadBasedOnAccNo1("201",adminId,Liabilities);
        	mh.setAdmin(admin1);
    		mh.setAccNo("201002");
    		mh.setAccCode("NSLOLL");
    		mh.setDescription("Secured Loans on Loans (Liability)");
    		mh.setApprovalStatus("Approval");
    		mh.setLevel("3");
    		mh.setHeadOfAccount(adminId);
    		mh.setMinorHeadName("Secured_Loans");
    		mh.setNature("Liabilities");
    		mh.setMajorHead(mh1);
    		mh.setCreatedDate(df.format(dateobj));
    		mh.setFlag("yes");
    		mh.setCreatedBy(adminId);
    		mh.setType("Loans (Liability)");
		}
        if(i==8) {
        	mh1=majorHeadService.getMajorHeadBasedOnAccNo1("201",adminId,Liabilities);
        	mh.setAdmin(admin1);
    		mh.setAccNo("201003");
    		mh.setAccCode("NULOLL");
    		mh.setDescription("Unsecured Loans on Loans (Liability)");
    		mh.setApprovalStatus("Approval");
    		mh.setLevel("3");
    		mh.setHeadOfAccount(adminId);
    		mh.setMinorHeadName("Unsecured_Loans");
    		mh.setNature("Liabilities");
    		mh.setMajorHead(mh1);
    		mh.setCreatedDate(df.format(dateobj));
    		mh.setFlag("yes");
    		mh.setCreatedBy(adminId);
    		mh.setType("Loans (Liability)");
		}
        if(i==9) {
        	mh1=majorHeadService.getMajorHeadBasedOnAccNo1("202",adminId,Liabilities);
        	mh.setAdmin(admin1);
    		mh.setAccNo("202001");
    		mh.setAccCode("NDTLOCL");
    		mh.setDescription("Duties & Taxes on Current Liabilities");
    		mh.setApprovalStatus("Approval");
    		mh.setLevel("3");
    		mh.setHeadOfAccount(adminId);
    		mh.setMinorHeadName("Duties & Taxes");
    		mh.setNature("Liabilities");
    		mh.setMajorHead(mh1);
    		mh.setCreatedDate(df.format(dateobj));
    		mh.setFlag("yes");
    		mh.setCreatedBy(adminId);
    		mh.setType("Current Liabilities");
		}
        if(i==10) {
        	mh1=majorHeadService.getMajorHeadBasedOnAccNo1("202",adminId,Liabilities);
        	mh.setAdmin(admin1);
    		mh.setAccNo("202002");
    		mh.setAccCode("NPOCL");
    		mh.setDescription("Provisions on Current Liabilities");
    		mh.setApprovalStatus("Approval");
    		mh.setLevel("3");
    		mh.setHeadOfAccount(adminId);
    		mh.setMinorHeadName("Provisions");
    		mh.setNature("Liabilities");
    		mh.setMajorHead(mh1);
    		mh.setCreatedDate(df.format(dateobj));
    		mh.setFlag("yes");
    		mh.setCreatedBy(adminId);
     		mh.setType("Current Liabilities");
        }
        if(i==11) {
        	mh1=majorHeadService.getMajorHeadBasedOnAccNo1("202",adminId,Liabilities);
        	mh.setAdmin(admin1);
    		mh.setAccNo("202003");
    		mh.setAccCode("NSCOCL");
    		mh.setDescription("Sundry Creditors on Current Liabilities");
    		mh.setApprovalStatus("Approval");
    		mh.setLevel("3");
    		mh.setHeadOfAccount(adminId);
    		mh.setMinorHeadName("Sundry_Creditors");
    		mh.setNature("Liabilities");
    		mh.setMajorHead(mh1);
    		mh.setCreatedDate(df.format(dateobj));
    		mh.setFlag("yes");
    		mh.setCreatedBy(adminId);
     		mh.setType("Current Liabilities");
		}
        if(i==12) {
        	mh1=majorHeadService.getMajorHeadBasedOnAccNo1("303",adminId,Expenses);
        	mh.setAdmin(admin1);
    		mh.setAccNo("303001");
    		mh.setAccCode("NRSOIE");
    		mh.setDescription("Reserves & Surplus on Indirect Expenses");
    		mh.setApprovalStatus("Approval");
    		mh.setLevel("3");
    		mh.setHeadOfAccount(adminId);
    		mh.setMinorHeadName("Reserves & Surplus");
    		mh.setNature("Expenses");
    		mh.setMajorHead(mh1);
    		mh.setCreatedDate(df.format(dateobj));
    		mh.setFlag("yes");
    		mh.setCreatedBy(adminId);
    		mh.setType("Misc. Expenses");
    		

		}
            minorHeadService.insertMinorHead(mh);
	}

	
	
	SourceOfFunds1 sourceOfFunds = new SourceOfFunds1();

	for(int i=0;i<15;i++) {
		
		if(i==0) {
			System.out.println("sourceof fund===");
			sourceOfFunds.setAdmin(admin1);
			sourceOfFunds.setSourceOfFund("Business Income");
		}
		if(i==1) {
			sourceOfFunds.setAdmin(admin1);

			sourceOfFunds.setSourceOfFund("Salary / Saving");
		}
		
		if(i==2) {
			sourceOfFunds.setAdmin(admin1);

			sourceOfFunds.setSourceOfFund("Financial supports from Spouse");
		}
		if(i==3) {
			sourceOfFunds.setAdmin(admin1);

			sourceOfFunds.setSourceOfFund("Property investment");
		}
		if(i==4) {
			sourceOfFunds.setAdmin(admin1);

			sourceOfFunds.setSourceOfFund("Shares investment");
		}
		if(i==5) {
			sourceOfFunds.setAdmin(admin1);

			sourceOfFunds.setSourceOfFund("Donation/Gift");
		}
		if(i==6) {
			sourceOfFunds.setAdmin(admin1);

			sourceOfFunds.setSourceOfFund("Freelance income");
		}
		if(i==7) {
			sourceOfFunds.setAdmin(admin1);

			sourceOfFunds.setSourceOfFund("Loans");
		}
		if(i==8) {
			sourceOfFunds.setAdmin(admin1);

			sourceOfFunds.setSourceOfFund("Retirement fund");
		}
		if(i==9) {
			sourceOfFunds.setAdmin(admin1);

			sourceOfFunds.setSourceOfFund("Rental/leasing income");
		}
		if(i==10) {
			sourceOfFunds.setAdmin(admin1);

			sourceOfFunds.setSourceOfFund("Data is not required to be collected by local jurisdiction");
		}
		if(i==11) {
			sourceOfFunds.setAdmin(admin1);

			sourceOfFunds.setSourceOfFund("Tax Refund");
		}
		if(i==12) {
			sourceOfFunds.setAdmin(admin1);

			sourceOfFunds.setSourceOfFund("Venture Capital");
		}
		if(i==13) {
			sourceOfFunds.setAdmin(admin1);

			sourceOfFunds.setSourceOfFund("Claims/Compensation");
		}
		if(i==14) {
			sourceOfFunds.setAdmin(admin1);

			sourceOfFunds.setSourceOfFund("Sales Assets");
		}
		
		sourceOfFundsService.insertSourceOfFunds(sourceOfFunds);
	}
	RealationShips1 rp = new RealationShips1();

	for(int i=0;i<20;i++) {
		
		if(i==0) {
			System.out.println("relations==");
			rp.setAdmin(admin1);
			rp.setRelationShip("Spouse");
		}
		if(i==1) {
			rp.setAdmin(admin1);
			rp.setRelationShip("Children");
		}
		if(i==2) {
			rp.setAdmin(admin1);
			rp.setRelationShip("Parent");
		}
		if(i==3) {
			rp.setAdmin(admin1);
			rp.setRelationShip("Sibling/brother/sister");
		}
		if(i==4) {
			rp.setAdmin(admin1);
			rp.setRelationShip("Relative/uncle/auntie/cousin");
		}
		if(i==5) {
			rp.setAdmin(admin1);
			rp.setRelationShip("Self");
		}
		if(i==6) {
			rp.setAdmin(admin1);
			rp.setRelationShip("Ex-spouse");
		}
		if(i==7) {
			rp.setAdmin(admin1);
			rp.setRelationShip("Friend");
		}
		if(i==8) {
			rp.setAdmin(admin1);
			rp.setRelationShip("Business partner");
		}
		if(i==9) {
			rp.setAdmin(admin1);
			rp.setRelationShip("Customer");
		}
		if(i==10) {
			rp.setAdmin(admin1);
			rp.setRelationShip("Employee");
		}
		if(i==11) {
			rp.setAdmin(admin1);
			rp.setRelationShip("Branch/Representative office");
		}
		if(i==12) {
			rp.setAdmin(admin1);
			rp.setRelationShip("Subsidiary company");
		}
		if(i==13) {
			rp.setAdmin(admin1);
			rp.setRelationShip("Holding compnay");
		}
		if(i==14) {
			rp.setAdmin(admin1);
			rp.setRelationShip("Supplier");
		}
		if(i==15) {
			rp.setAdmin(admin1);
			rp.setRelationShip("Creditor");
		}
		if(i==16) {
			rp.setAdmin(admin1);
			rp.setRelationShip("Debtor");
		}
		if(i==17) {
			rp.setAdmin(admin1);
			rp.setRelationShip("Franchisee/Franchisor");
		}
		if(i==18) {
			rp.setAdmin(admin1);
			rp.setRelationShip("Non Related");
		}
		if(i==19) {
			rp.setAdmin(admin1);
			rp.setRelationShip("Data is not required to be collected by local jurisdiction");
		}
		realationShips1Service.insertRelationships(rp);
	}
	ReasonForTransfer rt = new ReasonForTransfer();

	for(int i=0;i<10;i++) {
		
		if(i==0) {
			System.out.println("reson or transer");
			rt.setAdmin(admin1);
			rt.setReasonForTransfer("Freight");
		}
		if(i==1) {
			rt.setAdmin(admin1);
			rt.setReasonForTransfer("Passenger Fare");
		}
		if(i==2) {
			rt.setAdmin(admin1);
			rt.setReasonForTransfer("Goods and Services");
		}
		if(i==3) {
			rt.setAdmin(admin1);
			rt.setReasonForTransfer("Legal Services");
		}
		if(i==4) {
			rt.setAdmin(admin1);
			rt.setReasonForTransfer("Health Services");
		}
		if(i==5) {
			rt.setAdmin(admin1);
			rt.setReasonForTransfer("Education Services");
		}
		if(i==6) {
			rt.setAdmin(admin1);
			rt.setReasonForTransfer("Other Personal Services");
		}
		if(i==7) {
			rt.setAdmin(admin1);
			rt.setReasonForTransfer("Grants and Gifts");
		}
		if(i==8) {
			rt.setAdmin(admin1);
			rt.setReasonForTransfer("Worker's Remitances/Family maintainance");
		}
		if(i==9) {
			rt.setAdmin(admin1);
			rt.setReasonForTransfer("Social Contributions and Benefits(Private Sector");
		}
		reasonForTransferService.insertReasonForTransfer(rt);
			
	}
	InternetBankTransferMop rt1 = new InternetBankTransferMop();

	
	rt1.setAdmin(admin1);
	rt1.setAccountNumber("12345");
	rt1.setBankCode("123");
	rt1.setBankName("ABC");
	rt1.setPayeeName("payeeName");
	internetBankTransferMopService.save(rt1);

	SenderIds st=new SenderIds();
	for(int i=0;i<6;i++) {
		if(i==0) {
			System.out.println("idvalues==");
			st.setAdmin(admin1);
			st.setSenderType("Work Permit");
			st.setIssuingAuthority("state");
			st.setIdValue("1");

		}
		if(i==1) {
			st.setAdmin(admin1);
			st.setIssuingAuthority("country");
			st.setSenderType("International Passport");
			st.setIdValue("2");
		}
		if(i==2) {
			st.setAdmin(admin1);
			st.setIssuingAuthority("state");
			st.setSenderType("Identification/National ID");
			st.setIdValue("3");
		}
		if(i==3) {
			st.setAdmin(admin1);
			st.setIssuingAuthority("none");
			st.setSenderType("Social Security");
			st.setIdValue("6");
		}
		if(i==4) {
			st.setAdmin(admin1);
			st.setIssuingAuthority("state");
			st.setSenderType("Residence Permit");
			st.setIdValue("4");
		}
		if(i==5) {
			st.setAdmin(admin1);
			st.setIssuingAuthority("state");
			st.setSenderType("Passport");
			st.setIdValue("5");

		}
		if(i==6) {
			st.setAdmin(admin1);
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
	// mav=new ModelAndView("redirect:insertEmailTemplate");

		/* if (fromPage != null && fromPage.equals("1")) { */
	if(url!=null) {
		return mav=new ModelAndView("redirect:/login");
	} else {
	return mav=new ModelAndView("redirect:/login");
	}

}

	@GetMapping("/insertEmailTemplate")
	public ModelAndView returnEmailPage(HttpServletRequest request) {
		System.out.println("executing emailtemplateds.......");
		String adminId=sessionDataService.getAdminId(request.getSession());
		System.out.println("adminId===="+adminId);
		ModelAndView mav=new ModelAndView();
		EmailTemplate EmailTemplate=new EmailTemplate();
		Admin admin=adminService.getAdminDetailsBasedOnAdminId(adminId);
		for(int i=0;i<10;i++) {
			
			if(i==0) {
				EmailTemplate.setAdmin(admin);
				EmailTemplate.setBccEmail("email");
				EmailTemplate.setCcEmail("ccEmail");
				EmailTemplate.setDemo("");
				EmailTemplate.setReplyEmail("");
				EmailTemplate.setSubject("Reset PasswordLink"
					);
				EmailTemplate.setTemplate("Hi {FIRST_NAME},\r\n" + 
						"To initiate the password reset process for your member account, click the link below:\r\n" + 
						"{PASSWORD_RESET_LINK}");
				EmailTemplate.setTitle("Reset PasswordLink");
			}
			if(i==1) {
				EmailTemplate.setAdmin(admin);
				EmailTemplate.setBccEmail("email");
				EmailTemplate.setCcEmail("ccEmail");
				EmailTemplate.setDemo("");
				EmailTemplate.setReplyEmail("");
				EmailTemplate.setSubject("Manual id verification done by Admin"
					);
				EmailTemplate.setTemplate("Manual id verification done by Admin");
				EmailTemplate.setTitle("Manual id verification done by Admin");

			}
			if(i==2) {
				EmailTemplate.setAdmin(admin);
				EmailTemplate.setBccEmail("email");
				EmailTemplate.setCcEmail("ccEmail");
				EmailTemplate.setDemo(" ");
				EmailTemplate.setReplyEmail("");
				EmailTemplate.setSubject("Email to customer about auto id verififcation fail"
					);
				EmailTemplate.setTemplate("Email to customer about auto id verififcation fail");
				EmailTemplate.setTitle("Email to customer about auto id verififcation fail");

			}
			if(i==3) {
				EmailTemplate.setAdmin(admin);
				EmailTemplate.setBccEmail("email");
				EmailTemplate.setCcEmail("ccEmail");
				EmailTemplate.setDemo("");
				EmailTemplate.setReplyEmail("");
				EmailTemplate.setSubject("Alert to customer about expiry of photo id"
					);
				EmailTemplate.setTemplate("Hi {FIRST_NAME},\r\n" + 
						"\r\n" + 
						"This email is to notify you that your {ID_TYPE} will expire on {ID_EXPIRY_DATE}.\r\n" + 
						"Please upload a copy of a valid passport and proof of address, or drivers licence ID by clicking on the link below.\r\n" + 
						"{PROFILE_LINK}\r\n" + 
						"We look forward to serving you again!.");
				EmailTemplate.setTitle("Alert to customer about expiry of photo id");

			}
			if(i==4) {
				EmailTemplate.setAdmin(admin);
				EmailTemplate.setBccEmail("email");
				EmailTemplate.setCcEmail("ccEmail");
				EmailTemplate.setDemo("");
				EmailTemplate.setReplyEmail("");
				EmailTemplate.setSubject("Email to sender on complete transaction"
					);
				EmailTemplate.setTemplate("Hi {FIRST_NAME},\r\n" + 
						"\r\n" + 
						"Your money transfer of {SENDING_AMOUNT} for reference number {TRANSACTION_NUMBER} to {RECEIVING_COUNTRY_NAME} is now complete.\r\n" + 
						"Thank you for using Remitz.");
				EmailTemplate.setTitle("Email to sender on complete transaction");

			}
			if(i==5) {
				EmailTemplate.setAdmin(admin);
				EmailTemplate.setBccEmail("email");
				EmailTemplate.setCcEmail("ccEmail");
				EmailTemplate.setDemo("");
				EmailTemplate.setReplyEmail("");
				EmailTemplate.setSubject("email to sender on order initiate"
					);
				EmailTemplate.setTemplate("Hi {FIRST_NAME},\r\n" + 
						"\r\n" + 
						"Your money transfer of {SENDING_AMOUNT} for reference number {TRANSACTION_NUMBER} to {RECEIVING_COUNTRY_NAME} is initiated.\r\n" + 
						"Thank you for using CurrencyRemitApp.");
				EmailTemplate.setTitle("email to sender on order initiate");

			}
			if(i==6) {
				EmailTemplate.setAdmin(admin);
				EmailTemplate.setBccEmail("email");
				EmailTemplate.setCcEmail("ccEmail");
				EmailTemplate.setDemo("");
				EmailTemplate.setReplyEmail("");
				EmailTemplate.setSubject("password changed notification"
					);
				EmailTemplate.setTemplate("Hi {FIRST_NAME},\r\n" + 
						"Your login password has been changed successfully as per request sent on {DATE_TIME}.");
				EmailTemplate.setTitle("password changed notification");

			}
			if(i==7) {
				EmailTemplate.setAdmin(admin);
				EmailTemplate.setBccEmail("email");
				EmailTemplate.setCcEmail("ccEmail");
				EmailTemplate.setDemo("");
				EmailTemplate.setReplyEmail("");
				EmailTemplate.setSubject("thanks to customer about manual upload IDs"
					);
				EmailTemplate.setTemplate("Hi {FIRST_NAME},\r\n" + 
						"Thank you for uploading your documents, this will now be manually reviewed by our team and you should be expect contact from us within 1 hour during office hours (9am - 5pm Mon-Sat AEST) or first thing on the following working day.");
				EmailTemplate.setTitle("thanks to customer about manual upload IDs");

			}
			if(i==8) {
				EmailTemplate.setAdmin(admin);
				EmailTemplate.setBccEmail("email");
				EmailTemplate.setCcEmail("ccEmail");
				EmailTemplate.setDemo("");
				EmailTemplate.setReplyEmail("");
				EmailTemplate.setSubject("pay now pending reminder"
					);
				EmailTemplate.setTemplate("pay now pending reminder");
				EmailTemplate.setTitle("pay now pending reminder");

			}

			if(i==9) {
				EmailTemplate.setAdmin(admin);
				EmailTemplate.setBccEmail("email");
				EmailTemplate.setCcEmail("ccEmail");
				EmailTemplate.setDemo("");
				EmailTemplate.setReplyEmail("");
				EmailTemplate.setSubject("first signup messages"
					);
				EmailTemplate.setTemplate("Hi {FIRST_NAME},\r\n" + 
						"Thank you for choosing remitz. We are happy to have you on board!\r\n" + 
						"\r\n" + 
						"Here is your new account information with us. Please keep this email for future reference.\r\n" + 
						"\r\n" + 
						"Your username is your email address: {SENDER_EMAIL_ID}\r\n" + 
						"Your unique Customer Number is: {CUSTOMER_NUMBER}\r\n" + 
						"\r\n" + 
						"please verify your email address by clicking the link below\r\n" + 
						"\r\n" + 
						"{LINK}\r\n" + 
						"\r\n" + 
						"Great news! As a thank you for joining our great team, here is a welcome gift. Enjoy your first transfer with remitz free of charge! Simply enter the promo code during the transaction process. Let's go!\r\n" + 
						"\r\n" + 
						"Promo Code: LOVE\r\n" + 
						"\r\n" + 
						"Please note: remitz will never send you an email or SMS asking you to provide your password.\r\n" + 
						"\r\n" + 
						"              Phishing emails are increasing in number and sophistication. It?s important to remain vigilant and wary of unexpected emails or unfamiliar senders. If you have clicked on any links or noticed any unusual activities, report this to remitz  immediately at info@remitz.co.uk. remitz is committed to working with our customers to stay safe online.\r\n" + 
						"\r\n" + 
						"\r\n" + 
						"remitz follows the Anti-Money Laundering and Counter Terrorism Financing Act 2006.\r\n" + 
						"\r\n" + 
						"--\r\n" + 
						"Warm Regards, ");
				EmailTemplate.setTitle("first signup messages");

			}
		
			emailTemplateService.insertTemplate(EmailTemplate);
			mav=new ModelAndView("add_email");
			mav.setViewName("add_email");

		}
		return mav=new ModelAndView("redirect:/add_email");
		
	}
	
	
	
	
	@RequestMapping(value = "/adminList", method = RequestMethod.GET)
	public ModelAndView returnAdminList(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView("adminlist1");
		List<Admin> list = new ArrayList<Admin>();
		list = adminService.getAllAdmin();
		mav.addObject("list", list);
		return mav;
	}

	@GetMapping("updateAdmin")
	public ModelAndView updateAdmin(@RequestParam String adminid,HttpServletRequest request)
	{
		String superAdminId = (String)request.getSession(false).getAttribute("superadminid");
		System.out.println("superadminid:"+superAdminId);
		ModelAndView mav=new ModelAndView();
		if(superAdminId!=null && !superAdminId.equals("null") && !superAdminId.equals("")){
		Admin admin=adminService.getAdminDetailsBasedOnAdminId(adminid);
		List<Country> countrieslist=countryService.getAllCountries();
		List<ModeOfPayments> modeofpayment=modeOfPaymentsService.getAllModeOfPaymets();
		List<PaymentTypes> allpaymenttype=paymentTypesService.getAllPaymentTypes();
		
		System.out.println("adminid"+adminid);
		
		
		mav.setViewName("updateAdmin");
		mav.addObject("admindetails",admin);
		mav.addObject("countriesList",countrieslist);
		mav.addObject("modeofpayment", modeofpayment);
		mav.addObject("paymenttype", allpaymenttype);
		mav.addObject("superAdminId", superAdminId);
		mav.addObject("imageUrl", FileURLs.getAdminLogo(adminid));
		}
		return mav;
		
	}
	@PostMapping("checkIdPrefix")
	public @ResponseBody String checkIdPrefix(@RequestParam String adminid,String tnxIDPrefix){
		String result = "";
		//List<PaymentTypes> paymentTypeslist = paymentTypesService.getBasedOnStatus("active");
		System.out.println("admindid"+adminid);
		System.out.println("txid"+tnxIDPrefix);
		Admin a= adminService.checkIdPrefix(tnxIDPrefix);
		
		if(a==null || a.getAdminId().equals(adminid)) {
		
			result="notfound";
	
		}else {
			result="found";}
		
		
		
		return result;
	
}
	@RequestMapping("updateAdminDetails")
	public @ResponseBody String  updateAdminDetails(MultipartHttpServletRequest request)
	{String message="failed";
		System.out.println("its coming here");
		String adminId=request.getParameter("adminId");
		
		Admin admin=adminService.getAdminDetailsBasedOnAdminId(adminId);
		
		
		
		  Country country =countryService.getCountryBasedOnIso(request.getParameter("fromCountryISO")); 
		admin.setCountry(country);
		String fromCountryName = request.getParameter("fromCountryName");
		String timeZone = request.getParameter("timeZone");
		/*
		 * String toCountryISOs = request.getParameter("toCountryISOs"); String
		 * toCountryNames = request.getParameter("toCountryNames");
		 */
		/*
		 * String custFirstIdTypes = request.getParameter("custFirstIdTypes"); String
		 * custSecondIdTypes = request.getParameter("custSecondIdTypes");
		 */
		 String zoneid =
				  zoneService.getZoneIdBasedOnZoneName(timeZone);
		  Zone zone=
		  zoneService.getZoneBasedOnZoneId(zoneid); 
		 admin.setModeOfPayments(request.getParameter("modeOfPayment"));
		 admin.setPaymentTypes(request.getParameter("paymentType"));
		admin.setTransactionPrefix(request.getParameter("tnxIDPrefix"));
	admin.setZone(zone);
	admin.setPackages(request.getParameter("packages"));
	admin.setAdminStatus(request.getParameter("adminStatus"));
	System.out.println("business countries:"+request.getParameter("adminToCountries"));
	admin.setBusinessCountries(request.getParameter("adminToCountries"));
		/*
		 * String sendEmail = request.getParameter("sendEmail"); String sendSms =
		 * request.getParameter("sendSms"); String passwordExpiryDuration =
		 * request.getParameter("passwordExpiryDuration"); String ipSecurity =
		 * request.getParameter("ipSecurity");
		 */
		admin.setLogo(request.getParameter("logo"));
		/*
		 * String cLPAdmin = request.getParameter("cLPAdmin"); String
		 * toCountryLimitPerAdmin = request.getParameter("toCountryLimit"); String
		 * tLPAdminPerMonth = request.getParameter("tLPAdminPerMonth"); String
		 * tALPAdminPerMonth = request.getParameter("tALPAdminPerMonth"); String
		 * rALPAdmin = request.getParameter("rALPAdmin"); String dALPAdmin =
		 * request.getParameter("dALPAdmin");
		 */
		admin.setPackages(request.getParameter("packages"));
		/*
		 * String packageExpiryDate = request.getParameter("packageExpiryDate"); String
		 * roleOverMonths = request.getParameter("roleOverMonths");
		 */
		adminService.updateAdmin(admin,request);
		message="success";
		return message;
	}
	 @GetMapping({ "/generatenewadminkey" })
	    public ModelAndView generatenewadminkey(final HttpServletRequest request) {
	        final ModelAndView modelAndView = new ModelAndView("redirect:adminList");
	        final String adminId = request.getParameter("adminId");
	        this.adminService.updateAdminNewKey(adminId);
	        modelAndView.addObject("adminId",adminId);
	        return modelAndView;
	    }

		
				
		
		
	 
}
