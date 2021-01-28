package com.kws.unitedfintech.controller;

import java.net.InetAddress;
import java.net.UnknownHostException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.Instant;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.TimeZone;
import java.util.stream.Collectors;

import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.tomcat.util.net.openssl.ciphers.Authentication;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.web.authentication.logout.SecurityContextLogoutHandler;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.kws.unitedfintech.entities.AccessLog;
import com.kws.unitedfintech.entities.Admin;
import com.kws.unitedfintech.entities.AdminSellRates;
import com.kws.unitedfintech.entities.AgentDeposit;
import com.kws.unitedfintech.entities.AuditTrail;
import com.kws.unitedfintech.entities.BankIssuerCode;
import com.kws.unitedfintech.entities.Beneficiary;
import com.kws.unitedfintech.entities.Branch;
import com.kws.unitedfintech.entities.BranchPaymentTypeDetails;
import com.kws.unitedfintech.entities.Cash;
import com.kws.unitedfintech.entities.Country;
import com.kws.unitedfintech.entities.Customer;
import com.kws.unitedfintech.entities.EmailTemplate;
import com.kws.unitedfintech.entities.ModeOfPaymentFees;
import com.kws.unitedfintech.entities.ModeOfPayments;
import com.kws.unitedfintech.entities.PaymentTypes;
import com.kws.unitedfintech.entities.PurposeCodes;
import com.kws.unitedfintech.entities.RealationShips1;
import com.kws.unitedfintech.entities.ReasonForTransfer;
import com.kws.unitedfintech.entities.Relationship;
import com.kws.unitedfintech.entities.SenderIdType;
import com.kws.unitedfintech.entities.SenderIds;
import com.kws.unitedfintech.entities.SourceOfFund;
import com.kws.unitedfintech.entities.SourceOfFunds1;
import com.kws.unitedfintech.entities.States;
import com.kws.unitedfintech.entities.TransactionInformation;
import com.kws.unitedfintech.entities.User;
import com.kws.unitedfintech.helpers.EmailTemplateHeaderFooterUtil;
import com.kws.unitedfintech.helpers.SendMail;
import com.kws.unitedfintech.helpers.SendMoneyCalculator;
import com.kws.unitedfintech.modelclasses.FrontEndTranscationInfoModelClass;
import com.kws.unitedfintech.repository.UserRepository;
import com.kws.unitedfintech.service.AccessLogService;
import com.kws.unitedfintech.service.AdminService;
import com.kws.unitedfintech.service.AgentDepositService;
import com.kws.unitedfintech.service.AuditTrailService;
import com.kws.unitedfintech.service.BeneficiaryService;
import com.kws.unitedfintech.service.BranchPaymentTypeDetailsService;
import com.kws.unitedfintech.service.BranchService;
import com.kws.unitedfintech.service.CountryService;
import com.kws.unitedfintech.service.CurrencyRateService;
import com.kws.unitedfintech.service.CustomerService;
import com.kws.unitedfintech.service.EmailTemplateService;
import com.kws.unitedfintech.service.IDProofService;
import com.kws.unitedfintech.service.IssuerCodeService;
import com.kws.unitedfintech.service.ModeOfPaymentFeeService;
import com.kws.unitedfintech.service.ModeOfPaymentsService;
import com.kws.unitedfintech.service.PaymentTypesService;
import com.kws.unitedfintech.service.PurposeCodeService;
import com.kws.unitedfintech.service.RealationShips1Service;
import com.kws.unitedfintech.service.ReasonForTransferService;
import com.kws.unitedfintech.service.RelationshipService;
import com.kws.unitedfintech.service.SenderIdTypeService;
import com.kws.unitedfintech.service.SessionDataService;
import com.kws.unitedfintech.service.SourceOfFundService;
import com.kws.unitedfintech.service.SourceOfFundsService;
import com.kws.unitedfintech.service.StatesService;
import com.kws.unitedfintech.service.TransactionInformationService;
import com.kws.unitedfintech.service.cashService;

@Controller
@RestController
public class Ctrl {

	@Autowired
	private AuditTrailService auditTrailService;
	
	@Autowired
	private AgentDepositService adp;
	@Autowired
	private UserRepository userRepository;

	@Autowired
	private AccessLogService accessLogService;
	
	@Autowired
	private cashService cashService;
	
	@Autowired
	private SenderIdTypeService senderIdTypeService;
	
	@Autowired
	private ModeOfPaymentFeeService modeOfPaymentFeeService;

	@Autowired
	private CurrencyRateService currencyRateService;
	@Autowired
	private PaymentTypesService paymentTypesService;

	@Autowired
	private SourceOfFundsService sourceOfFundsService;
	
	@Autowired
	private RealationShips1Service realationShips1Service;
	
	@Autowired
	private ReasonForTransferService reasonForTransferService;
	
	@Autowired
	private AdminService adminService;
	@Autowired
	private ModeOfPaymentsService modeOfPaymentsService;

	@Autowired
	private BranchPaymentTypeDetailsService branchPaymentTypeDetailsService;
	@Autowired
	private BranchService branchService;
	@Autowired
	private IDProofService iDProofService;
	@Autowired
	private SourceOfFundService sourceOfFundService;

	@Autowired
	private PurposeCodeService purposeCodeService;
	@Autowired
	private RelationshipService relationshipService;

	@Autowired
	private StatesService statesService;
	@Autowired
	private CountryService countryService;
	@Autowired
	private SessionDataService sessionDataService;

	@Autowired
	private BeneficiaryService beneficiaryService;

	@Autowired
	private CustomerService customerService;

	@Autowired
	private IssuerCodeService issuerCodeService;

	@Autowired
	private TransactionInformationService transactionInformationService;
	@Autowired
	private EmailTemplateService emailTemplateService;

	private String role = "";
	String hederContent = EmailTemplateHeaderFooterUtil.getStaticEmailHeaderContent();
	String bodyStartsContent = EmailTemplateHeaderFooterUtil.getStaticEmailBodyStartContent();
	String bodyEndContent = EmailTemplateHeaderFooterUtil.getStaticEmailBodyEndsContent();
	String footerContent = EmailTemplateHeaderFooterUtil.getStaticEmailFooterContent();

	@GetMapping("/admin")
	public ModelAndView admin(HttpServletRequest request) {
		ModelAndView modelAndView = new ModelAndView();
        String adminId=sessionDataService.getAdminId(request.getSession());
        Admin admin=adminService.getAdminDetailsBasedOnAdminId(adminId);
        if(!admin.getCompanyName().equals("")) {
        	modelAndView.setViewName("redirect:admindashbord");
        }else {
        	modelAndView.setViewName("redirect:remitadminupdate");
        }
		return modelAndView;
	}
	@RequestMapping("admindashbord")
	public ModelAndView getAdmindashborad(HttpServletRequest request) {
		ModelAndView modelAndView=new ModelAndView();
		String adminId=sessionDataService.getAdminId(request.getSession());
        Admin admin=adminService.getAdminDetailsBasedOnAdminId(adminId);
        System.out.println("admin:::"+admin.getFlutter());
        sessionDataService.storeFlutterStatus(request.getSession(), admin.getFlutter());
        String flutter=sessionDataService.getFlutterStatus(request.getSession());
    	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
    	TimeZone timeZone = TimeZone.getTimeZone("IST");
    	Calendar cal = Calendar.getInstance();
    	Date d = cal.getTime();
        String trialdate=sdf.format(d);
        if(admin.getPackages().equals("trail")) {
        Admin a=adminService.gettrialDate(trialdate, adminId);
       System.out.println("a====="+a);
       if(a!=null) {
           modelAndView.setViewName("trialexpire");
       }else {
           modelAndView.setViewName("admindashbord");

       }
        }else {
        modelAndView.setViewName("admindashbord");
		modelAndView.addObject("admin",admin);
		modelAndView.addObject("flutter", flutter);
        }
		return modelAndView;
	}


	@GetMapping("/user")
	public String user() {
		return "<h2>Welcome Useryyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy!</h2> <a href='/logout'>logout</a>";
	}

	@GetMapping("/doTransaction")
	public ModelAndView getSuperAdmin(String role,HttpServletRequest request) {

		HttpSession session=request.getSession();
		 ModelAndView modelAndView=new ModelAndView();
		 Branch branch=new Branch();
		 List<Branch> list=branchService.getAll();
		System.out.println("firstlist.......:::"+list);
		 String functionality=(String)session.getAttribute("branchFunctionality");
		 Branch brdetails=(Branch)session.getAttribute("branch");
		 String brancid=(String)session.getAttribute("branchid");
		System.out.println("brancid======"+brancid);
		Branch branch1=branchService.getBranchBasedOnBranchId(brancid);
		List<ReasonForTransfer> pcodes=reasonForTransferService.findByAdmin(branch1.getAdmin().getAdminId());
		List<RealationShips1> rcodes=realationShips1Service.RelationshipsListBasedOnAdmin(branch1.getAdmin().getAdminId());
		List<SourceOfFunds1> fundcodes = sourceOfFundsService.SourceOfFundsListBasedOnAdmin(branch1.getAdmin().getAdminId());
		 List<ModeOfPaymentFees> moplist=modeOfPaymentsService.getModeOfPaymentFeeBasedOnBranchIdAndDisplay(brancid, "frontend");
		 System.out.println("brancid=="+brancid);
		 System.out.println("mopslist===="+moplist);
		 double totalDeposits=0;
		 double totalAmounttopay=0;
		 double totalAgentfee=0;
		 double total=0;
		 List<AgentDeposit> ad=adp.getByBranch(brancid,"approved");
		 for(int i=0;i<ad.size();i++) {
			 AgentDeposit a=ad.get(i);
			 totalDeposits=totalDeposits+Double.parseDouble(a.getDepositAmount()); 
		 }
		 List<TransactionInformation> tl=transactionInformationService.getByFromBranch(brancid);
		 System.out.println("tl====="+tl.size());
		 for(int i=0;i<tl.size();i++) {
			 TransactionInformation t=tl.get(i);
			 totalAgentfee=totalAgentfee+Double.parseDouble(t.getAgentFee()); 
			 total=total+t.getTotalAmountCollected();
		 }
		 totalAmounttopay= total-totalAgentfee;
		 totalDeposits=totalDeposits-totalAmounttopay;
			List<SenderIds> ids=senderIdTypeService.findByBranchAndAdminAndFunctionality(brancid, branch1.getAdmin().getAdminId(), "receiving");
			List<States> states=statesService.getAllStatesByCountryIso(branch1.getFromCountry().getCountryISO());
			modelAndView.addObject("states", states);		
			modelAndView.addObject("branch", branch1);
			modelAndView.addObject("countryISo", branch1.getFromCountry().getCountryISO());
			modelAndView.addObject("ids", ids);

		 if(functionality.equals("sending")||functionality.equals("both"))
			 {
				String txid=request.getParameter("txid");
				System.out.println("txid====="+txid);
				if(txid!=null) {
			System.out.println("if condition");
				TransactionInformation tx=transactionInformationService.findByTransactionId(txid);
				List<ModeOfPaymentFees> mopList=	modeOfPaymentsService.getList(brancid, "frontend",1000.0);
				List<BranchPaymentTypeDetails> bpt=branchPaymentTypeDetailsService.getBranchPaymentTypeDetailsBasedOnBranchIdAndStatus(brancid, "active");				
				List<Branch> b=branchService.getBranchesBasedOnFunctionalityAndAdminId(tx.getAdmin().getAdminId(), "sending");
				modelAndView.addObject("b", b);
				modelAndView.addObject("bpt", bpt);
				modelAndView.addObject("txid",txid);
				System.out.println("bpt====="+bpt.size());
				modelAndView.addObject("tx", tx);
				modelAndView.addObject("mopList", mopList);
				}
				modelAndView.addObject("moplist", moplist);
		modelAndView.addObject("countryIso", branch1.getFromCountry().getCountryISO());
		 modelAndView.addObject("list", list);
		 modelAndView.addObject("countryName", branch1.getFromCountry().getCountryName());
		 modelAndView.addObject("functionality",functionality);
		 modelAndView.addObject("branchid", brancid);
		 modelAndView.addObject("totalDeposits", totalDeposits);
		 modelAndView.addObject("totalAmounttopay", totalAmounttopay);
		 modelAndView.addObject("branchDetails", brdetails);
		modelAndView.addObject("pcodes",pcodes);
		modelAndView.addObject("rcodes",rcodes);
		 modelAndView.addObject("fundcodes", fundcodes);
		 modelAndView.setViewName("branch_dashboard");
			 }
			 if(functionality.equals("receiving"))
			 {
				 modelAndView.setViewName("RbranchDashboard");
			 }
		return modelAndView;
	}


	
	@RequestMapping(value = { "newlogin" }, method = { RequestMethod.POST, RequestMethod.GET })
	public ModelAndView newlogin(HttpServletRequest request,
			@ModelAttribute FrontEndTranscationInfoModelClass model) {
		System.out.println("model from new login is = " + model);
		String adminId=sessionDataService.getAdminId(request.getSession());
		Admin admin=adminService.getAdminDetailsBasedOnAdminId(adminId);
		ModelAndView mav = null;
		mav=new ModelAndView("login");
		mav.addObject("sendingAmount", model.getSendingAmount());
		mav.addObject("sendingBranch", model.getSendingBranch());
		mav.addObject("receivingBranch", model.getReceivingBranch());
		mav.addObject("paymentType", model.getPaymentType());
		mav.addObject("modeOfPayment", model.getModeOfPayment());
		mav.addObject("receivingAmount", model.getReceivingAmount());
		mav.addObject("adminId", admin.getAdminId());
		mav.addObject("admin", admin);
		mav.addObject("deliveryTime", model.getDeliveryTime());
		System.out.println("deliveryTime......"+model.getDeliveryTime());
		mav.addObject("model", model);

		return mav;
	}
	
	@RequestMapping(value = {"login"}, method = { RequestMethod.POST, RequestMethod.GET })
	public @ResponseBody ModelAndView loginPage(@RequestParam(value = "error", required = false) String error,
			@RequestParam(value = "logout", required = false) String logout, HttpServletRequest request,
			HttpServletRequest response) throws UnknownHostException {
		ModelAndView modelAndView = new ModelAndView();
		String errorMessge = null;
		String adminId = sessionDataService.getAdminId(request.getSession());
		Admin admin=adminService.getAdminDetailsBasedOnAdminId(adminId);
		String adminLogo = sessionDataService.getAdminLogo(request.getSession());
		System.out.println("admin====="+admin);

		org.springframework.security.core.Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		if (auth != null) {
System.out.println("auth::::::" + auth.getName());
		}
		if (error != null) {
			errorMessge = "Usernamerrrrrrrrrrrr or Password is incorrect !!";//oyintest18@gmail.com 123
		}
		if (logout != null) {
			errorMessge = "You have been successfully logged out !!";
		}
		modelAndView.addObject("errorMessge", errorMessge);
		modelAndView.setViewName("login");
		//String adminId = sessionDataService.getAdminId(request.getSession());
		//Admin admin=adminService.getAdminDetailsBasedOnAdminId(adminId);
		//String adminLogo = sessionDataService.getAdminLogo(request.getSession());
		System.out.println("admin====="+admin);
		modelAndView.addObject("adminId", adminId);
		modelAndView.addObject("admin", admin);
		//System.out.println("adminId===="+adminId);
		//System.out.println("adminLogo===="+adminLogo);
		//modelAndView.addObject("companyName", admin.getCompanyName());
		return modelAndView;
	}

		
	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String logoutPage(HttpServletRequest request, HttpServletResponse response) {
		String userId = sessionDataService.getAdminId(request.getSession());
		System.out.println("userId======"+userId);
		//Admin admin=adminService.getAdminDetailsBasedOnAdminId(adminId);

		org.springframework.security.core.Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		if (auth != null) {
			new SecurityContextLogoutHandler().logout(request, response, auth);
			System.out.println("auth::::::" + auth);
		}
		return "redirect:/login?logout=true";
	}

	@RequestMapping(value = "/home", method = RequestMethod.GET)
	public ModelAndView getHomePage() {
		ModelAndView modelAndView = new ModelAndView();
		System.out.println("Request Came to Dashboard page:::");
		modelAndView.setViewName("index");
		return modelAndView;
	}

	@GetMapping(value = "/superadmin")
	public ModelAndView getSuperadminDashborad(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		HttpSession session = request.getSession(false);
		System.out.println("superadminid in controller" + session.getAttribute("superadminid"));
		List<PaymentTypes> pTypesList = null;
		List<ModeOfPayments> pModes = null;
		pTypesList = new ArrayList<PaymentTypes>();
		pTypesList = paymentTypesService.getAllPaymentTypes();
		pTypesList.forEach(pt -> pt.getPaymentType());

		pModes = new ArrayList<ModeOfPayments>();
		pModes = modeOfPaymentsService.getAllModeOfPaymets();

		mav.addObject("pTypesList", pTypesList);
		mav.addObject("pModes", pModes);
		mav.setViewName("adminRegistration");
		return mav;
	}

	@GetMapping(value = "/brAgent")
	public ModelAndView getBranchAgentDashboard(HttpSession session, HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		session = request.getSession(false);

		System.out.println("agent id:" + session.getAttribute("agentid"));
		mav.setViewName("BranchAgentDashboards");
		return mav;
	}

	@RequestMapping(value = { "transactions" }, method = { RequestMethod.GET })
	public @ResponseBody ModelAndView gettransactions(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		List<TransactionInformation> txnList = null;
		String customerId = sessionDataService.getCustomerId(request.getSession());
		Customer customer=customerService.findByCustomerId(customerId);
		// String adminKey=sessionDataService.getAdminKey(request.getSession());
		if (customerId != null) {
			mav.setViewName("transactions");
			txnList = new ArrayList<TransactionInformation>();
			txnList = transactionInformationService.getTransactionDetailsBasedOnCustomerId(customerId);
			// List<TopUpTransaction> topUpTransactionList =
			// topUpTransactionService.getTopUpTransactionsBasedOnCustomerId(customerId);
			mav.addObject("txnList", txnList);
			mav.addObject("admin", customer.getAdmin());
			mav.addObject("customerId", customerId);
			// mav.addObject("topUpTransactionList",topUpTransactionList);
			Map<String, List<TransactionInformation>> map = new HashMap<String, List<TransactionInformation>>();
			// map=txnList.stream().collect(Collectors.groupingBy(TransactionInformation ::
			// getTransactionDate));
			map = txnList.stream().collect(Collectors.groupingBy(TransactionInformation::getTransactionId));

			// map.forEach((s,l)->System.out.println("tranasction list is =
			// "+s+"\n"+l.get(index))));
			mav.addObject("txnlistmap", map);
		} else {
			mav = new ModelAndView("redirect:/");
		}
		return mav;
	}

	@GetMapping("/getTransactionListBasedOCustomerId")
	@ResponseBody
	public ModelAndView getTransactionList(HttpServletRequest request) {
		String customerId = sessionDataService.getCustomerId(request.getSession());
		List<TransactionInformation> txnList = null;
		System.out.println("customerId....." + customerId);
		Customer customer=customerService.findByCustomerId(customerId);
ModelAndView mav=new ModelAndView();
		if (customerId != null && !customerId.contentEquals("")) {
			txnList = transactionInformationService.getTransactionDetailsBasedOnCustomerId(customerId);
			System.out.println("txnList......" + txnList);
		mav.addObject("admin", customer.getAdmin());
		mav.addObject("txnList", txnList);
		}
		return mav;

	}

	@RequestMapping(value = { "/fulldetailmt" }, method = { RequestMethod.GET })
	public ModelAndView getfulldetailmt(HttpServletRequest request, ModelMap map, @RequestParam String txnid) {
		System.out.println("hiii this is from full detail mt");
		ModelAndView mav = new ModelAndView();
		mav.setViewName("fulldetailmt");
		String customerId = sessionDataService.getCustomerId(request.getSession());
		Customer customer=customerService.findByCustomerId(customerId);
		if (customerId != null && !customerId.equals("")) {
			TransactionInformation ti = transactionInformationService.getTransactionDetails(txnid);
			System.out.println("ti is = " + ti);
			mav.addObject("txnDetail", ti);
			mav.addObject("admin", customer.getAdmin());
			return mav;
		} else {
			return mav = new ModelAndView("redirect:/");
		}

	}

	@RequestMapping(value = { "/viewprofile" }, method = { RequestMethod.GET })
	public ModelAndView getviewprofile(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		String customerId = sessionDataService.getCustomerId(request.getSession());
		if (customerId != null) {
			mav.setViewName("viewprofile");
			Customer customer = customerService.findByCustomerId(customerId);
			System.out.println("customer........." + customer);
			sessionDataService.storeCustomerInfo(request.getSession(), customer);
			String countryISO = customer.getCountry().getCountryISO();
			System.out.println("countryIso......." + countryISO);
			Admin admin=customer.getAdmin();
			System.out.println("admin==="+customer.getAdmin());
			List<States> list = statesService.getAllStatesByCountryIso(countryISO);

			System.out.println("list....." + list);
			mav.addObject("list", list);
			mav.addObject("admin", admin);
			mav.addObject("customer", customer);
		} else {
			mav = new ModelAndView("redirect:/");
		}
		return mav;
	}

	@RequestMapping(value = "updatemyaccountcustomer", method = RequestMethod.POST)
	public ModelAndView updateMyAccountCustomer(HttpServletRequest request, @ModelAttribute Customer customer)
			throws UnknownHostException {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("viewprofile");
		String customerId = sessionDataService.getCustomerId(request.getSession());
		Customer c = customerService.findByCustomerId(customerId);
		if (customerId != null) {
			String firstName = request.getParameter("firstName");
			String lastName = request.getParameter("lastName");
			String emailId = request.getParameter("emailId");
			String dob = c.getDob();
			String mobileNumber = request.getParameter("mobileNumber");
			String postalCode = request.getParameter("postalCode");
			String occupation = request.getParameter("occupation");
			customerService.updateCustomer(customerId, occupation, firstName, lastName, emailId, dob, mobileNumber,
					postalCode);
			return mav = new ModelAndView("redirect:viewprofile");
		} else {
			return mav = new ModelAndView("redirect:/?session expired");
		}
	}

	@RequestMapping(value = { "/recipients" }, method = { RequestMethod.GET })
	public ModelAndView getrecipients(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		String custId = sessionDataService.getCustomerId(request.getSession());
		if (custId != null) {
			Customer customer=customerService.findByCustomerId(custId);
			Admin admin=customer.getAdmin();
			
			mav.setViewName("/recipients");
			List<Beneficiary> list = beneficiaryService.getAllBeneficiarys(custId);
			System.out.println("list of beneficiary...." + list);
			mav.addObject("list", list);
			mav.addObject("admin", admin);
		} else {
			mav = new ModelAndView("redirect:/?session expire");
		}
		return mav;
	}

	@RequestMapping(value = { "/addrecipient" }, method = { RequestMethod.GET })
	public ModelAndView getnewrecipient(HttpServletRequest request) {
		ModelAndView mav = null;
		String custId = sessionDataService.getCustomerId(request.getSession());
		if (custId != null) {
			Customer c = customerService.findByCustomerId(custId);
			String adminId = c.getAdmin().getAdminId();
			System.out.println("adminId....." + adminId);
			List<RealationShips1> relationshipList = realationShips1Service.RelationshipsListBasedOnAdmin(c.getAdmin().getAdminId());
			// List<Country> list = countryService.getAllCountries();
			List<Branch> list = branchService.getAllReceiveingBranchesBasedOnAdmin(adminId);
			System.out.println("list of branches....." + list);
			String countryISo = c.getCountry().getCountryISO();
			System.out.println("countryISo....." + countryISo);
			List<BankIssuerCode> bankslist = issuerCodeService.getBankIssuerCodeList(c.getCountry().getCountryISO());
			System.out.println("banks in addreceipent...." + bankslist);
			List<SenderIdType> idList = iDProofService.getIdProof();
			List<Cash> clist=cashService.getListByAdmin(c.getAdmin().getAdminId());
			mav = new ModelAndView("myacc_recipient");
			mav.addObject("idList", idList);
			mav.addObject("clist", clist);
			mav.addObject("relationshipList", relationshipList);
			mav.addObject("list", list);
			mav.addObject("admin", c.getAdmin());
			mav.addObject("bankslist", bankslist);

		} else {
			mav = new ModelAndView("redirect:/?session expired");
		}
		return mav;
	}

	@RequestMapping(value = "addnewbene", method = RequestMethod.POST)
	public ModelAndView saveBeneDetals(HttpServletRequest request, @ModelAttribute Beneficiary beneficiary) {
		System.out.println("beneficiary = =" + beneficiary);
		ModelAndView mav = new ModelAndView();
		String customerId = sessionDataService.getCustomerId(request.getSession());
		if (customerId != null && !customerId.equals("")) {
			Customer customer = customerService.findByCustomerId(customerId);

			Admin admin = adminService.getAdminDetailsBasedOnAdminId(customer.getAdmin().getAdminId());
            String bankName=request.getParameter("bankName");
            beneficiary.setBankName(bankName.split(",")[0]); 
			beneficiary.setAdmin(admin);
			beneficiary.setCustomer(customer);
			String countryISO = request.getParameter("countryISO");
			Country country = countryService.getCountryBasedOnIso(countryISO.split(",")[0]);
			beneficiary.setBeneficiaryCountry(country);
			beneficiaryService.saveReceipentDetails(beneficiary);

		} else {
			return mav = new ModelAndView("redirect:/");
		}
		return mav = new ModelAndView("redirect:recipients");
	}

	@RequestMapping(value = { "/deleterecipient" }, method = { RequestMethod.GET })
	public ModelAndView deleterecipient(HttpServletRequest request) {
		ModelAndView mav = null;
		String custId = sessionDataService.getCustomerId(request.getSession());
		if (custId != null) {
			Customer c = customerService.findByCustomerId(custId);
			String beneficiaryId = request.getParameter("beneficiaryId");
			System.out.println("beneficiaryId....." + beneficiaryId);
			beneficiaryService.deleteByBeneficiaryId(beneficiaryId);

		}
		return mav = new ModelAndView("redirect:recipients");
	}

	@RequestMapping(value = { "/editrecipient" }, method = { RequestMethod.GET })
	public ModelAndView editrecipients(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		String custId = sessionDataService.getCustomerId(request.getSession());
		if (custId != null) {
			mav.setViewName("/editrecipient");
			String beneficiaryId = request.getParameter("beneficiaryId");
			System.out.println("beneficiaryId....." + beneficiaryId);
			Beneficiary beneficiary = beneficiaryService.getBeneficiaryDetails(beneficiaryId);
			System.out.println("list of beneficiary...." + beneficiary);
			Customer c = customerService.findByCustomerId(custId);
			String adminId = c.getAdmin().getAdminId();
			System.out.println("adminId....." + adminId);
			List<RealationShips1> relationshipList =realationShips1Service.RelationshipsListBasedOnAdmin(adminId);
			List<Branch> list = branchService.getAllReceiveingBranchesBasedOnAdmin(adminId);
			System.out.println("list of branches....." + list);
			List<Cash> clist=cashService.getListByAdmin(adminId);
			mav.addObject("clist", clist);
			//List<SenderIds> idList =senderIdTypeService.findByBranchAndAdminAndFunctionality(branchId, adminId, "sending");
			mav.addObject("beneficiary", beneficiary);
			//mav.addObject("idList", idList);
			mav.addObject("list", list);
			mav.addObject("admin", c.getAdmin());
			mav.addObject("accountHolderName", beneficiary.getAccountHolderName());
			mav.addObject("addressLine1", beneficiary.getAddressLine1());
			mav.addObject("bankBranchCode", beneficiary.getBankBranchCode());
			mav.addObject("bankId", beneficiary.getBankId());
			mav.addObject("beneficiaryCountry", beneficiary.getBeneficiaryCountry());
			mav.addObject("accountHolderName", beneficiary.getAccountHolderName());
			mav.addObject("benificiaryStatus", beneficiary.getBenificiaryStatus());
			mav.addObject("createdBy", beneficiary.getCreatedBy());
			mav.addObject("gender", beneficiary.getGender());
			mav.addObject("createdDate", beneficiary.getCreatedDate());
			mav.addObject("beneficiary", beneficiary);
			mav.addObject("relationshipList", relationshipList);
		} else {
			mav = new ModelAndView("redirect:/?session expire");
		}
		return mav;
	}

	@RequestMapping(value = "editnewbene", method = RequestMethod.POST)
	public ModelAndView editBeneDetals(HttpServletRequest request, @ModelAttribute Beneficiary beneficiary) {
		System.out.println("beneficiary = =" + beneficiary);
		ModelAndView mav = new ModelAndView();
		String customerId = sessionDataService.getCustomerId(request.getSession());
		if (customerId != null && !customerId.equals("")) {
			System.out.println("edit is working");
			Customer customer = customerService.findByCustomerId(customerId);
			String beneficiaryCountry = request.getParameter("countryISo");
			Admin admin = adminService.getAdminDetailsBasedOnAdminId(customer.getAdmin().getAdminId());
			beneficiary.setAdmin(admin);
			beneficiary.setCustomer(customer);
			beneficiary.setAddressLine2("2");
			String countryISO = request.getParameter("countryISO");
			Country country = countryService.getCountryBasedOnIso(countryISO.split(",")[0]);
			beneficiary.setBeneficiaryCountry(country);
			beneficiaryService.editBeneficiaryDetails(beneficiary);
			System.out.println("after edit....." + beneficiary);
			mav.addObject("beneficiaryId", beneficiary.getBeneficiaryId());

		} else {
			return mav = new ModelAndView("redirect:/");
		}
		return mav = new ModelAndView("redirect:recipients");
	}

	@RequestMapping(value = { "/doc" }, method = { RequestMethod.GET })
	public ModelAndView getdocuments1(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		String custId = sessionDataService.getCustomerId(request.getSession());
		if (custId != null) {
			mav.setViewName("doc");
			Customer customer = customerService.findByCustomerId(custId);
			List<Country> list = countryService.getAllCountries();
			// List<States> list =
			// statesService.getAllStatesByCountryIso(customer.getCountry().getCountryISO());
			List<SenderIds> ids=senderIdTypeService.findByBranchAndAdminAndFunctionality(customer.getBranch().getBranchId(),customer.getAdmin().getAdminId(), "receiving");
			System.out.println("branchId===="+customer.getBranch().getBranchId());
			System.out.println("ids===="+ids);
			mav.addObject("ids", ids);

			mav.addObject("customer", customer);
			mav.addObject("admin", customer.getAdmin());
			mav.addObject("list", list);
		} else {
			mav = new ModelAndView("redirect:/?session expired");
		}

		return mav;
	}

	@RequestMapping(value = "updatecustomerId", method = RequestMethod.POST)
	public ModelAndView updateCustomerId(HttpServletRequest request,
			MultipartHttpServletRequest multipartHttpServletRequest, @ModelAttribute Customer customer)
			throws UnknownHostException {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("doc");

		String custId = sessionDataService.getCustomerId(request.getSession());
		String firstName = sessionDataService.getCustomerName(request.getSession());
		String emailId = sessionDataService.getCustomerEmailId(request.getSession());
		if (custId != null) {
			Customer c = customerService.findByCustomerId(custId);
			String idIndexNo = request.getParameter("indexno");
			customer.setIdIndexNo(idIndexNo);
			customer.setIssuingCountry(c.getIssuingCountry());
			customer.setAdmin(c.getAdmin());
			customer.setBranch(c.getBranch());
			customer.setCreatedDate(c.getCreatedDate());
			customer.setCustomerDetailsFlag(c.getCustomerDetailsFlag());
			customer.setUpdatedDate(c.getUpdatedDate());
			customer.setCountry(c.getCountry());
			customer.setFirstIdProofStatus("yes");
			customer.setFirstIdIssueDate(request.getParameter("firstIdIssueDate"));
			customer.setFirstIdExpireDate(request.getParameter("firstIdExpireDate"));
			customer.setFirstIdNumber(request.getParameter("firstIdNumber"));
			customer.setFirstIdProofType((request.getParameter("firstIdProofType")).split(",")[0]);
			customer.setFirstIdProofDoc(request.getParameter("firstIdProofDoc"));
			customer.setSecondIdExpireDate(request.getParameter("secondIdExpireDate"));
			customer.setSecondIdIssueDate(request.getParameter("secondIdIssueDate"));
			customer.setSecondIdNumber(request.getParameter("secondIdNumber"));
			customer.setSecondIdProofType(request.getParameter("secondIdProofType"));
			customer.setSecondIdProofDoc(request.getParameter("secondIdProofDoc"));
			// customer.setIssuingCorequntry(c.getIssuingCountry());
			// System.out.println("issuing country......"+c.getCountry());
			System.out.println("countryiso.....in update ..." + c.getCountry());

			if (idIndexNo != null && idIndexNo != "") {
				customer.setIssuingCountry(c.getIssuingCountry());
			} else {

				Country idProofIssuedCountry = countryService
						.getCountryBasedOnIso(request.getParameter("issuingCountry"));
				customer.setSecondIdExpireDate(c.getSecondIdExpireDate());
				customer.setSecondIdIssueDate(c.getSecondIdIssueDate());
				customer.setSecondIdNumber(c.getSecondIdNumber());
				customer.setSecondIdProofDoc(c.getSecondIdProofDoc());
				customer.setSecondIdProofType(c.getSecondIdProofType());
				customer.setIssuingCountry(idProofIssuedCountry);
				System.out.println("idProofIssuedCountry......" + idProofIssuedCountry);
			}

			customer.setCustomerId(custId);
			customerService.updateCustomerDetailsWithIDImage(customer, multipartHttpServletRequest);
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


			return mav = new ModelAndView("redirect:doc");

		} else {
			return mav = new ModelAndView("redirect:/?session expired");
		}
	}

	@RequestMapping(value = "updateSecondIdProof", method = RequestMethod.POST)

	public ModelAndView updateId(MultipartHttpServletRequest multipartHttpServletRequest, HttpServletRequest req) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("doc");
		String customerId = sessionDataService.getCustomerId(req.getSession());
		if (customerId != null) {
			Customer customer = customerService.findByCustomerId(customerId);
			customer.setSecondIdExpireDate(req.getParameter("secondIdExpireDate"));
			customer.setSecondIdIssueDate(req.getParameter("secondIdIssueDate"));
			customer.setSecondIdNumber(req.getParameter("secondIdNumber"));
			customer.setSecondIdProofType(req.getParameter("secondIdProofType"));
			customer.setSecondIdProofStatus("yes");
			System.out.println("customerId in update id...." + customerId);
			customerService.updateSecondId(customer, multipartHttpServletRequest);
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



			return mav = new ModelAndView("redirect:doc");
		} else {
			return mav = new ModelAndView("redirect:/?session expired");
		}

	}

	@RequestMapping(value = "uploadidproofimage", method = RequestMethod.POST)
	public String uploadIdProofImage(HttpServletRequest request,
			MultipartHttpServletRequest multipartHttpServletRequest) throws UnknownHostException {
		String custId = sessionDataService.getCustomerId(request.getSession());
		if (custId != null) {
			Customer customer = customerService.findByCustomerId(custId);
			String indexno = request.getParameter("indexno");
			customer.setIdIndexNo(indexno);
			customerService.updateCustomerDetailsWithIDImage(customer, multipartHttpServletRequest);
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


			return "redirect:doc";
		} else {
			return "redirect:index?session expired";
		}
	}

	@RequestMapping(value = "uploadidproofimageforuploadlater", method = RequestMethod.POST)
	public ModelAndView uploadIdProofImageForUploadLater(HttpServletRequest request,
			MultipartHttpServletRequest multipartHttpServletRequest) throws UnknownHostException {
		String custId = sessionDataService.getCustomerId(request.getSession());
		ModelAndView mav = new ModelAndView();
		if (custId != null) {
			Customer customer = customerService.findByCustomerId(custId);
			String flag = request.getParameter("idUploadLaterFlag");
			// customer.setIdUploadLaterFlag(flag);
			customer.setUpdatedDate(customer.getUpdatedDate());
			customer.setIpAddress(customer.getIpAddress());
			customerService.updateCustomerDetailsWithIDImage(customer, multipartHttpServletRequest);
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



			return mav = new ModelAndView("redirect:transactions");
		} else {
			return mav = new ModelAndView("redirect:index?session expired");
		}
	}

	/*
	 * @RequestMapping(value = { "newrecipient1" }, method = { RequestMethod.POST,
	 * RequestMethod.GET }) public ModelAndView getrecipient(HttpServletRequest
	 * request,
	 * 
	 * @ModelAttribute FrontEndTranscationInfoModelClass model) {
	 * System.out.println("model from new recipient is = " + model); ModelAndView
	 * mav = null; String custId =
	 * sessionDataService.getCustomerId(request.getSession()); if (custId != null) {
	 * Customer customer = customerService.findByCustomerId(custId); if
	 * (!customer.getCustomerDetailsFlag().equals("full")) { mav = new
	 * ModelAndView("redirect:you"); } else { mav = new
	 * ModelAndView("newrecipient"); } List<Beneficiary> beneficiaryList =
	 * beneficiaryService.getBeneficiaryBasedOnCustomerCountryISOPaymentType(
	 * custId, model.getPaymentType(), model.getReceivingBranch().split("-")[0]);
	 * System.out.println("beneficiary list size is = " + beneficiaryList.size());
	 * 
	 * mav.addObject("beneficiaryList", beneficiaryList);
	 * mav.addObject("sendingAmount", model.getSendingAmount());
	 * mav.addObject("sendingBranch", model.getSendingBranch());
	 * mav.addObject("receivingBranch", model.getReceivingBranch());
	 * mav.addObject("paymentType", model.getPaymentType());
	 * mav.addObject("modeOfPayment", model.getModeOfPayment());
	 * mav.addObject("adminId", model.getAdminId()); mav.addObject("deliveryTime",
	 * model.getDeliveryTime()); } else { mav = new
	 * ModelAndView("redirect:login?session expired"); } return mav; }
	 * 
	 * 
	 * 
	 */

	@RequestMapping(value = { "txnreview1" }, method = { RequestMethod.POST })
	public @ResponseBody ModelAndView returnTxnReview(HttpServletRequest request,
			@ModelAttribute FrontEndTranscationInfoModelClass model, @ModelAttribute Beneficiary bene) {
		ModelAndView mav = null;
		System.out.println("model from txnewview is = " + model);
		String customerId = sessionDataService.getCustomerId(request.getSession());
		if (customerId != null) {
			mav = new ModelAndView("txn-review");
			String existedbeneficiary = request.getParameter("existedbeneficiary");
			mav.addObject("existedbeneficiary", existedbeneficiary);
			bene.setAccType(model.getPaymentType());
			if (existedbeneficiary == null || existedbeneficiary.equals("")) {
				bene.setAccType(model.getPaymentType());
				mav.addObject("beneficiary", bene);
			} else if (existedbeneficiary != null && !existedbeneficiary.equals("existedbeneficiary")) {
				Beneficiary beneficiary = beneficiaryService.getBeneficiaryDetails(existedbeneficiary);
				mav.addObject("beneficiary", beneficiary);
			}
			List<PurposeCodes> purposeCodes = purposeCodeService.getPurposeCodesList();
			List<SourceOfFund> sofList = sourceOfFundService.getSourceOfFundList();

			mav.addObject("sofList", sofList);
			mav.addObject("purposeCodes", purposeCodes);
			// mav.addObject("model",model);
			ModeOfPaymentFees mop = modeOfPaymentFeeService
					.getModeOfPaymentBasedOnName(model.getModeOfPayment().split(",")[0]);

			/*
			 * ModeOfPayments mop = modeOfPaymentsService
			 * .getModeOfPaymentBasedOnName(model.getModeOfPayment().split(",")[0]);
			 */
			model.setModeOfPaymentFee(mop.getFee() + "");
			model.setModeOfPayment(mop.getModeOfPaymentId().getModeOfPayment());
			String pt = "";
			if (model.getPaymentType().trim().equals("1"))
				pt = "bank";
			if (model.getPaymentType().trim().equals("2"))
				pt = "eWallet";
			if (model.getPaymentType().trim().equals("5"))
				pt = "cash";
			if (model.getPaymentType().trim().equals("10"))
				pt = "Ezy Local Deposit";
			if (model.getPaymentType().trim().equals("11"))
				pt = "Urgent Local Deposit";
			/*
			 * if (model.getPaymentType().equals("15")) pt = "bKash";
			 */
			System.out.println("pt = = = = = = = = = == = " + pt);
			// System.out.println("pt = = = =
			// ="+pt+model.getReceivingBranch().split("-")[1]);
			System.out.println("model from txn-review page  - = == " + model);
			// List<>
			List<AdminSellRates> crRates = currencyRateService
					.getCurrencyRateForSendingCountry(model.getReceivingBranch().split("-")[1], pt);
			System.out.println("crRate size = = =" + crRates.size());
			crRates.forEach(r -> {
				model.setCrRate(r.getMarkup() + "");
				model.setQuiqsendFee(r.getMasterRate() + "");
				model.setTrangloAUD(r.getSellRate() + "");
			});
			SendMoneyCalculator calculator = new SendMoneyCalculator();

			FrontEndTranscationInfoModelClass fullDetails = calculator.calculation(model);
			mav.addObject("txnDetails", fullDetails);
		} else {
			mav = new ModelAndView("redirect:login?session expired");
		}
		return mav;
	}

	@RequestMapping(value = { "/txnFulldetailsBranch" }, method = { RequestMethod.GET })
	public ModelAndView gettxnFulldetailsBranch(HttpServletRequest request, ModelMap map, @RequestParam String txnId) {
		System.out.println("hiii this is from full detail  of branch mt");
		ModelAndView mav = new ModelAndView();
		mav.setViewName("receipt");
			TransactionInformation ti = transactionInformationService.getTransactionDetails(txnId);
			System.out.println("ti is = " + ti);
			mav.addObject("txnDetail", ti);
			return mav;
		}

	
	@RequestMapping("/contactUs")
	public ModelAndView getcontactUsPage() {
		ModelAndView mav=new ModelAndView("contactUs");
		return mav;
	}

	
	@RequestMapping(value = { "/contact" }, method = { RequestMethod.POST })
	public ModelAndView contactUs(HttpServletRequest request) {
		System.out.println("hiii this is from full detail  of branch mt");
		ModelAndView mav = new ModelAndView();
		String Name=request.getParameter("Name");
		String EMail=request.getParameter("EMail");
		String mobileNumber=request.getParameter("mobileNumber");
		String address=request.getParameter("address");
		try { 
			SendMail.send("info@remitz.co.uk", EMail, "Contact Us Mail",
		  hederContent + bodyStartsContent + "Thankyou For Choosing Us..We Will Get Back To You Shortly..." + bodyEndContent +
		  footerContent); 
			} catch (Exception e) { 
				e.printStackTrace();
				}

		return mav;
	}

	
	
	
	@RequestMapping("/idExpired")
	public ModelAndView getIdExpireEmailPage() {
		ModelAndView mav=new ModelAndView("idExpire");
		return mav;
	}
	
	@RequestMapping("/idExpire")
	public @ResponseBody ModelAndView getIdExpireEmail() {
		ModelAndView mav=new ModelAndView();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		
		Calendar cal = Calendar.getInstance();
		Date d = cal.getTime();
		
		System.out.println("d====="+d);
		String currentdate = sdf.format(d);
		System.out.println("currentdate====="+currentdate);

		List<Customer> list=customerService.getbyexpiredDate(currentdate);
		System.out.println("list of expired customers======"+list.size());
		if(list.size()>0) {
		for(int i=0;i<list.size();i++) {
	Customer customer=list.get(i);
	System.out.println("customer in idExpire===="+customer);
	String idType="";
	if((customer.getFirstIdProofType()).equals("1") ) {
		idType="Work Permit";	
	}
	if((customer.getFirstIdProofType()).equals("2") ) {
	idType="International Passport";	
	}
	if((customer.getFirstIdProofType()).equals("3") ) {
	idType="Identification ID";	
	}
	if((customer.getFirstIdProofType()).equals("4") ) {
	idType="Residence Permit";	
	}
	if((customer.getFirstIdProofType()).equals("5") ) {
	idType="Passport";	
	}
	if((customer.getFirstIdProofType()).equals("6") ) {
	idType="Social Security";	
	}
	if((customer.getFirstIdProofType()).equals("7") ) {
	idType="System ID";	
	}

	if((customer.getFirstIdProofType()).equals("8") ) {
	idType="Driver Licence";	
	}
	String adminId=customer.getAdmin().getAdminId();
	List<EmailTemplate> em=emailTemplateService.getEmailTemplatesBasedOnAdmin(adminId); 
	System.out.println("adminId====="+customer.getAdmin().getAdminId());
	if(em.size() > 0) {		
	EmailTemplate emailTemplate = emailTemplateService.getEmailTemplateByTitleAndAdmin(customer.getAdmin().getAdminId(), "Alert to customer about expiry of PHOTO ID");
				System.out.println("message======="+emailTemplate);
				String bodyContent = emailTemplate.getTemplate();
				String replacedBodyContent = bodyContent.replace("{FIRST_NAME}", customer.getFirstName());
				String replacedBodyContent1=replacedBodyContent.replace("{ID_TYPE}", idType);
				String replacedBodyContent2=replacedBodyContent1.replace("{ID_EXPIRY_DATE}", customer.getFirstIdExpireDate());
				String replacedBodyContent3=replacedBodyContent2.replace("{PROFILE_LINK}", "demo.remitz.co.uk/login");
				System.out.println("replacedBodyContent3 in id expired======"+replacedBodyContent);
				System.out.println("emailTemplate email====="+emailTemplate);
				
				
				try { 
					SendMail.send("info@remitz.co.uk", customer.getEmailId(), emailTemplate.getSubject(),
				  hederContent + bodyStartsContent + replacedBodyContent3 + bodyEndContent +
				  footerContent); 
					} catch (Exception e) { 
						e.printStackTrace();
						}

	}
			}
		}
		mav.setViewName("idExpire");
		return mav;
	}
	
	
	
	@RequestMapping("payNowReminder")
	public ModelAndView payNowReminder() {
		ModelAndView mav=new ModelAndView();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Calendar cal = Calendar.getInstance();
		Date currentDate = new Date();
		cal.setTime(currentDate);
		cal.add(Calendar.HOUR, -6);
		Date f = cal.getTime();
		String fdate=sdf.format(f);
		System.out.println("fdate====="+fdate);
		Calendar cal1 = Calendar.getInstance();
	cal1.setTime(currentDate);
	cal1.add(Calendar.HOUR, -4);
	Date t=cal1.getTime();
	String tdate=sdf.format(t);
	System.out.println("tdate====="+tdate);
	Calendar cal2 = Calendar.getInstance();
cal2.setTime(currentDate);
cal2.add(Calendar.HOUR, +1);
Date e=cal2.getTime();
System.out.println("etime======"+e);
Calendar cal3 = Calendar.getInstance();
cal3.setTime(currentDate);
cal3.add(Calendar.HOUR, +1);
Date ex=cal3.getTime();
System.out.println("extime======"+ex);
mav.addObject("e", e);
mav.addObject("ex", ex);

	List<TransactionInformation> tx=transactionInformationService.getByTime(fdate,tdate);
	System.out.println("tx====="+tx.size());
	if(tx.size()>0) {
	for(int i=0;i<tx.size();i++) {
		TransactionInformation txn=tx.get(i);
		System.out.println("txn====="+txn);
		String emailId=txn.getCustomer().getEmailId();
		System.out.println("emailId===="+emailId);
		
		String adminId=txn.getCustomer().getAdmin().getAdminId();
		System.out.println("adminId====="+txn.getCustomer().getAdmin().getAdminId());
		List<EmailTemplate> em=emailTemplateService.getEmailTemplatesBasedOnAdmin(adminId); 
		System.out.println("em===="+em);
		String url="";
		String txnId=txn.getTransactionId();
		if(txn.getModeOfPayment().equals("Online")) {
			url="demo.remitz.co.uk/secure?txnId=" + txnId;
		}
		if(txn.getModeOfPayment().equals("Poli")) {
			url="demo.remitz.co.uk/poli1?txnId=" + txnId;
		}
		if(txn.getModeOfPayment().equals("Internet Bank Transfer")) {
			url="demo.remitz.co.uk/bnktrns?txnId=" + txnId;
		}
		if(txn.getModeOfPayment().equals("Cash")) {
			url="demo.remitz.co.uk/cash?txnId=" + txnId;
		}
		if(txn.getModeOfPayment().equals("Bank")) {
			url="demo.remitz.co.uk/bnktrns?txnId=" + txnId;
		}
	
		if(em.size() > 0) {		
		EmailTemplate emailTemplate = emailTemplateService.getEmailTemplateByTitleAndAdmin(adminId, "Pay Now Pending Reminder");
					System.out.println("message======="+emailTemplate);
					System.out.println("txnname======"+txn.getBeneficiary().getFirstName());
					String bodyContent = emailTemplate.getTemplate();
					String replacedBodyContent = bodyContent.replace("{FIRST_NAME}", txn.getCustomer().getFirstName());
					String replacedBodyContent1=replacedBodyContent.replace("{TRANSACTION_NUMBER}", txn.getTransactionId());
					String replacedBodyContent2=replacedBodyContent1.replace("{ORDER_EXPIRE_DATE_TIME}", sdf.format(e));
					String replacedBodyContent3=replacedBodyContent2.replace("{SENDING_AMOUNT}", txn.getSendingAmount()+" "+"to"+" "+txn.getBeneficiary().getFirstName());
					String replacedBodyContent4=replacedBodyContent3.replace("{RECEIVER_NAME}", txn.getBeneficiary().getFirstName());
					String replacedBodyContent5=replacedBodyContent4.replace("{PAY_NOW_BUTTON}", url);
					String replacedBodyContent6=replacedBodyContent5.replace("{with in 4 hours }", sdf.format(ex));
					System.out.println("replacedBodyContent6 in id pay now======"+replacedBodyContent);
					System.out.println("emailTemplate email====="+emailTemplate);
					
					
					try { 
						SendMail.send("info@remitz.co.uk", emailId, emailTemplate.getSubject(),
					  hederContent + bodyStartsContent + replacedBodyContent6 + bodyEndContent +
					  footerContent); 
						} catch (Exception exception) { 
							exception.printStackTrace();
							}

		}

	}
	}
	mav.setViewName("abc");
		return mav;
	}

	@RequestMapping(value = { "/emaildoc" }, method = { RequestMethod.GET })
	public ModelAndView getemaildocuments1(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		String custId =request.getParameter("customerId");
			mav.setViewName("doc");
			Customer customer = customerService.findByCustomerId(custId);
			List<Country> list = countryService.getAllCountries();
			List<SenderIds> ids=senderIdTypeService.findByBranchAndAdminAndFunctionality(customer.getBranch().getBranchId(),customer.getAdmin().getAdminId(), "receiving");
			System.out.println("branchId===="+customer.getBranch().getBranchId());
			System.out.println("ids===="+ids);
			mav.addObject("ids", ids);

			mav.addObject("customer", customer);
			mav.addObject("admin", customer.getAdmin());
			mav.addObject("list", list);

		return mav;
	}
	

	@RequestMapping("cancelTransaction")
	public ModelAndView cancelTransaction() {
		ModelAndView mav=new ModelAndView();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Calendar cal = Calendar.getInstance();
		Date currentDate = new Date();
		cal.setTime(currentDate);
		cal.add(Calendar.HOUR, -6);
		Date f = cal.getTime();
		String fdate=sdf.format(f);
		System.out.println("fdate====="+fdate);
		Calendar cal1 = Calendar.getInstance();
	cal1.setTime(currentDate);
	cal1.add(Calendar.HOUR, -4);
	Date t=cal1.getTime();
	String tdate=sdf.format(t);
	System.out.println("tdate====="+tdate);

	List<TransactionInformation> tx=transactionInformationService.getByTime(fdate, tdate);
	System.out.println("tx====="+tx.size());
	if(tx.size()>0) {
	for(int i=0;i<tx.size();i++) {
		TransactionInformation txn=tx.get(i);
		System.out.println("txn====="+txn);
		transactionInformationService.updateTransactionStatus("cancelled", txn.getTransactionId());
	}
	}
	return mav;
	}
	
	
	
	
	
	@RequestMapping(value = { "/transactionPreview" }, method = { RequestMethod.GET })
	public ModelAndView getfulldetailmt1(HttpServletRequest request, ModelMap map, @RequestParam String txnId) {
		System.out.println("hiii this is from full detail mt");
		ModelAndView mav = new ModelAndView();
		mav.setViewName("transactionPreview");
			TransactionInformation ti = transactionInformationService.getTransactionDetails(txnId);
			String customerId = ti.getCustomer().getCustomerId();
			Customer customer=customerService.findByCustomerId(customerId);
			System.out.println("ti is = " + ti);
			mav.addObject("txnDetail", ti);
			mav.addObject("admin", customer.getAdmin());
			return mav;

	}

	@RequestMapping("log_out")
	public ModelAndView logoutforacesslog(HttpServletRequest request) {
		String userId = sessionDataService.getAdminId(request.getSession());
		System.out.println("userId======"+userId);
		HttpSession session=request.getSession();
		String aid=(String) session.getAttribute("aid");
		String userid=(String) session.getAttribute("userid");
		System.out.println("userid===="+userid);
System.out.println("aid==="+aid);
SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
Calendar cal = Calendar.getInstance();
Date d = cal.getTime();
AccessLog ac=accessLogService.getbyid(aid);
if(ac!=null) {
ac.setLogOffTime(sdf.format(d));
accessLogService.updateAccessLog(ac);
}
ModelAndView mav=new ModelAndView("redirect:logout");		
return mav;

	}
	

	@RequestMapping("/access_logs")
	public ModelAndView  audit_Logs(HttpServletRequest request) {
		ModelAndView mav=new ModelAndView("access_logs");
		String adminId=sessionDataService.getAdminId(request.getSession());
		List<AccessLog> list=accessLogService.getAllByAdminId(adminId);
		mav.addObject("list", list);
		return mav;
	}
	
	
	
	@PostMapping("accessloglistbwdates")
	@ResponseBody
	public List<AccessLog> getaccessloglist(HttpServletRequest request,@RequestParam String logondate,String logoffdate){
		logondate=logondate+" "+"00:00:00";
		logoffdate=logoffdate+" "+"23:59:59";
		String adminId=sessionDataService.getAdminId(request.getSession());
		List<AccessLog> list= accessLogService.getlistbetweendates(logondate, logoffdate,adminId);	
	return list;
	}
	
	@PostMapping("accessloglistBwDatesAndUsertype")
	@ResponseBody
	public List<AccessLog> getaccessloglistusertype(HttpServletRequest request,@RequestParam String logondate,String logoffdate,String userType){
		logondate=logondate+" "+"00:00:00";
		logoffdate=logoffdate+" "+"23:59:59";
		String adminId=sessionDataService.getAdminId(request.getSession());

		List<AccessLog> list= accessLogService.getlistbwdatesandusertype(logondate, logoffdate, userType,adminId);
	return list;
	}
	@PostMapping("accessloglistBwDatesAndUsername")
	@ResponseBody
	public List<AccessLog> accessloglistBwDatesAndUsername(HttpServletRequest request,@RequestParam String logondate,String logoffdate,String username){
		logondate=logondate+" "+"00:00:00";
		logoffdate=logoffdate+" "+"23:59:59";
		String adminId=sessionDataService.getAdminId(request.getSession());

		List<AccessLog> list= accessLogService.getlistbwdatesandusername(logondate, logoffdate, username,adminId);
				
	return list;
	}

	
	@PostMapping("accessloglistBwDatesAndUsertypeAndUserName")
	@ResponseBody
	public  List<AccessLog> accessloglistBwDatesAndUsertypeAndUserName(HttpServletRequest request,@RequestParam String logondate,String logoffdate,String userType,String username){
		logondate=logondate+" "+"00:00:00";
		logoffdate=logoffdate+" "+"23:59:59";
		String adminId=sessionDataService.getAdminId(request.getSession());
		
		List<AccessLog> list= accessLogService.getlistbwdatesandusertypeandusername(logondate, logoffdate, userType, username,adminId);
		return list;	
	}

	@PostMapping("getlistbyuserType")
	@ResponseBody
	public List<AccessLog> getlistbyuserType(HttpServletRequest request,@RequestParam  String userType){
		String adminId=sessionDataService.getAdminId(request.getSession());
	
		List<AccessLog> list= accessLogService.getListByUserType(userType,adminId);
	return list;
	}

	@PostMapping("getlistbyuserName")
	@ResponseBody
	public List<AccessLog> getlistbyuserName(@RequestParam  String username,HttpServletRequest request){
		String adminId=sessionDataService.getAdminId(request.getSession());

		List<AccessLog> list= accessLogService.getListByUsername(username,adminId);
	return list;
	}
	@PostMapping("accessloglistbyUsertypeAndUserName")
	@ResponseBody
	public List<AccessLog> getaccessloglistusertypeAnduserName(HttpServletRequest request, @RequestParam  String userType,String username){
		String adminId=sessionDataService.getAdminId(request.getSession());

		List<AccessLog> list= accessLogService.
	getListByUserTypeAnduserName(userType, username,adminId);
		return list;
	}
	@PostMapping("addacceslog")
	public String addacceslog(@RequestParam String username,String password,String myIp, HttpServletRequest request) {
		User userDetails = userRepository.findByUserNameAndPassword(username, password);
		AccessLog a=new AccessLog();
		if(userDetails!=null) {
		a.setUserType(userDetails.getRoles());
		a.setUserName(userDetails.getUserName());
		a.setIpAddress(myIp);
		a.setUserid(userDetails.getUserType());
		a.setAdminId(userDetails.getUserType());
		if(userDetails.getRoles().equals("ROLE_BRANCH")) {
			Branch b=branchService.getBranchBasedOnBranchId(userDetails.getUserType());
			a.setAdminId(b.getAdmin().getAdminId());
		}
		if(userDetails.getRoles().equals("ROLE_CUSTOMER")) {
		Customer c=customerService.findByCustomerId(userDetails.getUserType());
		a.setAdminId(c.getAdmin().getAdminId());
		}		
		a.setAcessResult(" ");
		}else {
			a.setUserName(username);
			a.setAcessResult("login failed");
			a.setIpAddress(myIp);
			a.setUserType(" ");
			a.setUserid(" ");

		}
		AccessLog a1=accessLogService.saveAccessLog(a);
		System.out.println("a1======"+a1);
		HttpSession session = request.getSession();
		session.setAttribute("aid", a1.getAcessId());
	
		return a1.getAcessId();
		
	}

	@RequestMapping("/audit_trail")
	public ModelAndView audit_Trail(HttpServletRequest request) {
		String adminId=sessionDataService.getAdminId(request.getSession());
		List<AuditTrail> list=auditTrailService.getAllList(adminId);
		 ModelAndView mav=new ModelAndView("auditTrail");
		 mav.addObject("list", list);
		 return mav;
	}
}
