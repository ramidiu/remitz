package com.kws.unitedfintech.controller;

import java.io.IOException;
import java.net.UnknownHostException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.TimeZone;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.core.JsonParseException;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.kws.unitedfintech.entities.Admin;
import com.kws.unitedfintech.entities.Banks;
import com.kws.unitedfintech.entities.Beneficiary;
import com.kws.unitedfintech.entities.Branch;
import com.kws.unitedfintech.entities.BranchPaymentTypeDetails;
import com.kws.unitedfintech.entities.Cash;
import com.kws.unitedfintech.entities.Country;
import com.kws.unitedfintech.entities.Customer;
import com.kws.unitedfintech.entities.EWalletIssuerCode;
import com.kws.unitedfintech.entities.EmailTemplate;
import com.kws.unitedfintech.entities.InternetBankTransferMop;
import com.kws.unitedfintech.entities.ModeOfPaymentFees;
import com.kws.unitedfintech.entities.ModeOfPayments;
import com.kws.unitedfintech.entities.NasanoResponse;
import com.kws.unitedfintech.entities.OnlineMop;
import com.kws.unitedfintech.entities.PurposeCodes;
import com.kws.unitedfintech.entities.RealationShips1;
import com.kws.unitedfintech.entities.ReasonForTransfer;
import com.kws.unitedfintech.entities.Relationship;
import com.kws.unitedfintech.entities.RevenuePercentage;
import com.kws.unitedfintech.entities.SanctionSearch;
import com.kws.unitedfintech.entities.SenderIdType;
import com.kws.unitedfintech.entities.SenderIds;
import com.kws.unitedfintech.entities.ServiceFees;
import com.kws.unitedfintech.entities.SourceOfFund;
import com.kws.unitedfintech.entities.SourceOfFunds1;
import com.kws.unitedfintech.entities.States;
import com.kws.unitedfintech.entities.TransactionInformation;
import com.kws.unitedfintech.entities.TrulioCustomer;
import com.kws.unitedfintech.helpers.EmailTemplateHeaderFooterUtil;
import com.kws.unitedfintech.helpers.PasswordDecryptor;
import com.kws.unitedfintech.helpers.PasswordEncryptor;
import com.kws.unitedfintech.helpers.SendMail;
import com.kws.unitedfintech.helpers.SendMailBean;
import com.kws.unitedfintech.helpers.SendMoneyCalculator;
import com.kws.unitedfintech.modelclasses.FrontEndTranscationInfoModelClass;
import com.kws.unitedfintech.service.AdminService;
import com.kws.unitedfintech.service.BankService;
import com.kws.unitedfintech.service.BeneficiaryService;
import com.kws.unitedfintech.service.BranchPaymentTypeDetailsService;
import com.kws.unitedfintech.service.BranchService;
import com.kws.unitedfintech.service.CashIssuerCodeService;
import com.kws.unitedfintech.service.CountryService;
import com.kws.unitedfintech.service.CountryZonService;
import com.kws.unitedfintech.service.CurrencyRateService;
import com.kws.unitedfintech.service.CustomerService;
import com.kws.unitedfintech.service.EmailTemplateService;
import com.kws.unitedfintech.service.EwalletPaymentTypService;
import com.kws.unitedfintech.service.FeeService;
import com.kws.unitedfintech.service.IDProofService;
import com.kws.unitedfintech.service.InternetBankTransferMopService;
import com.kws.unitedfintech.service.IssuerCodeService;
import com.kws.unitedfintech.service.ModeOfPaymentsService;
import com.kws.unitedfintech.service.NasanoResponService;
import com.kws.unitedfintech.service.OnlineMopService;
import com.kws.unitedfintech.service.PurposeCodeService;
import com.kws.unitedfintech.service.RealationShips1Service;
import com.kws.unitedfintech.service.ReasonForTransferService;
import com.kws.unitedfintech.service.RelationshipService;
import com.kws.unitedfintech.service.RevenuePercentageService;
import com.kws.unitedfintech.service.SanctionSearchService;
import com.kws.unitedfintech.service.SenderIdTypeService;
import com.kws.unitedfintech.service.SessionDataService;
import com.kws.unitedfintech.service.SourceOfFundService;
import com.kws.unitedfintech.service.SourceOfFundsService;
import com.kws.unitedfintech.service.TransactionInformationService;
import com.kws.unitedfintech.service.TrulioCustomerService;
import com.kws.unitedfintech.service.UserService;


@Controller
public class HomeController {
	@Autowired
	private TrulioCustomerService ts;
	 @Autowired
	 private RevenuePercentageService rps;

	 @Autowired
	 private NasanoResponService nasanoResponService;
	@Autowired
	private SenderIdTypeService senderIdTypeService;
	
	@Autowired
	private OnlineMopService onlineMopService;
	
	@Autowired
	private InternetBankTransferMopService internetBankTransferMopService;
	
	@Autowired
	private EwalletPaymentTypService ewalletPaymentTypService;

	
	@Autowired
	private EmailTemplateService emailTemplateService;
	
	@Autowired
	private CustomerService customerService;

	@Autowired
	private AdminService adminService;
	@Autowired
	private CashIssuerCodeService cashIssuerCodeService;
	@Autowired
	private UserService userService;

	@Autowired
	private SourceOfFundsService sourceOfFundsService;
	
	@Autowired
	private RealationShips1Service realationShips1Service;
	@Autowired
	private ReasonForTransferService reasonForTransferService;

	
	@Autowired
	private BankService bankService;

	@Autowired
	private com.kws.unitedfintech.service.cashService cashService;

	@Autowired
	private BranchService branchService;
	@Autowired
	private SessionDataService sessionDataService;

	@Autowired
	private BeneficiaryService beneficiaryService;
	@Autowired
	private PurposeCodeService purposeCodeService;

	@Autowired
	private IssuerCodeService issuerCodeService;

	@Autowired
	private SourceOfFundService sourceOfFundService;
	@Autowired
	private RelationshipService relationshipService;

	@Autowired
	private CountryZonService countryZoneService;
	@Autowired
	private CountryService countryService;
	@Autowired
	private IDProofService iDProofService;
	@Autowired
	private ModeOfPaymentsService modeOfPaymentsService;

	@Autowired
	private SendMoneyCalculator calculator;
	@Autowired
	private CurrencyRateService currencyRateService;
	@Autowired
	private FeeService feeService;
	@Autowired
	private BranchPaymentTypeDetailsService branchPaymentTypeDetailsService;
	@Autowired
	private TransactionInformationService transactionInformationService;
	@Autowired
	private SanctionSearchService sanctionSearchService; 
	
	
	private static String adminId = "";
	String hederContent = EmailTemplateHeaderFooterUtil.getStaticEmailHeaderContent();
	String bodyStartsContent = EmailTemplateHeaderFooterUtil.getStaticEmailBodyStartContent();
	String bodyEndContent = EmailTemplateHeaderFooterUtil.getStaticEmailBodyEndsContent();
	String footerContent = EmailTemplateHeaderFooterUtil.getStaticEmailFooterContent();
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	TimeZone timeZone = TimeZone.getTimeZone("IST");
	Calendar cal = Calendar.getInstance();
	Date d = cal.getTime();

	@GetMapping(value = { "/", "/index" })
	public ModelAndView returnIndexPage(HttpServletRequest request) {
		ModelAndView modelAndView = new ModelAndView();
		String adminKey = request.getParameter("adminKey");
		// adminKey=adminKey.substring(9);
		// adminId=PasswordDecryptor.decrypt(PasswordDecryptor.key1,PasswordDecryptor.key2,
		// adminKey);
		// Admin admin=adminService.getAdminDetailsBasedOnAdminId(adminId);
		Admin admin = adminService.findByAdminKey(adminKey);
		//System.out.println("admin===="+admin);
		//System.out.println("fromBranch==="+admin.getBusinessCountries());
		sessionDataService.storeAdminInformation(request.getSession(), admin);
		adminId = admin.getAdminId();
		modelAndView.addObject("adminId", adminId);
		modelAndView.addObject("admin",admin);
		return modelAndView;
	}

	@RequestMapping(value = "/savecustomer", method = RequestMethod.POST)
	public ModelAndView saveCustomerDetails(ModelMap map, HttpServletRequest request, HttpServletResponse response,
			@ModelAttribute FrontEndTranscationInfoModelClass model, MultipartHttpServletRequest multipartRequest)
			throws UnknownHostException {
System.out.println("model in signup====="+model);
ModelAndView mav = new ModelAndView("redirect:my_account_calculator");
Customer customer=new Customer();
String ds=request.getParameter("ds");		
List<SanctionSearch> sanctionSearchList=sanctionSearchService.getSanctionSearchResult(request.getParameter("firstName"),request.getParameter("lastName"));
		System.out.println("sanctionSearchList::::"+sanctionSearchList);
		if(sanctionSearchList.size()>0) {
			customer.setSanctionSearchFlag("yes");
		}else {
			customer.setSanctionSearchFlag("no");
		}
		
		String branchId = request.getParameter("Branch");
		Branch branch = branchService.getBranchBasedOnBranchId(branchId);
		customer.setFirstName(request.getParameter("firstName"));
		customer.setLastName(request.getParameter("lastName"));
		customer.setPassword(request.getParameter("password"));
		customer.setEmailId(request.getParameter("emailId"));
		customer.setBranch(branch);
		customer.setCitizenship("yse");
		
		
		
		customer.setOccupation("yes");

		// Admin admin=adminService.getAdminDetailsBasedOnAdminId(adminId);

		// customer.setAdmin(admin);
		System.out.println("branch......" + branch);

		customer.setCountry(branch.getFromCountry());

		customer.setIssuingCountry(branch.getFromCountry());

		System.out.println("country...." + branch.getFromCountry());

		customer.setAdmin(branch.getAdmin());
		// System.out.println("admin....."+branch.getAdmin());
		List<Branch> list = branchService.getBranchesBasedOnFunctionalityAndAdminId(adminId, "receiving");

		System.out.println("list....." + list.size());

		customer.setCustomerDetailsFlag("partial");
		customer.setFirstIdProofStatus("no");
		customer.setSecondIdProofStatus("no");
		String custId = customerService.registerCustomer(customer, multipartRequest);
		System.out.println("custId = =" + custId);
		Customer customer1=customerService.findByCustomerId(custId);
		sessionDataService.storeCustomerIdInSession(request.getSession(), custId);
		
		EmailTemplate emailTemplate = emailTemplateService.getEmailTemplateByTitleAndAdmin(customer.getAdmin().getAdminId(), "first signup messages");
		System.out.println("message======="+emailTemplate);
		String bodyContent = emailTemplate.getTemplate();
		System.out.println("bodyContent========"+bodyContent);
		String firstName=request.getParameter("firstName");
		String emailId=request.getParameter("emailId");
		String replacedBodyContent = bodyContent.replace("{FIRST_NAME}", firstName).replace("{SENDER_EMAIL_ID}", emailId).replace("{CUSTOMER_NUMBER}", customer.getCustomerId());
		
		System.out.println("replacedBodyContent======"+replacedBodyContent);
		try { 
			SendMail.send("info@remitz.co.uk", emailId, emailTemplate.getSubject(),
		  hederContent + bodyStartsContent + replacedBodyContent + bodyEndContent +
		  footerContent); 
			} catch (Exception e) { 
				e.printStackTrace();
				}
		mav.addObject("sendingAmount", model.getSendingAmount());
		mav.addObject("sendingBranch", model.getSendingBranch());
		mav.addObject("receivingBranch", model.getReceivingBranch());
		mav.addObject("paymentType", model.getPaymentType());
		mav.addObject("modeOfPayment", model.getModeOfPayment());
		mav.addObject("adminId", model.getAdminId());
		mav.addObject("deliveryTime", model.getDeliveryTime());
		mav.addObject("receivingAmount", model.getReceivingAmount());
mav.addObject("ds", ds);
return mav;
	}

	@RequestMapping(value = "/signup", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView returnSignUpPage(HttpServletRequest request,@ModelAttribute FrontEndTranscationInfoModelClass model) {
		System.out.println("model in signup======"+model);
		System.out.println("list....");
		ModelAndView mav = new ModelAndView("signup");
		List<Branch> list = branchService.getBranchesBasedOnFunctionalityAndAdminId(adminId, "receiving");
		mav.addObject("list", list);
		String branchId="";
	String ds="empty";
		 String amt=model.getSendingAmount();
		 System.out.println("amt===="+amt);
			if(!amt.equals("")) {
		 branchId=model.getSendingBranch().split("-")[1];
		System.out.println("branchId in if condition===="+branchId);
		 Branch branch=branchService.getBranchBasedOnBranchId(branchId);
		mav.addObject("branch", branch);
		ds="notempty";
			}
			mav.addObject("ds", ds);
		mav.addObject("branchId", branchId);
		System.out.println("ds====="+ds);
		System.out.println("branchId in signup====="+branchId);
     String adminLogo=sessionDataService.getAdminLogo(request.getSession());
		String adminId=sessionDataService.getAdminId(request.getSession());
		Admin admin=adminService.getAdminDetailsBasedOnAdminId(adminId);
		mav.addObject("adminId",adminId);
		mav.addObject("adminLogo", adminLogo);
		mav.addObject("sendingAmount", model.getSendingAmount());
		mav.addObject("sendingBranch", model.getSendingBranch());
		mav.addObject("receivingBranch", model.getReceivingBranch());
		mav.addObject("paymentType", model.getPaymentType());
		mav.addObject("modeOfPayment", model.getModeOfPayment());
		mav.addObject("adminId", admin.getAdminId());
		mav.addObject("admin", admin);
		mav.addObject("ds", ds);
		mav.addObject("deliveryTime", model.getDeliveryTime());
		System.out.println("deliveryTime......"+model.getDeliveryTime());
		mav.addObject("model", model);

		return mav;
	}
	
	/*
	 * @RequestMapping(value = { "/checkemailid" }, method = { RequestMethod.POST })
	 * 
	 * @ResponseBody public String checkRegisteredEmailId(HttpServletRequest
	 * request, @RequestParam String emailId) { String result =
	 * customerService.checkEmail(emailId); return result; }
	 * 
	 */
	
	@GetMapping("my_account_calculators")
	public ModelAndView returnMyaccPage1(ModelMap map,HttpServletRequest request,@ModelAttribute FrontEndTranscationInfoModelClass model) {
		String customerId = sessionDataService.getCustomerId(request.getSession());
		Customer customer=customerService.findByCustomerId(customerId);
		ModelAndView mav=new ModelAndView("my_account_calculators");
		map.addAttribute("adminId", customer.getAdmin().getAdminId());
		mav.addObject("adminId", customer.getAdmin().getAdminId());
		String sc=customer.getCountry().getCurrencyCode();
		mav.addObject("sc", sc);
		String mp="";
		String rc="";
		String pt="";
 String sendingAmount="";
 String receivingAmount="";
 String paymentType="";
 String modeofpayment="";
 String amt=model.getSendingAmount();
		if(amt!=null) {
			sendingAmount=model.getSendingAmount();
			receivingAmount=model.getReceivingAmount();
			pt=model.getPaymentType();
			mp=model.getModeOfPayment().split(",")[0];
			 rc=model.getReceivingBranch().split("-")[2];
				
			 mp=model.getModeOfPayment().split(",")[0];
			 if(mp.equals("Internet?Bank?Transfer")) {
				
				 mp="Internet Bank Transfer";
				 
			 }else {
				 mp=model.getModeOfPayment().split(",")[0]; 
			 }
			 pt=model.getPaymentType();
			System.out.println("modeof payment in my acc==="+mp);
			 adminId=model.getAdminId();
			mav.addObject("sendingAmount", model.getSendingAmount());
			mav.addObject("sendingBranch", model.getSendingBranch());
			mav.addObject("receivingBranch", model.getReceivingBranch());
			mav.addObject("paymentType", model.getPaymentType());
			mav.addObject("modeOfPayment", model.getModeOfPayment());
			mav.addObject("receivingAmount", model.getReceivingAmount());
			mav.addObject("deliveryTime", model.getDeliveryTime());
			System.out.println("deliveryTime......"+model.getDeliveryTime());
			mav.addObject("model", model);

		}
		mav.addObject("sendingAmount", sendingAmount);
		mav.addObject("receivingAmount", receivingAmount);
		mav.addObject("rc", rc);
		mav.addObject("mp", mp);
		mav.addObject("pt", pt);
		return mav;
	}
	
	
	@GetMapping("my_account_calculator")
	public ModelAndView returnMyaccPage(ModelMap map,HttpServletRequest request,@ModelAttribute FrontEndTranscationInfoModelClass model) {
		System.out.println("model in my_account_calculator ===="+model);
		map.addAttribute("adminId", adminId);
		String customerId = sessionDataService.getCustomerId(request.getSession());
		Customer customer=customerService.findByCustomerId(customerId);
		String mp="";
		String rc="";
		String sc="";
		String pt="";
		String sendingAmount=null;
		String receivingAmount=null;
		String ds=request.getParameter("ds");
		System.out.println("ds in my acc==="+ds);
		String adminId=customer.getAdmin().getAdminId();
		Admin admin=adminService.getAdminDetailsBasedOnAdminId(adminId);
		 sc=customer.getCountry().getCurrencyCode();
				//model.getSendingBranch().split("-")[2];
		System.out.println("sc==="+sc);
		ModelAndView mav=new ModelAndView("my_account_calculator");
		String amt=model.getSendingAmount();
		 System.out.println("amt===="+amt);
			if(!ds.equals("empty")) {
				System.out.println("thiss is if conditiomn");
		 rc=model.getReceivingBranch().split("-")[2];
		 mp=model.getModeOfPayment().split(",")[0];
		 if(mp.equals("Internet?Bank?Transfer")) {
			
			 mp="Internet Bank Transfer";
			 
		 }else {
			 mp=model.getModeOfPayment().split(",")[0]; 
		 }
		 pt=model.getPaymentType();
		System.out.println("modeof payment in my acc==="+mp);
		 adminId=model.getAdminId();
		 sendingAmount=model.getSendingAmount();
		 receivingAmount=model.getReceivingAmount();
		mav.addObject("sendingAmount", sendingAmount);
		mav.addObject("sendingBranch", model.getSendingBranch());
		mav.addObject("receivingBranch", model.getReceivingBranch());
		mav.addObject("paymentType", model.getPaymentType());
		mav.addObject("modeOfPayment", model.getModeOfPayment());
		mav.addObject("receivingAmount", receivingAmount);
		mav.addObject("deliveryTime", model.getDeliveryTime());
		System.out.println("deliveryTime......"+model.getDeliveryTime());
		mav.addObject("model", model);
		}
		mav.addObject("sendingAmount", sendingAmount);
		mav.addObject("receivingAmount", receivingAmount);
		mav.addObject("adminId", adminId);
		mav.addObject("admin", admin);
		mav.addObject("sc", sc);
		mav.addObject("rc", rc);
		mav.addObject("mp", mp);
		mav.addObject("pt", pt);

		return mav;

	}

	@RequestMapping(value = { "/you" }, method = { RequestMethod.POST, RequestMethod.GET })
	public ModelAndView getsend2(HttpServletRequest request, @ModelAttribute FrontEndTranscationInfoModelClass model) {
		System.out.println(" You page model is = " + model);
		ModelAndView mav = null;
		String customerId = sessionDataService.getCustomerId(request.getSession());
		if (customerId != null) {
			System.out.println("customerId from session si  = " + customerId);
			Customer customer = customerService.findByCustomerId(customerId);
			String dob=customer.getDob();
			if (customer.getCustomerDetailsFlag().trim().equals("partial")||customer.getFirstIdNumber().equals("")||customer.getFirstIdProofType()==""||customer.getFirstIdProofType().equals("")) {
				mav = new ModelAndView("you");
				List<States> states = countryZoneService.findAllBycountryISO(customer.getCountry().getCountryISO());
				Branch branch=branchService.getBranchBasedOnBranchId(model.getReceivingBranch().split("-")[1]);
				List<SenderIds> ids=senderIdTypeService.findByBranchAndAdminAndFunctionality(model.getSendingBranch().split("-")[1], branch.getAdmin().getAdminId(), "receiving");				mav.addObject("ids", ids);
				mav.addObject("states", states);
				mav.addObject("customer", customer);
				String currencyCode = customer.getCountry().getCurrencyCode().toLowerCase();
				List<Country> countryList = countryService.getAllCountries();
				mav.addObject("countryList", countryList);
				mav.addObject("currencyCode", currencyCode);
				mav.addObject("model", model);
			Admin admin=adminService.getAdminDetailsBasedOnAdminId(customer.getAdmin().getAdminId());
				System.out.println("admin====="+admin);
				String trid=admin.getTrulio();
				System.out.println("sending country====in you===="+customer.getCountry().getCountryISO());
				TrulioCustomer tr=ts.findByCountryIso(customer.getCountry().getCountryISO());
			System.out.println("tr in you====="+tr);
			mav.addObject("tr", tr);
			mav.addObject("trid", trid);
			} else {
				mav = new ModelAndView("redirect:select_recipient");
			}
		} else {
			mav = new ModelAndView("redirect:index?session expired");
		}
		mav.addObject("model", model);
		// mav.addObject("deliveryTime", model.getDeliveryTime());
		/*
		 * Customer customer =
		 * customerService.getCustomerDetailsBasedOnCustomerId(custID); List<States>
		 * stateList = countryService.getStateListBasedOnCountryISO("AU"); List<Country>
		 * countryList = countryService.getAllCountries(); mav.addObject("stateList",
		 * stateList); mav.addObject("countryList", countryList); mav.addObject("model",
		 * model); mav.addObject("custID", custID); mav.addObject("customer", customer);
		 */

		return mav;
	}

	@RequestMapping(value = "updatecustomer", method = RequestMethod.POST)
	public ModelAndView updatecustomer(HttpServletRequest request, MultipartHttpServletRequest multipartRequest,
			@ModelAttribute FrontEndTranscationInfoModelClass model) throws UnknownHostException {
		ModelAndView mav = new ModelAndView("redirect:select_recipient");
		String custId = sessionDataService.getCustomerId(request.getSession());
		String emailId = sessionDataService.getCustomerEmailId(request.getSession());
		Customer customer = customerService.findByCustomerId(custId);
         String trstatus=customer.getTrulioResponse();
		if (custId != null && !custId.equals("")) {
			customer.setEmailId(emailId);
			customer.setNationalIdType(request.getParameter("nationalIdType"));
			customer.setFirstName(request.getParameter("firstName"));
			customer.setLastName(request.getParameter("lastName"));
			customer.setDob(request.getParameter("dob"));
			customer.setAddress1(request.getParameter("address"));
			 customer.setSuburb(request.getParameter("suburb"));
			customer.setMobileNumber(request.getParameter("mobileNumber"));
			customer.setEmailId(request.getParameter("emailId"));
			customer.setPostalCode(request.getParameter("postalCode"));
			String firstIdProofType = request.getParameter("firstIdProofType").split(",")[0];
			customer.setFirstIdProofType(firstIdProofType);
			customer.setFirstIdExpireDate(request.getParameter("firstIdExpireDate"));
			customer.setFirstIdNumber(request.getParameter("firstIdNumber"));
			customer.setTelephone(request.getParameter("telephone"));
			customer.setTelephone2(request.getParameter("telephone2"));
			customer.setStreetType(request.getParameter("streetType"));
			// customer.setIndividualRefNo(request.getParameter("individualRefNo"));
			customer.setHouseNumber(request.getParameter("houseNumber"));
			customer.setBuildingName(request.getParameter(""));
			customer.setGender(request.getParameter("gender"));
			customer.setOccupation(request.getParameter("occupation"));
			customer.setCitizenship(request.getParameter("citizenship"));
			customer.setBuildingName(request.getParameter("buildingName"));
			customer.setUnitNumber(request.getParameter("unitNumber"));
			customer.setStreetName(request.getParameter("streetName"));
			customer.setCity(request.getParameter("city"));
			String custCountryISO = request.getParameter("country");
			String custStateId = request.getParameter("cityOrState");
			Country custCountry = countryService.getCountryBasedOnIso(custCountryISO);
			String firstIdNumber=request.getParameter("firstIdNumber");
			System.out.println("firstIdNumber===="+firstIdNumber);
			if(firstIdProofType.equals("6")|| firstIdProofType=="6"||firstIdNumber==""||firstIdNumber.equals("")||firstIdNumber=="null"||firstIdNumber.equals("null")) {
				System.out.println("first id proof value inn if===="+firstIdProofType);
				customer.setIssuingCountry(custCountry);
            }else {
			String idIssuerCountryISO = request.getParameter("issuingCountry");
			System.out.println("issuingCountry...." + idIssuerCountryISO);
			Country idIssuerCountry = countryService.getCountryBasedOnIso(idIssuerCountryISO);
			customer.setIssuingCountry(idIssuerCountry);
			System.out.println("idIssuerCountry......" + idIssuerCountry);
			customer.setIssuingCountry(idIssuerCountry);
}
			customer.setCustomerDetailsFlag("full");

			String occupation = request.getParameter("occupation");
			String citizenship = request.getParameter("citizenship");
			customer.setCitizenship(citizenship);
			customer.setOccupation(occupation);
			customer.setCountry(custCountry);

			customer.setCustomerId(custId);
			if(customer.getTrulioResponse().equals("match")|| customer.getTrulioResponse()=="match") {
				System.out.println("if part of trulio response====");
				customer.setCustomerKYCMode("Auto");
				customer.setCustomerKYCStatus("completed");

			}else {
				System.out.println("else part of trulio response.........");
				customer.setCustomerKYCMode(request.getParameter("doneby"));
			customer.setCustomerKYCStatus(request.getParameter("kycstatus"));

			
			System.out.println("trulio response====="+customer.getTrulioResponse());
			if(firstIdNumber==""||firstIdNumber.equals("")||firstIdNumber=="null"||firstIdNumber.equals("null")) {
				customer.setCustomerKYCMode("manual");
				customer.setCustomerKYCStatus("pending");
			}

			Customer c=customerService.updateCustomerProfile(customer, multipartRequest);
            if(c.getFirstIdProofStatus()=="yes"||c.getFirstIdProofStatus().equals("yes")) {
            	System.out.println("manual id upload");
				EmailTemplate emailTemplate = emailTemplateService.getEmailTemplateByTitleAndAdmin(customer.getAdmin().getAdminId(), "Thanks to customer about manual upload IDS");
				System.out.println("message======="+emailTemplate);
				String bodyContent = emailTemplate.getTemplate();
				String replacedBodyContent = bodyContent.replace("{FIRST_NAME}", customer.getFirstName());
				
				System.out.println("replacedBodyContent======"+replacedBodyContent);
				System.out.println("emailTemplate email====="+emailTemplate);
				
				
				try { 
					SendMail.send("info@remitz.co.uk", customer.getEmailId(), emailTemplate.getSubject(),
				  hederContent + bodyStartsContent + replacedBodyContent + bodyEndContent +
				  footerContent); 
					} catch (Exception e) { 
						e.printStackTrace();
						}

            }
            }
			
			mav.addObject("sendingAmount", model.getSendingAmount());
			mav.addObject("sendingBranch", model.getSendingBranch());
			mav.addObject("receivingBranch", model.getReceivingBranch());
			mav.addObject("paymentType", model.getPaymentType());
			mav.addObject("modeOfPayment", model.getModeOfPayment());
			mav.addObject("adminId", model.getAdminId());
			mav.addObject("deliveryTime", model.getDeliveryTime());
		}
		return mav;
	}

	@RequestMapping(value = { "newrecipient" }, method = { RequestMethod.POST, RequestMethod.GET })
	public ModelAndView getrecipient(HttpServletRequest request,
			@ModelAttribute FrontEndTranscationInfoModelClass model) {
		System.out.println("model from new recipient is = " + model);
		ModelAndView mav = null;
		String custId = sessionDataService.getCustomerId(request.getSession());
		if (custId != null) {
			Customer customer = customerService.findByCustomerId(custId);
			System.out.println("customer first id in newreceipent==="+customer.getFirstIdNumber());

			if (!customer.getCustomerDetailsFlag().equals("full") ||customer.getFirstIdNumber().equals("")||customer.getFirstIdNumber()==""||customer.getFirstIdProofType().equals("") ) {
				System.out.println("if condition=====");
				mav = new ModelAndView("redirect:you");
			} else {
				mav = new ModelAndView("redirect:select_recipient");
			}
			System.out.println("mop...." + model.getModeOfPayment());
			System.out.println("customer...." + custId);
			System.out.println("payment type....." + model.getPaymentType());
			System.out.println("countryISo...." + model.getReceivingBranch());
			List<Beneficiary> beneficiaryList = beneficiaryService.getBeneficiaryBasedOnCustomerCountryISOPaymentType(
					custId, model.getPaymentType(), model.getReceivingBranch().split("-")[0]);
			System.out.println("beneficiary list size is = " + beneficiaryList.size());
			String adminId=model.getAdminId();
			Admin admin=adminService.getAdminDetailsBasedOnAdminId(adminId);
			System.out.println("beneficiaryList........" + beneficiaryList);
			System.out.println("countryIso....." + model.getReceivingBranch().split("-")[0]);
			System.out.println("payment type....." + model.getPaymentType());
			mav.addObject("beneficiaryList", beneficiaryList);

			mav.addObject("sendingAmount", model.getSendingAmount());
			mav.addObject("sendingBranch", model.getSendingBranch());
			mav.addObject("receivingBranch", model.getReceivingBranch());
			mav.addObject("paymentType", model.getPaymentType());
			mav.addObject("modeOfPayment", model.getModeOfPayment());
			mav.addObject("adminId", model.getAdminId());
			mav.addObject("admin", admin);
			mav.addObject("deliveryTime", model.getDeliveryTime());
			System.out.println("deliveryTime......"+model.getDeliveryTime());
			mav.addObject("model", model);
		} else {
			mav = new ModelAndView("redirect:login?session expired");
		}
		return mav;
	}
	@RequestMapping(value = { "select_recipient" }, method = { RequestMethod.POST, RequestMethod.GET })
	public ModelAndView getselectRecipient(HttpServletRequest request,
			@ModelAttribute FrontEndTranscationInfoModelClass model) {
		System.out.println("model from new recipient is = " + model);
		System.out.println("deliverytime====="+model.getDeliveryTime());
		ModelAndView mav = null;
		String custId = sessionDataService.getCustomerId(request.getSession());
		if (custId != null) {
			Customer customer = customerService.findByCustomerId(custId);

				mav = new ModelAndView("select_recipient");
			System.out.println("mop...." + model.getModeOfPayment());
			System.out.println("customer...." + custId);
			System.out.println("payment type....." + model.getPaymentType());
			System.out.println("countryISo...." + model.getReceivingBranch());
			List<Beneficiary> beneficiaryList = beneficiaryService.getBeneficiaryBasedOnCustomerCountryISOPaymentType(
					custId, model.getPaymentType(), model.getReceivingBranch().split("-")[0]);
			System.out.println("beneficiary list size is = " + beneficiaryList.size());
			String adminId=model.getAdminId();
			Admin admin=adminService.getAdminDetailsBasedOnAdminId(adminId);
			System.out.println("beneficiaryList........" + beneficiaryList);
			System.out.println("countryIso....." + model.getReceivingBranch().split("-")[0]);
			System.out.println("payment type....." + model.getPaymentType());
			mav.addObject("beneficiaryList", beneficiaryList);

			mav.addObject("sendingAmount", model.getSendingAmount());
			mav.addObject("sendingBranch", model.getSendingBranch());
			mav.addObject("receivingBranch", model.getReceivingBranch());
			mav.addObject("paymentType", model.getPaymentType());
			mav.addObject("modeOfPayment", model.getModeOfPayment());
			mav.addObject("adminId", model.getAdminId());
			mav.addObject("admin", admin);
			mav.addObject("deliveryTime", model.getDeliveryTime());
			System.out.println("deliveryTime......"+model.getDeliveryTime());
			mav.addObject("model", model);
		} else {
			mav = new ModelAndView("redirect:login?session expired");
		}
		return mav;
	}

	@RequestMapping(value = "/newrecpdetaits", method = RequestMethod.POST)
	public ModelAndView fillNewRecepientDetails(HttpServletRequest request,

			@ModelAttribute FrontEndTranscationInfoModelClass model) {
		System.out.println("model isssssssssssssssssssssssssssss = " + model);
		ModelAndView mav = null;
		String custId = sessionDataService.getCustomerId(request.getSession());
		System.out.println("custId==="+custId);
		Customer customer = customerService.findByCustomerId(custId);
		if (custId != null) {
			mav = new ModelAndView("/new_recepient_details");
			System.out.println("deliveryTime......" + model.getDeliveryTime());
			String towhome = request.getParameter("towhome");
			System.out.println("paymenttype===="+model.getPaymentType());
			if (model.getPaymentType().equals("1") || model.getPaymentType().equals("10")
					|| model.getPaymentType().equals("Urgent Local Deposit") || model.getPaymentType().equals("bank")) {
				List<Banks> bankIssuerCodeList = bankService.getBanksList(model.getReceivingBranch().split("-")[0]);
				System.out.println("bankIssuerCodeList......" + bankIssuerCodeList);
				mav.addObject("bankIssuerCodeList", bankIssuerCodeList);
			}
			if (model.getPaymentType().equals("5") || model.getPaymentType().equals("cash")) {
				System.out.println("countryIso...." + model.getReceivingBranch().split("-")[0]);
				List<Cash> cashIssuerCodeList = cashService.getCashListBasedonAdminAndCountryIso(
						customer.getAdmin().getAdminId(), model.getReceivingBranch().split("-")[0]);
				// (model.getReceivingBranch().split("-")[0]);
				System.out.println("adminId...." + customer.getAdmin().getAdminId());
				System.out.println("cashIssuerCodeList......." + cashIssuerCodeList);
				mav.addObject("cashIssuerCodeList", cashIssuerCodeList);
			}
			if (model.getPaymentType().equals("2")) {
				List<EWalletIssuerCode> ewalletIssuerCodeList = issuerCodeService
						.getEWalletIssuerCodeList(model.getReceivingBranch().split("-")[0]);
				mav.addObject("ewalletIssuerCodeList", ewalletIssuerCodeList);
			}

			Country country = countryService.getCountryBasedOnIso(model.getReceivingBranch().split("-")[0]);
			System.out.println(" country is  = " + country);
			Branch branch=branchService.getBranchBasedOnBranchId(model.getReceivingBranch().split("-")[1]);
			List<SenderIds> idList =senderIdTypeService.findByBranchAndAdminAndFunctionality(model.getReceivingBranch().split("-")[1], customer.getAdmin().getAdminId(), "sending");
			//List<Relationship> relationshipList = relationshipService.getRelationship();
			List<RealationShips1> relationshipList = realationShips1Service.RelationshipsListBasedOnAdmin(branch.getAdmin().getAdminId());
			System.out.println("idList===="+idList.size());
			System.out.println("relationshipList = =" + relationshipList.size());
			List<Cash> clist=cashService.getListByAdmin(adminId);
			List<PurposeCodes> purposeCodes = purposeCodeService.getPurposeCodesList();
			String adminId=model.getAdminId();
			Admin admin=adminService.getAdminDetailsBasedOnAdminId(adminId);
			mav.addObject("admin", admin);
			mav.addObject("clist", clist);
			System.out.println("purposeCodes = =" + purposeCodes);
			mav.addObject("idList", idList);
			mav.addObject("relationshipList", relationshipList);
			mav.addObject("purposeCodes", purposeCodes);
			mav.addObject("model", model);
			mav.addObject("towhome", towhome);
			mav.addObject("rCountryName", country.getCountryName());
			mav.addObject("dailingCode", country.getDalingCode());
			System.out.println("r country is =" + model.getReceivingBranch().split("-")[3]);
			mav.addObject("rCountryName", model.getReceivingBranch().split("-")[3]);
		} else {
			mav = new ModelAndView("redirect:login?session expired");

		}
		return mav;
	}

	@RequestMapping(value = { "txnreview" }, method = { RequestMethod.POST })
	public ModelAndView returnTxnReview(HttpServletRequest request,
			@ModelAttribute FrontEndTranscationInfoModelClass model, @ModelAttribute Beneficiary bene) {
		ModelAndView mav = null;
		System.out.println("model from txnewview is = " + model);
		String bankBranchCode=request.getParameter("bankBranchCode");
		System.out.println("bankBranchCode in txn======"+bankBranchCode);
		String bankName=request.getParameter("bankName");
		System.out.println("bankName in txn==="+bankName);
		System.out.println("beneficiary form txn review page is  = " + bene);
		String customerId = sessionDataService.getCustomerId(request.getSession());
		Customer customer=customerService.findByCustomerId(customerId);
		String collectionPointName=request.getParameter("collectionPointName");
		String collectionPointCode=request.getParameter("collectionPointCode");
		String collectionPointBank=request.getParameter("collectionPointBank");
		String collectionPointAddress=request.getParameter("collectionPointAddress");
		String collectionPointCity=request.getParameter("collectionPointCity");
		String collectionPointState=request.getParameter("collectionPointState");
		String collectionPointTelephone=request.getParameter("collectionPointTelephone");
		String collectionPin=request.getParameter("collectionPin");
		String beneficiaryAccountTransfer=request.getParameter("beneficiaryAccountTransfer");
		String bankDetails=request.getParameter("bankDetails");
		String bank=request.getParameter("bank");
		String swiftCode=request.getParameter("swiftCode");
		String iBAN=request.getParameter("iBAN");
		String branch=request.getParameter("branch");
		String BranchCity=request.getParameter("BranchCity");
		String branchState=request.getParameter("branchState");
		String telephone=request.getParameter("telephone");
		String branchManager=request.getParameter("branchManager");
		String cardNumber=request.getParameter("cardNumber");
		String beneficiaryAddress1=request.getParameter("beneficiaryAddress1");
		String beneficiaryAddress2=request.getParameter("beneficiaryAddress2");
		String beneficiaryAddress3=request.getParameter("beneficiaryAddress3");
		String beneficiaryCity=request.getParameter("beneficiaryCity");
		String beneficiaryPostCode=request.getParameter("beneficiaryPostCode");
		String beneficiaryIdType=request.getParameter("beneficiaryIdType");
		String beneficiaryIdDetails=request.getParameter("beneficiaryIdDetails");
		String deliveryNote=request.getParameter("deliveryNote");
		String utilityCompany=request.getParameter("utilityCompany");
		String customerAccountNumber=request.getParameter("customerAccountNumber");
		String invoiceNumber=request.getParameter("invoiceNumber");
		String bankToPay=request.getParameter("bankToPay");
		String iBan=request.getParameter("iBan");
		String bankBicCode=request.getParameter("bankBicCode");
		String addressLine1=request.getParameter("addressLine1");
		String addressLine2=request.getParameter("addressLine2");
		String addressLine3=request.getParameter("addressLine3");
		String city=request.getParameter("city");
		String state=request.getParameter("state");
		String billDescription=request.getParameter("billDescription");
		String postCode=request.getParameter("postCode");
		String mobileTrnsferNumber=request.getParameter("mobileTrnsferNumber");
		String transferNetWork=request.getParameter("transferNetWork");
		String transferNetWorkCreditType=request.getParameter("transferNetWorkCreditType");

		if (customerId != null) {
			mav = new ModelAndView("txn-review");
			System.out.println("deliveryTime........" + model.getDeliveryTime());
			String existedbeneficiary = request.getParameter("existedbeneficiary");
			mav.addObject("existedbeneficiary", existedbeneficiary);
			bene.setAccType(model.getPaymentType());
			if (existedbeneficiary == null || existedbeneficiary.equals("")) {
				bene.setAccType(model.getPaymentType());
				bene.setBankBranchCode(bankBranchCode);
				String ptp=model.getPaymentType().replace("?"," ").replace("�", " ");
				System.out.println("ptp======"+ptp);
				if(ptp.equals("Bill Payment")) {
					bene.setUtilityCompany(utilityCompany);
					//bene.setAddressLine1(addressLine1);
					//bene.setAddressLine2(addressLine2);
					//bene.setAddressLine3(addressLine3);
					bene.setBankToPay(bankToPay);
					bene.setBillDescription(billDescription);
					bene.setBankBicCode(bankBicCode);
					bene.setState(state);
					bene.setBeneficiaryIdDetails(beneficiaryIdDetails);
					bene.setBeneficiaryIdType(beneficiaryIdType);
					bene.setCity(city);
					bene.setInvoiceNumber(invoiceNumber);
					bene.setIBAN(iBan);
					bene.setEmailId(request.getParameter("bemailId"));
					bene.setCustomerAccountNumber(customerAccountNumber);
					}
					if(ptp.equals("Account Transfer")|| ptp.equals("Bank Deposit")) {
						bene.setBeneficiaryAccountTransfer(beneficiaryAccountTransfer);
						bene.setBank(bank);
						bene.setBankDetails(bankDetails);
					bene.setBranch(branch);
					bene.setBranchCity(BranchCity);
					bene.setBranchManager(branchManager);
					bene.setBranchState(branchState);
					bene.setIBAN(iBan);
					bene.setSwiftCode(swiftCode);
					bene.setTelephone(request.getParameter("branchTelephone"));

					}
					if(ptp.equals("Home Delivery")) {
						bene.setBeneficiaryAddress1(beneficiaryAddress1);
					bene.setBeneficiaryAddress2(beneficiaryAddress2);
					bene.setBeneficiaryAddress3(beneficiaryAddress3);
					bene.setBeneficiaryCity(beneficiaryCity);
					bene.setBeneficiaryPostCode(beneficiaryPostCode);
					bene.setDeliveryNote(deliveryNote);
					bene.setBeneficiaryIdDetails(beneficiaryIdDetails);
					bene.setBeneficiaryIdType(beneficiaryIdType);
					}
					if(ptp.equals("Card Transfer")) {
						bene.setCardNumber(cardNumber);
					}
					if(ptp.equals("Cash Collection")) {
						bene.setCollectionPin(collectionPin);
					bene.setCollectionPointAddress(collectionPointAddress);
					bene.setCollectionPointBank(collectionPointBank);
					bene.setCollectionPointCity(collectionPointCity);
					bene.setCollectionPointCode(collectionPointCode);
					bene.setCollectionPointName(collectionPointName);
					bene.setCollectionPointState(collectionPointState);
					bene.setCollectionPointTelephone(collectionPointTelephone);
					}
					
					if(ptp.equals("Mobile Money")) {
						bene.setMobileTrnsferNumber(mobileTrnsferNumber);
						bene.setTransferNetWork(transferNetWork);
						bene.setTransferNetWork(transferNetWorkCreditType);
						bene.setTransferNetWorkCreditType(transferNetWorkCreditType);
					}

				mav.addObject("beneficiary", bene);
			} else if (existedbeneficiary != null && !existedbeneficiary.equals("existedbeneficiary")) {
				Beneficiary beneficiary = beneficiaryService.getBeneficiaryDetails(existedbeneficiary);
				beneficiary.setBankBranchCode(bankBranchCode);
				String ptp=model.getPaymentType().replace("?"," ").replace("�", " ");
				System.out.println("ptp======"+ptp);
				/*
				 * if(ptp.equals("Mobile�Money") ||ptp.equals("Mobile?Money")) {
				 * ptp="Mobile Money"; }
				 * if(ptp.equals("Card�Transfer")||ptp.equals("Card?Transfer")) {
				 * ptp="Card Transfer"; }
				 * if(ptp.equals("Bank�Deposit")||ptp.equals("Bank?Deposit")) {
				 * ptp="Bank Deposit";
				 * }if(ptp.equals("Bill�Payment")||ptp.equals("Bill?Payment")) {
				 * ptp="Bill Payment";
				 * }if(ptp.equals("Home�Delivery")||ptp.equals("Home?Delivery")) {
				 * ptp="Home Delivery"; }
				 * if(ptp.equals("Account�Transfer")||ptp.equals("Account?Transfer")) {
				 * ptp="Account Transfer"; }
				 */
				if(ptp.equals("Bill Payment")) {
					beneficiary.setUtilityCompany(utilityCompany);
					beneficiary.setAddressLine1(addressLine1);
					beneficiary.setAddressLine2(addressLine2);
					beneficiary.setAddressLine3(addressLine3);
					beneficiary.setBankToPay(bankToPay);
					beneficiary.setBillDescription(billDescription);
					beneficiary.setBankBicCode(bankBicCode);
					beneficiary.setState(state);
					beneficiary.setBeneficiaryIdDetails(beneficiaryIdDetails);
					beneficiary.setBeneficiaryIdType(beneficiaryIdType);
					beneficiary.setCity(city);
					beneficiary.setInvoiceNumber(invoiceNumber);
					beneficiary.setIBAN(iBan);
					beneficiary.setEmailId(request.getParameter("bemailId"));
					beneficiary.setCustomerAccountNumber(customerAccountNumber);
					}
					if(ptp.equals("Account Transfer")||ptp.equals("Bank Deposit")) {
						beneficiary.setBeneficiaryAccountTransfer(beneficiaryAccountTransfer);
						beneficiary.setBank(bank);
						beneficiary.setBankDetails(bankDetails);
						beneficiary.setBranch(branch);
						beneficiary.setBranchCity(BranchCity);
						beneficiary.setBranchManager(branchManager);
						beneficiary.setBranchState(branchState);
						beneficiary.setIBAN(iBan);
						beneficiary.setSwiftCode(swiftCode);
						beneficiary.setTelephone(request.getParameter("branchTelephone"));

					}
					if(ptp.equals("Home Delivery")) {
						beneficiary.setBeneficiaryAddress1(beneficiaryAddress1);
						beneficiary.setBeneficiaryAddress2(beneficiaryAddress2);
						beneficiary.setBeneficiaryAddress3(beneficiaryAddress3);
						beneficiary.setBeneficiaryCity(beneficiaryCity);
						beneficiary.setBeneficiaryPostCode(beneficiaryPostCode);
						beneficiary.setDeliveryNote(deliveryNote);
						beneficiary.setBeneficiaryIdDetails(beneficiaryIdDetails);
						beneficiary.setBeneficiaryIdType(beneficiaryIdType);
					}
					if(ptp.equals("Card Transfer")) {
						beneficiary.setCardNumber(cardNumber);
					}
					if(ptp.equals("Cash Collection")) {
						beneficiary.setCollectionPin(collectionPin);
						beneficiary.setCollectionPointAddress(collectionPointAddress);
						beneficiary.setCollectionPointBank(collectionPointBank);
						beneficiary.setCollectionPointCity(collectionPointCity);
						beneficiary.setCollectionPointCode(collectionPointCode);
						beneficiary.setCollectionPointName(collectionPointName);
						beneficiary.setCollectionPointState(collectionPointState);
						beneficiary.setCollectionPointTelephone(collectionPointTelephone);
					}
					
					if(ptp.equals("Mobile Money")) {
						beneficiary.setMobileTrnsferNumber(mobileTrnsferNumber);
						beneficiary.setTransferNetWork(transferNetWork);
						beneficiary.setTransferNetWork(transferNetWorkCreditType);
						beneficiary.setTransferNetWorkCreditType(transferNetWorkCreditType);
					}

				mav.addObject("beneficiary", beneficiary);
			}
			

			List<SourceOfFunds1> sofList = sourceOfFundsService.SourceOfFundsListBasedOnAdmin(customer.getAdmin().getAdminId());
			List<ReasonForTransfer> purposeCodes =reasonForTransferService.findByAdmin(customer.getAdmin().getAdminId());

			mav.addObject("sofList", sofList);
			mav.addObject("purposeCodes", purposeCodes);
			mav.addObject("model", model);
			String adminId=model.getAdminId();
			Admin admin=adminService.getAdminDetailsBasedOnAdminId(adminId);
			mav.addObject("admin", admin);

			System.out.println("model from txn-review page  - = == " + model);
			String p=model.getPaymentType().replace("?"," ").replace("�", " ");
			System.out.println("ptp======"+p);

	double adminSellRate = currencyRateService.getCurrencyRateBasedOnFromBranchAndToBranch(
					model.getSendingBranch().split("-")[1], model.getReceivingBranch().split("-")[1], p, "selling");
			model.setCrRate(String.valueOf(adminSellRate));
			List<ServiceFees> sfeeList = feeService.getListOfServiceFeeBasedOnFromBranchAndToBranchId(
					model.getSendingBranch().split("-")[1], model.getReceivingBranch().split("-")[1],p);
			double srfee = 0.0;
			for (ServiceFees sf : sfeeList) {
				if (Double.parseDouble(model.getSendingAmount()) >= sf.getMinValue()
						&& Double.parseDouble(model.getSendingAmount()) <= sf.getMaxValue()) {
					srfee = sf.getServiceFee();
					
					if(sf.getRateType().equals("percentage")) {
						srfee=(Double.parseDouble(model.getSendingAmount())*sf.getServiceFee())/100;	
					System.out.println("srfee in percentage==="+srfee);
					}else {
						srfee=sf.getServiceFee();
						System.out.println("srfee in flat fee===="+srfee);
					}
					
					
				}
			}
			System.out.println(
					"parameter are =  " + model.getSendingBranch().split("-")[1] + " - " + model.getModeOfPayment());

			model = calculator.calculation(model);
			double mfee2=0.0;
			List<ModeOfPaymentFees> mfee1=modeOfPaymentsService.getModeOfPaymentFeeBasedOnBranchIdAndModeOfPayments(model.getSendingBranch().split("-")[1], model.getModeOfPayment().split(",")[0]);
			for(ModeOfPaymentFees m:mfee1) {
				if(Double.parseDouble(model.getSendingAmount()) >= m.getMinValue()
						&& Double.parseDouble(model.getSendingAmount()) <= m.getMaxValue()) {

					if(m.getRateType().equals("percentage")) {
						mfee2=(Double.parseDouble(model.getSendingAmount())*m.getFee())/100;	
					System.out.println("mee2 in percentage==="+mfee2);
					}else {
						mfee2=m.getFee();
						System.out.println("mfee2 in flat fee===="+mfee2);
					}
					System.out.println("mfee2==="+mfee2);
			}
			}

			double total_fee = mfee2 + srfee;
			model.setTotalTransactionFee(String.valueOf(total_fee));
			double total_to_pay = Double.parseDouble(model.getSendingAmount()) + total_fee;
			model.setTotalToPay(String.valueOf(total_to_pay));
			System.out.println("paymenttype......."+model.getPaymentType());
BranchPaymentTypeDetails details=branchPaymentTypeDetailsService.getDeliveryTime(model.getPaymentType(), model.getReceivingBranch().split("-")[1]);
		System.out.println("details....."+details);	
System.out.println("fullDetails  = " + model);
mav.addObject("sofList", sofList);
mav.addObject("purposeCodes", purposeCodes);
mav.addObject("model", model);
              mav.addObject("details",details);
			mav.addObject("txnDetails", model);
		} else {
			mav = new ModelAndView("redirect:login?session expired");
		}
		return mav;
	}

	@RequestMapping(value = { "/pay" }, method = { RequestMethod.POST })
	public ModelAndView getsend5(HttpServletRequest request, @ModelAttribute FrontEndTranscationInfoModelClass model,
			@ModelAttribute Beneficiary bene) {
		ModelAndView mav = null;
		mav = new ModelAndView("/pay");
		String existedbeneficiary = request.getParameter("existedbeneficiary");
		System.out.println("existedbeneficiary==="+existedbeneficiary);
		mav.addObject("existedbeneficiary", existedbeneficiary);
		if (existedbeneficiary == null || existedbeneficiary.equals("")) {
			String towhome = request.getParameter("towhome");
			mav.addObject("towhome", towhome);
			String sourceOfFund = request.getParameter("sourceOfFund");
			String purpose = request.getParameter("sendingReason");
			model.setSourceOfFund(sourceOfFund);
			bene.setSendingReason(purpose);
			bene.setBankBranchCode(request.getParameter("bankBranchCode"));
		} else if (existedbeneficiary != null && !existedbeneficiary.equals("existedbeneficiary")) {
			Beneficiary beneficiary = beneficiaryService.getBeneficiaryDetails(existedbeneficiary);
			beneficiary.setBankBranchCode(request.getParameter("bankBranchCode"));
			mav.addObject("beneficiary", beneficiary);
		}
		mav.addObject("beneficiary", bene);

		Branch branch = branchService.getBranchBasedOnBranchId(model.getSendingBranch().split("-")[1]);
		List<ModeOfPayments> mopList = modeOfPaymentsService.getAllModeOfPaymets();
		mav.addObject("selectedMop", model.getModeOfPayment().split(",")[0]);
		mav.addObject("mopList", mopList);
		mav.addObject("totalModeOfPaymentOfSendingBranch", branch.getModeOfPayment());
		System.out.println("payment type from pay page = = " + model.getPaymentType());
		String p=model.getPaymentType().replace("?"," ").replace("�", " ");
		System.out.println("ptp======"+p);


		double adminSellRate = currencyRateService.getCurrencyRateBasedOnFromBranchAndToBranch(
				model.getSendingBranch().split("-")[1], model.getReceivingBranch().split("-")[1],p,"selling");
		
		System.out.println("admin sell rate:");
		model.setCrRate(String.valueOf(adminSellRate));
		List<ServiceFees> sfeeList = feeService.getListOfServiceFeeBasedOnFromBranchAndToBranchId(
				model.getSendingBranch().split("-")[1], model.getReceivingBranch().split("-")[1],p);
		double srfee = 0.0;
		for (ServiceFees sf : sfeeList) {
			if (Double.parseDouble(model.getSendingAmount()) >= sf.getMinValue()
					&& Double.parseDouble(model.getSendingAmount()) <= sf.getMaxValue()) {
				srfee = sf.getServiceFee();
				if(sf.getRateType().equals("percentage")) {
					srfee=(Double.parseDouble(model.getSendingAmount())*sf.getServiceFee())/100;	
				System.out.println("srfee in percentage==="+srfee);
				}else {
					srfee=sf.getServiceFee();
					System.out.println("srfee in flat fee===="+srfee);
				}
				

			}
		}

		model = calculator.calculation(model);
		double mfee2=0.0;
		List<ModeOfPaymentFees> mfee1=modeOfPaymentsService.getModeOfPaymentFeeBasedOnBranchIdAndModeOfPayments(model.getSendingBranch().split("-")[1], model.getModeOfPayment().split(",")[0]);
		for(ModeOfPaymentFees m:mfee1) {
			if(Double.parseDouble(model.getSendingAmount()) >= m.getMinValue()
					&& Double.parseDouble(model.getSendingAmount()) <= m.getMaxValue()) {

				if(m.getRateType().equals("percentage")) {
					mfee2=(Double.parseDouble(model.getSendingAmount())*m.getFee())/100;	
				System.out.println("mfee2 in percentage==="+mfee2);
				}else {
					mfee2=m.getFee();
					System.out.println("mfee2 in flatfee==="+mfee2);
				}
				System.out.println("mfee2==="+mfee2);
		}
		}
		double fee=mfee2+srfee+Double.parseDouble(model.getSendingAmount());
		mav.addObject("fee", fee);
		mav.addObject("srfee", srfee);
		mav.addObject("mfee2", mfee2);
	System.out.println("service fee:"+srfee);
		double total_fee = mfee2+ srfee;
		System.out.println("total fees:"+total_fee); 
		model.setModeOfPaymentFee(String.valueOf(mfee2));
		model.setTotalTransactionFee(String.valueOf(total_fee));
		double total_to_pay = Double.parseDouble(model.getSendingAmount()) + total_fee;
		model.setTotalToPay(String.valueOf(total_to_pay));
		Double amt=Double.parseDouble(model.getSendingAmount());
		String amount=Math.round(amt)+"";
		System.out.println("amount==="+amount);
		List<ModeOfPaymentFees> modeOfPaymentFeesList=modeOfPaymentsService.getList(model.getSendingBranch().split("-")[1], "backend", Double.parseDouble(amount));
			System.out.println("moplist==="+modeOfPaymentFeesList);
		
		
		System.out.println("modeOfPaymentFeesList::::" + modeOfPaymentFeesList.size());
		FrontEndTranscationInfoModelClass fullDetails = calculator.calculation(model);
		System.out.println("fullDetails......" + fullDetails);
		mav.addObject("txnDetails", fullDetails);
		mav.addObject("modeOfPaymentFeesList", modeOfPaymentFeesList);
		return mav;
	}

	@RequestMapping(value = { "/insertOnlineTransaction" }, method = { RequestMethod.POST })
	@Transactional
	private String insertTransaction(HttpServletRequest request,
			@ModelAttribute FrontEndTranscationInfoModelClass model, Beneficiary beneficiary) {
		String customerId = sessionDataService.getCustomerId(request.getSession());
		String result = "";
		String mop = request.getParameter("selectedMop");
		System.out.println("mop==***8***************************************=" + mop);
		String paymentMethod = request.getParameter("paymentMethod");
		System.out.println("paymentMethod===" + paymentMethod);
		if (customerId != null) {
			String existedbeneficiary = request.getParameter("existedbeneficiary");
			Customer customer = customerService.findByCustomerId(customerId);
			Branch fromBranch = branchService.getBranchBasedOnBranchId(model.getSendingBranch().split("-")[1]);
			Country fromCountry = countryService.getCountryBasedOnIso(fromBranch.getFromCountry().getCountryISO());
			Admin admin = adminService.getAdminDetailsBasedOnAdminId(request.getParameter("adminId"));
			Branch toBranch = branchService.getBranchBasedOnBranchId(model.getReceivingBranch().split("-")[1]);
			Country toCountry = countryService.getCountryBasedOnIso(toBranch.getFromCountry().getCountryISO());
			TransactionInformation txnInfo = new TransactionInformation();
			String collectionPointName=request.getParameter("collectionPointName");
			String collectionPointCode=request.getParameter("collectionPointCode");
			String collectionPointBank=request.getParameter("collectionPointBank");
			String collectionPointAddress=request.getParameter("collectionPointAddress");
			String collectionPointCity=request.getParameter("collectionPointCity");
			String collectionPointState=request.getParameter("collectionPointState");
			String collectionPointTelephone=request.getParameter("collectionPointTelephone");
			String collectionPin=request.getParameter("collectionPin");
			String beneficiaryAccountTransfer=request.getParameter("beneficiaryAccountTransfer");
			String bankDetails=request.getParameter("bankDetails");
			String bank=request.getParameter("bank");
			String swiftCode=request.getParameter("swiftCode");
			String iBAN=request.getParameter("iBAN");
			String branch=request.getParameter("branch");
			String BranchCity=request.getParameter("BranchCity");
			String branchState=request.getParameter("branchState");
			String telephone=request.getParameter("telephone");
			String branchManager=request.getParameter("branchManager");
			String cardNumber=request.getParameter("cardNumber");
			String beneficiaryAddress1=request.getParameter("beneficiaryAddress1");
			String beneficiaryAddress2=request.getParameter("beneficiaryAddress2");
			String beneficiaryAddress3=request.getParameter("beneficiaryAddress3");
			String beneficiaryCity=request.getParameter("beneficiaryCity");
			String beneficiaryPostCode=request.getParameter("beneficiaryPostCode");
			String beneficiaryIdType=request.getParameter("beneficiaryIdType");
			String beneficiaryIdDetails=request.getParameter("beneficiaryIdDetails");
			String deliveryNote=request.getParameter("deliveryNote");
			String utilityCompany=request.getParameter("utilityCompany");
			String customerAccountNumber=request.getParameter("customerAccountNumber");
			String invoiceNumber=request.getParameter("invoiceNumber");
			String bankToPay=request.getParameter("bankToPay");
			String iBan=request.getParameter("iBan");
			String bankBicCode=request.getParameter("bankBicCode");
			String addressLine1=request.getParameter("addressLine1");
			String addressLine2=request.getParameter("addressLine2");
			String addressLine3=request.getParameter("addressLine3");
			String city=request.getParameter("city");
			String state=request.getParameter("state");
			String billDescription=request.getParameter("billDescription");
			String postCode=request.getParameter("postCode");
			String mobileTrnsferNumber=request.getParameter("mobileTrnsferNumber");
			String transferNetWork=request.getParameter("transferNetWork");
			String transferNetWorkCreditType=request.getParameter("transferNetWorkCreditType");

			System.out.println("beneficiary==="+beneficiary);
			if (existedbeneficiary == null || existedbeneficiary.equals("")) {
				String towhome = request.getParameter("towhome");
				beneficiary.setBeneficiaryCountry(toCountry);
				beneficiary.setCustomer(customer);
				beneficiary.setAdmin(admin);
				beneficiary.setBenificiaryStatus("New Receipent");
				beneficiary.setAccType(model.getPaymentType());
				beneficiary.setBankBranchCode(request.getParameter("bankBranchCode"));
				String ptp=model.getPaymentType().replace("?"," ").replace("�", " ");
				System.out.println("ptp======"+ptp);

				if(ptp.equals("Bill Payment")) {
					beneficiary.setUtilityCompany(utilityCompany);
					beneficiary.setAddressLine1(addressLine1);
					beneficiary.setAddressLine2(addressLine2);
					beneficiary.setAddressLine3(addressLine3);
					beneficiary.setBankToPay(bankToPay);
					beneficiary.setBillDescription(billDescription);
					beneficiary.setBankBicCode(bankBicCode);
					beneficiary.setState(state);
					beneficiary.setBeneficiaryIdDetails(beneficiaryIdDetails);
					beneficiary.setBeneficiaryIdType(beneficiaryIdType);
					beneficiary.setCity(city);
					beneficiary.setInvoiceNumber(invoiceNumber);
					beneficiary.setIBAN(iBan);
					beneficiary.setEmailId(request.getParameter("bemailId"));
					beneficiary.setCustomerAccountNumber(customerAccountNumber);
					}
					if(ptp.equals("Account Transfer")||ptp.equals("Bank Deposit")) {
						beneficiary.setBeneficiaryAccountTransfer(beneficiaryAccountTransfer);
						beneficiary.setBank(bank);
						beneficiary.setBankDetails(bankDetails);
						beneficiary.setBranch(branch);
						beneficiary.setBranchCity(BranchCity);
						beneficiary.setBranchManager(branchManager);
						beneficiary.setBranchState(branchState);
						beneficiary.setIBAN(iBan);
						beneficiary.setSwiftCode(swiftCode);
						beneficiary.setTelephone(request.getParameter("branchTelephone"));

					}
					if(ptp.equals("Home Delivery")) {
						beneficiary.setBeneficiaryAddress1(beneficiaryAddress1);
						beneficiary.setBeneficiaryAddress2(beneficiaryAddress2);
						beneficiary.setBeneficiaryAddress3(beneficiaryAddress3);
						beneficiary.setBeneficiaryCity(beneficiaryCity);
						beneficiary.setBeneficiaryPostCode(beneficiaryPostCode);
						beneficiary.setDeliveryNote(deliveryNote);
						beneficiary.setBeneficiaryIdDetails(beneficiaryIdDetails);
						beneficiary.setBeneficiaryIdType(beneficiaryIdType);
					}
					if(ptp.equals("Card Transfer")) {
						beneficiary.setCardNumber(cardNumber);
					}
					if(ptp.equals("Cash Collection")) {
						beneficiary.setCollectionPin(collectionPin);
						beneficiary.setCollectionPointAddress(collectionPointAddress);
						beneficiary.setCollectionPointBank(collectionPointBank);
						beneficiary.setCollectionPointCity(collectionPointCity);
						beneficiary.setCollectionPointCode(collectionPointCode);
						beneficiary.setCollectionPointName(collectionPointName);
						beneficiary.setCollectionPointState(collectionPointState);
						beneficiary.setCollectionPointTelephone(collectionPointTelephone);
					}
					
					if(ptp.equals("Mobile Money")) {
						beneficiary.setMobileTrnsferNumber(mobileTrnsferNumber);
						beneficiary.setTransferNetWork(transferNetWork);
						beneficiary.setTransferNetWork(transferNetWorkCreditType);
						beneficiary.setTransferNetWorkCreditType(transferNetWorkCreditType);
					}

				System.out.println("beneficiary==="+beneficiary);
			} else if (existedbeneficiary != null && !existedbeneficiary.equals("")) {
				beneficiary = beneficiaryService.getBeneficiaryDetails(existedbeneficiary);
				System.out.println("beneficiary==="+beneficiary);
				String ptp=model.getPaymentType().replace("?"," ").replace("�", " ");
				System.out.println("ptp======"+ptp);

				if(ptp.equals("Bill Payment")) {
					beneficiary.setUtilityCompany(utilityCompany);
					//beneficiary.setAddressLine1(addressLine1);
					//beneficiary.setAddressLine2(addressLine2);
					//beneficiary.setAddressLine3(addressLine3);
					beneficiary.setBankToPay(bankToPay);
					beneficiary.setBillDescription(billDescription);
					beneficiary.setBankBicCode(bankBicCode);
					beneficiary.setState(state);
					beneficiary.setBeneficiaryIdDetails(beneficiaryIdDetails);
					beneficiary.setBeneficiaryIdType(beneficiaryIdType);
					beneficiary.setCity(city);
					beneficiary.setInvoiceNumber(invoiceNumber);
					beneficiary.setIBAN(iBan);
					beneficiary.setEmailId(request.getParameter("bemailId"));
					beneficiary.setCustomerAccountNumber(customerAccountNumber);
					}
					if(ptp.equals("Account Transfer")||ptp.equals("Bank Deposit")) {
						beneficiary.setBeneficiaryAccountTransfer(beneficiaryAccountTransfer);
						beneficiary.setBank(bank);
						beneficiary.setBankDetails(bankDetails);
						beneficiary.setBranch(branch);
						beneficiary.setBranchCity(BranchCity);
						beneficiary.setBranchManager(branchManager);
						beneficiary.setBranchState(branchState);
						beneficiary.setIBAN(iBan);
						beneficiary.setSwiftCode(swiftCode);
						beneficiary.setTelephone(request.getParameter("branchTelephone"));

					}
					if(ptp.equals("Home Delivery")) {
						beneficiary.setBeneficiaryAddress1(beneficiaryAddress1);
						beneficiary.setBeneficiaryAddress2(beneficiaryAddress2);
						beneficiary.setBeneficiaryAddress3(beneficiaryAddress3);
						beneficiary.setBeneficiaryCity(beneficiaryCity);
						beneficiary.setBeneficiaryPostCode(beneficiaryPostCode);
						beneficiary.setDeliveryNote(deliveryNote);
						beneficiary.setBeneficiaryIdDetails(beneficiaryIdDetails);
						beneficiary.setBeneficiaryIdType(beneficiaryIdType);
					}
					if(ptp.equals("Card Transfer")) {
						beneficiary.setCardNumber(cardNumber);
					}
					if(ptp.equals("Cash Collection")) {
						beneficiary.setCollectionPin(collectionPin);
						beneficiary.setCollectionPointAddress(collectionPointAddress);
						beneficiary.setCollectionPointBank(collectionPointBank);
						beneficiary.setCollectionPointCity(collectionPointCity);
						beneficiary.setCollectionPointCode(collectionPointCode);
						beneficiary.setCollectionPointName(collectionPointName);
						beneficiary.setCollectionPointState(collectionPointState);
						beneficiary.setCollectionPointTelephone(collectionPointTelephone);
					}
					
					if(ptp.equals("Mobile Money")) {
						beneficiary.setMobileTrnsferNumber(mobileTrnsferNumber);
						beneficiary.setTransferNetWork(transferNetWork);
						beneficiary.setTransferNetWork(transferNetWorkCreditType);
						beneficiary.setTransferNetWorkCreditType(transferNetWorkCreditType);
					}
				
			}
			System.out.println("modeofpayment...." + model.getModeOfPayment().split(",")[0]);
			String pt = "";
			if (model.getPaymentType().equals("1"))
				pt = "bank";
			if (model.getPaymentType().equals("2"))
				pt = "eWallet";
			if (model.getPaymentType().equals("5"))
				pt = "cash";
			if (model.getPaymentType().equals("10"))
				pt = "Ezy Local Deposit";
			if (model.getPaymentType().equals("11"))
				pt = "Urgent Local Deposit";
			if (model.getPaymentType().equals("15"))
				pt = "bKash";
			String p=model.getPaymentType().replace("?"," ").replace("�", " ");
			System.out.println("ptp======"+p);
			double adminSellRate = currencyRateService.getCurrencyRateBasedOnFromBranchAndToBranch(
					model.getSendingBranch().split("-")[1], model.getReceivingBranch().split("-")[1],p,"selling");
			model.setCrRate(String.valueOf(adminSellRate));
			List<ServiceFees> sfeeList = feeService.getListOfServiceFeeBasedOnFromBranchAndToBranchId(
					model.getSendingBranch().split("-")[1], model.getReceivingBranch().split("-")[1],p);
			double srfee = 0.0;
			for (ServiceFees sf : sfeeList) {
				if (Double.parseDouble(model.getSendingAmount()) >= sf.getMinValue()
						&& Double.parseDouble(model.getSendingAmount()) <= sf.getMaxValue()) {
					srfee = sf.getServiceFee();
				}
			}

			model = calculator.calculation(model);
			double mfee2=0.0;
			List<ModeOfPaymentFees> mfee1=modeOfPaymentsService.getModeOfPaymentFeeBasedOnBranchIdAndModeOfPayments(model.getSendingBranch().split("-")[1], model.getModeOfPayment().split(",")[0]);
			for(ModeOfPaymentFees m:mfee1) {
				if(Double.parseDouble(model.getSendingAmount()) >= m.getMinValue()
						&& Double.parseDouble(model.getSendingAmount()) <= m.getMaxValue()) {

					if(m.getRateType().equals("percentage")) {
						mfee2=(Double.parseDouble(model.getSendingAmount())*m.getFee())/100;	
					}else {
						mfee2=m.getFee();
					}
					System.out.println("mfee2==="+mfee2);
			}
			}

		  	double total_fee=mfee2+srfee;
		  	System.out.println("total_fee===="+total_fee);
		  	double tfee=total_fee/2;
		  	System.out.println("tfee===="+tfee);
		  	txnInfo.setAgentFee(tfee+"");
			double o=0;
			System.out.println("txnInfo===="+model.getSendingBranch().split("-")[1]+","+model.getReceivingBranch().split("-")[1]+","+model.getAdminId());
		  	RevenuePercentage rp= rps.getByagents(model.getSendingBranch().split("-")[1], model.getReceivingBranch().split("-")[1], model.getAdminId());
			System.out.println("rp======"+rp);
			o=Integer.parseInt(rp.getSourcePercentage());
			  o= ((total_fee*o)/100);
System.out.println("o========"+o);

		  	System.out.println("txnInfo==="+txnInfo.getAgentFee());
			 model.setTotalTransactionFee(String.valueOf(total_fee));
			 double total_to_pay=Double.parseDouble(model.getSendingAmount())+total_fee;
			 model.setTotalToPay(String.valueOf(total_to_pay));
txnInfo.setTaxFee(srfee);
txnInfo.setTotalFee(total_fee);
txnInfo.setModeOfPaymentFee(mfee2);
txnInfo.setAgentFee(o+"");
			List<ModeOfPaymentFees> modeOfPaymentFeesList = modeOfPaymentsService
					.getModeOfPaymentFeeBasedOnBranchId(model.getSendingBranch().split("-")[1]);
			FrontEndTranscationInfoModelClass fullDetails = calculator.calculation(model);
			String nextPageName = request.getParameter("nextPageName");
			System.out.println("nextPageName......" + nextPageName);
			String mops = model.getModeOfPayment().split(",")[0];
			String txnId = "";
			String Amount=request.getParameter("sendingAmount");
			System.out.println("Amoiunt oin txn insert====="+Amount);
			System.out.println("date::::::" + fullDetails.getDeliveryTime());
			txnInfo.setCustomer(customer);
			txnInfo.setSendingAmount(Double.parseDouble(Amount));
			System.out.println("sending amount in txninfo-====="+fullDetails.getSendingAmount());
			txnInfo.setSourceOfFund(fullDetails.getSourceOfFund());
			txnInfo.setSendingReason(beneficiary.getSendingReason());
			txnInfo.setFromBranch(fromBranch);
			txnInfo.setReceipentAmount(Double.valueOf(Double.parseDouble(fullDetails.getReceivingAmount())));
			txnInfo.setReceivingCountry(toCountry);
			txnInfo.setReceivingCurrency(toCountry.getCurrencyCode());
			txnInfo.setSendingCountry(fromCountry);
			txnInfo.setDeliveryTime(fullDetails.getDeliveryTime());
			txnInfo.setSendingCurrency(fromCountry.getCurrencyCode());
			txnInfo.setSendingCurrencyRate(fullDetails.getCrRate());
			txnInfo.setPaymentType(fullDetails.getPaymentType());
			txnInfo.setModeOfPayment(fullDetails.getModeOfPayment());
			txnInfo.setAmountToBeConverted(Double.parseDouble(fullDetails.getSendingAmount()));
			txnInfo.setReceivingCurrencyRate(Double.parseDouble(fullDetails.getCrRate()));
			txnInfo.setTotalAmountCollected(Double.valueOf(fullDetails.getTotalToPay()));
			txnInfo.setTransactionRate(Double.parseDouble(fullDetails.getTxnRate()));
			txnInfo.setAdmin(admin);
			txnInfo.setSendingAmount(Double.parseDouble(fullDetails.getSendingAmount()));
			txnInfo.setToBranch(toBranch);
			NasanoResponse ns=new NasanoResponse();
			ns.setGloMsg("something");
			ns.setGloStatus("pending");
			ns.setGloTransactionId("134");
			NasanoResponse n=	nasanoResponService.save(ns);
			txnInfo.setNasanoResponse(n);

			System.out.println("mop in insert transaction======"+fullDetails.getModeOfPayment());
			if(fullDetails.getModeOfPayment().equals("Cash")||fullDetails.getModeOfPayment()=="Cash") {
System.out.println("if condition======");
			txnInfo.setStatus("funds received");
			txnInfo.setPaymentStatus("funds received");

			}else {
				txnInfo.setStatus("pending");
				txnInfo.setPaymentStatus("pending");

			}
			txnInfo.setApprovedByAdmin("pending");
			txnInfo.setApprovedBySendingBranch("pending");
			txnInfo.setApprovedByReceivingBranch("pending");
			txnInfo.setTransactionMode("online"); //
			txnInfo.setIssuerCode(beneficiary.getIssuerCode());
			 txnInfo.setUpdatedDate(sdf.format(d));
			if (fullDetails.getPaymentType().equals("10") || fullDetails.getPaymentType().equals("11")) {
				txnInfo.setAgent("Quiqsend");
			} else {
				txnInfo.setAgent("remitz");
			}

System.out.println("beneficiary======"+beneficiary);
			txnId = transactionInformationService.insertTransaction(txnInfo, beneficiary);

			result = "redirect:" + nextPageName + "?txnId=" + txnId;

		}
		return result;
	}


	@RequestMapping(value = "/secure", method = RequestMethod.GET)
	public ModelAndView getSecurePage(HttpServletRequest request) {
		ModelAndView modelAndView = new ModelAndView();
		String txnId = request.getParameter("txnId");
		TransactionInformation transactionInformation = transactionInformationService.getTransactionDetails(txnId);
		Customer customer=transactionInformation.getCustomer();
		modelAndView.setViewName("secure");
		modelAndView.addObject("transactionInformation", transactionInformation);
		modelAndView.addObject("admin", customer.getAdmin());
		OnlineMop om=onlineMopService.findOneByAdmin(customer.getAdmin().getAdminId());
		System.out.println("om==="+om);
		modelAndView.addObject("transactionInformation", transactionInformation);
		modelAndView.addObject("admin", customer.getAdmin());
		modelAndView.addObject("om", om);
		return modelAndView;
	}

	@RequestMapping(value = "/cash")
	public ModelAndView returnCashTransferPage(HttpServletRequest request, @RequestParam String txnId) {
		ModelAndView mav = null;
			mav = new ModelAndView("cash");
			mav.setViewName("cash");
			mav.addObject("txnId", txnId);
			TransactionInformation transactionInformation = transactionInformationService.getTransactionDetails(txnId);
			Customer customer=transactionInformation.getCustomer();
			mav.addObject("sendAmount", transactionInformation.getTotalAmountCollected());
			mav.addObject("rate", transactionInformation.getTransactionRate());
			mav.addObject("uploadIdFlag", transactionInformation.getCustomer().getFirstIdProofStatus());
	mav.addObject("admin", customer.getAdmin());
	
	mav.addObject("admin", customer.getAdmin());
mav.addObject("currency", transactionInformation.getSendingCurrency());
OnlineMop om=onlineMopService.findOneByAdmin(customer.getAdmin().getAdminId());
mav.addObject("om", om);

		return mav;
	}

	@RequestMapping(value = "/bnktrns")
	public ModelAndView returnBankTransferPage(HttpServletRequest request, @RequestParam String txnId) {
		ModelAndView mav = null;
		mav = new ModelAndView("banktransfer");
			mav.setViewName("banktransfer");
			mav.addObject("txnId", txnId);
			TransactionInformation transactionInformation = transactionInformationService.getTransactionDetails(txnId);
			Customer customer=transactionInformation.getCustomer();
			mav.addObject("sendAmount", transactionInformation.getTotalAmountCollected());
			mav.addObject("rate", transactionInformation.getTransactionRate());
			mav.addObject("uploadIdFlag", transactionInformation.getCustomer().getFirstIdProofStatus());
		mav.addObject("admin", customer.getAdmin());
		InternetBankTransferMop ibt=internetBankTransferMopService.findByAdmin(customer.getAdmin().getAdminId());
		System.out.println("ibt===="+ibt);
		mav.addObject("ibt", ibt);

		return mav;
	}

	@RequestMapping(value = "/poli1")
	public ModelAndView returnPoli1Page(HttpServletRequest request, @RequestParam String txnId) {
		ModelAndView mav = null;
		System.out.println("txnId = = = " + txnId);
			mav = new ModelAndView("poli1");
			mav.setViewName("poli1");
			mav.addObject("txnId", txnId);
			TransactionInformation transactionInformation = transactionInformationService.getTransactionDetails(txnId);
			Customer customer=transactionInformation.getCustomer();
			System.out.println("transactionInformation = = = " + transactionInformation);
			mav.addObject("sendAmount", transactionInformation.getTotalAmountCollected());
			mav.addObject("uploadIdFlag", transactionInformation.getCustomer().getFirstIdProofStatus());
		mav.addObject("admin", customer.getAdmin());
		return mav;
	}

	@RequestMapping(value = "/payid")
	public ModelAndView returnPayIdPage(HttpServletRequest request, @RequestParam String txnId) {
		ModelAndView mav = null;
			mav = new ModelAndView("payid");
			mav.setViewName("payid");
			mav.addObject("txnId", txnId);
			TransactionInformation transactionInformation = transactionInformationService.getTransactionDetails(txnId);
			Customer customer=transactionInformation.getCustomer();
			mav.addObject("sendAmount", transactionInformation.getTotalAmountCollected());
			mav.addObject("rate", transactionInformation.getTransactionRate());
			mav.addObject("uploadIdFlag", transactionInformation.getCustomer().getFirstIdProofStatus());
		mav.addObject("admin", customer.getAdmin());
		return mav;
	}

	/*
	 * @RequestMapping(value = "/login", method = RequestMethod.GET) public
	 * ModelAndView loginPage(HttpServletRequest request) { ModelAndView
	 * modelAndView=new ModelAndView(); System.out.println("hitting::::"); String
	 * adminId=request.getParameter("adminId"); String
	 * page=request.getParameter("page"); System.out.println("page::::"+page);
	 * System.out.println("lllllllllllllladminId:::::"+adminId);
	 * modelAndView.setViewName("login"); return modelAndView; }
	 * 
	 * 
	 * @RequestMapping(value="/logout", method = RequestMethod.GET) public String
	 * logoutPage (HttpServletRequest request, HttpServletResponse response) {
	 * Authentication auth = SecurityContextHolder.getContext().getAuthentication();
	 * if (auth != null){ new SecurityContextLogoutHandler().logout(request,
	 * response, auth); System.out.println("auth::::::"+auth); } return
	 * "redirect:/login?logout=true"; }
	 */

	@RequestMapping(value = "updatepaymentstatusfromuser", method = RequestMethod.POST)
	public String updatePaymentStatusFromUser(HttpServletRequest request, @RequestParam String txnId,
			@RequestParam String status) {
		String custId = sessionDataService.getCustomerId(request.getSession());
		if (custId != null) {
			TransactionInformation txnInfo = transactionInformationService.getTransactionDetails(txnId);
			if (status.equals("cancelled")) {
				txnInfo.setPaymentStatusFromUser(status);
				txnInfo.setStatus(status);
				txnInfo.setCancelReason("Cancelled by user");

SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
				
				Calendar cal = Calendar.getInstance();
				
				Date d = cal.getTime();
				txnInfo.setUpdatedDate(sdf.format(d));


				
			} else {
				txnInfo.setPaymentStatusFromUser(status);
			}
			String updatedBy = "user";
			status="pending";
			String comments = "";
			transactionInformationService.updateTransactionStatus(txnId, status, updatedBy, comments);
			
			return "redirect:success-page?txnId=" + txnInfo.getTransactionId();
		} else {
			return "redirect:/?session expired";
		}

	}

	@RequestMapping(value = { "/success-page" }, method = { RequestMethod.GET })
	public ModelAndView returnSuccessPageForCashAndBank(HttpServletRequest request, @RequestParam String txnId)
			throws JsonParseException, JsonMappingException, IOException {
		System.out.println("************************");
		ModelAndView mav = null;
		String custId = sessionDataService.getCustomerId(request.getSession());
		if (custId != null) {
			mav = new ModelAndView("success");
			mav.setViewName("success");
			TransactionInformation txninfo = transactionInformationService.getTransactionDetails(txnId);
			mav.addObject("txnId", txnId);
			mav.addObject("idFlag", txninfo.getCustomer().getFirstIdProofStatus());
			mav.addObject("customerId", txninfo.getCustomer().getCustomerId());
			mav.addObject("idType", txninfo.getCustomer().getFirstIdProofType());
			mav.addObject("rCountry", txninfo.getReceivingCountry().getCountryName());
			Customer customer=customerService.findByCustomerId(custId);
			mav.addObject("admin", customer.getAdmin());
			
			
			EmailTemplate emailTemplate = emailTemplateService.getEmailTemplateByTitleAndAdmin(customer.getAdmin().getAdminId(), "Email to sender on order initiate");
			System.out.println("message======="+emailTemplate);
			String bodyContent = emailTemplate.getTemplate();
			String replacedBodyContent = bodyContent.replace("{FIRST_NAME}", customer.getFirstName());
			String replacedBodyContent1 = replacedBodyContent.replace("{SENDING_AMOUNT}",Double.toString(txninfo.getSendingAmount()));
			String replacedBodyContent2=replacedBodyContent1.replace("{TRANSACTION_NUMBER}",txnId);
			String replacedBodyContent3=replacedBodyContent2.replace("{RECEIVING_COUNTRY_NAME}",txninfo.getReceivingCountry().getCountryName());
			System.out.println("replacedBodyContent======"+replacedBodyContent);
			System.out.println("emailTemplate email====="+emailTemplate);
			
			
			try { 
				SendMail.send("info@remitz.co.uk", customer.getEmailId(), emailTemplate.getSubject(),
			  hederContent + bodyStartsContent + replacedBodyContent3 + bodyEndContent +
			  footerContent); 
				} catch (Exception e) { 
					e.printStackTrace();
					}
			  

		} else {
			mav = new ModelAndView("redirect:/");
		}
		return mav;

	}

	@RequestMapping(value = "changepwd", method = RequestMethod.POST)
	public String changePassword(HttpServletRequest request) throws UnknownHostException {
		String custId = sessionDataService.getCustomerId(request.getSession());
		if (custId != null) {
			String newPwd = request.getParameter("newPwd");
			Customer customer = customerService.findByCustomerId(custId);
			customer.setPassword(newPwd);
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

			Calendar cal = Calendar.getInstance();

			Date d = cal.getTime();

			customer.setUpdatedDate(sdf.format(d));

			customer.setIpAddress(customer.getIpAddress());
			String pwd = request.getParameter("newPwd");
			customerService.updatepassword(pwd, custId);
			System.out.println("customer.getFirstName()::::::::" + customer.getFirstName());
			customerService.updateCustomerDetails(customer);
			EmailTemplate emailTemplate = emailTemplateService.getEmailTemplateByTitleAndAdmin(customer.getAdmin().getAdminId(), "Password Changed Notification");
			String bodyContent = emailTemplate.getTemplate();
			String replacedBodyContent = bodyContent.replace("{FIRST_NAME}", customer.getFirstName()).replace("{DATE_TIME}",
					sdf.format(d));
			System.out.println("replacedBodyContent in changepassword====="+replacedBodyContent);
			try { 
				SendMail.send("info@remitz.co.uk", customer.getEmailId(), emailTemplate.getSubject(),
			  hederContent + bodyStartsContent + replacedBodyContent + bodyEndContent +
			  footerContent); 
				} catch (Exception e) { 
					e.printStackTrace();
					}

			return "redirect:updatepwdinuser?custId=" + custId + "&pwd=" + pwd;
			// return "redirect:validatecustomer?userName=" + customer.getUserName() +
			// "&password=" + newPwd + "&page=au";
		} else {
			return "redirect:login?session expired";
		}
	}


	@GetMapping("/updatepwdinuser")
	private String pwdchangepage(HttpServletRequest request) {
		String pwd = request.getParameter("pwd");
		String userType = request.getParameter("custId");
		Customer customer = customerService.findByCustomerId(userType);
		userService.updateCustomerPwd(pwd, userType);
		sessionDataService.deleteCustomerInfo(request.getSession());
		return "/changeforgotpasswordupdateSuccess";

	}
	
	
	
	

	@RequestMapping(value = { "/changepassword" }, method = { RequestMethod.GET })
	public ModelAndView getchangepassword(HttpServletRequest request) {
		ModelAndView mav = null;
		String custId = sessionDataService.getCustomerId(request.getSession());
		if (custId != null) {
			mav = new ModelAndView("changepassword");
			mav.setViewName("changepassword");
			Customer customer = customerService.findByCustomerId(custId);
			mav.addObject("password", customer.getPassword());
			mav.addObject("admin", customer.getAdmin());
		} else {
			mav = new ModelAndView("redirect:login?session expired");
		}
		return mav;
	}
	
	
	@RequestMapping(value = { "/forgotpassword" }, method = { RequestMethod.GET })

	public ModelAndView ResetPage() {
		ModelAndView mav=new ModelAndView("forgotpassword");
		System.out.println("adminId==="+adminId);

		mav.setViewName("forgotpassword");
		mav.addObject("adminId", adminId);
		return  mav=new ModelAndView("forgotpassword");
		
	}
	
	@RequestMapping(value = "Resetpassword", method = RequestMethod.POST)
	public ModelAndView ResetPassword(HttpServletRequest request) throws UnknownHostException {
		ModelAndView mav=new ModelAndView();
		System.out.println("adminId in reset pwd======"+adminId);
		String emailId=request.getParameter("username");
		System.out.println("emailId===="+emailId);
		Customer customer = customerService.findByEmail(emailId);
		System.out.println("customer====="+customer);

		SendMailBean sendMailBean=new SendMailBean(); 
		System.out.println("adminId==="+customer.getAdmin().getAdminId());
		String encryptedCustomerId = PasswordEncryptor.encrypt(PasswordEncryptor.key1, PasswordEncryptor.key2,
				customer.getCustomerId());

		EmailTemplate emailTemplate = emailTemplateService.getEmailTemplateByTitleAndAdmin(customer.getAdmin().getAdminId(), "Reset Password Link");
		String bodyContent = emailTemplate.getTemplate();
		String replacedbodyContent = bodyContent.replace("{FIRST_NAME}", customer.getFirstName()).replace(
				"{PASSWORD_RESET_LINK}",
				"http://demo.remitz.co.uk//changeforgotpassword?customerId=" + encryptedCustomerId);
		System.out.println("replacedbodyContent:::" + replacedbodyContent);

		sendMailBean.send1("info@remitz.co.uk", emailId,"","", emailTemplate.getSubject(),
				hederContent + bodyStartsContent + replacedbodyContent + bodyEndContent + footerContent,"localhost");

		
		return mav = new ModelAndView("redirect:forgotpasswordemail");


	
	}
	
	@RequestMapping(value = { "/forgotpasswordemail" }, method = { RequestMethod.GET })

	public ModelAndView forgotpasswordemailPage() {
		ModelAndView mav=new ModelAndView("forgotpasswordemail");
		System.out.println("adminId==="+adminId);

		mav.setViewName("forgotpasswordemail");
		return  mav=new ModelAndView("forgotpasswordemail");
		
	}

	
	
	
	@RequestMapping(value = "/changeforgotpassword", method = RequestMethod.GET)
	public ModelAndView changeGetForgotPassword(HttpServletRequest request)   {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("/changeforgotpassword");
		String encyptedcustomerId = request.getParameter("customerId");
		System.out.println("adminId in changeforgotpwd...."+adminId);
		String customerId = PasswordDecryptor.decrypt(PasswordEncryptor.key1, PasswordEncryptor.key2,
				encyptedcustomerId);
		modelAndView.addObject("customerId", customerId);
		return modelAndView;
	}

	
	
	
	
	@RequestMapping(value = "/changeforgotpasswordupdate", method = RequestMethod.POST)
	public String changeForgotPasswordUpdate(HttpServletRequest request) throws IOException {
		String customerId = request.getParameter("customerId");
		String newpassword = request.getParameter("newpassword");
		Customer customer = customerService.findByCustomerId(customerId);
		customer.setPassword(newpassword);
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

		Calendar cal = Calendar.getInstance();

		Date d = cal.getTime();

		customer.setUpdatedDate(sdf.format(d));
		customerService.updateCustomerDetails(customer);
		EmailTemplate emailTemplate = emailTemplateService.getEmailTemplateByTitleAndAdmin(customer.getAdmin().getAdminId(), "Password Changed Notification");
		String bodyContent = emailTemplate.getTemplate();
		String replacedBodyContent = bodyContent.replace("{FIRST_NAME}", customer.getFirstName()).replace("{DATE_TIME}",
				sdf.format(d));
		System.out.println("replacedBodyContent in changepassword====="+replacedBodyContent);
		try { 
			SendMail.send("info@remitz.co.uk", customer.getEmailId(), emailTemplate.getSubject(),
		  hederContent + bodyStartsContent + replacedBodyContent + bodyEndContent +
		  footerContent); 
			} catch (Exception e) { 
				e.printStackTrace();
				}

		return "redirect:updatepwdinuser?custId=" + customerId + "&pwd=" + newpassword;
	}

	
	
	@RequestMapping(value = { "/changeforgotpasswordupdateSuccess" }, method = { RequestMethod.GET })
	public ModelAndView changeforgotpasswordupdateSuccess(HttpServletRequest request) {
		ModelAndView mav=new ModelAndView("changeforgotpasswordupdateSuccess");
		mav.setViewName("changeforgotpasswordupdateSuccess");
		return mav=new ModelAndView("changeforgotpasswordupdateSuccess");
	}
	
	
	
	@GetMapping("/frontendfooter")
	public ModelAndView frontendfooterpage(HttpServletRequest request) {
		ModelAndView mav=new ModelAndView("frontendfooter");
		mav.setViewName("frontendfooter");
		System.out.println("adminId==="+adminId);
		//String adminId=sessionDataService.getAdminId(request.getSession());
		Admin admin=adminService.getAdminDetailsBasedOnAdminId(adminId);
		mav.addObject("admin", admin);
		
		return mav;
		
	}

    @GetMapping("getBanksBasedOnCountry")
	@ResponseBody 
    public List<Banks> getBanksBasedOnCountry(@RequestParam("countryISO")String countryISO){
		 System.out.println("countryIso  in demo server===="+countryISO);
   	 List<Banks> bankList = bankService.getBanksList(countryISO);
		 System.out.println("bankList==="+bankList);
   	 return bankList;
	 }
    
    
    
    
    @GetMapping("getIdTypesBasedOnCountry")
	@ResponseBody 
    public List<SenderIds> getIdTypesBasedOnCountry(@RequestParam("branchId")String branchId){
System.out.println("branchId===="+branchId);
Branch branch=branchService.getBranchBasedOnBranchId(branchId);
    	List<SenderIds> idList=senderIdTypeService.findByBranchAndAdminAndFunctionality(branchId, branch.getAdmin().getAdminId(), "sending");
    System.out.println("idList====="+idList);
    	return idList;
    }
	
	
	
}