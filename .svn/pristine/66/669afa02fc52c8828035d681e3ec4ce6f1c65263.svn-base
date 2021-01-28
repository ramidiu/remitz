	
package com.kws.unitedfintech.controller;

import java.net.UnknownHostException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.TimeZone;

import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.MultipartRequest;
import org.springframework.web.servlet.ModelAndView;

import com.kws.unitedfintech.entities.AccessLog;
import com.kws.unitedfintech.entities.Admin;
import com.kws.unitedfintech.entities.AdminSellRates;
import com.kws.unitedfintech.entities.Agent;
import com.kws.unitedfintech.entities.AgentDeposit;
import com.kws.unitedfintech.entities.AuditTrail;
import com.kws.unitedfintech.entities.Beneficiary;
import com.kws.unitedfintech.entities.Branch;
import com.kws.unitedfintech.entities.BranchPaymentTypeDetails;
import com.kws.unitedfintech.entities.Cash;
import com.kws.unitedfintech.entities.Country;
import com.kws.unitedfintech.entities.Customer;
import com.kws.unitedfintech.entities.CustomerIdType;
import com.kws.unitedfintech.entities.EmailTemplate;
import com.kws.unitedfintech.entities.ModeOfPaymentFees;
import com.kws.unitedfintech.entities.NasanoResponse;
import com.kws.unitedfintech.entities.RealationShips1;
import com.kws.unitedfintech.entities.ReasonForTransfer;
import com.kws.unitedfintech.entities.SanctionSearch;
import com.kws.unitedfintech.entities.SenderIds;
import com.kws.unitedfintech.entities.ServiceFees;
import com.kws.unitedfintech.entities.SourceOfFunds1;
import com.kws.unitedfintech.entities.States;
import com.kws.unitedfintech.entities.SubHead;
import com.kws.unitedfintech.entities.TransactionInformation;
import com.kws.unitedfintech.entities.TrulioCustomer;
import com.kws.unitedfintech.entities.TxDaysLimit;
import com.kws.unitedfintech.helpers.EmailTemplateHeaderFooterUtil;
import com.kws.unitedfintech.helpers.GetIPAddress;
import com.kws.unitedfintech.helpers.SendMail;
import com.kws.unitedfintech.service.AccessLogService;
import com.kws.unitedfintech.service.AdminService;
import com.kws.unitedfintech.service.AgentDepositService;
import com.kws.unitedfintech.service.AuditTrailService;
import com.kws.unitedfintech.service.BeneficiaryService;
import com.kws.unitedfintech.service.BranchAgentService;
import com.kws.unitedfintech.service.BranchPaymentTypeDetailsService;
import com.kws.unitedfintech.service.BranchService;
import com.kws.unitedfintech.service.CountryService;
import com.kws.unitedfintech.service.CurrencyRateService;
import com.kws.unitedfintech.service.CustomerService;
import com.kws.unitedfintech.service.EmailTemplateService;
import com.kws.unitedfintech.service.FeeService;
import com.kws.unitedfintech.service.ModeOfPaymentsService;
import com.kws.unitedfintech.service.NasanoResponService;
import com.kws.unitedfintech.service.RealationShips1Service;
import com.kws.unitedfintech.service.ReasonForTransferService;
import com.kws.unitedfintech.service.SanctionSearchService;
import com.kws.unitedfintech.service.SenderIdTypeService;
import com.kws.unitedfintech.service.SessionDataService;
import com.kws.unitedfintech.service.SourceOfFundsService;
import com.kws.unitedfintech.service.StatesService;
import com.kws.unitedfintech.service.TransactionInformationService;
import com.kws.unitedfintech.service.TrulioCustomerService;
import com.kws.unitedfintech.service.TxDaysService;

@Controller
public class BranchController {
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	TimeZone timeZone = TimeZone.getTimeZone("IST");
	Calendar cal = Calendar.getInstance();
	Date d = cal.getTime();
	@Autowired
	private AuditTrailService auditTrailService;
	@Autowired
	private FeeService feeService;
	@Autowired
	private AccessLogService accessLogService;
	@Autowired
	private BeneficiaryService bservice1;
	@Autowired
	private ReasonForTransferService reasonForTransferService;
	
	@Autowired
	private NasanoResponService nasanoResponService;
	
	@Autowired
	private ModeOfPaymentsService modeOfPaymentsService;
	
	@Autowired
	private SourceOfFundsService sourceOfFundsService;
	@Autowired
	private com.kws.unitedfintech.service.cashService cashService;
	
	@Autowired
	private RealationShips1Service realationShips1Service;
	@Autowired
	private AdminService adminService;
	@Autowired
	private CurrencyRateService currencyRateService;
	@Autowired
	private AgentDepositService adp;

	@Autowired
	private TxDaysService txr;
	@Autowired
	TrulioCustomerService trulioCustomerService;
	
	@Autowired
	private CustomerService customerService;
	@Autowired
	private BranchAgentService bagentService;
	@Autowired
	private BranchService branchService;
	@Autowired
	private TransactionInformationService txnService;
	@Autowired
	private SessionDataService sessionDataService;
	@Autowired
	private StatesService statesService;
	
	@Autowired
	private CountryService countryService;
@Autowired
private BranchPaymentTypeDetailsService bptds;
@Autowired
private BranchAgentService branchagentService;
@Autowired
private BeneficiaryService bservice;
@Autowired
private SenderIdTypeService senderIdTypeService;

@Autowired
private SanctionSearchService sanctionSearchService;


@Autowired
private EmailTemplateService emailTemplateService;

String hederContent = EmailTemplateHeaderFooterUtil.getStaticEmailHeaderContent();
String bodyStartsContent = EmailTemplateHeaderFooterUtil.getStaticEmailBodyStartContent();
String bodyEndContent = EmailTemplateHeaderFooterUtil.getStaticEmailBodyEndsContent();
String footerContent = EmailTemplateHeaderFooterUtil.getStaticEmailFooterContent();


@RequestMapping("customerReg")
	public  ModelAndView returnCustomerRegistrationPage(HttpServletRequest request) {
		String branchId = sessionDataService.getBranchId(request.getSession());
		System.out.println("branchId in  custrg....."+branchId);
		ModelAndView mav = null;
		if (branchId != null) {
			mav = new ModelAndView("cust_reg");
		Branch branch=branchService.getBranchBasedOnBranchId(branchId);
		System.out.println("branch....."+branch);
		System.out.println("countryName....."+branch.getFromCountry().getCountryName());
		System.out.println("countryISo....."+branch.getFromCountry().getCountryISO());
		List<SenderIds> ids=senderIdTypeService.findByBranchAndAdminAndFunctionality(branchId, branch.getAdmin().getAdminId(), "receiving");
		TrulioCustomer tr=trulioCustomerService.findByCountryIso(branch.getFromCountry().getCountryISO());
	String trid=branch.getAdmin().getTrulio();
	mav.addObject("trid", trid);
		mav.addObject("ids", ids);
List<States> states=statesService.getAllStatesByCountryIso(branch.getFromCountry().getCountryISO());
mav.addObject("states", states);		
mav.addObject("branch", branch);
mav.addObject("tr", tr);
mav.addObject("branchId", branchId);
		mav.addObject("countryISo", branch.getFromCountry().getCountryISO());
		mav.addObject("country", branch.getFromCountry().getCountryName());
		}else {
			mav=new ModelAndView("redirect:login");	
		}
		return mav;
	}

	/*
	 * @GetMapping("/") public String returnHeader() { return "br/index"; }
	 */
	@GetMapping("/new_txn")
	public String returnTranactionPage() {
		return "br/new_txn";
	}
	
	
	 @RequestMapping(value="/loginValidation",method=RequestMethod.POST)
	 public String  branchLoginValidation(HttpServletRequest request,HttpServletResponse response,@RequestParam String emailId,@RequestParam String password){
		 	String result="";
	        Branch branch=branchService.getBranchDetails(emailId, password);
	        System.out.println("branch::"+branch);
			if(branch != null  && branch.getPassword().equals(password)){
				
				sessionDataService.storeBranchInformation(request.getSession(), branch);
				result="redirect:cust_reg";
			}
			else{
				result = "redirect:index?msg=Branch Email Id and password combination is wrong";
			}
			return result;
	 }
	
	
	 @RequestMapping(value="/insertRemitter",method=RequestMethod.POST)
	  public String saveCustomerDetails(HttpServletRequest request,HttpServletResponse response,@ModelAttribute Customer customer,MultipartHttpServletRequest multipartRequest) throws UnknownHostException
	  {
		 
		System.out.println("thisd is...insertRemitter..."); 
		 
		 List<SanctionSearch> sanctionSearchList=sanctionSearchService.getSanctionSearchResult(customer.getFirstName(),customer.getLastName());
			System.out.println("sanctionSearchList::::"+sanctionSearchList);
			if(sanctionSearchList.size()>0) {
				customer.setSanctionSearchFlag("yes");
			}else {
				customer.setSanctionSearchFlag("no");
			}
		 GetIPAddress getIpAddress=new GetIPAddress();
		  String result="";
		  String branchId=sessionDataService.getBranchId(request.getSession());
		  System.out.println("branchId====="+branchId);
		  if(branchId != null && !branchId.equals("")){
			  
			Branch branch= branchService.getBranchBasedOnBranchId(branchId);
				
				customer.setBranch(branch);
				
				customer.setCitizenship("yse");
				
				customer.setOccupation("yes");
				customer.setCustomerKYCMode("manual");
				customer.setCustomerKYCStatus("pending");
			       customer.setStatus("pending");	
				customer.setCountry(branch.getFromCountry());
				
				customer.setAdmin(branch.getAdmin());
				
				String ipAddress=getIpAddress.getIPAddress();
				
				customer.setIpAddress(ipAddress);
				customer.setFirstIdProofStatus("no");
				customer.setCustomerDetailsFlag("full");
				 customer.setSecondIdProofStatus("no");
					String firstIdProofType = request.getParameter("firstIdProofType").split(",")[0];
					customer.setFirstIdProofType(firstIdProofType);
		if(firstIdProofType.equals("6")|| firstIdProofType=="6") {
					System.out.println("first id proof value inn if===="+firstIdProofType);
				customer.setIssuingCountry(branch.getFromCountry());
		}else {

				Country idProofIssuedCountry=countryService.getCountryBasedOnIso(request.getParameter("idProofIssueCountry"));
				customer.setIssuingCountry(idProofIssuedCountry);
		}
		        String cid=customerService.registerCustomer(customer, multipartRequest);
	        	Customer c=customerService.findByCustomerId(cid);
		        String myIp=request.getParameter("myIp");
	        	AuditTrail atr=new AuditTrail();
	        	atr.setAgent(c.getCustomerId());
	        	atr.setMessage("new Remitter createed");
	        	atr.setUserId(c.getBranch().getBranchId());
	        	atr.setUserType("ROLE_BRANCH");
	        	atr.setOriginalData("-");
	        	atr.setChangedData("New  RemitterId is:"+c.getCustomerId());
	        	atr.setIpAddress(myIp);
	        	atr.setUserName(c.getEmailId());
	        	atr.setAdminId(c.getAdmin().getAdminId());
	        	atr.setCategory("new remitter  created by Sending agent:"+c.getBranch().getBranchId());
	        	auditTrailService.save(atr);

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



		        
		        result="redirect:customerReg";
			}
		  else{
			  result="redirect:index?msg=Your Session Expired Please Login Again";
		  }
		  return result;
	  }
	 
	 
	 @RequestMapping("/RemmitersList")
      public String ListPage()
          {
		 return"customerListing";
                   }
	 
		@RequestMapping(value="/Remmiterlist", method=RequestMethod.POST)
		@ResponseBody
		  public List<Customer> getcustomerListing(HttpServletRequest request, HttpServletResponse response) {
			
			String branchId=sessionDataService.getBranchId(request.getSession());
			System.out.println("branchId in customerlist====="+branchId);
			
			List<Customer> customerList=null;
			if(branchId!=null && !branchId.equals("")){
				
				
				String customerStatus=request.getParameter("customerStatus");//what is the status here? based on the statuslist came means filtering
				
				
	            customerList = customerService.getCustomersList(branchId, customerStatus);
	           
			}
			
			return customerList;
		  }
		
		//update status
		@RequestMapping(value = "/updatecustomerstatus",method = RequestMethod.POST)
		  public @ResponseBody String updateCustomerStatus(HttpServletRequest request,@RequestParam String customerId,@RequestParam String customerStatus) {
			  customerService.updateCustomerStatus(customerId, customerStatus);
			  
			  return "updated";
		  }
		@GetMapping("AgentRegistration")
		public ModelAndView returnAgentRegistrationPage(HttpServletRequest request,HttpServletResponse response)
		{
			ModelAndView modelAndView = new ModelAndView();
	        HttpSession session=request.getSession();
	        String adminId=(String) session.getAttribute("adminId");
	        System.out.println("adminid"+adminId);
	        String BranchId=(String) session.getAttribute("branchId");
	        Branch branch=branchService.getBranchBasedOnBranchId(BranchId);
			//String adminId = sessionDataService.getAdminId(request.getSession());
			if (adminId != null && !adminId.trim().equals("")) {
				Admin admin = adminService.getAdminDetailsBasedOnAdminId(adminId);
				System.out.println("admin::::"+admin);
				modelAndView.setViewName("Agents");
			
				String branchid=(String)session.getAttribute("branchId");
				System.out.println("branchid:"+branchid);
					List<Agent> list=bagentService.getBranchAllAgents(branchid);
					modelAndView.addObject("branchagentslist",list);
				modelAndView.addObject("admin", admin);
				modelAndView.addObject("branch", branch);
				/*
				 * modelAndView.addObject("profitMode" ,admin.getProfitMode());
				 * modelAndView.addObject("modeOfPayments" ,admin.getModeOfPayments());
				 * 
				 * modelAndView.addObject("paymentTypeList",admin.getPaymentTypes());
				 */

			
		}return modelAndView;
			}
		
		@RequestMapping(value="/submitAgent",method = RequestMethod.POST)
		public String getSubmitAgent(@ModelAttribute Agent agent,HttpServletRequest request,HttpSession session)
		{session=request.getSession(false);
			String page="";
	System.out.println("get agent profit mode:"+request.getParameter("agentProfitMode")); 
	 System.out.println("agent detials:"+agent.getAgentProfitMode()); 
	 String adminId=(String) session.getAttribute("adminId");
     System.out.println("adminid"+adminId);
     Admin admin = adminService.getAdminDetailsBasedOnAdminId(adminId);
     
	 	String branchid=(String)session.getAttribute("branchId");
	 	Branch branch=branchService.getBranchBasedOnBranchId(branchid);
	 	System.out.println(branch.getProfitMode());
	 agent.setBranch(branch);
	 agent.setAdmin(admin);
	 agent.setAgentProfitMode(branch.getProfitMode());
		  boolean flag=bagentService.getSubmitBranchAgent(agent);
		  
		  if(flag==true) {
		  page="redirect:AgentRegistration"; 
		  }else {page="redirect:AgentRegistration";}
		 
			return page ;
		}
		
	/*
	 * @GetMapping("AgentList") public ModelAndView
	 * getBranchAgentList(HttpServletRequest request) { ModelAndView mav=new
	 * ModelAndView(); HttpSession session=request.getSession(false); String
	 * branchid=(String)session.getAttribute("branchId");
	 * System.out.println("branchid:"+branchid); List<Agent>
	 * list=bagentService.getBranchAllAgents(branchid);
	 * mav.setViewName("BranchagentsList"); mav.addObject("branchagentslist",list);
	 * return mav; }
	 */
	
		
		@RequestMapping(value={"/Remitterprofile"}, method={org.springframework.web.bind.annotation.RequestMethod.GET})
		  public ModelAndView getcustomerprofile(HttpServletRequest request, HttpServletResponse response) {
			ModelAndView modelAndView=new ModelAndView();
			String custRegId=request.getParameter("custRegId");
			Customer customer=customerService.findByCustomerId(custRegId);
			System.out.println("adminid======="+customer.getAdmin().getAdminId());

			System.out.println("branchId======"+customer.getBranch().getBranchId());
			List<TxDaysLimit> tlist=txr.getByBranchId(customer.getBranch().getBranchId());
			int days1=0;
			int days2=0;
			int days3=0;
			for(int i=0;i<tlist.size();i++) {
				
				if(i==0) {
					TxDaysLimit tl1=tlist.get(i);
					days1=Integer.parseInt(tl1.getLimitDays());
					System.out.println("days1====="+days1);
				}
				
				if(i==1) {
					TxDaysLimit tl2=tlist.get(i);
					days2=Integer.parseInt(tl2.getLimitDays());
					System.out.println("days2====="+days2);

				}
				if(i==2) {
					TxDaysLimit tl3=tlist.get(i);
					days3=Integer.parseInt(tl3.getLimitDays());
					System.out.println("days3====="+days3);

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
			System.out.println("thirtydaysdate===="+thirtydaysdate);
			Calendar ninitydaysCalendar=Calendar.getInstance();
			ninitydaysCalendar.setTime(date1);
			ninitydaysCalendar.add(Calendar.DAY_OF_MONTH,-days2);
			Date nintydays=ninitydaysCalendar.getTime();
			String ninitydaysdate=dateFormat.format(nintydays);
			System.out.println("ninitydaysdate====="+ninitydaysdate);
			Calendar year=Calendar.getInstance();
			year.setTime(date1);
			year.add(Calendar.DAY_OF_MONTH,-days3);
			Date yearDays=year.getTime();
			String yeardaysdate=dateFormat.format(yearDays);
			System.out.println("yeardaysdate===="+yeardaysdate);
			List<TransactionInformation> tl=txnService.getTransactionDetailsgroupby(thirtydaysdate,currentDate,custRegId);
			double ta1=0;
              int count1=0;
              double ta2=0;
              int count2=0;
              double ta3=0;
              int count3=0;;
			System.out.println("tl===="+tl.size());
		List<TransactionInformation> thirtyibt=txnService.getTransactionDetailsgroupbymop(thirtydaysdate, currentDate, custRegId, "Internet Bank Transfer");
		int thirtycount=thirtyibt.size();
		double thirtyAmount=0;
		for(int i=0;i<thirtyibt.size();i++) {
			TransactionInformation t=thirtyibt.get(i);
	double amt=t.getTotalAmountCollected();
			thirtyAmount=thirtyAmount+amt;
			
		}
		List<TransactionInformation> thirtycash=txnService.getTransactionDetailsgroupbymop(thirtydaysdate, currentDate, custRegId, "Cash");
		int thirtycashCount=thirtycash.size();
		double thirtycashAmount=0;
		for(int i=0;i<thirtycash.size();i++) {
			TransactionInformation t=thirtycash.get(i);
			thirtycashAmount=thirtycashAmount+t.getTotalAmountCollected();
			
		}
		List<TransactionInformation> thirtyonline=txnService.getTransactionDetailsgroupbymop(thirtydaysdate, currentDate, custRegId, "Online");
		int thirtyonlineCount=thirtyonline.size();
		double thirtyonlineAmount=0;
		for(int i=0;i<thirtyonline.size();i++) {
			TransactionInformation t=thirtyonline.get(i);
			thirtyonlineAmount=thirtyonlineAmount+t.getTotalAmountCollected();
			
		}
		ta1=thirtyonlineAmount+thirtycashAmount+thirtyAmount;
		count1=thirtycount+thirtycashCount+thirtyonlineCount;
		
		
		List<TransactionInformation> ni=txnService.getTransactionDetailsgroupbymop(ninitydaysdate, currentDate, custRegId, "Internet Bank Transfer");
		int nic=ni.size();
		double nia=0;
		for(int i=0;i<ni.size();i++) {
			TransactionInformation t=ni.get(i);
	double amt=t.getTotalAmountCollected();
			nia=nia+amt;
			
		}
		List<TransactionInformation> nc=txnService.getTransactionDetailsgroupbymop(ninitydaysdate, currentDate, custRegId, "Cash");
		int ncc=nc.size();
		System.out.println("ncc====="+nc.size());
		double nca=0;
		for(int i=0;i<nc.size();i++) {
			TransactionInformation t=nc.get(i);
			nca=nca+t.getTotalAmountCollected();
			System.out.println("nca====="+nca);
			
		}
		List<TransactionInformation> no=txnService.getTransactionDetailsgroupbymop(ninitydaysdate, currentDate, custRegId, "Online");
		int noc=no.size();
		double noa=0;
		for(int i=0;i<no.size();i++) {
			TransactionInformation t=no.get(i);
			noa=noa+t.getTotalAmountCollected();
			
		}
		
		
		ta2=noa+nca+nia;
		count2=nic+ncc+noc;
		
		System.out.println("90 days amount====="+ta2);
		System.out.println("90 days count===="+count2);
		List<TransactionInformation> yi=txnService.getTransactionDetailsgroupbymop(yeardaysdate, currentDate, custRegId, "Internet Bank Transfer");
		int yic=yi.size();
		double yia=0;
		for(int i=0;i<yi.size();i++) {
			TransactionInformation t=yi.get(i);
	double amt=t.getTotalAmountCollected();
	yia=yia+amt;
			
		}
		List<TransactionInformation> yc=txnService.getTransactionDetailsgroupbymop(yeardaysdate, currentDate, custRegId, "Cash");
		int ycc=yc.size();
		double yca=0;
		for(int i=0;i<yc.size();i++) {
			TransactionInformation t=yc.get(i);
			yca=yca+t.getTotalAmountCollected();
			
		}
		List<TransactionInformation> yo=txnService.getTransactionDetailsgroupbymop(yeardaysdate, currentDate, custRegId, "Online");
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

		
		  @RequestMapping(value = "/editRemitterprofile",method = RequestMethod.GET)
		  public ModelAndView getCustomerEditProfile(HttpServletRequest request) {
			  ModelAndView modelAndView=new ModelAndView();
			  String customerId=request.getParameter("customerId");
			  Customer customer=customerService.findByCustomerId(customerId);
			  System.out.println("customer1........"+customer);
			  modelAndView.setViewName("customereditprofile");
			  customer.setCustomerDetailsFlag("full");
			  System.out.println("countryIso..."+customer.getCountry().getCountryISO());
			  System.out.println("countryName...."+customer.getCountry().getCountryName());
			  modelAndView.addObject("customer",customer);
			  String branchId=sessionDataService.getBranchId(request.getSession());
			  Branch branch=branchService.getBranchBasedOnBranchId(branchId);
				List<SenderIds> ids=senderIdTypeService.findByBranchAndAdminAndFunctionality(branchId, branch.getAdmin().getAdminId(), "receiving");
				modelAndView.addObject("ids", ids);
			  
			  modelAndView.addObject("branch", branch);
			  modelAndView.addObject("countryISo", branch.getFromCountry().getCountryISO());
			  modelAndView.addObject("country", branch.getFromCountry().getCountryName());

			  return modelAndView;
		  }
		  
		  
		  
		  
		  @RequestMapping(value = "/updateRemitterprofile",method = RequestMethod.POST)
		  public ModelAndView updateCustomeProfile(HttpServletRequest request,@ModelAttribute Customer customer,MultipartHttpServletRequest multipartRequest) {
			  ModelAndView modelAndView=new ModelAndView();
			  String branchId=sessionDataService.getBranchId(request.getSession());
			  if(branchId != null && !branchId.equals("")){
				  if(multipartRequest!=null) {
					Branch branch= branchService.getBranchBasedOnBranchId(branchId);
					customer.setBranch(branch);
					customer.setCountry(branch.getFromCountry());
					customer.setAdmin(branch.getAdmin());
					customer.setCustomerDetailsFlag("full");
					String firstIdProofType = request.getParameter("firstIdProofType").split(",")[0];
					customer.setFirstIdProofType(firstIdProofType);

			  System.out.println("updatecustomerprofile............working");
			  String idProofIssueCountryISO=request.getParameter("idProofIssueCountry");
			  Country idIssueCountry=countryService.getCountryBasedOnIso(idProofIssueCountryISO);
			  customer.setIssuingCountry(idIssueCountry);
			  System.out.println("customer2......"+customer);
			  customerService.updateCustomerProfile(customer, multipartRequest);
				String myIp=request.getParameter("myIp");
			  AuditTrail atr=new AuditTrail();
				atr.setAgent(branch.getBranchId());
				atr.setUserId(branch.getBranchId());
				atr.setUserType("ROLE_BRANCH");
				atr.setOriginalData(customer.getCustomerId());
				atr.setChangedData(customer.getCustomerId());
				atr.setIpAddress(myIp);
				atr.setUserName(customer.getBranch().getEmailId());
				atr.setCategory("Remitter Profile is updated");
				atr.setAdminId(customer.getAdmin().getAdminId());
				auditTrailService.save(atr);

				  }else {
					  return modelAndView=new ModelAndView("redirect:updatecustomerviewprofile");
				  }
				  
				  }
			  modelAndView.setViewName("redirect:customereditprofile");
			  modelAndView.addObject("customerId",customer.getCustomerId());
		  
			return modelAndView=new ModelAndView("redirect:RemmitersList");
		  }
		  
		  
		  
		  
		  @RequestMapping(value = "/updatecustomerviewprofile",method = RequestMethod.POST)
		  public @ResponseBody ModelAndView updateCustomeViewProfile(HttpServletRequest request  ) {
			  ModelAndView modelAndView=new ModelAndView();
			  String branchId=sessionDataService.getBranchId(request.getSession());
             System.out.println("gh");
			  modelAndView.setViewName("customereditprofile");
			  if(branchId != null && !branchId.equals("")){
				  
				  String customerId=request.getParameter("customerId");
				  Customer customer=customerService.findByCustomerId(customerId);
				  customer.setFirstName(request.getParameter("firstName"));
				  customer.setLastName(request.getParameter("lastName"));
				 customer.setGender( request.getParameter("gender"));
				  customer.setEmailId(   request.getParameter("emailId"));
				  customer.setDob(request.getParameter("dob"));
				  customer.setMobileNumber(request.getParameter("mobileNumber"));
				  customer.setAddress1(request.getParameter("address"));
				  customer.setCityOrState( request.getParameter("cityOrState"));
				   
				  String firstIdNumber=request.getParameter("firstIdNumber");
				  String firstIdIssueDate=request.getParameter("firstIdIssueDate");
				  String firstIdExpireDate=request.getParameter("firstIdExpireDate");
				  String firstIdProofStatus=request.getParameter("firstIdProofStatus");
 
					Branch branch= branchService.getBranchBasedOnBranchId(branchId);
					
					customer.setBranch(branch);
					
					customer.setCountry(branch.getFromCountry());
					
					customer.setAdmin(branch.getAdmin());

                customerService.updateViewProfile(customer);
			  }
			  modelAndView.setViewName("redirect:customereditprofile");
		  
			  return modelAndView;

		  } 
			 @RequestMapping(value={"/getAllCountries"},method={RequestMethod.POST})
		     @ResponseBody public List<Country> getAllCountries(){
			  System.out.println("Hiiii this is from country ajax ");
		     List<Country> countryList = countryService.getAllCountries();
		     System.out.println("countryList size is :::"+countryList.size());
		     return countryList;
		     }
 @RequestMapping("makeTransaction")
 public String redirectMakeTransaction()
 {
 return "redirect:/br";
 }
	@RequestMapping("insertFirstTransaction")
	public String SubmitTransaction(HttpServletRequest request)
	{
		String adminid=request.getParameter("admid");
		String txid=request.getParameter("txid");
		System.out.println("admin id in branchcot:"+adminid);
		Admin admin=adminService.getAdminDetailsBasedOnAdminId(adminid);
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
		String postCode=request.getParameter("beneficiaryPostCode");
		String mobileTrnsferNumber=request.getParameter("mobileTrnsferNumber");
		String transferNetWork=request.getParameter("transferNetWork");
		String transferNetWorkCreditType=request.getParameter("transferNetWorkCreditType");
		TransactionInformation ti=txnService.findByTransactionId(txid);
		System.out.println("taxfe in edit===="+request.getParameter("tax_fee"));
		System.out.println("agentFee in edit===="+request.getParameter("agent_fee"));
		Customer c=customerService.findByCustomerId(ti.getCustomer().getCustomerId());
		System.out.println("c-====="+c);
					ti.setCustomer(c);
		double taxfee=Double.parseDouble(request.getParameter("tax_fee"));
		ti.setTaxFee(taxfee);
		ti.setTotalAmountCollected(Double.parseDouble(request.getParameter("total_to_pay")));
		String mop=request.getParameter("modeOfPayment");
		String pt[]=mop.split("-");
		ti.setModeOfPayment(pt[1]);
		ti.setAgentFee(request.getParameter("agent_fee"));
		ti.setAdminFee(request.getParameter("admin_fee"));
		ti.setRecagentFee(request.getParameter("rec_fee"));
		ti.setSendingReason(request.getParameter("purpose"));
		ti.setReceivingCurrencyRate(Double.parseDouble(request.getParameter("exch_rate")));
		ti.setSendingAmount(Double.parseDouble(request.getParameter("sendAmount")));
		ti.setReceipentAmount(Double.parseDouble(request.getParameter("receiveAmount")));
ti.setPaymentType(request.getParameter("payment"));
ti.setTxnConfirmation("confirmed");
ti.setProfitRate(request.getParameter("profitRate"));
ti.setBuyRate(request.getParameter("buyingRate"));
ti.setAdmin(admin);
String countryid=request.getParameter("toBranchId");
System.out.println("country id:"+countryid);
String ptp=request.getParameter("payment");
Beneficiary b=bservice.getBeneficiaryDetails(ti.getBeneficiary().getBeneficiaryId());
b.setFirstName(request.getParameter("bFirstName"));
b.setLastName(request.getParameter("blastName"));
b.setGender(request.getParameter("bgender"));
b.setMobileNumber(request.getParameter("bmobileNumber"));
b.setRelationShip(request.getParameter("purpose"));
if(ptp.equals("Bill Payment")) {
b.setUtilityCompany(utilityCompany);
b.setAddressLine1(addressLine1);
b.setAddressLine2(addressLine2);
b.setAddressLine3(addressLine3);
b.setBankToPay(bankToPay);
b.setBillDescription(billDescription);
b.setBankBicCode(bankBicCode);
b.setState(state);

b.setBeneficiaryIdDetails(beneficiaryIdDetails);
b.setBeneficiaryIdType(beneficiaryIdType);
b.setCity(city);
b.setInvoiceNumber(invoiceNumber);
b.setIBAN(iBan);
b.setEmailId(request.getParameter("bemailId"));
b.setCustomerAccountNumber(customerAccountNumber);
}
if(ptp.equals("Account Transfer")||ptp.equals("Bank Deposit")) {
	b.setBeneficiaryAccountTransfer(beneficiaryAccountTransfer);
	b.setBank(bank);
b.setBankDetails(bankDetails);
b.setBranch(branch);
b.setBranchCity(BranchCity);
b.setBranchManager(branchManager);
b.setBranchState(branchState);
b.setTelephone(telephone);
b.setSwiftCode(swiftCode);
b.setTelephone(request.getParameter("branchTelephone"));

}
if(ptp.equals("Home Delivery")) {
b.setBeneficiaryAddress1(beneficiaryAddress1);
b.setBeneficiaryAddress2(beneficiaryAddress2);
b.setBeneficiaryAddress3(beneficiaryAddress3);
b.setBeneficiaryCity(beneficiaryCity);
b.setBeneficiaryPostCode(beneficiaryPostCode);
b.setDeliveryNote(deliveryNote);
b.setBeneficiaryIdDetails(beneficiaryIdDetails);
b.setBeneficiaryIdType(beneficiaryIdType);
}
if(ptp.equals("Card Transfer")) {
b.setCardNumber(cardNumber);
}
if(ptp.equals("Cash Collection")) {
b.setCollectionPin(collectionPin);
b.setCollectionPointAddress(collectionPointAddress);
b.setCollectionPointBank(collectionPointBank);
b.setCollectionPointCity(collectionPointCity);
b.setCollectionPointCode(collectionPointCode);
b.setCollectionPointName(collectionPointName);
b.setCollectionPointState(collectionPointState);
b.setCollectionPointTelephone(collectionPointTelephone);
}

if(ptp.equals("Mobile Money")) {
b.setMobileTrnsferNumber(mobileTrnsferNumber);
b.setTransferNetWork(transferNetWork);
b.setTransferNetWork(transferNetWorkCreditType);
b.setTransferNetWorkCreditType(transferNetWorkCreditType);
}
//b.setProfitRate(request.getParameter("profitRate"));

b.setSendingReason(request.getParameter("relationShip"));
b.setCityOrTown(request.getParameter("bcityOrState"));
//b.setAddressLine1(request.getParameter("baddress"));
 b.setIdProof(Integer.parseInt(request.getParameter("idProof"))); 
b.setIdProofNo(request.getParameter("idProofNo"));
b.setAccType(request.getParameter("payment"));
b.setBankName(request.getParameter("bankName"));
b.setBankBranchState(request.getParameter("bankState"));
b.setAccountHolderName(request.getParameter("accountHolderName"));
b.setBankBranchCode(request.getParameter("branchCode"));
b.setBankAccountNumber(request.getParameter("accountNo"));
//b.setAddressLine2("-");
b.setBankId("-");
b.setBranchName("-");
b.setCreatedBy("-");
b.setUpdatedBy("-");
b.setCreatedDate("-");
b.setUpdatedDate("-");
b.setIssuerCode("-");
b.setEWalletNo("-");
b.setEmailId("-");
b.setPostCode(postCode);
b.setCustomer(c);
ti.setTransactionRate(Double.parseDouble(request.getParameter("exch_rate")));
b.setAdmin(admin);
b.setEmailId(request.getParameter("bemailId"));
bservice.ConfirmBeneficiaryDetails(b);

ti.setBeneficiary(b);
ti.setPaymentType(request.getParameter("payment"));
ti.setAmountToBeConverted(Double.parseDouble(request.getParameter("sendAmount")));
ti.setSendingCurrencyRate(request.getParameter("exch_rate"));
		double mfee=Double.parseDouble(request.getParameter("mfees"));
		ti.setModeOfPaymentFee(mfee);
		double totalfee=taxfee+mfee;
ti.setTotalFee(totalfee);
ti.setSourceOfFund(request.getParameter("sourceOfFund"));
ti.setOccupation(request.getParameter("occupation"));
System.out.println("mop====="+pt[1]);
if(pt[1].equals("Cash")) {
	ti.setStatus("funds received");
	ti.setPaymentStatus("funds received");

}else {
ti.setStatus("pending");
ti.setPaymentStatus("pending");

}
ti.setCustomer(ti.getCustomer());
ti.setUpdatedBy("user");
ti.setPaymentStatusFromUser("paid");
ti.setAgent("remitz");
ti.setApprovedByAdmin("pending");
ti.setApprovedBySendingBranch("pending");
ti.setApprovedByReceivingBranch("pending");
ti.setTransactionMode("online");

return "redirect:/txnConfirmation?txnId="+txid;

	}
		@RequestMapping("insertTransaction")
		public String getSubmitTransaction(HttpServletRequest request, MultipartHttpServletRequest multipartRequest)
		{
		String adminid=request.getParameter("admid");
		Admin admin=adminService.getAdminDetailsBasedOnAdminId(adminid);
			System.out.println("else condition of txn");
			TransactionInformation ti=new TransactionInformation();
			System.out.println("taxfe===="+request.getParameter("tax_fee"));
			System.out.println("agentFee===="+request.getParameter("agent_fee"));
			String enterAmount=request.getParameter("enterAmount");
			String convertedAmount=request.getParameter("cAmount");
			double taxfee=Double.parseDouble(request.getParameter("tax_fee"));
			ti.setTaxFee(taxfee);
			ti.setTotalAmountCollected(Double.parseDouble(request.getParameter("total_to_pay")));
			String mop=request.getParameter("modeOfPayment");
			String pt[]=mop.split("-");
			ti.setModeOfPayment(pt[1]);
			ti.setConvertedAmount(Double.parseDouble(convertedAmount));
ti.setEnterAmount(enterAmount);
			ti.setAgentFee(request.getParameter("agentFee"));
			ti.setAdminFee(request.getParameter("admin_fee"));
			ti.setRecagentFee(request.getParameter("rec_fee"));
			ti.setSendingReason(request.getParameter("purpose"));
			ti.setReceivingCurrencyRate(Double.parseDouble(request.getParameter("exch_rate")));
			ti.setSendingAmount(Double.parseDouble(request.getParameter("sendAmount")));
			ti.setReceipentAmount(Double.parseDouble(request.getParameter("receiveAmount")));
           ti.setPaymentType(request.getParameter("payment"));
            NasanoResponse ns=new NasanoResponse();
			ns.setGloMsg("something");
			ns.setGloStatus("notdone");
			ns.setGloTransactionId("134");
			NasanoResponse n=	nasanoResponService.save(ns);
			ti.setNasanoResponse(n);
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
			String postCode=request.getParameter("beneficiaryPostCode");
			String mobileTrnsferNumber=request.getParameter("mobileTrnsferNumber");
			String transferNetWork=request.getParameter("transferNetWork");
			String transferNetWorkCreditType=request.getParameter("transferNetWorkCreditType");
		ti.setProfitRate(request.getParameter("profitRate"));
		ti.setBuyRate(request.getParameter("buyingRate"));
		System.out.println("billDescription===="+billDescription);	
		ti.setAdmin(admin);
			String countryid=request.getParameter("toBranchId");
             System.out.println("country id:"+countryid);
			
			Branch bc=branchService.getBranchBasedOnBranchId(countryid);
			Country rc=countryService.getCountryBasedOnIso(bc.getFromCountry().getCountryISO());
			System.out.println("branch country"+bc.toString());
			String frombranch=request.getParameter("bid");
			System.out.println("country id:"+frombranch);
						
		Branch fbc=branchService.getBranchBasedOnBranchId(frombranch);
		Country frc=countryService.getCountryBasedOnIso(fbc.getFromCountry().getCountryISO());
		Customer c=new Customer();
		if(request.getParameter("cflag").equals("new")) {
			 
			Customer c1=new Customer();
			c1.setCityOrState(request.getParameter("cState"));
			c1.setPassword(request.getParameter("cuspwd"));
			c1.setMobileNumber(request.getParameter("custMobNo1"));
			c1.setFirstName(request.getParameter("custForName1"));
			c1.setLastName(request.getParameter("custSurName1"));
			c1.setGender(request.getParameter("custGender1"));
			c1.setCityOrState(request.getParameter("custCityState1"));
			c1.setAddress1(request.getParameter("custAddress1"));
			c1.setEmailId(request.getParameter("custEmail1"));
			c1.setPostalCode(request.getParameter("custPostCode1"));
			c1.setOccupation(request.getParameter("occupation1"));
			c1.setFirstIdNumber(request.getParameter("firstIdNumber1"));
			c1.setDob(request.getParameter("custDob1"));
			c1.setFirstIdIssueDate(request.getParameter("firstIdIssueDate1"));
			c1.setFirstIdExpireDate(request.getParameter("firstIdExpireDate1"));
			c1.setFirstIdProofType((request.getParameter("firstIdProofType1")).split(",")[0]);
			Country ic=countryService.getCountryBasedOnIso(request.getParameter("idProofIssueCountry1"));
			c1.setIssuingCountry(ic);
			c1.setCountry(fbc.getFromCountry());
			c1.setFirstIdProofStatus("yes");
			c1.setBranch(fbc);
			c1.setAdmin(admin);
			c1.setStatus("pending");
			c1.setCustomerKYCStatus("pending");
			c1.setCustomerKYCMode("Manual");
			 List<SanctionSearch> sanctionSearchList=sanctionSearchService.getSanctionSearchResult(request.getParameter("forName1"),request.getParameter("surName1"));
		System.out.println("sanctionSearchList::::"+sanctionSearchList);
				if(sanctionSearchList.size()>0) {
					c1.setSanctionSearchFlag("yes");
				}else {
					c1.setSanctionSearchFlag("no");
				}
		    String cid=  customerService.registerCustomer(c1, multipartRequest);
c=customerService.findByCustomerId(cid);
		
	}else {
         c=customerService.findByCustomerId(request.getParameter("cid"));
		
	}
		System.out.println("c in txn========"+c);
        ti.setCustomer(c);
		if(request.getParameter("bflag").equals("new"))
			{
			Beneficiary b=new Beneficiary();
			String ptp=request.getParameter("payment");
			b.setFirstName(request.getParameter("bFirstName"));
			b.setLastName(request.getParameter("blastName"));
			b.setGender(request.getParameter("bgender"));
			b.setMobileNumber(request.getParameter("bmobileNumber"));
			b.setRelationShip(request.getParameter("purpose"));
			b.setPostCode(beneficiaryPostCode);
			b.setCityOrTown(request.getParameter("bcityOrState"));
			b.setAddress(request.getParameter("baddress"));
			b.setEmailId(request.getParameter("bemailId"));
			b.setState(request.getParameter("state"));
			if(ptp.equals("Bill Payment")) {
			b.setUtilityCompany(utilityCompany);
			b.setAddressLine1(addressLine1);
			b.setAddressLine2(addressLine2);
			b.setAddressLine3(addressLine3);
			b.setBankToPay(bankToPay);
			b.setBillDescription(billDescription);
			b.setBankBicCode(bankBicCode);
			b.setState(state);
			b.setCity(city);
			b.setInvoiceNumber(invoiceNumber);
			b.setIBAN(iBan);
			b.setCustomerAccountNumber(customerAccountNumber);
			}
			if(ptp.equals("Account Transfer")||ptp.equals("Bank Deposit")) {
				b.setBeneficiaryAccountTransfer(beneficiaryAccountTransfer);
				b.setBank(bank);
			b.setBankDetails(bankDetails);
			b.setBranch(branch);
			b.setTelephone(telephone);
			b.setBranchCity(BranchCity);
			b.setBranchManager(branchManager);
			b.setBranchState(branchState);
			b.setIBAN(iBan);
			b.setSwiftCode(swiftCode);
			b.setEmailId(request.getParameter("bemailId"));
			b.setTelephone(request.getParameter("branchTelephone"));

			}
			if(ptp.equals("Home Delivery")) {
			b.setBeneficiaryAddress1(beneficiaryAddress1);
			b.setBeneficiaryAddress2(beneficiaryAddress2);
			b.setBeneficiaryAddress3(beneficiaryAddress3);
			b.setBeneficiaryCity(beneficiaryCity);
			b.setBeneficiaryIdDetails(beneficiaryIdDetails);
			b.setBeneficiaryIdType(beneficiaryIdType);
			b.setBeneficiaryPostCode(beneficiaryPostCode);
			b.setDeliveryNote(deliveryNote);
			}
			if(ptp.equals("Card Transfer")) {
			b.setCardNumber(cardNumber);
			}
			if(ptp.equals("Cash Collection")) {
			b.setCollectionPin(collectionPin);
			b.setCollectionPointAddress(collectionPointAddress);
			b.setCollectionPointBank(collectionPointBank);
			b.setCollectionPointCity(collectionPointCity);
			b.setCollectionPointCode(collectionPointCode);
			b.setCollectionPointName(collectionPointName);
			b.setCollectionPointState(collectionPointState);
			b.setCollectionPointTelephone(collectionPointTelephone);
			}
			
			if(ptp.equals("Mobile Money")) {
			b.setMobileTrnsferNumber(mobileTrnsferNumber);
			b.setTransferNetWork(transferNetWork);
			b.setTransferNetWorkCreditType(transferNetWorkCreditType);
			}
			b.setSendingReason(request.getParameter("relationShip"));
		b.setCityOrTown(request.getParameter("bcityOrState"));
			 b.setIdProof(Integer.parseInt(request.getParameter("idProof"))); 
		b.setIdProofNo(request.getParameter("idProofNo"));
		b.setAccType(request.getParameter("payment"));
		b.setBankName(request.getParameter("bankName"));
		b.setBankBranchState(request.getParameter("bankState"));
		b.setAccountHolderName(request.getParameter("accountHolderName"));
		b.setBankBranchCode(request.getParameter("branchCode"));
		b.setBankAccountNumber(request.getParameter("accountNo"));
		b.setPostCode(request.getParameter("postCode"));
			//b.setAddressLine2("-");
			b.setBankId("-");
			b.setEWalletNo("-");
			b.setBranchName("-");
			b.setCreatedBy("-");
			b.setUpdatedBy("-");
			b.setCreatedDate("-");
			b.setUpdatedDate("-");
			b.setIssuerCode("-");
			b.setEmailId("-");
			b.setPostCode(postCode);
			b.setBeneficiaryCountry(rc);
			b.setCustomer(c);
			BranchPaymentTypeDetails deliverytime= bptds.getDeliveryTime(request.getParameter("payment"), countryid);
			ti.setDeliveryTime(deliverytime.getDeliveryTime());	
			ti.setToBranch(bc);
			ti.setReceivingCurrency(bc.getFromCountry().getCurrencyCode());
			ti.setSendingCurrency(fbc.getFromCountry().getCurrencyCode());
			ti.setTransactionRate(Double.parseDouble(request.getParameter("exch_rate")));
			b.setAdmin(admin);
			bservice.saveBeneficiaryDetails(b);
			
			ti.setBeneficiary(b);
			
			}
			if(request.getParameter("bflag").equals("exist"))
			{
String benifiecieryid=request.getParameter("bnid");
System.out.println("benifiecieryid==="+benifiecieryid);
 Beneficiary b1= bservice.getBeneficiaryDetails(benifiecieryid);
System.out.println("b1========"+b1);
 String ptp=request.getParameter("payment");
if(ptp.equals("Bill Payment")) {
b1.setUtilityCompany(utilityCompany);
b1.setAddressLine1(addressLine1);
b1.setAddressLine2(addressLine2);
b1.setAddressLine3(addressLine3);
b1.setBankToPay(bankToPay);
b1.setBillDescription(billDescription);
b1.setBankBicCode(bankBicCode);
b1.setState(state);
b1.setCity(city);
b1.setInvoiceNumber(invoiceNumber);
b1.setCustomerAccountNumber(customerAccountNumber);
}
if(ptp.equals("Account Transfer")||ptp.equals("Bank Deposit")) {
	b1.setBeneficiaryAccountTransfer(beneficiaryAccountTransfer);
	b1.setBank(bank);
b1.setBankDetails(bankDetails);
b1.setBranch(branch);
b1.setTelephone(telephone);
b1.setBranchCity(BranchCity);
b1.setBranchManager(branchManager);
b1.setBranchState(branchState);
b1.setSwiftCode(swiftCode);
b1.setTelephone(request.getParameter("branchTelephone"));

}
if(ptp.equals("Home Delivery")) {
b1.setBeneficiaryAddress1(beneficiaryAddress1);
b1.setBeneficiaryAddress2(beneficiaryAddress2);
b1.setBeneficiaryAddress3(beneficiaryAddress3);
b1.setBeneficiaryCity(beneficiaryCity);
b1.setBeneficiaryPostCode(beneficiaryPostCode);
b1.setDeliveryNote(deliveryNote);
}
if(ptp.equals("Card Transfer")) {
b1.setCardNumber(cardNumber);
}
if(ptp.equals("Cash Collection")) {
b1.setCollectionPin(collectionPin);
b1.setCollectionPointAddress(collectionPointAddress);
b1.setCollectionPointBank(collectionPointBank);
b1.setCollectionPointCity(collectionPointCity);
b1.setCollectionPointCode(collectionPointCode);
b1.setCollectionPointName(collectionPointName);
b1.setCollectionPointState(collectionPointState);
b1.setCollectionPointTelephone(collectionPointTelephone);
}

if(ptp.equals("Mobile Money")) {
b1.setMobileTrnsferNumber(mobileTrnsferNumber);
b1.setTransferNetWork(transferNetWork);
b1.setTransferNetWorkCreditType(transferNetWorkCreditType);
}
bservice.updateBeneficiaryDetails(b1);
 ti.setBeneficiary(b1);
			}
			ti.setPaymentType(request.getParameter("payment"));
			ti.setToBranch(bc);
			ti.setAmountToBeConverted(Double.parseDouble(request.getParameter("sendAmount")));
			ti.setSendingCurrencyRate(request.getParameter("exch_rate"));
		double mfee=Double.parseDouble(request.getParameter("mfees"));
	ti.setModeOfPaymentFee(mfee);
double totalfee=taxfee+mfee;
			ti.setTotalFee(totalfee);
		ti.setSourceOfFund(request.getParameter("sourceOfFund"));
		ti.setOccupation(request.getParameter("occupation"));
			ti.setFromBranch(fbc);
			ti.setSendingCountry(frc);
			ti.setReceivingCountry(rc);
			System.out.println("mop====="+pt[1]);
			if(pt[1].equals("Cash")) {
				ti.setStatus("funds received");
				ti.setPaymentStatus("funds received");

			}else {
			ti.setStatus("pending");
			ti.setPaymentStatus("pending");

			}
			ti.setUpdatedBy("user");
			ti.setPaymentStatusFromUser("paid");
			ti.setAgent("remitz");
			ti.setApprovedByAdmin("pending");
			ti.setApprovedBySendingBranch("pending");
			ti.setApprovedByReceivingBranch("pending");
			ti.setTransactionMode("online");
			String txnId=txnService.saveTransactionInformation(ti);
			String myIp=request.getParameter("myIp");
			AuditTrail atr=new AuditTrail();
			atr.setAgent(fbc.getBranchId());
			atr.setUserId(fbc.getBranchId());
			atr.setUserType("ROLE_BRANCH");
			atr.setChangedData(txnId);
			atr.setIpAddress(myIp);
			atr.setUserName(fbc.getEmailId());
			atr.setAdminId(fbc.getAdmin().getAdminId());
			atr.setCategory("New Transaction is created");
			auditTrailService.save(atr);


			System.out.println("txnId=txnFulldetailsBranch===="+txnId);
			return "redirect:/txnConfirmation?txnId="+txnId;
		}
		
		@RequestMapping("branchTransactionlist")
		public ModelAndView getAllBranchTransactions(HttpServletRequest request)
		{
			HttpSession session =request.getSession();
		      String BranchId=(String) session.getAttribute("branchId");
		        System.out.println("branchid:"+BranchId);
		       Branch b= branchService.getBranchBasedOnBranchId(BranchId);
        System.out.println("how adminid"+b.getAdmin().getAdminId());
        SimpleDateFormat dateFormat=new SimpleDateFormat("yyyy-MM-dd");
        Date date1=new Date();
        String currentDate=dateFormat.format(date1);
        System.out.println("currentDate===="+currentDate);
        List<TransactionInformation>l=txnService.getAllSendingBranchTransactions(b.getAdmin().getAdminId(),BranchId,currentDate,currentDate);
			System.out.println("size:"+l.size());
		ModelAndView mav=new ModelAndView();
		List<TransactionInformation>l1=txnService.getByFromBranch(BranchId);				
		double lifetimeAgentcommision=0;
		double lifetimeAgenttopayhq=0;
		double balancetopay=0;
		double lifetimedeposit=0;
		double commision=0;
		List<AgentDeposit> all=adp.getByBranch(BranchId,"approved");
		System.out.println("cmplt adp===="+all.size());
		for(int i=0;i<all.size();i++) {
			AgentDeposit ad1=all.get(i);
			lifetimedeposit=lifetimedeposit+Double.parseDouble(ad1.getDepositAmount());
		}
		System.out.println("lifetimedeposit==="+lifetimedeposit);
		System.out.println("cmplttxn====="+l1.size());
		double destAmount=0;
		for(int i=0;i<l1.size();i++) {
			TransactionInformation t=l1.get(i);
			lifetimeAgentcommision=lifetimeAgentcommision+Double.parseDouble(t.getAgentFee());
			lifetimeAgenttopayhq=lifetimeAgenttopayhq+(t.getSendingAmount()+t.getTaxFee());
			commision=commision+t.getTaxFee();
			destAmount=destAmount+t.getReceipentAmount();
		}
		System.out.println("lifetimeAgenttopayhq==="+lifetimeAgenttopayhq);
		System.out.println("lifetimeAgentcommision==="+lifetimeAgentcommision);
		lifetimeAgenttopayhq =lifetimeAgenttopayhq-lifetimeAgentcommision;
		balancetopay=lifetimeAgenttopayhq-(lifetimeAgentcommision)-(lifetimedeposit);
		mav.addObject("lifetimeAgentcommision", lifetimeAgentcommision);
		mav.addObject("lifetimeAgenttopayhq", lifetimeAgenttopayhq);
		mav.addObject("lifetimedeposit", lifetimedeposit);
		mav.addObject("total", l1.size());
		mav.addObject("destAmount", destAmount);
		mav.addObject("commision", commision);
		mav.addObject("fromdate",currentDate);
	    mav.addObject("todate",currentDate);
		mav.addObject("transactionlist", l);
		mav.addObject("nsn", b.getAdmin().getNsano());
		mav.setViewName("branchTransactionList");
		return mav;
		
		}
		@RequestMapping("getReceivingBranchTransactions")
		public ModelAndView getReceivingBranchTransactions(HttpServletRequest request)
		{
				HttpSession session=request.getSession();
				
				Branch branchid=(Branch)session.getAttribute("branch");
				String adminid=branchid.getAdmin().getAdminId();
			ModelAndView mav=new ModelAndView();
			
			
			Date date1=new Date();
			SimpleDateFormat dateFormat=new SimpleDateFormat("yyyy-MM-dd");
			
			/*Calendar calendar=Calendar.getInstance();
			calendar.setTime(date1);
			Date date=calendar.getTime();
			*/String currentDate=dateFormat.format(date1);
			/*String todayFormatedDate=dateFormat1.format(date);*/
			List<TransactionInformation> list=txnService.getAllReceivingBranchTransactions(adminid, branchid.getBranchId(),currentDate,currentDate);
			mav.addObject("fromdate",currentDate);
			mav.addObject("todate",currentDate);
			mav.addObject("list",list);
			mav.setViewName("RecievingBranchTransactions");
			return mav;
}
		
		@PostMapping("getRecTrnBasedonStatus")
		public @ResponseBody List<TransactionInformation> getRecTrnsBasedOnStatus(@RequestParam String status,String fromdate,String todate,HttpServletRequest request)
		{
		 String adminid=sessionDataService.getAdminId(request.getSession());
		System.out.println("admin id:"+adminid);
		/*
		 * String adminid=b.getAdmin().getAdminId(); String branchid=b.getBranchId();
		 */	
		System.out.println("status:before callingany:"+status);
		List<TransactionInformation> l=null;
		if(!(status.equals("newtrns")) && !(status.equals("all"))) {
		l=txnService.getAllTrnbasedOnStatus(status, fromdate, todate, adminid);
		}
		else if(status.equals("all")){
			System.out.println("adminid:"+adminid+"fromdate:"+fromdate+"todate:"+todate);
				// l=txnService.getAllTransactionDetailsBasedOnAdminId(adminid, fromdate, todate);
			l=txnService.getTransactionDetailsBasedOnadminIdId(adminid);
			}
		
		else if(status.equals("newtrns")){
		status="pending";
			 l=txnService.getAllTrnbasedOnPaymentStatus(status, fromdate, todate, adminid);
		System.out.println("executing else:");
		}
			System.out.println("receving list:"+l.size());
			return l;
		}

		
		
		
		
		
		@RequestMapping("BranchCustomerManualIdVerification")
		public ModelAndView manualIDVerification(HttpServletRequest request) {
			String branchId = sessionDataService.getBranchId(request.getSession());
			System.out.println("BranchCustomerManualIdVerification" + branchId);
			ModelAndView mav = null;
			if (branchId != null) {
				mav = new ModelAndView("BranchManualIdVerification");
				List<Customer> list = customerService.getCustomersList(branchId, "pending");
				System.out.println("list size1111 = = " + list.size());
				System.out.println("list size is = " + list.size());
				mav.addObject("list", list);
			} else {
				mav = new ModelAndView("redirect:index?session expired");
			}
			return mav;
		}

		
		@RequestMapping("Bmanual_id_update")
		public String updateManualVerification(@RequestParam String id, String status, HttpServletRequest request) {
			String message = "";
			String branchId = sessionDataService.getBranchId(request.getSession());
			if (branchId != null) {
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
						System.out.println("idType in two====="+idType);

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

							System.out.println("idType====="+idType);

							EmailTemplate emailTemplate = emailTemplateService.getEmailTemplateByTitleAndAdmin(c.getAdmin().getAdminId(), "Manual id verification done by Admin");
							System.out.println("message======="+emailTemplate);
							String bodyContent = emailTemplate.getTemplate();
							String replacedBodyContent = bodyContent.replace("{FIRST_NAME}", c.getFirstName());
							String replacedBodyContent2=replacedBodyContent.replace("{ID_TYPE}",c.getFirstIdProofType());
							
							System.out.println("replacedBodyContent======"+replacedBodyContent);
							System.out.println("emailTemplate email====="+emailTemplate);
							
							
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
				if (status.equals("yes")) {
					List<TransactionInformation> l = txnService
							.getTransactionDetailsBasedOnCustomerId(c.getCustomerId());
					if (l.size() != 0) {
						for (TransactionInformation ti : l) {
							TransactionInformation txninfo = txnService
									.getTransactionDetails(ti.getTransactionId());
							if (txninfo.getPaymentStatus().equals("funds received")) {
								txninfo.setStatus("processing");
								txnService.updateTransactionInformation(txninfo);
							}
						}
					}
				}

				return "redirect:BranchCustomerManualIdVerification";
			} else {
				return "redirect:index?home";
			}

		}


		 @RequestMapping(value="/trulioredirect",method=RequestMethod.POST)
		  public String trulioredirect(HttpServletRequest request,HttpServletResponse response,@ModelAttribute Customer customer,MultipartHttpServletRequest multipartRequest) throws UnknownHostException
		  {
	return "redirect:customerListing";
		  }
		 
			@GetMapping("/addBranch_rates")
			public ModelAndView returnAddRatesPage(HttpServletRequest request) {
				ModelAndView mav = null;
				String adminId = sessionDataService.getAdminId(request.getSession());
				if (adminId != null) {
					mav = new ModelAndView("addBranch_rates");

				} else {
					mav = new ModelAndView("redirect:login");
				}
				return mav;
			}
			@GetMapping("/getallbuybranchesbasedonadmin")
			@ResponseBody
			public List<Branch> getallbuybranchesbasedonadmin(HttpServletRequest request) {
				String toBranchId = sessionDataService.getBranchId(request.getSession());
				Branch b=branchService.getBranchBasedOnBranchId(toBranchId);
				List<Branch> branchList = branchService.getAllBranchesBasedOnAdminId(b.getAdmin().getAdminId());
				return branchList;
			}

			@GetMapping("/getallBuyratesbasedonBranch")
			@ResponseBody
			public List<AdminSellRates> getAllBuyRatesBasedOnAdmin(HttpServletRequest request) {
				String toBranchId = sessionDataService.getBranchId(request.getSession());
				System.out.println("toBranchId==="+toBranchId);
				List<AdminSellRates> sellRates = currencyRateService.getAllAdminSellRateBasedOnBranch(toBranchId, "buy");
				System.out.println("sellRates==="+sellRates);
				return sellRates;
			}

			@PostMapping("/update_rates_by_branch")
			public String updateRatesByAdmin(HttpServletRequest request, @ModelAttribute AdminSellRates rates,
					@RequestParam String f_br, @RequestParam String t_br) {
				System.out.println("rates = = =" + rates);
				String toBranchId = sessionDataService.getBranchId(request.getSession());
				AdminSellRates ar=currencyRateService.getByCrId(rates.getCrId());
				Branch b=branchService.getBranchBasedOnBranchId(toBranchId);				
				if (toBranchId != null) {
					Admin admin = adminService.getAdminDetailsBasedOnAdminId(b.getAdmin().getAdminId());
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
					return "redirect:addBranch_rates";
				} else {
					return "redirect:index";
				}
			}

		
			@RequestMapping("AgentDeposit")
			public ModelAndView returnAgentDeposit(HttpServletRequest request) {
				String id = sessionDataService.getBranchId(request.getSession());
				Branch b=branchService.getBranchBasedOnBranchId(id);
List<AgentDeposit> list=adp.getAllByAgent(id);
 String currentDate=sdf.format(d).split(" ")[0];
String fromDate=currentDate+" "+"00"+":"+"00"+":"+"00";	
String todate=currentDate+" "+"12"+":"+"59"+":"+"59";	
System.out.println("fromDate===="+fromDate);
System.out.println("todate====="+todate);
SimpleDateFormat dateFormat=new SimpleDateFormat("yyyy-MM-dd");
Date date1=new Date();
String currentDate1=dateFormat.format(date1);
System.out.println("currentDate===="+currentDate1);

List<AgentDeposit> list1=adp.getByBranchAndDates(id, currentDate1, currentDate1,"approved");
System.out.println("list1===="+list1.size());
int todaytotaldeposit=0;
double amt1=0;
for(int i=0;i<list1.size();i++) {
	AgentDeposit ad=list1.get(i);	
	todaytotaldeposit=todaytotaldeposit+Integer.parseInt(ad.getDepositAmount());
}

System.out.println("totaldeposit====="+todaytotaldeposit);
double fee=0;
double sa=0;
double tthq=0;
double todayAgentcommision=0;
double todaytxnvalu=0;
double shortfail=0;
List<TransactionInformation>l=txnService.getAllSendingBranchTransactions(b.getAdmin().getAdminId(),id,currentDate1,currentDate1);
for(int i=0;i<l.size();i++) {
	TransactionInformation t=l.get(i);
	todayAgentcommision=todayAgentcommision+Double.parseDouble(t.getAgentFee());
	amt1=amt1+(t.getTotalAmountCollected());
	todaytxnvalu=todaytxnvalu+t.getSendingAmount();
}
double totaltopayHq=amt1-(todayAgentcommision);
shortfail=totaltopayHq-todaytotaldeposit;
System.out.println("amt1==="+amt1);
System.out.println("fee===="+fee);
 String countryIso=b.getFromCountry().getCountryISO();
				ModelAndView mav=new ModelAndView("AgentDeposit");
				mav.addObject("list", list);
				mav.addObject("bid", b.getBranchId());
				mav.addObject("currentDate", currentDate);
				mav.addObject("countryIso", countryIso);
				mav.addObject("todaytotaldeposit", todaytotaldeposit);
				mav.addObject("todayAgentcommision", todayAgentcommision);
				mav.addObject("totaltopayHq", totaltopayHq);
				mav.addObject("todaytxnvalu", todaytxnvalu);
				mav.addObject("shortfail", shortfail);
				System.out.println("shortfail==="+shortfail);
				System.out.println("todaytxnvalu==="+todaytxnvalu);
				System.out.println("totaltopayHq==="+totaltopayHq);
				System.out.println("todayAgentcommision===="+todayAgentcommision);
				System.out.println("todaytotaldeposit===="+todaytotaldeposit);
				List<TransactionInformation>l1=txnService.getByFromBranch(id);				
				double lifetimeAgentcommision=0;
				double lifetimeAgenttopayhq=0;
				double balancetopay=0;
				double lifetimedeposit=0;
				List<AgentDeposit> all=adp.getByBranch(id,"approved");
				System.out.println("cmplt adp===="+all.size());
				for(int i=0;i<all.size();i++) {
					AgentDeposit ad1=all.get(i);
					lifetimedeposit=lifetimedeposit+Double.parseDouble(ad1.getDepositAmount());
				}
				System.out.println("lifetimedeposit==="+lifetimedeposit);
				System.out.println("cmplttxn====="+l1.size());
				for(int i=0;i<l1.size();i++) {
					TransactionInformation t=l1.get(i);
					lifetimeAgentcommision=lifetimeAgentcommision+Double.parseDouble(t.getAgentFee());
					lifetimeAgenttopayhq=lifetimeAgenttopayhq+(t.getTotalAmountCollected());
				}
				System.out.println("lifetimeAgenttopayhq==="+lifetimeAgenttopayhq);
				System.out.println("lifetimeAgentcommision==="+lifetimeAgentcommision);
				lifetimeAgenttopayhq =lifetimeAgenttopayhq-lifetimeAgentcommision;
				balancetopay=lifetimeAgenttopayhq-(lifetimeAgentcommision)-(lifetimedeposit);
				mav.addObject("lifetimeAgentcommision", lifetimeAgentcommision);
				mav.addObject("lifetimeAgenttopayhq", lifetimeAgenttopayhq);
				mav.addObject("lifetimedeposit", lifetimedeposit);
				mav.addObject("balancetopay", balancetopay);
				return mav;
			}
			
			@PostMapping("insertDeposits")
			public ModelAndView insertDeposits(@ModelAttribute AgentDeposit ad,HttpServletRequest request,MultipartRequest multiPartRequest) {
				String id
				= sessionDataService.getBranchId(request.getSession());
Branch b=branchService.getBranchBasedOnBranchId(id);
String currentDate=sdf.format(d).split(" ")[0];
ad.setDate(currentDate);
ad.setBranch(b);
ad.setAdmin(b.getAdmin());
ad.setStatus("pending");
System.out.println("ad===="+ad);
adp.save(ad, multiPartRequest);
String myIp=request.getParameter("myIp");
AuditTrail atr=new AuditTrail();
atr.setAgent(b.getBranchId());
atr.setUserId(b.getBranchId());
atr.setUserType("ROLE_BRANCH");
atr.setOriginalData("-");
atr.setChangedData("New Agent  Deposit Amount is:"+ad.getDepositAmount());
atr.setIpAddress(myIp);
atr.setUserName(b.getEmailId());
atr.setCategory("agent deposit is created");
atr.setAdminId(b.getAdmin().getAdminId());
auditTrailService.save(atr);

ModelAndView mav=new ModelAndView();
return mav=new ModelAndView("redirect:AgentDeposit");
			}

			
			
			
@GetMapping("getAgentDepositsByDates")
@ResponseBody
public String getAgentDepositsByDates(@RequestParam String fromDate,String toDate,String bid)
{
	int todaytotaldeposit=0;
	double amt1=0;
	List<AgentDeposit> list1=adp.getByBranchAndDates(bid, fromDate, toDate,"approved");
	for(int i=0;i<list1.size();i++) {
		AgentDeposit ad=list1.get(i);	
		todaytotaldeposit=todaytotaldeposit+Integer.parseInt(ad.getDepositAmount());
	}
	double todayAgentcommision=0;
	double todaytxnvalu=0;
	double shortfail=0;
	Branch b=branchService.getBranchBasedOnBranchId(bid);
	List<TransactionInformation>l=txnService.getAllSendingBranchTransactions(b.getAdmin().getAdminId(),bid,fromDate,toDate);
	for(int i=0;i<l.size();i++) {
		TransactionInformation t=l.get(i);
		todayAgentcommision=todayAgentcommision+Double.parseDouble(t.getAgentFee());
		amt1=amt1+(t.getTotalAmountCollected());
		todaytxnvalu=todaytxnvalu+t.getSendingAmount();
	}
	double totaltopayHq=amt1-(todayAgentcommision);
	shortfail=totaltopayHq-todaytotaldeposit;
String fee=totaltopayHq+","+todaytotaldeposit+","+shortfail+","+todayAgentcommision+","+todaytxnvalu;

return fee;
}



@RequestMapping("txnConfirmation")
public ModelAndView txnConfirmationpage(HttpServletRequest request) {
	String txId=request.getParameter("txnId");
	TransactionInformation tx=txnService.findByTransactionId(txId);
	ModelAndView mav=new ModelAndView("txnConfirmation");
	mav.addObject("tx", tx);
	 double totalDeposits=0;
	 double totalAmounttopay=0;
	 double totalAgentfee=0;
	 double total=0;
	 System.out.println("tx======"+tx);
	 System.out.println("from branch===="+tx.getFromBranchId());
	 System.out.println("branchid======="+tx.getFromBranch().getBranchId());
	 List<AgentDeposit> ad=adp.getByBranch(tx.getFromBranch().getBranchId(),"approved");
	 System.out.println("ad======="+ad.size());
	 for(int i=0;i<ad.size();i++) {
		 AgentDeposit a=ad.get(i);
		 totalDeposits=totalDeposits+Double.parseDouble(a.getDepositAmount()); 
	 }
	 List<TransactionInformation> tl=txnService.getByFromBranch(tx.getFromBranch().getBranchId());
	 for(int i=0;i<tl.size();i++) {
		 TransactionInformation t=tl.get(i);
		 totalAgentfee=totalAgentfee+Double.parseDouble(t.getAgentFee()); 
		 total=total+t.getTotalAmountCollected();
	 }
	 totalAmounttopay= total-totalAgentfee;
	 totalDeposits=totalDeposits-totalAmounttopay;
	 mav.addObject("totalDeposits", totalDeposits);
	 mav.addObject("countryIso", tx.getFromBranch().getFromCountry().getCountryISO());
	 mav.addObject("totalAmounttopay", totalAmounttopay);

	return mav;
}



@PostMapping("confirmtxn")
@ResponseBody
public ModelAndView confirmtxn(HttpServletRequest request) {
	String txid=request.getParameter("txid");
	TransactionInformation tx=txnService.findByTransactionId(txid);
tx.setTxnConfirmation("confirmed");
tx.setStatus("pending");
txnService.confirmTxn(tx);
ModelAndView mav=new ModelAndView("redirect:txnFulldetailsBranch");
mav.addObject("txnId", txid);
	return mav;
}
@PostMapping("deletetxn")
@ResponseBody
public ModelAndView deletetxn(HttpServletRequest request) {
	String txid=request.getParameter("txid");
	TransactionInformation tx=txnService.findByTransactionId(txid);
tx.setTxnConfirmation("deleted");
tx.setStatus("cancelled");
txnService.confirmTxn(tx);
ModelAndView mav=new ModelAndView("redirect:/doTransaction");
	return mav;
}




@PostMapping("edittxn")
@ResponseBody
public String edittx(@RequestParam String txid,String sendamount,String receiveamount,String servicefee,String totalamountindollar,String modeofpayment,String receiverfirstname,String receiverlastname,String receivergender,String 	mobileno,String receiverpurpose,String receiverrelation,String receivercitystate,String receiveraddress,String receiveridproof,String receiveridproofno,String collectionPointName,String collectionPointCode,String collectionPointBank,String collectionPointAddress,String collectionPointCity,String collectionPointState,String collectionPointTelephone,String collectionPin,String beneficiaryAccountTransfer,String bankDetails,String bank,String swiftCode,String iBAN,String branch,String BranchCity,String branchState,String telephone,String branchManager,String cardNumber,String beneficiaryAddress1,String beneficiaryAddress2,String beneficiaryAddress3,String beneficiaryCity,String beneficiaryPostCode,String beneficiaryIdType,String beneficiaryIdDetails,String deliveryNote,String utilityCompany,String customerAccountNumber,String invoiceNumber,String bankToPay,String iBan,String bankBicCode,String addressLine1,String addressLine2,String addressLine3,String city,String state,String postCode,String billDescription,String mobileTrnsferNumber,String transferNetWork,String transferNetWorkCreditType,String profitRate,String buyRate,String adminFee,String agentFee,String recagentFee, String gender) 
{
	System.out.println("this is edit txn===");
	TransactionInformation tx=txnService.findByTransactionId(txid);
	tx.setAdminFee(adminFee);
	tx.setAgentFee(agentFee);
	tx.setRecagentFee(recagentFee);
tx.setSendingAmount(Double.parseDouble(sendamount));
tx.setTaxFee(Double.parseDouble(servicefee));
tx.setProfitRate(profitRate);
tx.setBuyRate(buyRate);
tx.setTotalAmountCollected(Double.parseDouble(totalamountindollar));
txnService.confirmTxn(tx);
Beneficiary b=bservice.getBeneficiaryDetails(tx.getBeneficiary().getBeneficiaryId());
b.setFirstName(receiverfirstname);
b.setLastName(receiverlastname);
b.setMobileNumber(mobileno);
b.setGender(receivergender);
b.setAddressLine1(addressLine1);
b.setIdProofNo(receiveridproofno);
b.setAddressLine2(addressLine2);
b.setBeneficiaryCity(receivercitystate);
bservice.ConfirmBeneficiaryDetails(b);
	return "updated";
}






@RequestMapping(value= {"getCustomers"},method = RequestMethod.GET)
@ResponseBody
public  List<Customer>  getCustomers(HttpServletRequest request) {
	String s=request.getParameter("q");
	String branchId = sessionDataService.getBranchId(request.getSession());
List<Customer> subheadsearchlist=customerService.SearchCustomer(s, branchId)
;List<Customer> MIN_List=null;

Customer SUB;
for(int i=0; i < subheadsearchlist.size(); i++ ){
SUB=(Customer)subheadsearchlist.get(i);
 //out.println(SUB.getSubHeadId()+","+SUB.getSubHeadName()+","+SUB.getAccNo()+","+SUB.getMajorHead()+","+SUB.getMinorHead());
}
	return subheadsearchlist;
}
@PostMapping("custById")
@ResponseBody
public String custbyid(@RequestParam String subhead) {
	Customer c=customerService.findByCustomerId(subhead);
	if(c!=null) {
	String cu=c.getCustomerId()+"-"+"Name:"+c.getFirstName()+" "+c.getLastName()+" "+"EmailId:"+c.getEmailId()+" "+"MobileNumber:"+c.getMobileNumber()+" "+"Address:"+c.getAddress1()+" "+"City"+c.getCity()+" "+"StreetName:"+c.getStreetName()+" "+"BuildingName:"+c.getBuildingName()+" "+"Occupation:"+c.getOccupation()+" "+"CountryName:"+c.getCountry().getCountryName()+"IdType:"+c.getFirstIdProofType()+"IdNumber:"+c.getFirstIdNumber()+"IdExpiredDate:"+c.getFirstIdExpireDate();
	return cu;
	}else {
		return "0";
	}
	
}
@PostMapping("cById")
@ResponseBody
public String cbyid(@RequestParam String subhead) {
	Customer c=customerService.findByCustomerId(subhead);
	String risk=" ";
	if(c!=null) {
		String fnm=c.getFirstName();
		String lnm=c.getLastName();
		String fullname=c.getFirstName()+""+c.getLastName();
		System.out.println("fu;llname====="+fullname);
		List<SanctionSearch> sanctionSearchList=sanctionSearchService.getSanctionSearchResult(c.getFirstName(),c.getLastName());
			System.out.println("sanctionSearchList::::"+sanctionSearchList.size());
			Map<String, String> bcMap = new HashMap<String, String>();
			if(sanctionSearchList.size()>0) {
				for(int i=0;i<sanctionSearchList.size();i++) {
					SanctionSearch s=sanctionSearchList.get(i);	
					bcMap.put(s.getName(), s.getName());
					if(s.getName().equals(fullname)) {
							risk="100%";
						}else if(bcMap.containsKey(fullname)) {
							risk="88%";
						}else if(!bcMap.containsKey(fullname)&&bcMap.containsKey(fnm)||bcMap.containsKey(lnm)) {
							risk ="75%";
						}else {
							risk="55%";
						}
				}
			}
	return risk;
	}else {
		return risk;
	}
}

@PostMapping("benById")
@ResponseBody
public String benById(@RequestParam String bn) {
	Beneficiary c=bservice.getBeneficiaryDetails(bn);
	if(c!=null) {
	String cu=c.getBeneficiaryId()+"-"+"firstName:"+c.getFirstName()+" "+c.getLastName()+" "+"emailId:"+c.getEmailId()+" "+"MobileNumber:"+c.getMobileNumber()+" "+"Address:"+c.getAddressLine1()+" "+"City:"+c.getCity()+" "+"AddressLine2:"+c.getAddressLine2()+" "+"AddressLine3:"+c.getAddressLine3()+" "+"PaymentType:"+c.getAccType()+" "+"PostCode:"+c.getPostCode()+" "+"Country:"+c.getBeneficiaryCountry().getCountryISO()+"IdType:"+c.getIdProof()+"IdNumber:"+c.getIdProofNo();
	return cu;
	}else {
		return "0";
	}
	
}

@RequestMapping(value= {"getBen"},method = RequestMethod.GET)
@ResponseBody
public  List<Beneficiary>  getBen(HttpServletRequest request,@RequestParam String cid, String fname) {
	String s=request.getParameter("q");
	String branchId = sessionDataService.getBranchId(request.getSession());
List<Beneficiary> subheadsearchlist=bservice.getbySearch(fname, cid);
	return subheadsearchlist;
}

@RequestMapping("NewFile")
public ModelAndView NewFile() {
	ModelAndView mav=new ModelAndView("NewFile");
	return mav;
}
@RequestMapping(value = { "/benpro" }, method = { RequestMethod.GET })
public ModelAndView benpro(HttpServletRequest request) {
	ModelAndView mav = new ModelAndView();
	String branchId = sessionDataService.getBranchId(request.getSession());
		mav.setViewName("/benpro");
		//mav=new ModelAndView("redirect:benpro");
		String beneficiaryId = request.getParameter("beneficiaryId");
		String txId=request.getParameter("txId");
		System.out.println("beneficiaryId....." + beneficiaryId);
		Beneficiary beneficiary = bservice.getBeneficiaryDetails(beneficiaryId);
		System.out.println("list of beneficiary...." + beneficiary);
		Customer c = customerService.findByCustomerId(beneficiary.getCustomer().getCustomerId());
		String adminId = c.getAdmin().getAdminId();
		System.out.println("adminId....." + adminId);
		List<RealationShips1> relationshipList =realationShips1Service.RelationshipsListBasedOnAdmin(adminId);
		List<Branch> list = branchService.getAllReceiveingBranchesBasedOnAdmin(adminId);
		System.out.println("list of branches....." + list);
		List<Cash> clist=cashService.getListByAdmin(adminId);
		mav.addObject("clist", clist);
		mav.addObject("txId", txId);
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
	return mav;
}




@PostMapping("getDuplicateCustomer")
@ResponseBody
public String getDuplicateCustomer(@RequestParam String firstName,String lastName,String emailId,String dob,String address1,String mobileNumber) {
	String result="no";
	List<Customer> list=customerService.getDuplicateCustomer(firstName, lastName, dob, emailId, address1, mobileNumber);
	if(list.size()>0) {
		result="yes";
	}
		
	return result;
}
@PostMapping("getDuplicateBen")
@ResponseBody
public String getDuplicateBen(@RequestParam String firstName,String lastName,String mobileNumber,String addressLine1) {
	String result="no";
	List<Beneficiary> list=bservice.getDuplicateBeneficiary(firstName, lastName, mobileNumber, addressLine1);
	if(list.size()>0) {
		result="yes";
	}
		
	return result;
}

@RequestMapping("AgentsList")
public ModelAndView AgentsList(HttpServletRequest request){
	ModelAndView mav=new ModelAndView("agentsList");
	String adminId=sessionDataService.getAdminId(request.getSession());
	List<Branch> list=branchService.getAllBranchesBasedOnAdminId(adminId);
	mav.addObject("list", list);
	return mav;
}
	@RequestMapping("switchAgent")
	public ModelAndView switchAgent(HttpServletRequest request) {
		String branchId=request.getParameter("branchId");
		System.out.println("branchId======"+branchId);
		HttpSession session = request.getSession();
		sessionDataService.storeBranchId(session, branchId);
		Branch branch=branchService.getBranchBasedOnBranchId(branchId);
		String aid=(String) session.getAttribute("aid");
		AccessLog ac=accessLogService.AccessLogbyid(aid,branch.getAdmin().getAdminId(),branch.getAdmin().getAdminId());
		if(ac!=null) {
			String result="switch to"+" "+branchId;
			ac.setAcessResult(result);
			accessLogService.updateAccessLog(ac);
		}
		System.out.println("aid in switch agent===="+aid);
		session.setAttribute("branchid", branchId);
		session.setAttribute("branchId", branchId);
		session.setAttribute("branch", branch);
		session.setAttribute("role", "ROLE_BRANCH");
		session.setAttribute("switchAgent", "sa");
		session.setAttribute("adminId", branch.getAdmin().getAdminId());
		session.setAttribute("branchFunctionality", branch.getFunctionality());
		List<ReasonForTransfer> pcodes=reasonForTransferService.findByAdmin(branch.getAdmin().getAdminId());
		List<RealationShips1> rcodes=realationShips1Service.RelationshipsListBasedOnAdmin(branch.getAdmin().getAdminId());
		List<SourceOfFunds1> fundcodes = sourceOfFundsService.SourceOfFundsListBasedOnAdmin(branch.getAdmin().getAdminId());
		 List<ModeOfPaymentFees> moplist=modeOfPaymentsService.getModeOfPaymentFeeBasedOnBranchIdAndDisplay(branchId, "frontend");
		 double totalDeposits=0;
		 double totalAmounttopay=0;
		 double totalAgentfee=0;
		 double total=0;
		 List<AgentDeposit> ad=adp.getByBranch(branchId,"approved");
		 for(int i=0;i<ad.size();i++) {
			 AgentDeposit a=ad.get(i);
			 totalDeposits=totalDeposits+Double.parseDouble(a.getDepositAmount()); 
		 }
		 List<TransactionInformation> tl=txnService.getByFromBranch(branchId);
		 System.out.println("tl====="+tl.size());
		 for(int i=0;i<tl.size();i++) {
			 TransactionInformation t=tl.get(i);
			 totalAgentfee=totalAgentfee+Double.parseDouble(t.getAgentFee()); 
			 total=total+t.getTotalAmountCollected();
		 }
		 totalAmounttopay= total-totalAgentfee;
		 totalDeposits=totalDeposits-totalAmounttopay;
			ModelAndView modelAndView=new ModelAndView();
			 List<Branch> list=branchService.getAll();
				List<SenderIds> ids=senderIdTypeService.findByBranchAndAdminAndFunctionality(branch.getBranchId(), branch.getAdmin().getAdminId(), "receiving");
				List<States> states=statesService.getAllStatesByCountryIso(branch.getFromCountry().getCountryISO());
				modelAndView.addObject("states", states);		
				modelAndView.addObject("branch", branch);
				modelAndView.addObject("countryISo", branch.getFromCountry().getCountryISO());
				modelAndView.addObject("ids", ids);

			 String functionality=branch.getFunctionality();
			 if(functionality.equals("sending")||functionality.equals("both"))
			 {
		 modelAndView.addObject("moplist", moplist);
	modelAndView.addObject("countryIso", branch.getFromCountry().getCountryISO());
	 modelAndView.addObject("list", list);
	 modelAndView.addObject("countryName", branch.getFromCountry().getCountryName());
	 modelAndView.addObject("functionality",branch.getFunctionality());
	 modelAndView.addObject("branchid", branchId);
	 modelAndView.addObject("totalDeposits", totalDeposits);
	 modelAndView.addObject("totalAmounttopay", totalAmounttopay);
	 modelAndView.addObject("branchDetails", branch);
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

	@RequestMapping("makeDefault")
	public ModelAndView makeDefault(HttpServletRequest request) {
		String branchId=request.getParameter("branchId");
		Branch branch=branchService.getBranchBasedOnBranchId(branchId);
		System.out.println("branch==="+branch);
		String functionality=branch.getFunctionality();
		String iso=branch.getFromCountry().getCountryISO();
		Branch b =branchService.getbyfunctionalityandisoanddefaultflag(functionality, iso, "default",branch.getAdmin().getAdminId());
		if(b!=null) {
		b.setDefaultFlag("normal");
		branchService.updateBranchDetails(b);
		}

		branch.setDefaultFlag("default");
		branchService.updateBranchDetails(branch);
		ModelAndView mav=new ModelAndView("redirect:AgentsList");
		return mav;
	}
	@RequestMapping("senddashboard")
	public ModelAndView brdashboard(HttpServletRequest request) {
	
		String branchId=sessionDataService.getBranchId(request.getSession());
		int success=txnService.getbystatus("funds received", branchId);
		int cancel=txnService.getbystatus("cancelled", branchId);
		int pending=txnService.getbystatus("pending", branchId);
		int process=txnService.getbystatus("processing", branchId);
	System.out.println("pending===="+pending);
	System.out.println("cancel==="+cancel);
		//double credit=txnService.getsomebystatus("funds received", branchId);
		List<TransactionInformation> list=txnService.getByFromBranch(branchId);
		Branch b=branchService.getBranchBasedOnBranchId(branchId);
		List<Branch> rlist=branchService.getAllBranchesBasedOnFunctionalityAndAdminIdwithoutFlag(b.getAdmin().getAdminId(), "sending");
		System.out.println("rlist======"+rlist);
		 double totalDeposits=0;
		 double totalAmounttopay=0;
		 double totalAgentfee=0;
		 double total=0;
		 List<AgentDeposit> ad=adp.getByBranch(branchId,"approved");
		 for(int i=0;i<ad.size();i++) {
			 AgentDeposit a=ad.get(i);
			 totalDeposits=totalDeposits+Double.parseDouble(a.getDepositAmount()); 
		 }
		 List<TransactionInformation> tl=txnService.getByFromBranch(branchId);
		 System.out.println("tl====="+tl.size());
		 for(int i=0;i<tl.size();i++) {
			 TransactionInformation t=tl.get(i);
			 totalAgentfee=totalAgentfee+Double.parseDouble(t.getAgentFee()); 
			 total=total+t.getTotalAmountCollected();
		 }
		 totalAmounttopay= total-totalAgentfee;
		 totalDeposits=totalDeposits-totalAmounttopay;

		ModelAndView mav=new ModelAndView("senddashboard");
		mav.addObject("success", success);
		mav.addObject("cancel", cancel);
		mav.addObject("pending", pending);
		mav.addObject("enter", list.size());
		mav.addObject("b", b);
		mav.addObject("credit", totalDeposits);
		mav.addObject("branchId", branchId);
		mav.addObject("rlist", rlist);
		 
		return mav;
	}
	@PostMapping("ratesBasedOnFromCountryAndToCountry")
	@ResponseBody
	public List<AdminSellRates> ratesBasedOnFromCountryAndToCountry(@RequestParam String fromBranch,String toBranch){
Branch b=branchService.getBranchBasedOnBranchId(fromBranch);
	List<AdminSellRates>  list=currencyRateService.getAllAdminSellRateBasedOnFromBranchAndToBranchRateType(b.getAdmin().getAdminId(), fromBranch, toBranch, "selling");	
	return	list;
	}
@PostMapping("commisionslabs")	
@ResponseBody
public List<ServiceFees> commisionslabs(@RequestParam String fromBranch,String toBranch){
List<ServiceFees> list= feeService.getbyfromtobranchhes(fromBranch, toBranch);
System.out.println("list====="+list);
return list;
}
@PostMapping("getStatesBasedOnBranch")
@ResponseBody
public List<States> getStatesBasedOnBranch(@RequestParam String branchId)
{
	Branch b=branchService.getBranchBasedOnBranchId(branchId);
	List<States> list=statesService.getAllStatesByCountryIso(b.getFromCountry().getCountryISO());
	return list;
	
}
@GetMapping("getcollectionpointbystate")
@ResponseBody
public List<Cash> getcollectionpointbystate(@RequestParam String stateid,HttpServletRequest request){
	String branchId=sessionDataService.getBranchId(request.getSession());
	Branch b=branchService.getBranchBasedOnBranchId(branchId);
	List<Cash> list=cashService.getcashpickupbasedonstate(b.getAdmin().getAdminId(), stateid);
System.out.println("lisy======"+list.size());
	return list;
}

@GetMapping("getcashpickupbasedonname")
@ResponseBody
public List<Cash> getcashpickupbasedonname(@RequestParam String name,HttpServletRequest request){
	String branchId=sessionDataService.getBranchId(request.getSession());
	Branch b=branchService.getBranchBasedOnBranchId(branchId);

	List<Cash> list=cashService.getcashpickupbypickupfrom(b.getAdmin().getAdminId(), name);
	System.out.println("list=="+list.size());
	return list;
			}

}	