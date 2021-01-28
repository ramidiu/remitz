package com.kws.unitedfintech.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.TimeZone;

import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

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
import org.springframework.web.multipart.MultipartRequest;
import org.springframework.web.servlet.ModelAndView;

import com.kws.unitedfintech.entities.AccessLog;
import com.kws.unitedfintech.entities.AddNewUser;
import com.kws.unitedfintech.entities.Admin;
import com.kws.unitedfintech.entities.AdminSellRates;
import com.kws.unitedfintech.entities.AgentDeposit;
import com.kws.unitedfintech.entities.AuditTrail;
import com.kws.unitedfintech.entities.Banks;
import com.kws.unitedfintech.entities.Branch;
import com.kws.unitedfintech.entities.BranchPaymentTypeDetails;
import com.kws.unitedfintech.entities.Cash;
import com.kws.unitedfintech.entities.Country;
import com.kws.unitedfintech.entities.Customer;
import com.kws.unitedfintech.entities.EmailTemplate;
import com.kws.unitedfintech.entities.EwalletPaymentType;
import com.kws.unitedfintech.entities.InternetBankTransferMop;
import com.kws.unitedfintech.entities.KeyGeneration;
import com.kws.unitedfintech.entities.MaxAmount;
import com.kws.unitedfintech.entities.ModeOfPaymentFees;
import com.kws.unitedfintech.entities.ModeOfPayments;
import com.kws.unitedfintech.entities.Nasano;
import com.kws.unitedfintech.entities.OnlineMop;
import com.kws.unitedfintech.entities.PaymentTypes;
import com.kws.unitedfintech.entities.Processbank;
import com.kws.unitedfintech.entities.RealationShips1;
import com.kws.unitedfintech.entities.ReasonForTransfer;
import com.kws.unitedfintech.entities.RevenuePercentage;
import com.kws.unitedfintech.entities.SanctionSearch;
import com.kws.unitedfintech.entities.SenderIdType;
import com.kws.unitedfintech.entities.SenderIds;
import com.kws.unitedfintech.entities.ServiceFees;
import com.kws.unitedfintech.entities.SourceOfFunds1;
import com.kws.unitedfintech.entities.States;
import com.kws.unitedfintech.entities.TransactionInformation;
import com.kws.unitedfintech.entities.TxDaysLimit;
import com.kws.unitedfintech.entities.Zone;
import com.kws.unitedfintech.helpers.EmailTemplateHeaderFooterUtil;
import com.kws.unitedfintech.helpers.SendMail;
import com.kws.unitedfintech.service.AccessLogService;
import com.kws.unitedfintech.service.AdminKeyService;
import com.kws.unitedfintech.service.AdminService;
import com.kws.unitedfintech.service.AgentDepositService;
import com.kws.unitedfintech.service.AuditTrailService;
import com.kws.unitedfintech.service.BankService;
import com.kws.unitedfintech.service.BranchPaymentTypeDetailsService;
import com.kws.unitedfintech.service.BranchService;
import com.kws.unitedfintech.service.CountryService;
import com.kws.unitedfintech.service.CountryZonService;
import com.kws.unitedfintech.service.CurrencyRateService;
import com.kws.unitedfintech.service.CustomerService;
import com.kws.unitedfintech.service.EmailTemplateService;
import com.kws.unitedfintech.service.EwalletPaymentTypService;
import com.kws.unitedfintech.service.FeeService;
import com.kws.unitedfintech.service.IDProofService;
import com.kws.unitedfintech.service.InternetBankTransferMopService;
import com.kws.unitedfintech.service.MaxAmountService;
import com.kws.unitedfintech.service.ModeOfPaymentFeeService;
import com.kws.unitedfintech.service.ModeOfPaymentsService;
import com.kws.unitedfintech.service.NewUserService;
import com.kws.unitedfintech.service.NsanoService;
import com.kws.unitedfintech.service.OnlineMopService;
import com.kws.unitedfintech.service.PaymentTypesService;
import com.kws.unitedfintech.service.ProcessService;
import com.kws.unitedfintech.service.RealationShips1Service;
import com.kws.unitedfintech.service.ReasonForTransferService;
import com.kws.unitedfintech.service.RevenuePercentageService;
import com.kws.unitedfintech.service.SanctionSearchService;
import com.kws.unitedfintech.service.SenderIdTypeService;
import com.kws.unitedfintech.service.SessionDataService;
import com.kws.unitedfintech.service.SourceOfFundService;
import com.kws.unitedfintech.service.SourceOfFundsService;
import com.kws.unitedfintech.service.StatesService;
import com.kws.unitedfintech.service.TransactionInformationService;
import com.kws.unitedfintech.service.TxDaysService;
import com.kws.unitedfintech.service.UserService;

@Controller
public class AdminController {
	@Autowired
	private AuditTrailService auditTrailService;

	@Autowired
	private NsanoService ns;
	@Autowired
	private MaxAmountService mx;
	@Autowired
	private AccessLogService accessLogService;
	@Autowired
	private AgentDepositService adp;
	@Autowired
	private ProcessService processService;
	
	@Autowired
	private TxDaysService txr;
	
	@Autowired
	private SenderIdTypeService senderIdTypeService;
	@Autowired
	private EwalletPaymentTypService ewalletPaymentTypService;
@Autowired
private RevenuePercentageService rps;
	
	@Autowired
	private IDProofService iDProofService1;
	
	@Autowired
	private InternetBankTransferMopService internetBankTransferMopService;

	@Autowired
	private OnlineMopService onlineMopService;

	@Autowired
	private AdminService adminService;
	@Autowired
	private TransactionInformationService transactionService;
	@Autowired
	private BranchPaymentTypeDetailsService branchPaymentTypeDetailsService;

	@Autowired
	private AdminKeyService adminKeyService;
	@Autowired
	private CustomerService customerService;
	@Autowired
	private RealationShips1Service realationShips1Service;
	@Autowired
	private SourceOfFundService sourceOfFundService;

	@Autowired
	private ReasonForTransferService reasonForTransferService;
@Autowired
private StatesService statesService;
	@Autowired
	private BankService bankService;
	@Autowired
	private SessionDataService sessionDataService;
	@Autowired
	private BranchService branchService;
	@Autowired
	private BranchPaymentTypeDetailsService payTypeService;
	@Autowired
	private CountryService countryService;
	@Autowired
	private CountryZonService zoneService;
	@Autowired
	private CurrencyRateService currencyRateService;
	@Autowired
	private ModeOfPaymentsService modeOfPaymentsService;
	@Autowired
	private FeeService serviceFee;

	@Autowired
	private PaymentTypesService paymentTypesService;

	@Autowired
	private UserService userService;

	@Autowired
	private com.kws.unitedfintech.service.cashService cashService;

	@Autowired
	private SourceOfFundsService sourceOfFundsService;
	@Autowired
	private EmailTemplateService emailTemplateService;

	@Autowired
	private ModeOfPaymentFeeService feeService;

	@Autowired
	private NewUserService newUserService;
	@Autowired
	private SanctionSearchService sanctionSearchService;

	/*
	 * @GetMapping(value = { "/", "/index" }) public String returnLoginPage() {
	 * return "adm/index"; }
	 */
	String hederContent = EmailTemplateHeaderFooterUtil.getStaticEmailHeaderContent();
	String bodyStartsContent = EmailTemplateHeaderFooterUtil.getStaticEmailBodyStartContent();
	String bodyEndContent = EmailTemplateHeaderFooterUtil.getStaticEmailBodyEndsContent();
	String footerContent = EmailTemplateHeaderFooterUtil.getStaticEmailFooterContent();
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	TimeZone timeZone = TimeZone.getTimeZone("IST");
	Calendar cal = Calendar.getInstance();
	Date d = cal.getTime();

	/*
	 * @RequestMapping(value = , method = RequestMethod.GET) public String
	 * getindexPage() { return "adm/index"; }
	 */
	/*
	 * @RequestMapping(value = "/validateAdmin", method = RequestMethod.POST) public
	 * ModelAndView validateAdmin(HttpServletRequest request, HttpServletResponse
	 * response,
	 * 
	 * @RequestParam String userName, @RequestParam String password) { ModelAndView
	 * mav = new ModelAndView(); Admin admin = adminService.validateAdmin(userName,
	 * password); if (admin != null) {
	 * sessionDataService.storeAdminInformation(request.getSession(), admin);
	 * System.out.println("adminflag:"+admin.getFlag());
	 * if(admin.getFlag().equals("false")) { mav.setViewName("adm/adminsetup");
	 * mav.addObject("admin",admin); }else { List<Branch> branchList =
	 * branchService.getAllBranches(admin.getAdminId());
	 * 
	 * mav.setViewName("redirect:branch_registration"); mav.addObject("admin",
	 * admin); mav.addObject("branches", branchList); return mav;} } else {
	 * mav.setViewName("redirect:index");
	 * 
	 * } return mav; }
	 */
	@RequestMapping(value = { "/branch_registration" }, method = {
			org.springframework.web.bind.annotation.RequestMethod.GET })
	public ModelAndView getbranchRegistration(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView modelAndView = new ModelAndView();
		HttpSession session = request.getSession();
		String adminId = (String) session.getAttribute("adminId");
		// String adminId = sessionDataService.getAdminId(request.getSession());
		if (adminId != null && !adminId.trim().equals("")) {
			Admin admin = adminService.getAdminDetailsBasedOnAdminId(adminId);
			modelAndView.setViewName("branch_registration1");
			List<Branch> branchesList = branchService.getAllBranchesBasedOnAdminId(adminId);
			// List<Branch> branchList1=branchService.getBranchBasedOnBranchId(branchId);
			List<BranchPaymentTypeDetails> bptd = null;
			List<Country> list=countryService.getAllCountries();
			bptd = payTypeService.getBranchPaymentTypeBasedOnBranchId(adminId);
			modelAndView.addObject("list", list);
			modelAndView.addObject("admin", admin);
			modelAndView.addObject("nsano", admin.getNsano());
			modelAndView.addObject("branchesList", branchesList);
			modelAndView.addObject("profitMode", admin.getProfitMode());
			modelAndView.addObject("modeOfPayments", admin.getModeOfPayments());

			modelAndView.addObject("paymentTypeList", admin.getPaymentTypes());
			if (request.getParameter("branchId") != null) {

				Branch branch = branchService.getBranchBasedOnBranchId(request.getParameter("branchId"));

				// List<BranchPaymentTypeDetails>
				// bpd=branchPaymentTypeDetailsService.getListBasedOnBranch(request.getParameter("branchId"));

				// System.out.println("bpd............."+bpd);

				modelAndView.addObject("branch", branch);
				// modelAndView.addObject("bpd", bpd);
				if (request.getParameter("buttonName") != null) {
					String buttonName = request.getParameter("buttonName");
					modelAndView.addObject("buttonName", buttonName);
				}
			}
		} else {
			modelAndView.setViewName("redirect:index");
			modelAndView.addObject("msg", "Session Expired Please Login Again");
		}
		return modelAndView;
	}

	@RequestMapping(value = "checkEmail", method = RequestMethod.POST)
	public @ResponseBody String getAgentByAdmin(HttpServletRequest request, @RequestParam String emailId) {
		String result = branchService.getBranchListBasedOnEmailId(emailId);
		return result;
	}

	@GetMapping(value = "getBranchBasedOnCountryISOAndAdminId")
	public @ResponseBody String getBranchBasedOnCountryISOAndAdminId(@RequestParam String countryISO,
			@RequestParam String adminId) {
		return branchService.getBranchBasedOnCountryISOAndAdminId(countryISO, adminId);
	}

	@GetMapping("getTimeZones")
	public List<Zone> getTimeZones(@RequestParam String iso) {
		return zoneService.getTimeZonesBasedOnCountry(iso);
	}
	/*
	 * @RequestMapping(value = "/logout", method = RequestMethod.GET) public String
	 * logout(HttpServletRequest request) {
	 * sessionDataService.deleteAdminInformation(request.getSession()); return
	 * "redirect:index"; }
	 */

	@RequestMapping(value = "/insertbranch", method = RequestMethod.POST)
	public String saveBranchDetails(HttpServletRequest request, @ModelAttribute Branch branch) {

		String paymentTypes = "";
		String paymentStatus = "";
		List<BranchPaymentTypeDetails> list = new ArrayList<BranchPaymentTypeDetails>();
		HttpSession session = request.getSession();
		String adminId = (String) session.getAttribute("adminId");

		if (adminId != null && !adminId.trim().equals("")) {
			Admin admin = adminService.getAdminDetailsBasedOnAdminId(adminId);
			String pmtType = request.getParameter("pmtType");
			String fromCountry = request.getParameter("fromCountry");
			Country country = countryService.getCountryBasedOnIso(fromCountry);
			String zoneId = request.getParameter("zone");
			Zone zone = zoneService.getZoneBasedOnZoneId(zoneId);

			String modeofpayments = "";
			if (branch.getFunctionality().equals("sending") || branch.getFunctionality().equals("both")) {
				String[] modeofpayemnt = request.getParameterValues("modeOfPayment");
				for (String s1 : modeofpayemnt) {
					modeofpayments = modeofpayments + s1 + ",";
				}
			}

String payments="";
			int counts = Integer.parseInt(request.getParameter("counts"));
			if (branch.getFunctionality().equals("receiving") || branch.getFunctionality().equals("both")) {
				for (int i = 1; i <= counts - 1; i++) {
					BranchPaymentTypeDetails bptd = new BranchPaymentTypeDetails();
					String paymenttype = request.getParameter("paymentType" + i);
					
					String st=request.getParameter("paymentStatus" + i);
					if(st.equals("active")) {
					payments=payments+paymenttype+",";
					}
					System.out.println("paymenttype in branch======"+payments);
					PaymentTypes p = payTypeService.getPaymentTypeDetails(paymenttype);
					bptd.setPaymentTypes(p);
					bptd.setStatus(request.getParameter("paymentStatus" + i));

					bptd.setDeliveryTime(request.getParameter("DeleiveryTime" + i));

					list.add(bptd);
				}
			}

			String pmtMode = request.getParameter("pmtMode");
			branch.setModeOfPayment(pmtMode);
			branch.setAdmin(admin);
			branch.setPaymentMode(payments);
			branch.setFromCountry(country);
			branch.setZone(zone);
			branch.setProfitMode("Flat fee");
			String branchId = branchService.saveBranchDetails(branch, list);
            Branch b=branchService.getBranchBasedOnBranchId(branchId);
            String myIp=request.getParameter("myIp");
        	AuditTrail atr=new AuditTrail();
        	atr.setAgent(b.getBranchId());
        	atr.setMessage("new Agent createed");
        	atr.setUserId(b.getAdmin().getAdminId());
        	atr.setUserType("ROLE_ADMIN");
        	atr.setOriginalData("-");
        	atr.setChangedData("New Agent  agentId is:"+b.getBranchId());
        	atr.setIpAddress(myIp);
        	atr.setUserName(b.getEmailId());
        	atr.setCategory("new"+" "+b.getFunctionality()+" "+" agent created by admin:"+b.getAdmin().getAdminId());
        	atr.setTransaction("-");
        	atr.setSourceCountry("-");
        	atr.setAdminId(b.getAdmin().getAdminId());
        	auditTrailService.save(atr);
			if(branch.getFunctionality().equals("receiving")) { 
				Cash c=new Cash();
				c.setAdmin(admin);
				c.setCountry(b.getFromCountry());
				/*
				 * List<States>
				 * st=statesService.getAllStatesByCountryIso(b.getFromCountry().getCountryISO())
				 * ; if(list.size()>0) { States state=new States(); for(int i=0;i<st.size();i++)
				 * { if(i==0) { state=st.get(i); } } c.setCollectionPointState(state); }
				 */				c.setCollectionPin("ABC4566");
				c.setCashPickupFrom("ABCD35456");
				c.setContactNumber("34435656776");
				c.setCashBank("no");
				c.setCollectionPointAddress("ABCD");
				c.setCollectionPointBank("ABC BANK");
				c.setCollectionPointCity("CITY");
				c.setCollectionPointCode("12345678");
				//cashService.insertCash(c);
				System.out.println("nsano====admin="+admin.getNsano());
				System.out.println("nsano====branch===="+branch.getNsano());
				if(admin.getNsano().equals("yes") && branch.getNsano().equals("yes")) {
				System.out.println("nsano condition......");
				Nasano n=new Nasano();
				n.setAdmin(admin);
				n.setApiKey("fe4f3f3f867248dd8c3ab2af364d24a1");
				n.setBranch(b);
				ns.save(n);
				}
				}


			if (branch.getFunctionality().equals("sending") || branch.getFunctionality().equals("both")) {
	
             MaxAmount ma=new MaxAmount();
				ma.setAdmin(admin);
				ma.setBranch(b);
				ma.setAmount("1000");
				MaxAmount m=mx.save(ma);

				AgentDeposit ad=new AgentDeposit();
				ad.setDepositAmount("2000");
				ad.setNotes("opening balance");
				ad.setDocument("intial");
				ad.setAdmin(admin);
				ad.setBranch(b);
				ad.setStatus("approved");
				ad.setDocument("document");
				AgentDeposit a=	adp.save2(ad);
				System.out.println("a====="+a);
				return "redirect:insertDefaultRatesWhileBranchRegistration?fromBranchId=" + branchId + "&modeofpayemnt="
						+ modeofpayments + "&functionality=" + branch.getFunctionality();
			} else {
				return "redirect:insertDefaultRatesWhileBranchRegistration?fromBranchId=" + branchId + "&functionality="
						+ branch.getFunctionality();
			}
		} else {
			return "redirect:index?msg=Your Session Expired Please Login Again";
		}

	}

	@GetMapping("/insertDefaultRatesWhileBranchRegistration")
	public String insertDefaultRatesWhileBranchRegistration(HttpServletRequest request,
			@RequestParam String fromBranchId, @ModelAttribute Branch branchId) {
		String adminId = sessionDataService.getAdminId(request.getSession());

		String mop = request.getParameter("modeofpayemnt");
		String functionality = request.getParameter("functionality");

		if (adminId != null) {
			Admin admin = adminService.getAdminDetailsBasedOnAdminId(adminId);
			List<Branch> sendinglist = branchService.getAllBranchesBasedOnAdminId(adminId);
			List<Branch> receivinglist = sendinglist;
			for (Branch b : sendinglist) {

				if (b.getFunctionality().equals("sending") || b.getFunctionality().equals("both")) {
					for (Branch b1 : receivinglist) {

						if (b1.getFunctionality().equals("receiving") || b1.getFunctionality().equals("both")) {

							if (b.getFromCountry().getCountryName().equals(b1.getFromCountry().getCountryName())) {
							} else {

					String paymenttypes=b.getAdmin().getPaymentTypes();
							RevenuePercentage rp=new RevenuePercentage();
							rp.setAdminPercentage("50");
							rp.setSourcePercentage("50");
							rp.setTerminatePercentage("0");
							rp.setAdmin(b.getAdmin());
							rp.setFromBranch(b);
						rp.setToBranch(b1);
						rps.save(rp);
								AdminSellRates rates = new AdminSellRates();
								rates.setMarkup(0.0);
								rates.setMasterRate(0.0);
								rates.setRateType("selling");
								rates.setSellRate(0.0);
								currencyRateService.saveAdminSellRate(rates, admin, b, b1);
								currencyRateService.saveAdminBuyRate(rates,admin,b,b1);	
								serviceFee.addFeeLimitation(1, 10000, 2, b.getBranchId(), b1.getBranchId(),admin.getAdminId(), "flatfee");
							}
						}
					}

				}
			}
			if (functionality.equals("sending") || functionality.equals("both")) {

				return "redirect:insertDefaultModeOfPaymentWhileBranchRegistration?fromBranchId=" + fromBranchId
						+ "&mop=" + mop;
			} else {
				return "redirect:/insertsenderIds?fromBranchId="+fromBranchId;
			}
		} else {
			return "redirect:index?msg=Your Session Expired Please Login Again";
		}

	}

	@GetMapping("/insertDefaultModeOfPaymentWhileBranchRegistration")
	public String insertDefaultModeOfPaymentoBranchId(HttpServletRequest request, ModelMap map,
			@RequestParam String fromBranchId) {
		String adminId = sessionDataService.getAdminId(request.getSession());
		String mops = request.getParameter("mop");
		String modeOfPayments[] = mops.split(",");
		if (adminId != null) {

			Admin admin = adminService.getAdminDetailsBasedOnAdminId(adminId);


			Branch branch = branchService.getBranchBasedOnBranchId(fromBranchId);
			// String[] m=branch.getModeOfPayment().split(",");
			// String[] m2=m.split("-");

			String[] s1 = admin.getModeOfPayments().split(",");

			Map<String, String> modeOfPaymentsMap = new HashMap<String, String>();

			for (String modeofpayment : modeOfPayments) {
				modeOfPaymentsMap.put(modeofpayment, modeofpayment);
			}
			for (String s : s1) {
				ModeOfPayments mop = modeOfPaymentsService.getModeOfPaymentBasedOnId(s.split("-")[0]);
				if (!branch.getFunctionality().trim().equals("receiving")) {
					ModeOfPaymentFees modeOfPaymentFees = new ModeOfPaymentFees();
					modeOfPaymentFees.setFee(3);
					modeOfPaymentFees.setMinValue(1.0);
					modeOfPaymentFees.setMaxValue(10000.0);
					modeOfPaymentFees.setBranchId(branch);
					modeOfPaymentFees.setModeOfPaymentId(mop);
					modeOfPaymentFees.setAdmin(admin);
					if(mop.getModeOfPayment().equals("Cash")) {
						modeOfPaymentFees.setDisplay("backend");	
					}
					if(mop.getModeOfPaymentId().equals("MPMT1006")) {
						modeOfPaymentFees.setDisplay("both");	
					}
					if(mop.getModeOfPaymentId().equals("MPMT1009")) {
						modeOfPaymentFees.setDisplay("frontend");	
					}
					if(mop.getModeOfPaymentId().equals("MPMT1010")) {
						modeOfPaymentFees.setDisplay("frontend");	
					}
					
					modeOfPaymentFees.setRateType("flatfee");
					if (modeOfPaymentsMap.containsKey(s)) {
						modeOfPaymentFees.setStatus("active");
					} else {
						modeOfPaymentFees.setStatus("inactive");
					}

					 feeService.saveModeOfPayments(modeOfPaymentFees, admin);
				}
			}
			return "redirect:/insertTxDays?fromBranchId="+fromBranchId;
		} else {
			return "redirect:index?msg=Your Session Expired Please Login Again";
		}
		// return adminId;

	}

	
	@GetMapping("/insertTxDays")
	public String insertTxDays(@RequestParam String fromBranchId)
	{
		Branch branch = branchService.getBranchBasedOnBranchId(fromBranchId);
		TxDaysLimit tx=new TxDaysLimit();
		for(int i=0;i<3;i++) {
			if(i==0) {
			tx.setBranch(branch);
			tx.setAdmin(branch.getAdmin());
			tx.setLimitDays("30");
			}
			if(i==1) {
			tx.setBranch(branch);
			tx.setAdmin(branch.getAdmin());
			tx.setLimitDays("90");
			}
			if(i==2) {
			tx.setBranch(branch);
			tx.setAdmin(branch.getAdmin());
			tx.setLimitDays("365");
			}

txr.save(tx);
		}
		return "redirect:/insertsenderIds?fromBranchId="+fromBranchId;
	}
	
	@GetMapping("/insertsenderIds")
	public String insertsenderIds(@RequestParam String fromBranchId)
	{
		Branch branch = branchService.getBranchBasedOnBranchId(fromBranchId);
		SenderIds senderIds=new SenderIds();
		for(int i=0;i<3;i++) {
			if(i==0) {
			senderIds.setFunctionality(branch.getFunctionality());	
			senderIds.setIdValue("2");
			senderIds.setIssuingAuthority("country");
			senderIds.setSenderType("International Passport");
			senderIds.setBranch(branch);
			senderIds.setAdmin(branch.getAdmin());
		}
			if(i==1) {
			senderIds.setFunctionality(branch.getFunctionality());	
			senderIds.setIdValue("01");
			senderIds.setIssuingAuthority("state");
			senderIds.setSenderType("Driving License");
			senderIds.setBranch(branch);
			senderIds.setAdmin(branch.getAdmin());
			
		}
			if(i==2) {
			senderIds.setFunctionality(branch.getFunctionality());	
			senderIds.setIdValue("5");
			senderIds.setIssuingAuthority("state");
			senderIds.setSenderType("Passport");
			senderIds.setBranch(branch);
			senderIds.setAdmin(branch.getAdmin());
			}
			senderIdTypeService.Save(senderIds);
			
		}
		return "redirect:branch_registration";
		
	}
	
	@GetMapping("/mop")

	public ModelAndView returnModeOfPaymentsPage(HttpServletRequest request, ModeOfPaymentFees modeOfPaymentFees,
			ModelMap map, String status) {

		ModelAndView mav = null;

		String adminId = sessionDataService.getAdminId(request.getSession());

		if (adminId != null) {

			Admin admin = adminService.getAdminDetailsBasedOnAdminId(adminId);

			mav = new ModelAndView("modeofpayments");
			status = "active";

			List<ModeOfPaymentFees> mlist = feeService.getAllGroupByBranchId(adminId, status);

			map.addAttribute("mop", admin.getModeOfPayments());
			mav.addObject("mlist", mlist);
			List<Branch> country = new ArrayList<Branch>();
			List<String> modofpayment = new ArrayList<String>();
			Map<String, List<ModeOfPaymentFees>> mapobject = new HashMap();
			List<Map<String, List<ModeOfPaymentFees>>> list = new ArrayList();
			Map<List<Branch>, List<Map<String, List<ModeOfPaymentFees>>>> mapobject1 = new HashMap();
			// mav.addObject("mlist1", mlist1);
			List<Branch> blist = branchService.getAllBranchesBasedOnFunctionalityAndAdminIdwithoutFlag(adminId, "receiving");
			for (Branch b : blist) {
				String mop = b.getModeOfPayment();
				String mop1[] = mop.split(",");
				country.add(b);
				for (int i = 0; i < mop1.length; i++) {
					String mode = mop1[i].split("-")[0];
					List<ModeOfPaymentFees> mopfee = feeService.getAllMopFeesBasedOnAdminidBranchidPaymentId(adminId,
							b.getBranchId(), mode);
					String branchmop = b.getBranchId() + "-" + mop1[i].split("-")[1];
					mav.addObject("mopfee", mopfee);
					mapobject.put(branchmop, mopfee);
				}
				List<ModeOfPaymentFees> mopfees = feeService.getAllModeOfPaymentFeesBasedOnAdminId(adminId);
				mav.addObject("mopfees", mopfees);

			}
			mav.addObject("countries", country);
			mav.addObject("mop", mapobject);
			mav.addObject("blist", blist);
			/* mav.addObject("getallobjects",mapobject1); */
			/* System.out.println("mapobject1:"+mapobject1); */
		} else {
			mav = new ModelAndView("redirect:index");
		}
		return mav;
	}

	@GetMapping("/add_rates")
	public ModelAndView returnAddRatesPage(HttpServletRequest request) {
		ModelAndView mav = null;
		String adminId = sessionDataService.getAdminId(request.getSession());
		if (adminId != null) {
			mav = new ModelAndView("add_rates");

		} else {
			mav = new ModelAndView("redirect:index");
		}
		return mav;
	}

	@GetMapping("/addbuy_rates")
	public ModelAndView returnAddbuyRatesPage(HttpServletRequest request) {
		ModelAndView mav = null;
		String adminId = sessionDataService.getAdminId(request.getSession());
		if (adminId != null) {
			mav = new ModelAndView("addbuy_rates");

		} else {
			mav = new ModelAndView("redirect:index");
		}
		return mav;
	}

	
	@GetMapping("/getallbranchesbasedonadmin")
	@ResponseBody
	public List<Branch> getAllBranchesBasedOnAdmin(HttpServletRequest request) {
		String adminId = sessionDataService.getAdminId(request.getSession());
		List<Branch> branchList = branchService.getAllBranchesBasedOnAdminId(adminId);
		return branchList;
	}
	@GetMapping("getallRevenueRatesbasedonadmin")
	@ResponseBody
	public List<RevenuePercentage> getgetallRevenueRatesbasedonadmin(HttpServletRequest request){
		String adminId = sessionDataService.getAdminId(request.getSession());
		return rps.getByAdminId(adminId);
	}

	@GetMapping("/getallsellratesbasedonadmin")
	@ResponseBody
	public List<AdminSellRates> getAllSelleRatesBasedOnAdmin(HttpServletRequest request) {
		String adminId = sessionDataService.getAdminId(request.getSession());
		List<AdminSellRates> sellRates = currencyRateService.getAllAdminSellRateBasedOnAdminId(adminId,"selling","active");
		return sellRates;
	}
	@GetMapping("/getallBuyratesbasedonadmin")
	@ResponseBody
	public List<AdminSellRates> getAllBuyRatesBasedOnAdmin(HttpServletRequest request) {
		String adminId = sessionDataService.getAdminId(request.getSession());
		List<AdminSellRates> sellRates = currencyRateService.getAllAdminSellRateBasedOnAdminId(adminId,"buy","active");
		return sellRates;
	}

	
	@PostMapping("/update_rates_by_admin")
	public String updateRatesByAdmin(HttpServletRequest request, @ModelAttribute AdminSellRates rates,
			@RequestParam String f_br, @RequestParam String t_br,String crId) {
		String adminId = sessionDataService.getAdminId(request.getSession());
		System.out.println("rates===="+rates);
		AdminSellRates ar=currencyRateService.getByCrId(rates.getCrId());
       System.out.println("ar======"+ar);
		String myIp=request.getParameter("myIp");
    	AuditTrail atr=new AuditTrail();
    	atr.setAgent(adminId);
    	atr.setMessage("Updated Conversion rates for "+ar.getToBranch().getFromCountry().getCountryISO());
    	atr.setUserId(adminId);
    	atr.setUserType("ROLE_ADMIN");
    	atr.setCategory("update_destination_conversion_rate");
    	atr.setOriginalData(ar.getSellRate()+"");
    	atr.setChangedData(rates.getMasterRate()+"");
    	atr.setIpAddress(myIp);
    	atr.setAdminId(ar.getAdmin().getAdminId());
    	atr.setUserName(ar.getAdmin().getEmailId());
    	auditTrailService.save(atr);

		if (adminId != null) {
			Admin admin = adminService.getAdminDetailsBasedOnAdminId(adminId);
			Branch from_br = branchService.getBranchBasedOnBranchId(f_br);
			Branch to_br = branchService.getBranchBasedOnBranchId(t_br);
			ar.setAdmin(admin);
			ar.setFromBranch(from_br);
			ar.setToBranch(to_br);
			ar.setMarkup(rates.getMarkup());
			ar.setMasterRate(rates.getMasterRate());
			ar.setSellRate(rates.getSellRate());
			rates.setUpdatedDate(sdf.format(d));
			rates.setRateUpdatedDate(sdf.format(d));
			currencyRateService.updateAdminSellRate(ar);
			return "redirect:add_rates";
		} else {
			return "redirect:index";
		}
	}

	
	@PostMapping("/update_Buyrates_by_admin")
	public String updateBuyRatesByAdmin(HttpServletRequest request, @ModelAttribute AdminSellRates rates,
			@RequestParam String f_br, @RequestParam String t_br,String crId) {
		String adminId = sessionDataService.getAdminId(request.getSession());
		AdminSellRates ar=currencyRateService.getByCrId(rates.getCrId());
		if (adminId != null) {
			Admin admin = adminService.getAdminDetailsBasedOnAdminId(adminId);
			Branch from_br = branchService.getBranchBasedOnBranchId(f_br);
			Branch to_br = branchService.getBranchBasedOnBranchId(t_br);
			ar.setAdmin(admin);
			ar.setFromBranch(from_br);
			ar.setToBranch(to_br);
			ar.setMarkup(rates.getMarkup());
			ar.setMasterRate(rates.getMasterRate());
			ar.setSellRate(rates.getSellRate());
			rates.setUpdatedDate(sdf.format(d));
			rates.setRateUpdatedDate(sdf.format(d));
			currencyRateService.updateAdminSellRate(ar);
			return "redirect:addbuy_rates";
		} else {
			return "redirect:index";
		}
	}

	
	@GetMapping("/add_new_rates_by_admin")
	public String addNewRatesByAdmin(HttpServletRequest request, @ModelAttribute AdminSellRates rates,
			@RequestParam String f_br, @RequestParam String t_br) {
		String adminId = sessionDataService.getAdminId(request.getSession());
		if (adminId != null) {
			Admin admin = adminService.getAdminDetailsBasedOnAdminId(adminId);
			Branch from_br = branchService.getBranchBasedOnBranchId(f_br);
			Branch to_br = branchService.getBranchBasedOnBranchId(t_br);
			rates.setFromBranch(from_br);
			rates.setToBranch(to_br);
			rates.setAdmin(admin);
			rates.setCreatedDate(sdf.format(d));
			rates.setUpdatedDate(sdf.format(d));
			// currencyRateService.updateAdminSellRate(rates);
			return "redirect:add_rates";
		} else {
			return "redirect:index";
		}
	}

	/*
	 * @RequestMapping(value = "/modeofpayments", method = RequestMethod.POST)
	 * public String saveModeOfPaymentDetails(@ModelAttribute ModeOfPayments
	 * modeOfPayments)
	 * 
	 * { modeOfPaymentsService.insertModeOfPayments(modeOfPayments); return null;
	 * 
	 * }
	 */
	@RequestMapping(value = "/srfee", method = RequestMethod.GET)
	public ModelAndView getServiceFee(HttpServletRequest request) {
		ModelAndView mav = null;
		List<ServiceFees> servicefeeList = null;
		String adminId = sessionDataService.getAdminId(request.getSession());
		if (adminId != null) {
			mav = new ModelAndView("srfee");
			List<Branch> sList = branchService.getByAdminAndFunctionality(adminId, "receiving");
			List<Branch> rList = branchService.getByAdminAndFunctionality(adminId, "sending");
			
			servicefeeList = serviceFee.getAllBranchesBasedOnAdminId(adminId);

			if (sList != null && rList !=null) {
				mav.addObject("sList", sList);
				mav.addObject("rList", rList);
				mav.addObject("servicefeelist", servicefeeList);

			}

		}else {
			mav=new ModelAndView("login");
		}
		return mav;
	}

	@RequestMapping(value = "/addFeeLimitation", method = RequestMethod.POST)
	public @ResponseBody String addFeeLimitation(@RequestParam String minvalue, @RequestParam String maxvalue,
			@RequestParam String fee, @RequestParam String f_br, @RequestParam String t_br,
			@RequestParam String adminid,@RequestParam String rateType,String ptype) {
		String message = "success";
		boolean flag = serviceFee.addFeeLimitation1(Long.parseLong(minvalue), Long.parseLong(maxvalue),
				Integer.parseInt(fee), 0, f_br, t_br, adminid,rateType.toString(),ptype);

		if (flag == true) {
			message = "success";
		} else {

			message = "failed";
		}
		return message;
	}

	@RequestMapping(value = "/updateFeeLimitation", method = RequestMethod.POST)
	public @ResponseBody String updateFeeLimitation(@RequestParam String servicefeeid, int fee, String adminid,String rateType) {
		String message = "";
		boolean flag = serviceFee.updateFeeLimitation(servicefeeid, fee, adminid,rateType);

		if (flag == true) {
			message = "updated";
		} else {

			message = "failed";
		}
		return message;
	}

	@RequestMapping(value = "/deleteFeeLimitation", method = RequestMethod.POST)
	public @ResponseBody String deleteFeeLimitation(@RequestParam String sid, String adminid) {
		String message = "";

		boolean flag = serviceFee.deleteFeeLimitation(sid, adminid);

		if (flag == true) {
			message = "deleted";
		} else {

			message = "failed";
		}
		return message;
	}

	/*
	 * @PostMapping("insertModeOfPaymentFee") public String
	 * insertModeOfPaymentFee(HttpServletRequest request) {
	 * System.out.println("form insertModeOfPaymentFee"); String data =
	 * request.getParameter("data");
	 * 
	 * System.out.println("data = " + data);
	 * 
	 * String[] s1 = data.split(",");
	 * 
	 * for (String s : s1) {
	 * 
	 * String[] s2 = s.split("-");
	 * 
	 * ModeOfPaymentFees fee = new ModeOfPaymentFees();
	 * System.out.println("modeofpayment................."+s2[0]);
	 * 
	 * //ModeOfPayments
	 * mop=modeOfPaymentsService.getModeofPaymentIdBasedOnModeOfPayment(s2[0]);
	 * //ModeOfPayments mop=modeOfPaymentsService.getModeOfPaymentBasedOnId(s2[0]);
	 * //System.out.println("idS...........:::"+mop);
	 * System.out.println("modof paymebnt id  = "+s2[0]); ModeOfPayments
	 * mop=modeOfPaymentsService.getModeOfPaymentBasedOnId(s2[0]);
	 * System.out.println("mop  = "+mop); fee.setModeOfPaymentId(mop);
	 * 
	 * //System.out.println("mop........"+mop);
	 * 
	 * //fee.setBranchId(s2[1]);
	 * 
	 * System.out.println("branchId........."+s2[1]);
	 * 
	 * fee.setFee(Double.parseDouble(s2[2]));
	 * 
	 * System.out.println("feee.................."+fee);
	 * 
	 * String adminId = sessionDataService.getAdminId(request.getSession());
	 * 
	 * Admin admin = adminService.getAdminDetailsBasedOnAdminId(adminId);
	 * 
	 * fee.setAdmin(admin); System.out.println("mode of payment  =  "+fee);
	 * //modeOfPaymentsService.saveModeOfPayments(fee);
	 * 
	 * }
	 * 
	 * return "redirect:mop"; }
	 * 
	 */

	@RequestMapping(value = "/updateFee", method = RequestMethod.POST)
	public @ResponseBody String updateFee(HttpServletRequest req, @RequestParam String modeOfPaymentFeeId,
			String adminId, String fee) {
		String message = "";
		boolean flag = feeService.updateFee(modeOfPaymentFeeId, Double.parseDouble(fee), adminId);

		if (flag == true) {
			message = "updated";
		} else {

			message = "failed";
		}
		return message;
	}

	/*
	 * @GetMapping("/getallFeebasedonadmin")
	 * 
	 * @ResponseBody public List<ModeOfPaymentFees>
	 * getAlFeeBasedOnAdmin(HttpServletRequest request){ String adminId =
	 * sessionDataService.getAdminId(request.getSession());
	 * 
	 * List<ModeOfPaymentFees>
	 * mlist=feeService.getAllModeOfPaymentFeesBasedOnAdminId(adminId);
	 * 
	 * System.out.println("mlist......."+mlist);
	 * 
	 * return mlist; }
	 * 
	 * 
	 * 
	 * 
	 */

	@RequestMapping("/admincustomerList")
	public String ListPage() {
		return "admincustomerList";
	}

	@RequestMapping(value = "/admincustomerlist", method = RequestMethod.POST)
	@ResponseBody
	public List<Customer> getcustomerListing(HttpServletRequest request, HttpServletResponse response) {

		String adminId = sessionDataService.getAdminId(request.getSession());

		List<Customer> customerList = null;

		if (adminId != null && !adminId.equals("")) {


			String customerStatus = request.getParameter("customerStatus");

			customerList = customerService.getAllCustomerList(adminId, customerStatus);

		}
		return customerList;

	}

	@RequestMapping(value = { "/updatebranch" }, method = { RequestMethod.POST })
	public String updateBranchDetails(HttpServletRequest request, @ModelAttribute Branch branch) {
		// String result = "";
		String adminId = sessionDataService.getAdminId(request.getSession());
		if ((adminId != null) && (!adminId.trim().equals(""))) {

			Admin admin = adminService.getAdminDetailsBasedOnAdminId(adminId);
			String branchId = request.getParameter("branchId");
			String password = request.getParameter("password");
			Branch b = branchService.getBranchBasedOnBranchId(branchId);
			branch.setFromCountry(b.getFromCountry());
			branch.setZone(b.getZone());
			branch.setAdmin(admin);
			branch.setEmailId(b.getEmailId());
			branch.setProfitMode(b.getProfitMode());
			branch.setCreatedDate(b.getCreatedDate());
			branch.setUpdatedDate(b.getUpdatedDate());
			branch.setFunctionality(b.getFunctionality());

			branchService.updateBranchDetails(branch);
			String myIp=request.getParameter("myIp");
			AuditTrail atr=new AuditTrail();
			atr.setAgent(branch.getAdmin().getAdminId());
			atr.setUserId(branch.getAdmin().getAdminId());
			atr.setUserType("ROLE_ADMIN");
			atr.setChangedData(branch.getBranchId());
			atr.setIpAddress(myIp);
			atr.setUserName(branch.getAdmin().getEmailId());
			atr.setCategory("Agent Details updated");
			atr.setAdminId(branch.getAdmin().getAdminId());
			auditTrailService.save(atr);

			String modeofpayments = "";

			if (branch.getFunctionality().equals("sending") || branch.getFunctionality().equals("both")) {

				String[] modeofpayemnt = request.getParameterValues("modeOfPayment");
				for (String s1 : modeofpayemnt) {
					modeofpayments = modeofpayments + s1 + ",";
				}

			}

			if (branch.getFunctionality().equals("sending") || branch.getFunctionality().equals("both")) {
				return "redirect:/updateModeOfPaymentFeeStatus?branchId=" + branchId + "&modeofpayments="
						+ modeofpayments + "&password=" + password;

			} else {
				return "redirect:updatepassword?password=" + password + "&branchId=" + branchId;
			}

		} else {
			return "redirect:index?msg=Your Session Expired Please Login Again";
		}

	}

	@GetMapping("/updatepassword")
	public String updateUserTypePassword(HttpServletRequest request) {
		String userType = request.getParameter("branchId");
		String password = request.getParameter("password");
		userService.updateUserPassword(password, userType);
		return "redirect:/branch_registration";

	}

	@GetMapping("/updateModeOfPaymentFeeStatus")
	public String updateMopStatus(HttpServletRequest request) {
		String branchId = request.getParameter("branchId");
		String password = request.getParameter("password");
		String modeofpayments = request.getParameter("modeofpayments");
		String adminId = sessionDataService.getAdminId(request.getSession());

		if (adminId != null) {

			Admin admin = adminService.getAdminDetailsBasedOnAdminId(adminId);

			feeService.updateStatusByBranchId(branchId, adminId, modeofpayments);
		}

		return "redirect:updatepassword?password=" + password + "&branchId=" + branchId;

	}

	@GetMapping("manageBranchPayments")
	public ModelAndView getBranchPaymentTypeBasedOnAdminId(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		HttpSession session = request.getSession(false);
		String admin = (String) session.getAttribute("adminId");
		List<Branch> list = null;
		List<BranchPaymentTypeDetails> bptd = null;
		mav.setViewName("manageBranchPaymentsType");
		Admin ad = adminService.getAdminDetailsBasedOnAdminId(admin);
		list = branchService.getAllReceivingAndBothBasedObAdminId(admin);
		bptd = payTypeService.getBranchPaymentTypeBasedOnBranchId(admin);
		mav.addObject("list", list);
		mav.addObject("paymenttype", bptd);
		mav.addObject("adminpt", ad);
		return mav;
	}

	@PostMapping("updatebranchpaymenttype")
	public @ResponseBody String updateBranchPaymentType(@RequestParam String branchid, String branchstatus,
			String paymentid, String paymentstatus, String deliverytime) {
		String message = "";
		BranchPaymentTypeDetails bp=payTypeService.getById(paymentid);
		System.out.println("payment type======"+bp.getPaymentTypes().getPaymentType());
		List<AdminSellRates> list=currencyRateService.findByToBranch(branchid,bp.getPaymentTypes().getPaymentType());
		System.out.println("list======"+list.size());
		if(list.size()>0) {
			for(int i=0;i<list.size();i++) {
				AdminSellRates rates=list.get(i);
				rates.setStatus(paymentstatus);
				currencyRateService.updateAdminSellRate(rates);
			}
		}
		boolean flag = payTypeService.updateBranchPaymentType(branchid, branchstatus, paymentid, paymentstatus,
				deliverytime);

		if (flag == true) {
			message = "success";
		} else {
			message = "failed";
		}

		return message;

	}

	@RequestMapping(value = "/admincustomereditprofile", method = RequestMethod.GET)
	public ModelAndView getCustomerEditProfile(HttpServletRequest request) {
		ModelAndView modelAndView = new ModelAndView();
		String customerId = request.getParameter("customerId");
		Customer customer = customerService.findByCustomerId(customerId);
		modelAndView.setViewName("admincustomereditprofile");
		modelAndView.addObject("customer", customer);
		String branchId = customer.getBranch().getBranchId();
		Branch branch = branchService.getBranchBasedOnBranchId(branchId);
		modelAndView.addObject("branch", branch);
		List<SenderIds> ids=senderIdTypeService.findByBranchAndAdminAndFunctionality(branchId, branch.getAdmin().getAdminId(), "receiving");
		modelAndView.addObject("ids", ids);

		modelAndView.addObject("countryISo", branch.getFromCountry().getCountryISO());
		modelAndView.addObject("country", branch.getFromCountry().getCountryName());

		return modelAndView;
	}

	@RequestMapping(value = "/adminupdatecustomerprofile", method = RequestMethod.POST)
	public ModelAndView updateCustomeProfile(HttpServletRequest request, @ModelAttribute Customer customer,
			MultipartHttpServletRequest multipartRequest) {
		ModelAndView modelAndView = new ModelAndView();
		// String branchId=sessionDataService.getBranchId(request.getSession());
		String adminId = sessionDataService.getAdminId(request.getSession());
		if (adminId != null && !adminId.equals("")) {
			Admin admin = adminService.getAdminDetailsBasedOnAdminId(adminId);

			// Branch branch= branchService.getBranchBasedOnBranchId(branchId);
			String customerId = request.getParameter("customerId");
			Customer c = customerService.findByCustomerId(customerId);

			customer.setBranch(c.getBranch());

			customer.setCountry(c.getCountry());

			customer.setAdmin(admin);

			String idProofIssueCountryISO = request.getParameter("idProofIssueCountry");
			Country idIssueCountry = countryService.getCountryBasedOnIso(idProofIssueCountryISO);
			customer.setIssuingCountry(idIssueCountry);
			String firstIdProofType = request.getParameter("firstIdProofType").split(",")[0];
			customer.setFirstIdProofType(firstIdProofType);

			customerService.updateCustomerProfile(customer, multipartRequest);
		}
		modelAndView.setViewName("redirect:admincustomereditprofile");
		modelAndView.addObject("customerId", customer.getCustomerId());
		modelAndView.addObject("branch", customer.getBranch());

		return modelAndView = new ModelAndView("redirect:/admincustomerList");
	}

	@RequestMapping("/addNewUsers")
	public ModelAndView newUsersPage(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView("addNewUsers");
		String adminId = sessionDataService.getAdminId(request.getSession());
		if (adminId != null && !adminId.equals("")) {
			mav.setViewName("addNewUsers");
			List<AddNewUser> List = newUserService.getAllNewUsersListBasedOnAdminId(adminId);
			Admin admin = adminService.getAdminDetailsBasedOnAdminId(adminId);
			if (request.getParameter("newUserId") != null) {
				String newUserId = request.getParameter("newUserId");
				AddNewUser addNewUser = newUserService.getUserById(newUserId);
				mav.addObject("addNewUser", addNewUser);
			}

			mav.addObject("admin", admin);
			mav.addObject("List", List);
		}

		return mav;
	}

	@RequestMapping(value = "/insertNewUser", method = RequestMethod.POST)
	public ModelAndView saveNewUserDetails(HttpServletRequest request, MultipartRequest multiPartRequest,
			@ModelAttribute AddNewUser addNewUser) {
		ModelAndView mav = new ModelAndView("newUsers");
		String adminId = sessionDataService.getAdminId(request.getSession());
		if (adminId != null && !adminId.equals("")) {
			Admin admin = adminService.getAdminDetailsBasedOnAdminId(adminId);
			addNewUser.setAdmin(admin);
			String toCountryDetails = request.getParameter("toCountryDetails");
			addNewUser.setBusinessCountries(toCountryDetails);
			mav.addObject("admin", admin);
			List<AddNewUser> List = newUserService.getAllNewUsersList();
			String toCountryNames = request.getParameter("toCountryNames");
			newUserService.saveNewUser(addNewUser, multiPartRequest);
			mav.addObject("List", List);

		}

		mav.setViewName("redirect:addNewUsers");
		return mav;

	}

	@RequestMapping(value = "/updateNewUser", method = RequestMethod.GET)
	public ModelAndView NewUserProfile(HttpServletRequest request, ModelMap map) {
		ModelAndView modelAndView = new ModelAndView();
		String newUserId = request.getParameter("newUserId");
		AddNewUser addNewUser = newUserService.getUserById(newUserId);
		String adminId = sessionDataService.getAdminId(request.getSession());
		Admin admin = adminService.getAdminDetailsBasedOnAdminId(adminId);
		modelAndView.setViewName("updateNewUser");
		modelAndView.addObject("addNewUser", addNewUser);
		modelAndView.addObject("admin", admin);
		String businessCountries = request.getParameter("businessCountries");
		map.addAttribute("bc", admin.getBusinessCountries());
		String[] adminb = admin.getBusinessCountries().split(",");
		String[] user = addNewUser.getBusinessCountries().split(",");
		Map<String, String> bcMap = new HashMap<String, String>();
		List<Admin> adminlist = adminService.getAllAdmin();
		String buisnesscountries = "";
		String userc = "";
		for (String users : user) {
			bcMap.put(users, users);
		}

		for (String a : adminb) {
			if (!bcMap.containsKey(a)) {
				map.addAttribute("abc", a);
				buisnesscountries = buisnesscountries + a + ",";

			} else {
				map.addAttribute("user", a);
				userc = userc + a + ",";
			}
		}

		modelAndView.addObject("adminlist", adminlist);
		modelAndView.addObject("buisnesscountries", buisnesscountries);
		modelAndView.addObject("newUserId", newUserId);
		modelAndView.addObject("userc", userc);

		return modelAndView;
	}

	@RequestMapping(value = "/updateUser", method = RequestMethod.POST)
	public ModelAndView updateUser(HttpServletRequest request, @ModelAttribute AddNewUser addNewUser,
			MultipartHttpServletRequest multipartRequest) {
		ModelAndView modelAndView = new ModelAndView("updateNewUser");
		String adminId = sessionDataService.getAdminId(request.getSession());
		Admin admin = adminService.getAdminDetailsBasedOnAdminId(adminId);
		addNewUser.setAdmin(admin);

		String businessCountries = request.getParameter("businessCountries");

		if (businessCountries != null) {
			newUserService.updateNewUser(addNewUser, multipartRequest);
		} else {
			String userc = request.getParameter("userc");
			addNewUser.setBusinessCountries(userc);
			newUserService.updateNewUser(addNewUser, multipartRequest);

		}
		modelAndView.setViewName("redirect:updateNewUser");
		modelAndView.addObject("newUserId", addNewUser.getNewUserId());

		return modelAndView = new ModelAndView("redirect:/addNewUsers");
	}

	@GetMapping("getTransactionListBasedOnFromToDate")
	@ResponseBody
	public  List<TransactionInformation> getAllTransaction(@RequestParam String fromdate, String todate,
			HttpServletRequest request)

	{
		String adminId = sessionDataService.getAdminId(request.getSession());
		String branchId=sessionDataService.getBranchId(request.getSession());
		Branch b=branchService.getBranchBasedOnBranchId(branchId);
		List<TransactionInformation> list = adminService.getTransactionDetailsByAdmin(b.getAdmin().getAdminId(), fromdate, todate);
		ModelAndView mav = new ModelAndView();

		return list;

	}

	/*
	 * @RequestMapping("getunderremitfromdateandtodate") public @ResponseBody
	 * List<TransactionInformation>
	 * getUnderRemitFromDateAndToDate(HttpServletRequest request)
	 * 
	 * { String adminId = sessionDataService.getAdminId(request.getSession());
	 * List<TransactionInformation> list =
	 * transactionService.getUnderRemiTransactions(adminId, "funds received",
	 * "completed"); System.out.println("list test of transaction:" + list.size());
	 * ModelAndView mav = new ModelAndView(); mav.addObject("transactionlist",list);
	 * mav.setViewName("transactionList");
	 * 
	 * return list;
	 * 
	 * }
	 */
	@RequestMapping("transactionList")
	public ModelAndView getAllTransactionList(HttpServletRequest request)

	{
		String adminId = sessionDataService.getAdminId(request.getSession());
		String fromdate = "";
		String todate = "";
		Admin a=adminService.getAdminDetailsBasedOnAdminId(adminId);
		List<TransactionInformation> list = adminService.getTransactionDetailsByAdmin(adminId, fromdate, todate);
		/*
		 * for(TransactionInformation l:list) { fromdate=l.getCreatedDate();
		 * todate=l.getCreatedDate(); }
		 */
		for (int i = list.size() - 1; i < list.size(); i++) {
			for (TransactionInformation l : list) {
				fromdate = l.getCreatedDate();
				todate = l.getCreatedDate();
			}
		}
		ModelAndView mav = new ModelAndView();
		mav.addObject("transactionlist", list);
		mav.setViewName("transactionList");
		mav.addObject("fromdate", fromdate);
		mav.addObject("todate", todate);
		mav.addObject("nsn", a.getNsano());
		return mav;

	}

	@RequestMapping("CustomerManualIdVerification")
	public ModelAndView manualIDVerification(HttpServletRequest request) {
		String adminId = sessionDataService.getAdminId(request.getSession());
		ModelAndView mav = null;
		if (adminId != null) {
			mav = new ModelAndView("ManualIdVerification");
			List<Customer> list = customerService.getAllCustomerByAdminId(adminId);
			/*
			 * list=list.stream().filter(l->l.getAdmin().getAdminId().equals(adminId) &&
			 * l.getCustomerKYCStatus().equals("N")).collect(Collectors.toList());
			 */
			/*
			 * && l.getCustomerKYCMode().equals("RapidId") && l.getFirstIdProofDoc()!=null
			 * && !l.getFirstIdProofDoc().equals("")&&
			 * l.getCustomerKYCStatus().equals("N")l.getAdmin().getAdminId().equals(adminId)
			 * &&
			 */
			mav.addObject("list", list);
		} else {
			mav = new ModelAndView("redirect:index?session expired");
		}
		return mav;
	}

	@RequestMapping("manual_id_update")
	public String updateManualVerification(@RequestParam String id, String status, HttpServletRequest request) {
		String message = "";
		String adminId = sessionDataService.getAdminId(request.getSession());
		if (adminId != null) {
			Customer c = customerService.findByCustomerId(id);
			if (status.equals("yes")) {
				c.setCustomerKYCStatus("completed");
				c.setFirstIdProofStatus(status);
				c.setSecondIdProofStatus(status);
				c.setStatus("active");
				String idType="";
				if((c.getFirstIdProofType()).equals('1') ) {
					idType="Work Permit";	
				}
				if((c.getFirstIdProofType()).equals("2") ) {

					idType="International Passport";	
				}
				if((c.getFirstIdProofType()).equals('3') ) {
				idType="Identification ID";	
				}
				if((c.getFirstIdProofType()).equals('4') ) {
				idType="Residence Permit";	
				}
				if((c.getFirstIdProofType()).equals('5') ) {
				idType="Passport";	
				}
				if((c.getFirstIdProofType()).equals('6') ) {
				idType="Social Security";	
				}
				if((c.getFirstIdProofType()).equals('7') ) {
				idType="System ID";	
				}

				if((c.getFirstIdProofType()).equals('8') ) {
				idType="Driver Licence";	
				}

				
				EmailTemplate emailTemplate = emailTemplateService.getEmailTemplateByTitleAndAdmin(c.getAdmin().getAdminId(), "Manual id verification done by Admin");
				String bodyContent = emailTemplate.getTemplate();
				String replacedBodyContent = bodyContent.replace("{FIRST_NAME}", c.getFirstName());
				String replacedBodyContent2=replacedBodyContent.replace("{ID_TYPE}",idType);
								
				try { 
					SendMail.send("info@remitz.co.uk", c.getEmailId(), emailTemplate.getSubject(),
				  hederContent + bodyStartsContent + replacedBodyContent2 + bodyEndContent +
				  footerContent); 
					} catch (Exception e) { 
						e.printStackTrace();
						}

				
			} else {

				c.setCustomerKYCStatus("pending");
				c.setFirstIdProofStatus(status);
				c.setSecondIdProofStatus(status);
			}

			customerService.updateCustomer(c);
			AuditTrail atr=new AuditTrail();
			atr.setAgent(c.getBranch().getBranchId());
			atr.setUserId(c.getBranch().getBranchId());
			atr.setUserType("ROLE_BRANCH");
			atr.setChangedData(c.getCustomerKYCStatus());
			atr.setIpAddress("");
			atr.setUserName(c.getBranch().getEmailId());
			atr.setCategory("id verficication  is updated");
			atr.setAdminId(c.getAdmin().getAdminId());
			auditTrailService.save(atr);

			if (status.equals("yes")) {
				List<TransactionInformation> l = transactionService
						.getTransactionDetailsBasedOnCustomerId(c.getCustomerId());
				if (l.size() != 0) {
					for (TransactionInformation ti : l) {
						TransactionInformation txninfo = transactionService
								.getTransactionDetails(ti.getTransactionId());
						if (txninfo.getPaymentStatus().equals("funds received")) {
							txninfo.setStatus("processing");
							transactionService.updateTransactionInformation(txninfo);
						}
					}
				}
			}

			return "redirect:CustomerManualIdVerification";
		} else {
			return "redirect:index?home";
		}

	}

	@PostMapping("changePaymentStatusInTransaction")
	public @ResponseBody String changePaymentStatusTransaction(@RequestParam String pstatus, String txnid,
			String ckycstatus) {
		String message = "";
		Object[] txinfo = {};
		System.out.println("ckycstatus controller:" + ckycstatus);
				boolean flag = adminService.updateTransactionPaymentStatus(txnid, pstatus, ckycstatus);
		TransactionInformation ts=transactionService.getTransactionDetails(txnid);
		if(pstatus.equals("funds received")) {
			EmailTemplate emailTemplate = emailTemplateService.getEmailTemplateByTitleAndAdmin(ts.getAdmin().getAdminId(), "Thanks for payment received");
			String bodyContent = emailTemplate.getTemplate();
			String replacedBodyContent = bodyContent.replace("{FIRST_NAME}", ts.getCustomer().getFirstName());
			String replacedBodyContent1=replacedBodyContent.replace("{PAYMENT_DATE}", ts.getCreatedDate());
			String replacedBodyContent2=replacedBodyContent1.replace("{TRANSACTION_NUMBER}", ts.getTransactionId());
						
			try { 
				SendMail.send("info@remitz.co.uk", ts.getCustomer().getEmailId(), emailTemplate.getSubject(),
			  hederContent + bodyStartsContent + replacedBodyContent2 + bodyEndContent +
			  footerContent); 
				} catch (Exception e) { 
					e.printStackTrace();
					}


		}
				if (flag == true)
			message = "success";
		else
			message = "failed";
		return message;

	}

	@PostMapping("changeTransactionStatus")
	public @ResponseBody String changeTransactionStatus(@RequestParam String transactionstatus, String txnid) {
		String message = "";
		Object[] txinfo = {};
		/*
		 * ModelAndView mav=new ModelAndView(); String
		 * adminId=sessionDataService.getAdminId(request.getSession());
		 * List<TransactionInformation>list=adminService.getTransactionDetailsByAdmin(
		 * adminId,fromdate,todate); System.out.println("list in admin:"+list.size());
		 * txinfo[0]=list; txinfo[1]=fromdate; txinfo[2]=todate;
		 */
		boolean flag = adminService.updateTransactionStatus(transactionstatus, txnid);
		if (flag == true)
			message = "success";
		else
			message = "failed";
		return message;

	}

	@GetMapping("/banks")
	public ModelAndView returnbanksPage(HttpServletRequest request, ModelMap map) {
		ModelAndView mav = new ModelAndView("banks");
		mav.setViewName("banks");
		String adminId = sessionDataService.getAdminId(request.getSession());

		List<Branch> branchlist = branchService.getAllBranchesBasedOnFunctionalityAndAdminIdwithoutFlag(adminId, "sending");
				//getBranchesBasedOnFunctionalityAndAdminId(adminId, "sending");
		mav.addObject("branchlist", branchlist);

		Admin admin = adminService.getAdminDetailsBasedOnAdminId(adminId);
		List<Branch> list = branchService.getAllBranchesBasedOnFunctionalityAndAdminIdwithoutFlag(adminId, "sending");
		mav.addObject("list", list);
		List<Banks> bankslist = bankService.getAll();
		List<Branch> branchList = branchService.getAllBranchesBasedOnFunctionalityAndAdminIdwithoutFlag(adminId, "sending");

		mav.addObject("bankslist", bankslist);
		mav.addObject("branchList", branchList);
		return mav;
	}

	@RequestMapping(value = "/insertbanks", method = RequestMethod.POST)
	public ModelAndView savebanks(HttpServletRequest request, @ModelAttribute Banks banks) {
		ModelAndView mav = new ModelAndView();
		String adminId = sessionDataService.getAdminId(request.getSession());
		
		  Admin admin=adminService.getAdminDetailsBasedOnAdminId(adminId);
		 
		String c = request.getParameter("country");
		Country country = countryService.getCountryBasedOnIso(c);
		banks.setCountry(country);
		String bankId=bankService.saveBanks(banks);
		String myIp=request.getParameter("myIp");
		AuditTrail atr=new AuditTrail();
		atr.setAgent(adminId);
		atr.setUserId(adminId);
		atr.setUserType("ROLE_ADMIN");
		atr.setChangedData(bankId);
		atr.setIpAddress(myIp);
		atr.setUserName(admin.getEmailId());
		atr.setAdminId(admin.getAdminId());
		atr.setCategory("New Transaction is created");
		auditTrailService.save(atr);

		return mav = new ModelAndView("redirect:banks");

	}

	@RequestMapping("/cashpickup")
	public ModelAndView returncashPage(HttpServletRequest request, ModelMap map) {
		ModelAndView mav = new ModelAndView("cashpickup");
		mav.setViewName("cashpickup");

		String adminId = sessionDataService.getAdminId(request.getSession());
		Admin admin = adminService.getAdminDetailsBasedOnAdminId(adminId);
		List<Branch> list = branchService.getBranchesBasedOnFunctionalityAndAdminId(adminId, "sending");
		mav.addObject("list", list);
		List<Cash> cashlist = cashService.getListByAdmin(adminId);
		mav.addObject("cashlist", cashlist);

		List<Branch> branchList = branchService.getBranchesBasedOnFunctionalityAndAdminId(adminId, "sending");

		mav.addObject("branchList", branchList);
		return mav;
	}

	@RequestMapping(value = "/insertcash", method = RequestMethod.POST)
	public ModelAndView savecash(HttpServletRequest request, @ModelAttribute Cash cash) {
		ModelAndView mav = new ModelAndView();
		String adminId = sessionDataService.getAdminId(request.getSession());
		Admin admin = adminService.getAdminDetailsBasedOnAdminId(adminId);
		cash.setAdmin(admin);
		String c = request.getParameter("country");
		Country country = countryService.getCountryBasedOnIso(c);
		cash.setCountry(country);
		cashService.insertCash(cash);

		return mav = new ModelAndView("redirect:cashpickup");

	}

	@RequestMapping("/add_email_templates1")
	public @ResponseBody ModelAndView addEmailFormate(HttpServletRequest request) {
		String adminId = sessionDataService.getAdminId(request.getSession());
		ModelAndView mav = null;
		if (adminId != null) {
			mav = new ModelAndView("add_email");
			List<EmailTemplate> list = emailTemplateService.getEmailTemplatesBasedOnAdmin(adminId);
			mav.addObject("list", list);
			EmailTemplate emailTemplate = new EmailTemplate();
			if (list.size() > 0) {
				emailTemplate = list.get(0);
			}
			mav.addObject("emailTemplate", emailTemplate);

		} else {
			mav = new ModelAndView("redirect:login?session expired");
		}
		return mav;
	}

	@RequestMapping(value = "/insertemailtemplate", method = RequestMethod.POST)
	public String addTemplateForEmail(HttpServletRequest request, @ModelAttribute EmailTemplate template) {
		String adminId = sessionDataService.getAdminId(request.getSession());
		Admin admin = adminService.getAdminDetailsBasedOnAdminId(adminId);
		if (adminId != null) {
			String flag = request.getParameter("flag");
			if (flag != null && flag.equals("addnewtitle")) {
				String newtitle = request.getParameter("newtitle");
				template.setTitle(newtitle);
				template.setAdmin(admin);
			} else {
				String title[] = request.getParameter("title").split("-");
				template.setEmailCode(Integer.parseInt(title[0]));
				template.setTitle(title[1]);
				template.setAdmin(admin);
			}
			emailTemplateService.insertTemplate(template);
			return "redirect:add_email_templates";
		} else {
			return "redirect:login?session expired";
		}
	}

	@RequestMapping(value = "/gettemplatebasedonid", method = RequestMethod.GET)
	public ModelAndView getEmailTemplateBasedOnTemaplateId(@RequestParam int id, HttpServletRequest request) {
		ModelAndView mav = null;
		String adminId = sessionDataService.getAdminId(request.getSession());
		Admin admin = adminService.getAdminDetailsBasedOnAdminId(adminId);
		if (adminId != null) {
			mav = new ModelAndView("add_email");
			List<EmailTemplate> list = emailTemplateService.getEmailTemplatesBasedOnAdmin(adminId);
			mav.addObject("list", list);
			EmailTemplate emailTemplate = new EmailTemplate();
			emailTemplate = emailTemplateService.getEmailTemplateBasedOnTemplateId(id);
			mav.addObject("emailTemplate", emailTemplate);

		} else {
			mav = new ModelAndView("redirect:login?session expired");
		}
		return mav;

	}

	@GetMapping("/remitadminupdate")
		public String getRemitAdminUpdate(HttpServletRequest request, HttpServletResponse response,ModelMap map) {
		List<PaymentTypes> pTypesList = null;
		pTypesList = paymentTypesService.getAllPaymentTypes();
		pTypesList.forEach(pt->pt.getPaymentType());
		map.addAttribute("pTypesList", pTypesList);
		return "remitadminupdate";
	}

	@PostMapping("/updateremitdetails")
	public String updateRemitAdminDetails(@ModelAttribute Admin admin, MultipartHttpServletRequest request) {
		String adminId = sessionDataService.getAdminId(request.getSession());
		String toCountryDetails = request.getParameter("toCountryDetails");
		admin.setBusinessCountries(toCountryDetails);
		String pTypes = request.getParameter("pTypes");
		System.out.println("pTypes----"+pTypes);
		admin.setPaymentTypes(pTypes);
		admin.setAdminId(adminId);
		adminService.updateRemitAdmin(admin, request);
		return "redirect:admindashbord";
	}

	@GetMapping("/adminCustomerprofile")
	public ModelAndView admincustomerprofile(HttpServletRequest request) {
		ModelAndView modelAndView = new ModelAndView();
		String custRegId = request.getParameter("custRegId");
		Customer customer=customerService.findByCustomerId(custRegId);
		List<TxDaysLimit> tlist=txr.getByBranchId(customer.getBranch().getBranchId());
		int days1=0;
		int days2=0;
		int days3=0;
		for(int i=0;i<tlist.size();i++) {
			
			if(i==0) {
				TxDaysLimit tl1=tlist.get(i);
				days1=Integer.parseInt(tl1.getLimitDays());
			}
			
			if(i==1) {
				TxDaysLimit tl2=tlist.get(i);
				days2=Integer.parseInt(tl2.getLimitDays());

			}
			if(i==2) {
				TxDaysLimit tl3=tlist.get(i);
				days3=Integer.parseInt(tl3.getLimitDays());

			}

		}

		Date date1=new Date();
		SimpleDateFormat dateFormat=new SimpleDateFormat("yyyy-MM-dd");
		SimpleDateFormat dateFormat1=new SimpleDateFormat("dd-MMM-YYYY");
		Calendar calendar=Calendar.getInstance();
		calendar.setTime(date1);
		Date date=calendar.getTime();
		String currentDate=dateFormat.format(date);
		String todayFormatedDate=dateFormat1.format(date);
		
		Calendar ThirtydaysCalendar=Calendar.getInstance();
		ThirtydaysCalendar.setTime(date1);
		ThirtydaysCalendar.add(Calendar.DAY_OF_MONTH,-days1);
		Date thirtydays=ThirtydaysCalendar.getTime();
		String thirtydaysdate=dateFormat.format(thirtydays);
		Calendar ninitydaysCalendar=Calendar.getInstance();
		ninitydaysCalendar.setTime(date1);
		ninitydaysCalendar.add(Calendar.DAY_OF_MONTH,-days2);
		Date nintydays=ninitydaysCalendar.getTime();
		String ninitydaysdate=dateFormat.format(nintydays);
		Calendar year=Calendar.getInstance();
		year.setTime(date1);
		year.add(Calendar.DAY_OF_MONTH,-days3);
		Date yearDays=year.getTime();
		String yeardaysdate=dateFormat.format(yearDays);
		List<TransactionInformation> tl=transactionService.getTransactionDetailsgroupby(thirtydaysdate,currentDate,custRegId);
		double ta1=0;
          int count1=0;
          double ta2=0;
          int count2=0;
          double ta3=0;
          int count3=0;;
	List<TransactionInformation> thirtyibt=transactionService.getTransactionDetailsgroupbymop(thirtydaysdate, currentDate, custRegId, "Internet Bank Transfer");
	int thirtycount=thirtyibt.size();
	double thirtyAmount=0;
	for(int i=0;i<thirtyibt.size();i++) {
		TransactionInformation t=thirtyibt.get(i);
double amt=t.getTotalAmountCollected();
		thirtyAmount=thirtyAmount+amt;
		
	}
	List<TransactionInformation> thirtycash=transactionService.getTransactionDetailsgroupbymop(thirtydaysdate, currentDate, custRegId, "Cash");
	int thirtycashCount=thirtycash.size();
	double thirtycashAmount=0;
	for(int i=0;i<thirtycash.size();i++) {
		TransactionInformation t=thirtycash.get(i);
		thirtycashAmount=thirtycashAmount+t.getTotalAmountCollected();
		
	}
	List<TransactionInformation> thirtyonline=transactionService.getTransactionDetailsgroupbymop(thirtydaysdate, currentDate, custRegId, "Online");
	int thirtyonlineCount=thirtyonline.size();
	double thirtyonlineAmount=0;
	for(int i=0;i<thirtyonline.size();i++) {
		TransactionInformation t=thirtyonline.get(i);
		thirtyonlineAmount=thirtyonlineAmount+t.getTotalAmountCollected();
		
	}
	ta1=thirtyonlineAmount+thirtycashAmount+thirtyAmount;
	count1=thirtycount+thirtycashCount+thirtyonlineCount;
	
	
	List<TransactionInformation> ni=transactionService.getTransactionDetailsgroupbymop(ninitydaysdate, currentDate, custRegId, "Internet Bank Transfer");
	int nic=ni.size();
	double nia=0;
	for(int i=0;i<ni.size();i++) {
		TransactionInformation t=ni.get(i);
double amt=t.getTotalAmountCollected();
		nia=nia+amt;
		
	}
	List<TransactionInformation> nc=transactionService.getTransactionDetailsgroupbymop(ninitydaysdate, currentDate, custRegId, "Cash");
	int ncc=nc.size();
	double nca=0;
	for(int i=0;i<nc.size();i++) {
		TransactionInformation t=nc.get(i);
		nca=nca+t.getTotalAmountCollected();
		
	}
	List<TransactionInformation> no=transactionService.getTransactionDetailsgroupbymop(ninitydaysdate, currentDate, custRegId, "Online");
	int noc=no.size();
	double noa=0;
	for(int i=0;i<no.size();i++) {
		TransactionInformation t=no.get(i);
		noa=noa+t.getTotalAmountCollected();
		
	}
	
	
	ta2=noa+nca+nia;
	count2=nic+ncc+noc;
	
	List<TransactionInformation> yi=transactionService.getTransactionDetailsgroupbymop(yeardaysdate, currentDate, custRegId, "Internet Bank Transfer");
	int yic=yi.size();
	double yia=0;
	for(int i=0;i<yi.size();i++) {
		TransactionInformation t=yi.get(i);
double amt=t.getTotalAmountCollected();
yia=yia+amt;
		
	}
	List<TransactionInformation> yc=transactionService.getTransactionDetailsgroupbymop(yeardaysdate, currentDate, custRegId, "Cash");
	int ycc=yc.size();
	double yca=0;
	for(int i=0;i<yc.size();i++) {
		TransactionInformation t=yc.get(i);
		yca=yca+t.getTotalAmountCollected();
		
	}
	List<TransactionInformation> yo=transactionService.getTransactionDetailsgroupbymop(yeardaysdate, currentDate, custRegId, "Online");
	int yoc=yo.size();
	double yoa=0;
	for(int i=0;i<yo.size();i++) {
		TransactionInformation t=yo.get(i);
		yoa=yoa+t.getTotalAmountCollected();
		
	}
	
	
	ta3=yoa+yca+yia;
	count3=yic+ycc+yoc;
	
	modelAndView.addObject("days1", days1);
	modelAndView.addObject("days2", days2);
	modelAndView.addObject("days3", days3);
	modelAndView.addObject("ta1", ta1);
	modelAndView.addObject("count1", count1);
	modelAndView.addObject("ta2", ta2);
	modelAndView.addObject("count2", count2);
	modelAndView.addObject("ta3", ta3);
	modelAndView.addObject("count3", count3);
	modelAndView.addObject("tl", tl.size());
	modelAndView.addObject("thirtycashCount", thirtycashCount);
	modelAndView.addObject("thirtycashAmount", thirtycashAmount);
	modelAndView.addObject("thirtyonlineCount", thirtyonlineCount);
	modelAndView.addObject("thirtyonlineAmount", thirtyonlineAmount);
	modelAndView.addObject("thirtyibtcount", thirtycount);
	modelAndView.addObject("thirtyibtAmount", thirtyAmount);
	modelAndView.addObject("nca", nca);
	modelAndView.addObject("nia", nia);
	modelAndView.addObject("noa", noa);
	modelAndView.addObject("ncc", ncc);
	modelAndView.addObject("nic", nic);
	modelAndView.addObject("noc", noc);
	modelAndView.addObject("yca", yca);
	modelAndView.addObject("yia", yia);
	modelAndView.addObject("yoa", yoa);
	modelAndView.addObject("ycc", ycc);
	modelAndView.addObject("yic", yic);
	modelAndView.addObject("yoc", yoc);

	modelAndView.addObject("customer",customer);
	modelAndView.addObject("todayFormatedDate", todayFormatedDate);
modelAndView.setViewName("customerprofile");
	  return modelAndView;
	  }

	

	@RequestMapping(value = "/updatecustomerstatusByAdmin", method = RequestMethod.POST)
	public @ResponseBody String updateCustomerStatus(HttpServletRequest request, @RequestParam String customerId,
			@RequestParam String customerStatus, String myIp) {
		Customer c=customerService.findByCustomerId(customerId);
		AuditTrail atr=new AuditTrail();
		atr.setAgent(c.getBranch().getBranchId());
		atr.setUserId(c.getBranch().getBranchId());
		atr.setUserType("ROLE_BRANCH");
		atr.setOriginalData(c.getStatus());
		atr.setChangedData(customerStatus);
		atr.setIpAddress(myIp);
		atr.setUserName(c.getBranch().getEmailId());
		atr.setCategory("Remitter status is updated");
		atr.setAdminId(c.getAdmin().getAdminId());
		auditTrailService.save(atr);

		customerService.updateCustomerStatus(customerId, customerStatus);

		System.out.println("updated");
		return "updated";
	}

	@RequestMapping(value = "/adminUpdate", method = RequestMethod.GET)
	public ModelAndView returnAdminList(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView("adminUpdate");
		String adminId = sessionDataService.getAdminId(request.getSession());
		// List<Admin> list = new ArrayList<Admin>();
		Admin admin = adminService.getAdminDetailsBasedOnAdminId(adminId);
		mav.addObject("adminlist", admin);
		return mav;
	}

	@RequestMapping("/add_email_templates")
	public @ResponseBody ModelAndView addEmailFormates(HttpServletRequest request) {
		String adminId = sessionDataService.getAdminId(request.getSession());
		ModelAndView mav = null;
		if (adminId != null) {
			mav = new ModelAndView("add_email");
			List<EmailTemplate> list = emailTemplateService.getEmailTemplatesBasedOnAdmin(adminId);
			mav.addObject("list", list);
			System.out.println("list...." + list);
			EmailTemplate emailTemplate = new EmailTemplate();
			if (list.size() > 0) {
				emailTemplate = list.get(0);
				System.out.println("emailTemplate....." + list.get(0));
			} else {
				EmailTemplate EmailTemplate = new EmailTemplate();
				Admin admin = adminService.getAdminDetailsBasedOnAdminId(adminId);
				for (int i = 0; i < 11; i++) {

					if (i == 0) {
						System.out.println("firstloop");

						EmailTemplate.setAdmin(admin);
						EmailTemplate.setBccEmail(admin.getEmailId());
						EmailTemplate.setCcEmail(admin.getEmailId());
						EmailTemplate.setDemo("");
						EmailTemplate.setReplyEmail(admin.getEmailId());
						EmailTemplate.setSubject("Reset Password Link");
						EmailTemplate.setTemplate(
								"<span style=\"color: rgb(34, 34, 34); font-family: Arial, Helvetica, sans-serif; font-size: small;\">Hi {FIRST_NAME},</span><br style=\"color: rgb(34, 34, 34); font-family: Arial, Helvetica, sans-serif; font-size: small;\"><span style=\"color: rgb(34, 34, 34); font-family: Arial, Helvetica, sans-serif; font-size: small;\">To initiate the password reset process for your member account, click the link below:</span><br style=\"color: rgb(34, 34, 34); font-family: Arial, Helvetica, sans-serif; font-size: small;\"><span style=\"color: rgb(34, 34, 34); font-family: Arial, Helvetica, sans-serif; font-size: small;\">{PASSWORD_RESET_LINK}</span><br>");
						EmailTemplate.setTitle("Reset Password Link");
					}
					if (i == 1) {
						EmailTemplate.setAdmin(admin);
						EmailTemplate.setBccEmail(admin.getEmailId());
						EmailTemplate.setCcEmail(admin.getEmailId());
						EmailTemplate.setDemo("");
						EmailTemplate.setReplyEmail(admin.getEmailId());
						EmailTemplate.setSubject("Manual id verification done by Admin");
						EmailTemplate.setTemplate("Manual id verification done by Admin");
						EmailTemplate.setTitle("Manual id verification done by Admin");

					}
					if (i == 2) {
						EmailTemplate.setAdmin(admin);
						EmailTemplate.setBccEmail(admin.getEmailId());
						EmailTemplate.setCcEmail(admin.getEmailId());
						EmailTemplate.setDemo(" ");
						EmailTemplate.setReplyEmail(admin.getEmailId());
						EmailTemplate.setSubject("Email to customer about auto id verififcation fail");
						EmailTemplate.setTemplate("Email to customer about auto id verififcation fail");
						EmailTemplate.setTitle("Email to customer about auto id verififcation fail");

					}
					if (i == 3) {
						EmailTemplate.setAdmin(admin);
						EmailTemplate.setBccEmail(admin.getEmailId());
						EmailTemplate.setCcEmail(admin.getEmailId());
						EmailTemplate.setDemo("");
						EmailTemplate.setReplyEmail(admin.getEmailId());
						EmailTemplate.setSubject("Alert to customer about expiry of PHOTO ID");
						EmailTemplate.setTemplate(
								"<span style=\"color: rgb(34, 34, 34); font-family: Arial, Helvetica, sans-serif; font-size: small;\">Hi {FIRST_NAME},</span><br style=\"color: rgb(34, 34, 34); font-family: Arial, Helvetica, sans-serif; font-size: small;\"><br style=\"color: rgb(34, 34, 34); font-family: Arial, Helvetica, sans-serif; font-size: small;\"><span style=\"color: rgb(34, 34, 34); font-family: Arial, Helvetica, sans-serif; font-size: small;\">This email is to notify you that your {ID_TYPE} will expire on {ID_EXPIRY_DATE}.</span><br style=\"color: rgb(34, 34, 34); font-family: Arial, Helvetica, sans-serif; font-size: small;\"><span style=\"color: rgb(34, 34, 34); font-family: Arial, Helvetica, sans-serif; font-size: small;\">Please upload a copy of a valid passport and proof of address, or drivers licence ID by clicking on the link below.</span><br style=\"color: rgb(34, 34, 34); font-family: Arial, Helvetica, sans-serif; font-size: small;\"><span style=\"color: rgb(34, 34, 34); font-family: Arial, Helvetica, sans-serif; font-size: small;\">{PROFILE_LINK}</span><br style=\"color: rgb(34, 34, 34); font-family: Arial, Helvetica, sans-serif; font-size: small;\"><span style=\"color: rgb(34, 34, 34); font-family: Arial, Helvetica, sans-serif; font-size: small;\">We look forward to serving you again!.</span><br>");
						EmailTemplate.setTitle("Alert to customer about expiry of PHOTO ID");

					}
					if (i == 4) {
						EmailTemplate.setAdmin(admin);
						EmailTemplate.setBccEmail(admin.getEmailId());
						EmailTemplate.setCcEmail(admin.getEmailId());
						EmailTemplate.setDemo("");
						EmailTemplate.setReplyEmail(admin.getEmailId());
						EmailTemplate.setSubject("Email to sender on complete transaction");
						EmailTemplate.setTemplate(
								"<span style=\"color: rgb(34, 34, 34); font-family: Arial, Helvetica, sans-serif; font-size: small;\">Hi {FIRST_NAME},</span><br style=\"color: rgb(34, 34, 34); font-family: Arial, Helvetica, sans-serif; font-size: small;\"><br style=\"color: rgb(34, 34, 34); font-family: Arial, Helvetica, sans-serif; font-size: small;\"><span style=\"color: rgb(34, 34, 34); font-family: Arial, Helvetica, sans-serif; font-size: small;\">Your money transfer of {SENDING_AMOUNT} for reference number {TRANSACTION_NUMBER} to {RECEIVING_COUNTRY_NAME} is now complete.</span><br style=\"color: rgb(34, 34, 34); font-family: Arial, Helvetica, sans-serif; font-size: small;\"><span style=\"color: rgb(34, 34, 34); font-family: Arial, Helvetica, sans-serif; font-size: small;\">Thank you for using Remitz.</span><br>");
						EmailTemplate.setTitle("Email to sender on complete transaction");

					}
					if (i == 5) {
						EmailTemplate.setAdmin(admin);
						EmailTemplate.setBccEmail(admin.getEmailId());
						EmailTemplate.setCcEmail(admin.getEmailId());
						EmailTemplate.setDemo("");
						EmailTemplate.setReplyEmail(admin.getEmailId());
						EmailTemplate.setSubject("Email to sender on order initiate");
						EmailTemplate.setTemplate(
								"<span style=\"color: rgb(34, 34, 34); font-family: Arial, Helvetica, sans-serif; font-size: small;\">Hi {FIRST_NAME},</span><br style=\"color: rgb(34, 34, 34); font-family: Arial, Helvetica, sans-serif; font-size: small;\"><br style=\"color: rgb(34, 34, 34); font-family: Arial, Helvetica, sans-serif; font-size: small;\"><span style=\"color: rgb(34, 34, 34); font-family: Arial, Helvetica, sans-serif; font-size: small;\">Your money transfer of {SENDING_AMOUNT} for reference number {TRANSACTION_NUMBER} to {RECEIVING_COUNTRY_NAME} is initiated.</span><br style=\"color: rgb(34, 34, 34); font-family: Arial, Helvetica, sans-serif; font-size: small;\"><span style=\"color: rgb(34, 34, 34); font-family: Arial, Helvetica, sans-serif; font-size: small;\">Thank you for using CurrencyRemitApp.</span><br>");
						EmailTemplate.setTitle("Email to sender on order initiate");

					}
					if (i == 6) {
						EmailTemplate.setAdmin(admin);
						EmailTemplate.setBccEmail(admin.getEmailId());
						EmailTemplate.setCcEmail(admin.getEmailId());
						EmailTemplate.setDemo("");
						EmailTemplate.setReplyEmail(admin.getEmailId());
						EmailTemplate.setSubject("Password Changed Notification");
						EmailTemplate.setTemplate(
								"<span style=\"color: rgb(34, 34, 34); font-family: Arial, Helvetica, sans-serif; font-size: small;\">Hi {FIRST_NAME},</span><br style=\"color: rgb(34, 34, 34); font-family: Arial, Helvetica, sans-serif; font-size: small;\"><span style=\"color: rgb(34, 34, 34); font-family: Arial, Helvetica, sans-serif; font-size: small;\">Your login password has been changed successfully as per request sent on {DATE_TIME}.</span><br>");
						EmailTemplate.setTitle("Password Changed Notification");

					}
					if (i == 7) {
						EmailTemplate.setAdmin(admin);
						EmailTemplate.setBccEmail(admin.getEmailId());
						EmailTemplate.setCcEmail(admin.getEmailId());
						EmailTemplate.setDemo("");
						EmailTemplate.setReplyEmail(admin.getEmailId());
						EmailTemplate.setSubject("Thanks to customer about manual upload IDS");
						EmailTemplate.setTemplate(
								"<span style=\"color: rgb(34, 34, 34); font-family: Arial, Helvetica, sans-serif; font-size: small;\">Hi {FIRST_NAME},</span><br style=\"color: rgb(34, 34, 34); font-family: Arial, Helvetica, sans-serif; font-size: small;\"><span style=\"color: rgb(34, 34, 34); font-family: Arial, Helvetica, sans-serif; font-size: small;\">Thank you for uploading your documents, this will now be manually reviewed by our team and you should be expect contact from us within 1 hour during office hours (9am - 5pm Mon-Sat AEST) or first thing on the following working day.</span><br>");
						EmailTemplate.setTitle("Thanks to customer about manual upload IDS");

					}
					if (i == 8) {
						EmailTemplate.setAdmin(admin);
						EmailTemplate.setBccEmail(admin.getEmailId());
						EmailTemplate.setCcEmail(admin.getEmailId());
						EmailTemplate.setDemo("");
						EmailTemplate.setReplyEmail(admin.getEmailId());
						EmailTemplate.setSubject("Pay Now Pending Reminder");
						EmailTemplate.setTemplate(
								"<span style=\"color: rgb(34, 34, 34); font-family: Arial, Helvetica, sans-serif; font-size: small;\">Hi {FIRST_NAME},</span><br style=\"color: rgb(34, 34, 34); font-family: Arial, Helvetica, sans-serif; font-size: small;\"><span style=\"color: rgb(34, 34, 34); font-family: Arial, Helvetica, sans-serif; font-size: small;\">Thank you for visiting&nbsp;</span><a href=\"http://www.currencyremitapp.com/\" target=\"_blank\" data-saferedirecturl=\"https://www.google.com/url?q=http://www.CurrencyRemitApp.com&amp;source=gmail&amp;ust=1579756825990000&amp;usg=AFQjCNG4d10_pMmsmBkBTJk-syTjyU6KJQ\" style=\"color: rgb(17, 85, 204); font-family: Arial, Helvetica, sans-serif; font-size: small; background-color: rgb(255, 255, 255);\">www.CurrencyRemitApp.com</a><span style=\"color: rgb(34, 34, 34); font-family: Arial, Helvetica, sans-serif; font-size: small;\">.</span><br style=\"color: rgb(34, 34, 34); font-family: Arial, Helvetica, sans-serif; font-size: small;\"><span style=\"color: rgb(34, 34, 34); font-family: Arial, Helvetica, sans-serif; font-size: small;\">We noticed that you didn't get a chance to finish your transaction {TRANSACTION_NUMBER} so we're holding your transaction until {ORDER_EXPIRE_DATE_TIME}. Your transfer of {SENDING_AMOUNT} to {RECEIVER_SHORT_INFO} is ready to go.</span><br style=\"color: rgb(34, 34, 34); font-family: Arial, Helvetica, sans-serif; font-size: small;\"><span style=\"color: rgb(34, 34, 34); font-family: Arial, Helvetica, sans-serif; font-size: small;\">Pay online now, it's quick and secure.</span><br style=\"color: rgb(34, 34, 34); font-family: Arial, Helvetica, sans-serif; font-size: small;\"><span style=\"color: rgb(34, 34, 34); font-family: Arial, Helvetica, sans-serif; font-size: small;\">{PAY_NOW_BUTTON}</span><br style=\"color: rgb(34, 34, 34); font-family: Arial, Helvetica, sans-serif; font-size: small;\"><span style=\"color: rgb(34, 34, 34); font-family: Arial, Helvetica, sans-serif; font-size: small;\">Important information</span><br style=\"color: rgb(34, 34, 34); font-family: Arial, Helvetica, sans-serif; font-size: small;\"><span style=\"color: rgb(34, 34, 34); font-family: Arial, Helvetica, sans-serif; font-size: small;\">Payment must be made by {ORDER_EXPIRE_DATE_TIME} or the transaction will be cancelled. Once a payment is processed, your transaction will be released immediately. The transaction fees have not changed from your original enquiry.</span><br>");
						EmailTemplate.setTitle("Pay Now Pending Reminder");

					}

					if (i == 9) {
						EmailTemplate.setAdmin(admin);
						EmailTemplate.setBccEmail(admin.getEmailId());
						EmailTemplate.setCcEmail(admin.getEmailId());
						EmailTemplate.setDemo("");
						EmailTemplate.setReplyEmail(admin.getEmailId());
						EmailTemplate.setSubject("first signup messages");
						EmailTemplate.setTemplate(
								"<span style=\"color: rgb(34, 34, 34); font-family: Arial, Helvetica, sans-serif; font-size: small;\">Hi {FIRST_NAME},</span><br style=\"color: rgb(34, 34, 34); font-family: Arial, Helvetica, sans-serif; font-size: small;\"><span style=\"color: rgb(34, 34, 34); font-family: Arial, Helvetica, sans-serif; font-size: small;\">Thank you for choosing Remitz. We are happy to have you on board!</span><div><br style=\"color: rgb(34, 34, 34); font-family: Arial, Helvetica, sans-serif; font-size: small;\"><span style=\"color: rgb(34, 34, 34); font-family: Arial, Helvetica, sans-serif; font-size: small;\">Here is your new account information with us. Please keep this&nbsp;</span><span class=\"il\" style=\"color: rgb(34, 34, 34); font-family: Arial, Helvetica, sans-serif; font-size: small;\">email</span><span style=\"color: rgb(34, 34, 34); font-family: Arial, Helvetica, sans-serif; font-size: small;\">&nbsp;for future reference.</span></div><div><br style=\"color: rgb(34, 34, 34); font-family: Arial, Helvetica, sans-serif; font-size: small;\"><b><span style=\"color: rgb(34, 34, 34); font-family: Arial, Helvetica, sans-serif; font-size: small;\">Your username is your&nbsp;</span><span class=\"il\" style=\"color: rgb(34, 34, 34); font-family: Arial, Helvetica, sans-serif; font-size: small;\">email</span><span style=\"color: rgb(34, 34, 34); font-family: Arial, Helvetica, sans-serif; font-size: small;\">&nbsp;address: {SENDER_EMAIL_ID}</span><br style=\"color: rgb(34, 34, 34); font-family: Arial, Helvetica, sans-serif; font-size: small;\"><span style=\"color: rgb(34, 34, 34); font-family: Arial, Helvetica, sans-serif; font-size: small;\">Your unique Customer Number is: {CUSTOMER_NUMBER}</span></b></div><div><br style=\"color: rgb(34, 34, 34); font-family: Arial, Helvetica, sans-serif; font-size: small;\"><span style=\"color: rgb(34, 34, 34); font-family: Arial, Helvetica, sans-serif; font-size: small;\">Great news! As a thank you for joining our great team, here is a welcome gift. Enjoy your first transfer with Remitz free of charge! Simply enter the promo code during the transaction process. Let's go!</span></div><div><br style=\"color: rgb(34, 34, 34); font-family: Arial, Helvetica, sans-serif; font-size: small;\"><span style=\"color: rgb(34, 34, 34); font-family: Arial, Helvetica, sans-serif; font-size: small;\"><b>Promo Code: LOVE</b></span></div><div><br style=\"color: rgb(34, 34, 34); font-family: Arial, Helvetica, sans-serif; font-size: small;\"><span style=\"color: rgb(34, 34, 34); font-family: Arial, Helvetica, sans-serif; font-size: small;\"><b>Please note:</b> Remitz will never send you an&nbsp;</span><span class=\"il\" style=\"color: rgb(34, 34, 34); font-family: Arial, Helvetica, sans-serif; font-size: small;\">email</span><span style=\"color: rgb(34, 34, 34); font-family: Arial, Helvetica, sans-serif; font-size: small;\">&nbsp;or SMS asking you to provide your password.</span></div><div><br style=\"color: rgb(34, 34, 34); font-family: Arial, Helvetica, sans-serif; font-size: small;\"><span style=\"color: rgb(34, 34, 34); font-family: Arial, Helvetica, sans-serif; font-size: small;\">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; Phishing&nbsp;</span><span class=\"il\" style=\"color: rgb(34, 34, 34); font-family: Arial, Helvetica, sans-serif; font-size: small;\">emails</span><span style=\"color: rgb(34, 34, 34); font-family: Arial, Helvetica, sans-serif; font-size: small;\">&nbsp;are increasing in number and sophistication. It?s important to remain vigilant and wary of unexpected&nbsp;</span><span class=\"il\" style=\"color: rgb(34, 34, 34); font-family: Arial, Helvetica, sans-serif; font-size: small;\">emails</span><span style=\"color: rgb(34, 34, 34); font-family: Arial, Helvetica, sans-serif; font-size: small;\">&nbsp;or unfamiliar senders. If you have clicked on any links or noticed any unusual activities, report this to Remitz immediately at info@remitz.com.au</span><span style=\"color: rgb(34, 34, 34); font-family: Arial, Helvetica, sans-serif; font-size: small;\">. remitz is committed to working with our customers to stay safe online.</span></div><div><br></div><div><br style=\"color: rgb(34, 34, 34); font-family: Arial, Helvetica, sans-serif; font-size: small;\"><br></div> ");
						EmailTemplate.setTitle("first signup messages");

					}
					if (i == 10) {
						EmailTemplate.setAdmin(admin);
						EmailTemplate.setBccEmail(admin.getEmailId());
						EmailTemplate.setCcEmail(admin.getEmailId());
						EmailTemplate.setDemo("");
						EmailTemplate.setReplyEmail(admin.getEmailId());
						EmailTemplate.setSubject("Thanks for payment received");
						EmailTemplate.setTemplate(
								"<span style=\"color: rgb(34, 34, 34); font-family: Arial, Helvetica, sans-serif; font-size: small;\">Hi {FIRST_NAME},</span><br style=\"color: rgb(34, 34, 34); font-family: Arial, Helvetica, sans-serif; font-size: small;\"><span style=\"color: rgb(34, 34, 34); font-family: Arial, Helvetica, sans-serif; font-size: small;\">You have successfully made a payment to CurrencyRemitApp on {PAYMENT_DATE}.</span><br style=\"color: rgb(34, 34, 34); font-family: Arial, Helvetica, sans-serif; font-size: small;\"><span style=\"color: rgb(34, 34, 34); font-family: Arial, Helvetica, sans-serif; font-size: small;\">Your transaction number is {TRANSACTION_NUMBER}.</span><br style=\"color: rgb(34, 34, 34); font-family: Arial, Helvetica, sans-serif; font-size: small;\"><span style=\"color: rgb(34, 34, 34); font-family: Arial, Helvetica, sans-serif; font-size: small;\">We will notify you again as soon as we have confirmation that your recipient's account is credited.</span><br style=\"color: rgb(34, 34, 34); font-family: Arial, Helvetica, sans-serif; font-size: small;\"><span style=\"color: rgb(34, 34, 34); font-family: Arial, Helvetica, sans-serif; font-size: small;\">If you need to talk to us, our Care team at customerservice@</span><wbr style=\"color: rgb(34, 34, 34); font-family: Arial, Helvetica, sans-serif; font-size: small;\"><span style=\"color: rgb(34, 34, 34); font-family: Arial, Helvetica, sans-serif; font-size: small;\">CurrencyRemitApp.com will help you along.</span><br style=\"color: rgb(34, 34, 34); font-family: Arial, Helvetica, sans-serif; font-size: small;\"><span style=\"color: rgb(34, 34, 34); font-family: Arial, Helvetica, sans-serif; font-size: small;\">Thank you for using CurrencyRemitApp.</span><br>");
						EmailTemplate.setTitle("Thanks for payment received");

					}

					emailTemplateService.insertTemplate(EmailTemplate);
				}

			}
			mav.addObject("emailTemplate", emailTemplate);

		} else {
			mav = new ModelAndView("redirect:login?session expired");
		}
		return mav;
	}

	@RequestMapping("/sourceOfFund")
	public @ResponseBody ModelAndView addSourceOFund(HttpServletRequest request) {
		String adminId = sessionDataService.getAdminId(request.getSession());
		ModelAndView mav = null;
		if (adminId != null) {
			mav = new ModelAndView("sourceOfFund");
			List<SourceOfFunds1> list = sourceOfFundsService.SourceOfFundsListBasedOnAdmin(adminId);
			mav.addObject("list", list);
			SourceOfFunds1 sourceOfFund = new SourceOfFunds1();
			if (list.size() > 0) {
				sourceOfFund = list.get(0);
			} else {
				SourceOfFunds1 sourceOfFunds = new SourceOfFunds1();

				Admin admin = adminService.getAdminDetailsBasedOnAdminId(adminId);
				for (int i = 0; i < 15; i++) {

					if (i == 0) {
						sourceOfFunds.setAdmin(admin);
						sourceOfFunds.setSourceOfFund("Business Income");
					}
					if (i == 1) {
						sourceOfFunds.setAdmin(admin);

						sourceOfFunds.setSourceOfFund("Salary / Saving");
					}

					if (i == 2) {
						sourceOfFunds.setAdmin(admin);

						sourceOfFunds.setSourceOfFund("Financial supports from Spouse");
					}
					if (i == 3) {
						sourceOfFunds.setAdmin(admin);

						sourceOfFunds.setSourceOfFund("Property investment");
					}
					if (i == 4) {
						sourceOfFunds.setAdmin(admin);

						sourceOfFunds.setSourceOfFund("Shares investment");
					}
					if (i == 5) {
						sourceOfFunds.setAdmin(admin);

						sourceOfFunds.setSourceOfFund("Donation/Gift");
					}
					if (i == 6) {
						sourceOfFunds.setAdmin(admin);

						sourceOfFunds.setSourceOfFund("Freelance income");
					}
					if (i == 7) {
						sourceOfFunds.setAdmin(admin);

						sourceOfFunds.setSourceOfFund("Loans");
					}
					if (i == 8) {
						sourceOfFunds.setAdmin(admin);

						sourceOfFunds.setSourceOfFund("Retirement fund");
					}
					if (i == 9) {
						sourceOfFunds.setAdmin(admin);

						sourceOfFunds.setSourceOfFund("Rental/leasing income");
					}
					if (i == 10) {
						sourceOfFunds.setAdmin(admin);

						sourceOfFunds.setSourceOfFund("Data is not required to be collected by local jurisdiction");
					}
					if (i == 11) {
						sourceOfFunds.setAdmin(admin);

						sourceOfFunds.setSourceOfFund("Tax Refund");
					}
					if (i == 12) {
						sourceOfFunds.setAdmin(admin);

						sourceOfFunds.setSourceOfFund("Venture Capital");
					}
					if (i == 13) {
						sourceOfFunds.setAdmin(admin);

						sourceOfFunds.setSourceOfFund("Claims/Compensation");
					}
					if (i == 14) {
						sourceOfFunds.setAdmin(admin);

						sourceOfFunds.setSourceOfFund("Sales Assets");
					}

					sourceOfFundsService.insertSourceOfFunds(sourceOfFunds);
				}
			}
			mav.addObject("sourceOfFund", sourceOfFund);

		} else {
			mav = new ModelAndView("redirect:login?session expired");
		}
		return mav;
	}

	// updateSourceOfFund
	@RequestMapping(value = "/updateFund", method = RequestMethod.POST)
	public @ResponseBody String editSourceOfFund(HttpServletRequest request, @RequestParam String sourceOfFund,
			String sourceOffundId, String adminId) {
		String message = "";

		boolean flag = sourceOfFundsService.updateFund(sourceOfFund, Integer.parseInt(sourceOffundId), adminId);

		if (flag == true) {
			message = "updated";
		} else {

			message = "failed";
		}
		return message;
	}

	// deleteSourceOfFund
	@RequestMapping(value = { "/deleteSourceOfFund" }, method = { RequestMethod.GET })
	public ModelAndView deleteSourceOfFund(HttpServletRequest request) {
		ModelAndView mav = null;
		String sourceOffundId = request.getParameter("sourceOffundId");
		sourceOfFundsService.deleteFund(Integer.parseInt(sourceOffundId));

		return mav = new ModelAndView("redirect:sourceOfFund");
	}

	@RequestMapping("/relationShips1")
	public @ResponseBody ModelAndView relationShips1(HttpServletRequest request) {
		String adminId = sessionDataService.getAdminId(request.getSession());
		ModelAndView mav = null;
		if (adminId != null) {
			mav = new ModelAndView("relationShips1");
			List<RealationShips1> list = realationShips1Service.RelationshipsListBasedOnAdmin(adminId);
			mav.addObject("list", list);
			RealationShips1 realationShips1 = new RealationShips1();
			if (list.size() > 0) {
				realationShips1 = list.get(0);
			} else {
				Admin admin = adminService.getAdminDetailsBasedOnAdminId(adminId);

				RealationShips1 rp = new RealationShips1();

				for (int i = 0; i < 20; i++) {

					if (i == 0) {
						rp.setAdmin(admin);
						rp.setRelationShip("Spouse");
					}
					if (i == 1) {
						rp.setAdmin(admin);
						rp.setRelationShip("Children");
					}
					if (i == 2) {
						rp.setAdmin(admin);
						rp.setRelationShip("Parent");
					}
					if (i == 3) {
						rp.setAdmin(admin);
						rp.setRelationShip("Sibling/brother/sister");
					}
					if (i == 4) {
						rp.setAdmin(admin);
						rp.setRelationShip("Relative/uncle/auntie/cousin");
					}
					if (i == 5) {
						rp.setAdmin(admin);
						rp.setRelationShip("Self");
					}
					if (i == 6) {
						rp.setAdmin(admin);
						rp.setRelationShip("Ex-spouse");
					}
					if (i == 7) {
						rp.setAdmin(admin);
						rp.setRelationShip("Friend");
					}
					if (i == 8) {
						rp.setAdmin(admin);
						rp.setRelationShip("Business partner");
					}
					if (i == 9) {
						rp.setAdmin(admin);
						rp.setRelationShip("Customer");
					}
					if (i == 10) {
						rp.setAdmin(admin);
						rp.setRelationShip("Employee");
					}
					if (i == 11) {
						rp.setAdmin(admin);
						rp.setRelationShip("Branch/Representative office");
					}
					if (i == 12) {
						rp.setAdmin(admin);
						rp.setRelationShip("Subsidiary company");
					}
					if (i == 13) {
						rp.setAdmin(admin);
						rp.setRelationShip("Holding compnay");
					}
					if (i == 14) {
						rp.setAdmin(admin);
						rp.setRelationShip("Supplier");
					}
					if (i == 15) {
						rp.setAdmin(admin);
						rp.setRelationShip("Creditor");
					}
					if (i == 16) {
						rp.setAdmin(admin);
						rp.setRelationShip("Debtor");
					}
					if (i == 17) {
						rp.setAdmin(admin);
						rp.setRelationShip("Franchisee/Franchisor");
					}
					if (i == 18) {
						rp.setAdmin(admin);
						rp.setRelationShip("Non Related");
					}
					if (i == 19) {
						rp.setAdmin(admin);
						rp.setRelationShip("Data is not required to be collected by local jurisdiction");
					}
					realationShips1Service.insertRelationships(rp);
				}
			}
			mav.addObject("realationShips1", realationShips1);

		} else {
			mav = new ModelAndView("redirect:login?session expired");
		}
		return mav;
	}

	@RequestMapping(value = "/updateRelationShip", method = RequestMethod.POST)
	public @ResponseBody String editRelationShip(HttpServletRequest request, @RequestParam String relationShip,
			String relationId, String adminId) {
		String message = "";

		boolean flag = realationShips1Service.updateRelationShip(relationShip, Integer.parseInt(relationId), adminId);

		if (flag == true) {
			message = "updated";
		} else {

			message = "failed";
		}
		return message;
	}

	// deleteSourceOfFund
	@RequestMapping(value = { "/deleteRelationShip" }, method = { RequestMethod.GET })
	public ModelAndView deleteRelationShip(HttpServletRequest request) {
		ModelAndView mav = null;
		String relationId = request.getParameter("relationId");
		realationShips1Service.deleteRelationShip(Integer.parseInt(relationId));
		return mav = new ModelAndView("redirect:relationShips1");
	}

	@RequestMapping("/reasonForTransfer")
	public @ResponseBody ModelAndView reasonForTransfer(HttpServletRequest request) {
		String adminId = sessionDataService.getAdminId(request.getSession());
		ModelAndView mav = null;
		if (adminId != null) {
			mav = new ModelAndView("reasonForTransfer");
			List<ReasonForTransfer> list = reasonForTransferService.findByAdmin(adminId);
			mav.addObject("list", list);
			ReasonForTransfer reasonForTransfer = new ReasonForTransfer();
			if (list.size() > 0) {
				reasonForTransfer = list.get(0);
			} else {
				Admin admin = adminService.getAdminDetailsBasedOnAdminId(adminId);

				ReasonForTransfer rt = new ReasonForTransfer();

				for (int i = 0; i < 10; i++) {

					if (i == 0) {
						rt.setAdmin(admin);
						rt.setReasonForTransfer("Freight");
					}
					if (i == 1) {
						rt.setAdmin(admin);
						rt.setReasonForTransfer("Passenger Fare");
					}
					if (i == 2) {
						rt.setAdmin(admin);
						rt.setReasonForTransfer("Goods and Services");
					}
					if (i == 3) {
						rt.setAdmin(admin);
						rt.setReasonForTransfer("Legal Services");
					}
					if (i == 4) {
						rt.setAdmin(admin);
						rt.setReasonForTransfer("Health Services");
					}
					if (i == 5) {
						rt.setAdmin(admin);
						rt.setReasonForTransfer("Education Services");
					}
					if (i == 6) {
						rt.setAdmin(admin);
						rt.setReasonForTransfer("Other Personal Services");
					}
					if (i == 7) {
						rt.setAdmin(admin);
						rt.setReasonForTransfer("Grants and Gifts");
					}
					if (i == 8) {
						rt.setAdmin(admin);
						rt.setReasonForTransfer("Worker's Remitances/Family maintainance");
					}
					if (i == 9) {
						rt.setAdmin(admin);
						rt.setReasonForTransfer("Social Contributions and Benefits(Private Sector");
					}
					reasonForTransferService.insertReasonForTransfer(rt);

				}
			}
			mav.addObject("reasonForTransfer", reasonForTransfer);

		} else {
			mav = new ModelAndView("redirect:login?session expired");
		}
		return mav;
	}

	@RequestMapping(value = "/updateReasonForTranser", method = RequestMethod.POST)
	public @ResponseBody String editReasonForTransfer(HttpServletRequest request,
			@RequestParam String reasonForTransfer, String reasonFortransferId, String adminId) {
		String message = "";

		boolean flag = reasonForTransferService.updateReasonForTranser(reasonForTransfer,
				Integer.parseInt(reasonFortransferId), adminId);
		if (flag == true) {
			message = "updated";
		} else {

			message = "failed";
		}
		return message;
	}

	// deleteSourceOfFund
	@RequestMapping(value = { "/deleteReasonForTransfer" }, method = { RequestMethod.GET })
	public ModelAndView deleteReasonForTransfer(HttpServletRequest request) {
		ModelAndView mav = null;
		System.out.println("delete----");
		String reasonFortransferId = request.getParameter("reasonFortransferId");
		System.out.println("reasonFortransferId....." + reasonFortransferId);
		reasonForTransferService.deleteResonorTranser(Integer.parseInt(reasonFortransferId));
		return mav = new ModelAndView("redirect:reasonForTransfer");
	}

	@RequestMapping("/adminKey")
	public @ResponseBody ModelAndView adminKey(HttpServletRequest request) {
		String adminId = sessionDataService.getAdminId(request.getSession());
		ModelAndView mav = null;
		if (adminId != null) {
			mav = new ModelAndView("adminKey");
			List<KeyGeneration> list = adminKeyService.findAllByAdmin(adminId);
			mav.addObject("list", list);
			KeyGeneration adminKey = new KeyGeneration();
			if (list.size() > 0) {
				adminKey = list.get(0);
			} else {
				Admin admin = adminService.getAdminDetailsBasedOnAdminId(adminId);
				KeyGeneration ak = new KeyGeneration();
				ak.setAdmin(admin);
				ak.setFromEmail(admin.getEmailId());
				ak.setMailKey("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");
				adminKeyService.saveAdminKey(ak);

			}
			mav.addObject("adminKey", adminKey);

		}

		else {
			mav = new ModelAndView("redirect:login?session expired");
		}

		return mav;
	}

	@RequestMapping("/emails")
	public ModelAndView returnEmail() {
		ModelAndView mav = new ModelAndView("emails");
		return mav;
	}

	@RequestMapping("/ewalletPaymentTyp")
	public ModelAndView ewalletPaymentTyp(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView("ewalletPaymentTyp");
		String adminId = sessionDataService.getAdminId(request.getSession());
		if (adminId != null && !adminId.equals("")) {
			mav.setViewName("ewalletPaymentTyp");
			List<EwalletPaymentType> list = ewalletPaymentTypService.findByAdmin(adminId);
			EwalletPaymentType ew = ewalletPaymentTypService.findOneByAdmin(adminId);
			mav.addObject("ew", ew);
			mav.addObject("list", list);
		}
		return mav;
	}

	@RequestMapping(value = "/insertEwallet", method = RequestMethod.POST)
	public ModelAndView insertEwallet(HttpServletRequest request,
			@ModelAttribute EwalletPaymentType ewalletPaymentType) {
		ModelAndView mav = new ModelAndView();
		String adminId = sessionDataService.getAdminId(request.getSession());
		Admin admin = adminService.getAdminDetailsBasedOnAdminId(adminId);
		ewalletPaymentType.setAdmin(admin);
		ewalletPaymentTypService.save(ewalletPaymentType);
		return mav = new ModelAndView("redirect:ewalletPaymentTyp");

	}

	@RequestMapping(value = "/updateEwallet", method = RequestMethod.POST)
	public ModelAndView updateEwallet(HttpServletRequest request, @RequestParam String ewalletId,
			@RequestParam String ewalletName, @RequestParam String userName, @RequestParam String password,
			@RequestParam String apiKey, @ModelAttribute EwalletPaymentType ewalletPaymentType) {
		ModelAndView mav = new ModelAndView();
		String adminId = sessionDataService.getAdminId(request.getSession());
		Admin admin = adminService.getAdminDetailsBasedOnAdminId(adminId);
		ewalletPaymentType.setAdmin(admin);
		ewalletPaymentType.setEwalletId(ewalletId);
		ewalletPaymentType.setEwalletName(ewalletName);
		ewalletPaymentType.setUserName(userName);
		ewalletPaymentType.setPassword(password);
		ewalletPaymentType.setApiKey(apiKey);
		ewalletPaymentTypService.update(ewalletPaymentType);
		return mav = new ModelAndView("redirect:ewalletPaymentTyp");

	}

	@RequestMapping("/onlineMop")
	public ModelAndView onlineMop(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView("onlineMop");
		String adminId = sessionDataService.getAdminId(request.getSession());
		if (adminId != null && !adminId.equals("")) {
			mav.setViewName("onlineMop");
			List<OnlineMop> list = onlineMopService.findByAdmin(adminId);
			mav.addObject("list", list);
			OnlineMop om = onlineMopService.findOneByAdmin(adminId);
			mav.addObject("om", om);
		}
		return mav;
	}

	@RequestMapping(value = "/insertOnlineMop", method = RequestMethod.POST)
	public ModelAndView insertOnlineMop(HttpServletRequest request, MultipartRequest multiPartRequest,
			@ModelAttribute OnlineMop onlineMop) {
		ModelAndView mav = new ModelAndView();
		String adminId = sessionDataService.getAdminId(request.getSession());
		Admin admin = adminService.getAdminDetailsBasedOnAdminId(adminId);
		onlineMop.setAdmin(admin);
		onlineMopService.save(onlineMop, multiPartRequest);
		return mav = new ModelAndView("redirect:onlineMop");

	}

	@RequestMapping("/updateOnlineMop")
	public ModelAndView updateonlineMop(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView("updateOnlineMop");
		String adminId = sessionDataService.getAdminId(request.getSession());
		if (adminId != null && !adminId.equals("")) {
			mav.setViewName("updateOnlineMop");
			String onlineId = request.getParameter("onlineId");
			OnlineMop om = onlineMopService.findById(onlineId);
			mav.addObject("om", om);
		}
		return mav;
	}

	@RequestMapping(value = "/updateMop", method = RequestMethod.POST)
	public ModelAndView updateMop(HttpServletRequest request, MultipartRequest multiPartRequest,
			@ModelAttribute OnlineMop onlineMop) {
		ModelAndView mav = new ModelAndView();
		String adminId = sessionDataService.getAdminId(request.getSession());
		Admin admin = adminService.getAdminDetailsBasedOnAdminId(adminId);
		String onlineId = request.getParameter("onlineId");
		OnlineMop om = onlineMopService.findById(onlineId);
		om.setAdmin(admin);
		om.setApiKey(request.getParameter("apiKey"));
		om.setLink(request.getParameter("link"));
		om.setPassword(request.getParameter("password"));
		om.setPaymentGatewayName(request.getParameter("paymentGatewayName"));
		om.setPaymentPage(request.getParameter("paymentPage"));
		om.setUserName(request.getParameter("userName"));
		onlineMopService.update(om, multiPartRequest);
		return mav = new ModelAndView("redirect:updateOnlineMop");

	}

	@RequestMapping("/internetbanktransferMop")
	public @ResponseBody ModelAndView internetbanktransferMop(HttpServletRequest request) {
		String adminId = sessionDataService.getAdminId(request.getSession());
		ModelAndView mav = null;
		if (adminId != null) {
			mav = new ModelAndView("internetbanktransferMop");
			InternetBankTransferMop list = internetBankTransferMopService.findByAdmin(adminId);
			List<InternetBankTransferMop> list1 = internetBankTransferMopService.findAllByAdmin(adminId);
			mav.addObject("list", list);
			InternetBankTransferMop ibt = new InternetBankTransferMop();
			if (list1.size() > 0) {
				ibt = list1.get(0);
			} else {
				Admin admin = adminService.getAdminDetailsBasedOnAdminId(adminId);

				InternetBankTransferMop rt = new InternetBankTransferMop();

				rt.setAdmin(admin);
				rt.setAccountNumber("12345");
				rt.setBankCode("123");
				rt.setBankName("ABC");
				rt.setPayeeName("payeeName");
				internetBankTransferMopService.save(rt);
			}

			mav.addObject("ibt", ibt);

		} else {
			mav = new ModelAndView("redirect:login?session expired");
		}
		return mav;
	}

	@RequestMapping(value = "/insertbanktransferMop", method = RequestMethod.POST)
	public ModelAndView insertbanktransferMop(HttpServletRequest request, MultipartRequest multiPartRequest,
			@ModelAttribute InternetBankTransferMop ibt) {
		ModelAndView mav = new ModelAndView();
		String adminId = sessionDataService.getAdminId(request.getSession());
		Admin admin = adminService.getAdminDetailsBasedOnAdminId(adminId);
		ibt.setAdmin(admin);
		internetBankTransferMopService.update(ibt);
		return mav = new ModelAndView("redirect:internetbanktransferMop");

	}

	@RequestMapping("/SenderIdTypes")
	public @ResponseBody ModelAndView SenderIdTypes(HttpServletRequest request) {
		String adminId = sessionDataService.getAdminId(request.getSession());
		ModelAndView mav = null;
		if (adminId != null) {
			mav = new ModelAndView("SenderIdTypes");
			List<SenderIds> list = senderIdTypeService.findByAdmin(adminId);
			mav.addObject("list", list);
			SenderIds senderIds = new SenderIds();
			if (list.size() > 0) {
				senderIds = list.get(0);
			} else {
				Admin admin1 = adminService.getAdminDetailsBasedOnAdminId(adminId);
				SenderIds st = new SenderIds();
				for (int i = 0; i < 7; i++) {
					if (i == 0) {
						st.setAdmin(admin1);
						st.setSenderType("Work Permit");
						st.setIssuingAuthority("state");
						st.setIdValue("1");
					}
					if (i == 1) {
						st.setAdmin(admin1);
						st.setIssuingAuthority("country");
						st.setSenderType("International Passport");
						st.setIdValue("2");
					}
					if (i == 2) {
						st.setAdmin(admin1);
						st.setIssuingAuthority("state");
						st.setSenderType("Identification/National ID");
						st.setIdValue("3");
					}
					if (i == 3) {
						st.setAdmin(admin1);
						st.setIssuingAuthority("none");
						st.setSenderType("Social Security");
						st.setIdValue("6");
					}
					if (i == 4) {
						st.setAdmin(admin1);
						st.setIssuingAuthority("state");
						st.setSenderType("Residence Permit");
						st.setIdValue("4");
					}
					if (i == 5) {
						st.setAdmin(admin1);
						st.setIssuingAuthority("state");
						st.setSenderType("Passport");
						st.setIdValue("5");

					}
					if (i == 6) {
						st.setAdmin(admin1);
						st.setIssuingAuthority("state");
						st.setSenderType("Driver Licence");
						st.setIdValue("01");

					}
					senderIdTypeService.Save(st);
				}

			}
			mav.addObject("senderIds", senderIds);

		} else {
			mav = new ModelAndView("redirect:login?session expired");
		}
		return mav;
	}

	// deleteSourceOfFund
	@RequestMapping(value = { "/deleteSenderIds" }, method = { RequestMethod.GET })
	public ModelAndView deleteSenderIds(HttpServletRequest request) {
		ModelAndView mav = null;
		String senderId = request.getParameter("senderId");
		senderIdTypeService.deletebyid(Integer.parseInt(senderId));
		return mav = new ModelAndView("redirect:SenderIdTypes");
	}

	@RequestMapping(value = "/updateSenderId", method = RequestMethod.POST)
	public @ResponseBody String updateSenderId(HttpServletRequest request, @RequestParam String senderType,
			String senderId, String issuingAuthority, String adminId) {
		String message = "";

		
		boolean flag = senderIdTypeService.updatebyId(Integer.parseInt(senderId), senderType, issuingAuthority,
				adminId);
		if (flag == true) {
			message = "updated";
		} else {

			message = "failed";
		}
		return message;
	}

	/*
	 * @RequestMapping("underremittransactions") public ModelAndView
	 * getUnderRemitTransactions(HttpServletRequest request) { String adminId =
	 * sessionDataService.getAdminId(request.getSession());
	 * System.out.println("admin id from transaction list :" + adminId); String
	 * fromDate = ""; String toDate = ""; List<TransactionInformation> list =
	 * transactionService.getUnderRemiTransactions(adminId, "funds received",
	 * "completed"); System.out.println("list in admin:" + list.size());
	 * 
	 * for(TransactionInformation l:list) { fromdate=l.getCreatedDate();
	 * todate=l.getCreatedDate(); }
	 * 
	 * for (int i = list.size() - 1; i < list.size(); i++) { for
	 * (TransactionInformation l : list) { fromDate = l.getCreatedDate(); toDate =
	 * l.getCreatedDate(); } } ModelAndView mav = new ModelAndView();
	 * mav.addObject("transactionlist", list);
	 * mav.setViewName("underremittransactions"); mav.addObject("fromdate",
	 * fromDate); mav.addObject("todate", toDate); return mav;
	 * 
	 * }
	 * 
	 */ @RequestMapping("underremitbanktransactions")
	public ModelAndView getUnderBankRemitTransactions(HttpServletRequest request) {
		String adminId = sessionDataService.getAdminId(request.getSession());
		/*
		 * System.out.println("admin id from transaction list :" + adminId); String
		 * fromDate = ""; String toDate = "";
		 * 
		 * List<TransactionInformation> list =
		 * transactionService.getUnderBankRemiTransactions(adminId, "funds received",
		 * "completed", "bank"); System.out.println("list in admin:" + list.size());
		 * 
		 * for (TransactionInformation l : list) { fromDate = l.getCreatedDate(); toDate
		 * = l.getCreatedDate(); }
		 * 
		 * for (int i = list.size() - 1; i < list.size(); i++) { for
		 * (TransactionInformation l : list) { fromDate = l.getCreatedDate(); toDate =
		 * l.getCreatedDate(); } }
		 * 
		 */		ModelAndView mav = new ModelAndView();
		//mav.addObject("transactionlist", list);
		mav.setViewName("underremitbanktransactions");
		//mav.addObject("fromdate", fromDate);
		//mav.addObject("todate", toDate);
		return mav;
}
	 @RequestMapping("/profitlosss")
		public ModelAndView getProfitLoss(HttpServletRequest request) {
			ModelAndView modelAndView=new ModelAndView("profitlosss");
			Calendar calendar=Calendar.getInstance();
			SimpleDateFormat dateFormat=new SimpleDateFormat("yyyy-MM-dd");
			String fromDate=dateFormat.format(calendar.getTime());
	        modelAndView.addObject("fromDate", fromDate);
			return  modelAndView;
		}
	 @RequestMapping("/getprofitlosstrans")
	 public @ResponseBody List<TransactionInformation> getProfitLossTransactions(HttpServletRequest request,@RequestParam String fromDate,@RequestParam String toDate){
		 String adminId=sessionDataService.getAdminId(request.getSession());
		 List<TransactionInformation> transactionsList=transactionService.getProfitLossTransactions(adminId,"funds received",fromDate,toDate);
			return  transactionsList;
	 }
	 
	 @RequestMapping("/gettransactionsbystatus")
	 public @ResponseBody List<TransactionInformation> getTransactions(@RequestParam  String status,HttpServletRequest request){
		 String adminId=sessionDataService.getAdminId(request.getSession());
		 List<TransactionInformation> transactionlist=null;
		 if(status.equals("all")) {
			 transactionlist=transactionService.getUnderBankRemiTransactions(adminId, "funds received", "completed", "bank");
		 }else {
			 
			 transactionlist=transactionService.getTransactionByStatus(adminId, status,"bank","funds received","completed"); 
		 }
		 return transactionlist;
	 }
	 @RequestMapping("/getsanctioncustomers")
	 public ModelAndView  getSanctionSearchCustomers(HttpServletRequest request){
		 ModelAndView modelAndView=new ModelAndView();
		 List<Customer> sanctionCustomersList=null; 
		 String adminId=sessionDataService.getAdminId(request.getSession());
		 sanctionCustomersList=customerService.getSanctionCustomers(adminId);
		 modelAndView.setViewName("sanctionCustomersList");
		 modelAndView.addObject("sanctionCustomersList", sanctionCustomersList);
		 return  modelAndView;
		 
	 }
	 @RequestMapping("sanctionsearchcustomer")
	 public ModelAndView getSanctionCustomer(@RequestParam String customerId) {
		 ModelAndView modelAndView=new ModelAndView();
		 Customer customer=customerService.findByCustomerId(customerId);
		 List<SanctionSearch> sanctionSearchList=sanctionSearchService.getSanctionSearchResult(customer.getFirstName(),customer.getLastName());
		 modelAndView.setViewName("sanctionsearchcustomer");
		 modelAndView.addObject("sanctionSearchList", sanctionSearchList);
		 modelAndView.addObject("customer",customer);
		 return  modelAndView;
	 }
	 @RequestMapping("updatesanctionsearchstatus")
	 public ModelAndView updateSanctionSearchStatus(@RequestParam  String customerId) {
		 ModelAndView modelAndView=new ModelAndView("redirect:getsanctioncustomers"); 
		 customerService.updateSanctionSearchStatus(customerId);
		 return  modelAndView;
	 }
	 @RequestMapping(value = { "/addSenderIdTypes" }, method = { RequestMethod.GET })
		public ModelAndView addSenderIds(HttpServletRequest request) {
			ModelAndView mav = new ModelAndView("addSenderIdTypes");
		String adminId=request.getParameter("adminId");
		List<Branch> branches=branchService.getBranchesBasedOnFunctionalityAndAdminId(adminId, "receiving");
		mav.addObject("adminId",adminId);
		mav.addObject("branches", branches);
			return mav;
		}
		@RequestMapping(value = { "/addReceiverIdTyps" }, method = { RequestMethod.GET })
		public ModelAndView addReceiverIds(HttpServletRequest request) {
			ModelAndView mav = new ModelAndView("addReceiverIdTyps");
		String adminId=request.getParameter("adminId");
		List<Branch> branches=branchService.getAllBranches(adminId);
		mav.addObject("adminId",adminId);
		mav.addObject("branches", branches);
		List<SenderIds> types=senderIdTypeService.findByAdmin(adminId);
		/*
		 * Map<String, String> idMap = new HashMap<String, String>(); List<SenderIds>
		 * homes = new ArrayList<SenderIds>(); types.forEach(item -> { List<SenderIds>
		 * sd=senderIdTypeService.findByBranch(item.getBranch().getBranchId());
		 * //residentMap.put(or.getRoomId(),
		 * res.getFirstName()+" "+res.getSurName()+"-"+res.getResidentId());
		 * idMap.put(item.getBranch().getBranchId(), sd.); });
		 */
		mav.addObject("types", types);
			return mav;
		}
		@RequestMapping(value = { "/getBranchByBranchId" }, method = { RequestMethod.GET })
		@ResponseBody
		public List<Branch> getBranchByBranchId(HttpServletRequest request,@RequestParam String branchId) {
		List<Branch> branchList=branchService.getBranchlistBasedOnBranchId(branchId);	
		return branchList;
		}
		@RequestMapping(value = { "/insertSenderIds" }, method = { RequestMethod.POST })
		public String insertSenderIds(HttpServletRequest request) {
			ModelAndView mav=new ModelAndView();
			String toCountryDetails=request.getParameter("toCountryDetails");
			String br=request.getParameter("country");
			Branch branch=branchService.getBranchBasedOnBranchId(br.split(",")[2]);
			String[] ids=toCountryDetails.split(",");
			SenderIds sd=new SenderIds();
			sd.setBranch(branch);
			sd.setAdmin(branch.getAdmin());
			sd.setFunctionality(br.split(",")[1]);
			for(String id:ids) {
				if(id.equals("Work Permit")) {
					SenderIdType st=iDProofService1.getbysIdType(id);
					sd.setIssuingAuthority(st.getIssuingAuthority());
					sd.setIdValue(st.getIdValue());
					sd.setSenderType(id);
					sd.setBranch(branch);
					sd.setAdmin(branch.getAdmin());
					sd.setFunctionality(br.split(",")[1]);
					senderIdTypeService.Save(sd);
					
				}
				if(id.equals("International Passport")) {
					SenderIdType st=iDProofService1.getbysIdType(id);
					sd.setIssuingAuthority(st.getIssuingAuthority());
					sd.setIdValue(st.getIdValue());
					sd.setSenderType(id);
					sd.setBranch(branch);
					sd.setAdmin(branch.getAdmin());
					sd.setFunctionality(br.split(",")[1]);
					senderIdTypeService.Save(sd);

				}
				if(id.equals("Identification/National ID")) {
					SenderIdType st=iDProofService1.getbysIdType(id);
					sd.setIssuingAuthority(st.getIssuingAuthority());
					sd.setIdValue(st.getIdValue());
					sd.setSenderType(id);
					sd.setBranch(branch);
					sd.setAdmin(branch.getAdmin());
					sd.setFunctionality(br.split(",")[1]);
					senderIdTypeService.Save(sd);
			
				}
				if(id.equals("Residence Permit")) {
					SenderIdType st=iDProofService1.getbysIdType(id);
					sd.setIssuingAuthority(st.getIssuingAuthority());
					sd.setIdValue(st.getIdValue());
					sd.setSenderType(id);
					sd.setBranch(branch);
					sd.setAdmin(branch.getAdmin());
					sd.setFunctionality(br.split(",")[1]);
					senderIdTypeService.Save(sd);

				}
				if(id.equals("Passport")) {
					SenderIdType st=iDProofService1.getbysIdType(id);
					sd.setIssuingAuthority(st.getIssuingAuthority());
					sd.setIdValue(st.getIdValue());
					sd.setSenderType(id);
					sd.setBranch(branch);
					sd.setAdmin(branch.getAdmin());
					sd.setFunctionality(br.split(",")[1]);
					senderIdTypeService.Save(sd);

				}
				if(id.equals("NationalId")) {
					SenderIdType st=iDProofService1.getbysIdType(id);
					sd.setIssuingAuthority(st.getIssuingAuthority());
					sd.setIdValue(st.getIdValue());
					sd.setSenderType(id);
					sd.setBranch(branch);
					sd.setAdmin(branch.getAdmin());
					sd.setFunctionality(br.split(",")[1]);
					senderIdTypeService.Save(sd);

				}

				if(id.equals("System ID")) {
					SenderIdType st=iDProofService1.getbysIdType(id);
					sd.setIdValue(st.getIdValue());
					sd.setIssuingAuthority(st.getIssuingAuthority());
					sd.setSenderType(id);
					sd.setBranch(branch);
					sd.setAdmin(branch.getAdmin());
					sd.setFunctionality(br.split(",")[1]);
					senderIdTypeService.Save(sd);

				}
				if(id.equals("Driving License")) {
				SenderIdType st=iDProofService1.getbysIdType(id);
				sd.setIssuingAuthority(st.getIssuingAuthority());
				sd.setIdValue(st.getIdValue());
				sd.setSenderType(id);
				sd.setBranch(branch);
				sd.setAdmin(branch.getAdmin());
				sd.setFunctionality(br.split(",")[1]);
				senderIdTypeService.Save(sd);

				}

				
			}
			String adminId=branch.getAdmin().getAdminId();
			mav.addObject("adminId",branch.getAdmin().getAdminId());
			return "redirect:addReceiverIdTyps?adminId="+adminId;
		}
		
		
		
		@RequestMapping(value = { "/editReceiverIds" }, method = { RequestMethod.GET })
		public ModelAndView editReceiverIds(HttpServletRequest request,@RequestParam String branchId) {
			ModelAndView mav = new ModelAndView("editReceiverIds");
			List<SenderIds> list=senderIdTypeService.findByBranch(branchId);
			List<SenderIdType> sd=iDProofService1.getIdProof();
			Branch branch=branchService.getBranchBasedOnBranchId(branchId);
			mav.addObject("list", list);
			mav.addObject("sd", sd);
			mav.addObject("branch", branch);
			
		return mav;
		
		}
		
		
		
		@RequestMapping("maxAmount")
		public ModelAndView returnMaxAmountPage(HttpServletRequest request) {
			ModelAndView mav=new ModelAndView("maxAmount");
			String adminId=sessionDataService.getAdminId(request.getSession());
			List<Branch> branches=branchService.getAllSendingBranchesBasedOnAdminId(adminId);
			List<MaxAmount> ma=mx.getbyadmin(adminId);
			mav.addObject("ma", ma);
			mav.addObject("branches", branches);
			return mav;
		}
		
		
		@PostMapping("addmaxAmount")
		public ModelAndView addmaxAmount(@ModelAttribute MaxAmount ma,HttpServletRequest request) {
			String branchId=request.getParameter("branchId");
			String amount=request.getParameter("amount");
			Branch b=branchService.getBranchBasedOnBranchId(branchId);
			String adminId=sessionDataService.getAdminId(request.getSession());
             Admin  admin=adminService.getAdminDetailsBasedOnAdminId(adminId);
             ma.setAdmin(admin);
			ma.setAmount(amount);
			ma.setBranch(b);
			mx.save(ma);
			ModelAndView mav=new ModelAndView("redirect:maxAmount");
				
			return mav;
		}
		
		@PostMapping("updateAmount")
		public @ResponseBody String updateAmount(@RequestParam String amount,String maxAmountId) {

			MaxAmount ma=mx.updateAmount(amount, maxAmountId);
			return "updated";
		}
		
		@GetMapping("getAml")
		public @ResponseBody String getAmlamount(@RequestParam String branchId) {
			MaxAmount ma=mx.getAmountByBranchId(branchId);
			String amt=ma.getAmount();
			return amt;
		}
		@RequestMapping("txDaysLimit")
		public ModelAndView returntx(HttpServletRequest request) {
			ModelAndView mav=new ModelAndView("txDaysLimit");
			String adminId=sessionDataService.getAdminId(request.getSession());
			List<Branch> branches=branchService.getAllSendingBranchesBasedOnAdminId(adminId);
			List<TxDaysLimit> tx=txr.txByAdmin(adminId);
			mav.addObject("tx", tx);
			mav.addObject("adminId", adminId);
			
			mav.addObject("branches", branches);
			return mav;
		}
		
		
		@PostMapping("addTxLimits")
		public ModelAndView addtxdays(@ModelAttribute TxDaysLimit tx,HttpServletRequest request) {
			String branchId=request.getParameter("branchId");
			String limitDays=request.getParameter("limitDays");
			Branch b=branchService.getBranchBasedOnBranchId(branchId);
			String adminId=sessionDataService.getAdminId(request.getSession());
             Admin  admin=adminService.getAdminDetailsBasedOnAdminId(adminId);
             tx.setAdmin(admin);
			tx.setLimitDays(limitDays);
			tx.setBranch(b);
			txr.save(tx);
			ModelAndView mav=new ModelAndView("redirect:txDaysLimit");
				
			return mav;
		}
		
		@PostMapping("updateDays")
		public @ResponseBody String updatdays(@RequestParam String limitDays,String txId) {

       txr.updatebytxId(txId, limitDays);
			return "updated";
		}
		
		@GetMapping("/revenuePercentage")
		public ModelAndView revenuePercentage(HttpServletRequest request) {
			ModelAndView mav = null;
			String adminId = sessionDataService.getAdminId(request.getSession());
			if (adminId != null) {
				mav = new ModelAndView("revenuePercentage");

			} else {
				mav = new ModelAndView("redirect:login");
			}
			return mav;
		}
		@PostMapping("/update_revenue_by_admin")
		public String update_revenue_by_admin(HttpServletRequest request, @ModelAttribute RevenuePercentage rates,
				@RequestParam String f_br, @RequestParam String t_br, String myIp) {
			String adminId = sessionDataService.getAdminId(request.getSession());
			if (adminId != null) {
				Admin admin = adminService.getAdminDetailsBasedOnAdminId(adminId);
				Branch from_br = branchService.getBranchBasedOnBranchId(f_br);
				Branch to_br = branchService.getBranchBasedOnBranchId(t_br);
				rates.setAdminPercentage(request.getParameter("adminPercentage"));
				rates.setAdmin(admin);
				rates.setFromBranch(from_br);
				rates.setToBranch(to_br);
				rates.setTerminatePercentage(request.getParameter("terminatePercentage"));
				rates.setSourcePercentage(request.getParameter("sourcePercentage"));
				rps.updateRevenue(rates);
				AuditTrail atr=new AuditTrail();
				atr.setAgent("-");
				atr.setMessage("-");
				atr.setUserId(from_br.getAdmin().getAdminId());
				atr.setAdminId(from_br.getAdmin().getAdminId());
				atr.setUserType("ROLE_ADMIN");
				atr.setOriginalData("");
				atr.setChangedData("source % :"+request.getParameter("sourcePercentage")+"terminate % is:"+request.getParameter("terminatePercentage")+"admin % is:"+request.getParameter("adminPercentage"));
				atr.setIpAddress(myIp);
				atr.setUserName("-");
				atr.setCategory("Revenue %  updated");
				atr.setTransaction("-");
				atr.setSourceCountry("-");
				auditTrailService.save(atr);


				return "redirect:revenuePercentage";
			} else {
				return "redirect:login";
			}
		}

		@PostMapping("getSrfeelist")
		public @ResponseBody List<ServiceFees> getservicefeelist(@RequestParam String fromBranch,String toBranch,String ptype ){
			return serviceFee.getByFromBranchToBranchAndPaymentType(fromBranch, toBranch, ptype);
			
		}
		@PostMapping("updatesrFee")
		public @ResponseBody String updateFee(@RequestParam String sfid,String minValue,String maxValue,String sFee,String rateType, String myIp) 
		{
			ServiceFees s=serviceFee.getByServiceFeeId(sfid) ;
        	AuditTrail atr=new AuditTrail();
        	atr.setAgent(s.getFromBranch().getBranchName());
        	atr.setMessage("-");
        	atr.setUserId(s.getFromBranch().getBranchId());
        	atr.setUserType("ROLE_BRANCH");
        	atr.setOriginalData(s.getServiceFeeId());
        	atr.setChangedData("commision fee updated record is:"+s.getMinValue()+"to"+s.getMaxValue());
        	atr.setIpAddress(myIp);
        	atr.setUserName(s.getFromBranch().getEmailId());
        	atr.setAdminId(s.getAdmin().getAdminId());
        	atr.setCategory("commision slab updated");
        	auditTrailService.save(atr);

			s.setMinValue(Double.parseDouble(minValue));
			s.setMaxValue(Double.parseDouble(maxValue));
			s.setServiceFee(Double.parseDouble(sFee));
			s.setRateType(rateType.toLowerCase());
			serviceFee.updtefee(s);
			double value=serviceFee.getmaxvalue(s.getFromBranch().getBranchId(),s.getToBranch().getBranchId(),s.getPaymentType());
			System.out.println("value in controller===="+value);

			return "success";
		}
		@PostMapping("getServicemaxvalue")
		public @ResponseBody double getServicemaxvalue(@RequestParam String fromBranch,String toBranch,String ptype) {
			double value=0;
			value=serviceFee.getmaxvalue(fromBranch, toBranch, ptype);
			
			return value+1;
			
		}
		@PostMapping("addServicevalue")
		public @ResponseBody String addServicevalue(@RequestParam String fromBranch,String toBranch,String ptype,String mv,String mx,String sf,String rateType, String myIp) {
			
			Branch b=branchService.getBranchBasedOnBranchId(fromBranch);
			double pf=0;
			serviceFee.addFeeLimitation1(Double.parseDouble(mv), Double.parseDouble(mx), Double.parseDouble(sf), pf, fromBranch, toBranch, b.getAdmin().getAdminId(), rateType.toLowerCase(), ptype);
        	Branch b1=branchService.getBranchBasedOnBranchId(fromBranch);
			AuditTrail atr=new AuditTrail();
        	atr.setAgent("-");
        	atr.setMessage("-");
        	atr.setAdminId(b1.getAdmin().getAdminId());
        	atr.setUserId(b1.getAdmin().getAdminId());
        	atr.setUserType("ROLE_ADMIN");
        	atr.setOriginalData("-");
        	atr.setChangedData("commision fee added record is:"+mv+"to"+mx);
        	atr.setIpAddress(myIp);
        	atr.setUserName("-");
        	atr.setCategory("commision slab added");
        	auditTrailService.save(atr);

			return "sucess";
		}
		
		
		@PostMapping("deleteServicevalue")
		public @ResponseBody String deleteServicevalue(@RequestParam String fromBranch,String toBranch,String ptype, ServletRequest request, String myIp) {
			double value=serviceFee.getmaxvalue(fromBranch, toBranch, ptype);
			ServiceFees s=serviceFee.getbymaxvalueptype(fromBranch, toBranch, ptype, value);
        	AuditTrail atr=new AuditTrail();
        	atr.setAgent(s.getFromBranch().getBranchName());
        	atr.setMessage("-");
        	atr.setUserId(s.getFromBranch().getBranchId());
        	atr.setAdminId(s.getAdmin().getAdminId());
        	atr.setUserType("ROLE_BRANCH");
        	atr.setOriginalData(s.getServiceFeeId());
        	atr.setChangedData("commision fee deleted record is:"+s.getMinValue()+"to"+s.getMaxValue());
        	atr.setIpAddress(myIp);
        	atr.setUserName(s.getFromBranch().getEmailId());
        	atr.setCategory("commision slab deleted");
        	auditTrailService.save(atr);

			System.out.println("s====="+s.getServiceFeeId());
			boolean flag=serviceFee.deleteFeeLimitation(s.getServiceFeeId(), s.getAdmin().getAdminId());
			return "sucess";
			
		}
		@RequestMapping("process")
		public ModelAndView processbanks(HttpServletRequest request) {
			ModelAndView mav=new ModelAndView("processbank");
			String adminId = sessionDataService.getAdminId(request.getSession());
			List<Branch> list=branchService.getbyprocessbankflag(adminId, "sending");
			List<Country> list1=countryService.getAllCountries();
			mav.addObject("list", list);
			return mav;
		}
		
		
		@RequestMapping("processbankList")
		public ModelAndView processbankList(HttpServletRequest request) {
			ModelAndView mav=new ModelAndView("processbankList");
			String adminId = sessionDataService.getAdminId(request.getSession());
			List<Branch> list=branchService.getbyprocessbankflag(adminId, "sending");
			mav.addObject("list", list);
			return mav;
	
		}
		@PostMapping("getprocessbanklist")
		@ResponseBody
		public List<Processbank> getprocessbanklist(@RequestParam String country){
			System.out.println("country===="+country);
			return processService.getListbycountry(country);
			
		}
		
		@RequestMapping("switchToAdmin")
		public ModelAndView returnAdmin(HttpServletRequest request) {
			ModelAndView mav=null;
			String branchId=sessionDataService.getBranchId(request.getSession());
			Branch b=branchService.getBranchBasedOnBranchId(branchId);
			System.out.println("b in switch admin====="+b);
			HttpSession session = request.getSession();
			sessionDataService.storeAdminId(session, b.getAdmin().getAdminId());
			session.setAttribute("role", "ROLE_ADMIN");
			String aid=(String) session.getAttribute("aid");
			AccessLog ac=accessLogService.AccessLogbyid(aid,b.getAdmin().getAdminId(),b.getAdmin().getAdminId());
			if(ac!=null) {
				String result=ac.getAcessResult()+","+"reverted back to"+" "+b.getAdmin().getAdminId();
				ac.setAcessResult(result);
				accessLogService.updateAccessLog(ac);
			}

			mav=new ModelAndView("admindashbord");
return mav;
		}
		
		
		@RequestMapping("agentdepositlist")
		public ModelAndView agentdeposits(HttpServletRequest request) {
			ModelAndView mav=null;
			String adminId=sessionDataService.getAdminId(request.getSession());
			if(adminId!=null) {
			List<AgentDeposit> list=adp.getbyadmin(adminId);
			System.out.println("list===="+list);
			mav=new ModelAndView("agentdepositlist");
			mav.addObject("list", list);
			}else {
				mav=new ModelAndView("login");
			}
			return mav;
		}
		
	@RequestMapping("ApproveDeposit")
	public ModelAndView ApproveDeposit(HttpServletRequest request) {
		ModelAndView mav=null;
		String id=request.getParameter("Id");
		AgentDeposit a=adp.getbyId(id);
		a.setStatus("approved");
		adp.updateStatus(a);
		mav=new ModelAndView("redirect:agentdepositlist");
return mav;	
	}

	@PostMapping("getAdtListbwdates")
	@ResponseBody
	public List<AuditTrail> getListbwdates(HttpServletRequest request,@RequestParam String date1,String date2){
		date1=date1+" "+"00:00:00";
		date2=date2+" "+"23:59:59";
		String adminId=sessionDataService.getAdminId(request.getSession());
		List<AuditTrail> list=auditTrailService.getByDate(date1, date2,adminId);
	System.out.println("list===="+list.size());
		return list;
	}
	
	@PostMapping("getListbwdatesAndUsername")
	@ResponseBody
	public List<AuditTrail> getListbwdatesAndUsername(HttpServletRequest request,@RequestParam String date1,String date2,String username){
		date1=date1+" "+"00:00:00";
		date2=date2+" "+"23:59:59";
		String adminId=sessionDataService.getAdminId(request.getSession());
		List<AuditTrail> list=auditTrailService.getByDateAndUsername(date1, date2, username,adminId);
		System.out.println("list===="+list.size());

		return list;
	}
	
	@PostMapping("getListbwdatesAndagent")
	@ResponseBody
	public List<AuditTrail> getListbwdatesAndagent(HttpServletRequest request,@RequestParam String date1,String date2,String agent){
		date1=date1+" "+"00:00:00";
		date2=date2+" "+"23:59:59";
		String adminId=sessionDataService.getAdminId(request.getSession());
		List<AuditTrail> list=auditTrailService.getByDateAndAgent(date1, date2, agent,adminId);
		System.out.println("list===="+list.size());

		return list;
	}
	@PostMapping("getListByusername")
	@ResponseBody
	public List<AuditTrail> getListByusername(HttpServletRequest request,@RequestParam String username){
		String adminId=sessionDataService.getAdminId(request.getSession());
		List<AuditTrail> list=auditTrailService.getByUsername(username,adminId);
		System.out.println("list===="+list.size());

		return list;
	}

	@PostMapping("getListByAgent")
	@ResponseBody
	public List<AuditTrail> getListByAgent(HttpServletRequest request,@RequestParam String agent){
		String adminId=sessionDataService.getAdminId(request.getSession());
		List<AuditTrail> list=auditTrailService.getByAgentCode(agent,adminId);
		System.out.println("list===="+list.size());

		return list;
	}

	
	@PostMapping("getListbwdatesAndUsernameAndAgent")
	@ResponseBody
	public List<AuditTrail> getListbwdatesAndUsernameAndAgent(@RequestParam String date1,String date2,String username,String agent, HttpServletRequest request){
		date1=date1+" "+"00:00:00";
		date2=date2+" "+"23:59:59";
		String adminId=sessionDataService.getAdminId(request.getSession());

		List<AuditTrail> list=auditTrailService.getByDateAndUsernameAndAgent(date1, date2, username, agent,adminId);
	return list;
	}


}