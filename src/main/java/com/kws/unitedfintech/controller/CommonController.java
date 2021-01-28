package com.kws.unitedfintech.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.kws.unitedfintech.entities.Admin;
import com.kws.unitedfintech.entities.AdminSellRates;
import com.kws.unitedfintech.entities.AuditTrail;
import com.kws.unitedfintech.entities.BankIssuerCode;
import com.kws.unitedfintech.entities.Banks;
import com.kws.unitedfintech.entities.Beneficiary;
import com.kws.unitedfintech.entities.Branch;
import com.kws.unitedfintech.entities.BranchPaymentTypeDetails;
import com.kws.unitedfintech.entities.Cash;
import com.kws.unitedfintech.entities.Country;
import com.kws.unitedfintech.entities.Customer;
import com.kws.unitedfintech.entities.ModeOfPaymentFees;
import com.kws.unitedfintech.entities.ModeOfPayments;
import com.kws.unitedfintech.entities.NationalIdTypes;
import com.kws.unitedfintech.entities.RevenuePercentage;
import com.kws.unitedfintech.entities.SenderIds;
import com.kws.unitedfintech.entities.ServiceFees;
import com.kws.unitedfintech.entities.States;
import com.kws.unitedfintech.entities.TransactionInformation;
import com.kws.unitedfintech.entities.Zone;
import com.kws.unitedfintech.service.AdminService;
import com.kws.unitedfintech.service.AuditTrailService;
import com.kws.unitedfintech.service.BankService;
import com.kws.unitedfintech.service.BeneficiaryService;
import com.kws.unitedfintech.service.BranchPaymentTypeDetailsService;
import com.kws.unitedfintech.service.BranchService;
import com.kws.unitedfintech.service.CountryService;
import com.kws.unitedfintech.service.CountryZonService;
import com.kws.unitedfintech.service.CurrencyRateService;
import com.kws.unitedfintech.service.CustomerService;
import com.kws.unitedfintech.service.FeeService;
import com.kws.unitedfintech.service.IssuerCodeService;
import com.kws.unitedfintech.service.ModeOfPaymentFeeService;
import com.kws.unitedfintech.service.ModeOfPaymentsService;
import com.kws.unitedfintech.service.NationalIdService;
import com.kws.unitedfintech.service.NewUserService;
import com.kws.unitedfintech.service.RevenuePercentageService;
import com.kws.unitedfintech.service.SenderIdTypeService;
import com.kws.unitedfintech.service.SessionDataService;
import com.kws.unitedfintech.service.TransactionInformationService;
import com.kws.unitedfintech.service.UserService;
import com.kws.unitedfintech.service.cashService;


 @RestController 
@RequestMapping("common/")
public class CommonController {
	 @Autowired
	 private RevenuePercentageService rps;
	 
	 
	 @Autowired
	 private AuditTrailService auditTrailService;
	 @Autowired
	 private NationalIdService nis;
	 
	 @Autowired
	 private SenderIdTypeService senderIdTypeService;
	 
  @Autowired
	private ModeOfPaymentFeeService mopfService;
@Autowired
private UserService userService;
	@Autowired
	private CountryService countryService;
	@Autowired
	BeneficiaryService bservice;
	@Autowired
	private CustomerService customerService;
	@Autowired
	private cashService cashService;
	@Autowired
	private BankService bankService;
	@Autowired
	private NewUserService newUserService;
	@Autowired
	private IssuerCodeService issuerCodeService;
	@Autowired
	private CountryZonService zoneService;
	@Autowired
	private BranchService branchService;
	@Autowired
	private ModeOfPaymentsService modeOfPaymentsService;
	@Autowired
	private CurrencyRateService currencyRateService;
	@Autowired
	private TransactionInformationService txnService;
	@Autowired
	private FeeService feeService; 
	@Autowired
	private CountryZonService countryZoneService;
	@Autowired
	private BranchPaymentTypeDetailsService branchPaymentTypeDetailsService;
	@Autowired
	private SessionDataService sessionDataService;
	@Autowired
	private AdminService adminService;
	
	@GetMapping("getallcountrys")
	public @ResponseBody List<Country> getAllCountries() {
		System.out.println("hi its working from controller");
		return countryService.getAllCountries();
	}
	
	
	
	@PostMapping("getallcountrysBasedOnAdmin")
	public @ResponseBody List<Branch> getAllCountriesBasedOnAdmin(@RequestParam String adminId) {
		Admin admin=adminService.getAdminDetailsBasedOnAdminId(adminId);
		
		System.out.println("hi its working from controller");
		return branchService.getAllBranchesBasedOnAdminId(adminId);
	}
	

	
	@GetMapping("getTimeZones")
	@ResponseBody
	public List<Zone> getTimeZones(@RequestParam String iso) {
		System.out.println("iso======"+iso);
		return zoneService.getTimeZonesBasedOnCountry(iso);
	}

	@PostMapping("checkEmail")
	public String getAgentByAdmin(HttpServletRequest request, @RequestParam String emailId) {
		return branchService.getBranchListBasedOnEmailId(emailId);
	}
	@GetMapping(value="getBranchBasedOnCountryISOAndAdminId")
	public String getBranchBasedOnCountryISOAndAdminId(@RequestParam String countryISO,@RequestParam String adminId) {
		return branchService.getBranchBasedOnCountryISOAndAdminId(countryISO, adminId);
	}
	@GetMapping("duplicatereceivebranch")
	@ResponseBody
	public String getBranchBasedOnCountryISOAndAdminIdAndfunctionality(@RequestParam String countryISO,@RequestParam String adminId,String functionality) {
		System.out.println("common controller");
		List<Branch> list= branchService.getBranchBasedOnCountryISOAndAdminIdAndFunctionality(countryISO, adminId,"sending");
	System.out.println("list======"+list.size());
		String result="";
	if(list.size()>0) {
	result="existed";	
	}else {
		result="not existed";
	}
	return result;
	}
	@GetMapping("getAllBranchesBasedOnFunctionalityAndAdminId")
	public List<Branch> getAllBranchesBasedOnFunctionalityAndAdminId(@RequestParam String adminId,@RequestParam String functionality){
		return branchService.getBranchesBasedOnFunctionalityAndAdminId(adminId, functionality);
	}
	@GetMapping("getAllBranchesBasedOnFunctionalityAndAdminIdBackend")
	public List<Branch> getAllBranchesBasedOnFunctionalityAndAdminIdBackend(@RequestParam String adminId,@RequestParam String functionality){
		return branchService.getBranchesBasedOnFunctionalityAndAdminIdbackend(adminId, functionality);
	}
	
	@GetMapping("getAllBranchesBasedOnFunctionalityAndExceptGivenBranchAndAdminId")
	public List<Branch> getAllBranchesBasedOnFunctionalityAndExceptGivenBranchAndAdminId(@RequestParam String adminId,@RequestParam String functionality,@RequestParam String givenBranch){
		return branchService.getBranchesBasedOnFunctionalityAndExceptGivenBranchAndAdminId(adminId, functionality, givenBranch);
	}
	@GetMapping("getmodeofpaymentlist")
	public List<ModeOfPayments> getModeOfPaymentList() {
		return modeOfPaymentsService.getAllModeOfPaymets();
	}
	@GetMapping("getmodeofpaymentsbasedonbranchidandmodeofpaymentid")
	public List<ModeOfPaymentFees> getModeOfPaymentsBasedOnBranchIdAndModeofPaymentId(@RequestParam String branchId,@RequestParam String modeOfPaymentId) {
		return modeOfPaymentsService.getModeOfPaymentFeeBasedOnBranchIdAndModeOfPayments(branchId, modeOfPaymentId);
	}
	@GetMapping("getmodeofpaymentsbasedonbranchidandmodeofpayment")
	public ModeOfPaymentFees getModeOfPaymentsBasedOnBranchIdAndModeofPayment(@RequestParam String branchId,@RequestParam String modeOfPayment) {
		return	modeOfPaymentsService.getModeOfPaymentFeeBasedOnBranchIdAndModeOfPayment(branchId, modeOfPayment);
		/*
		 * modeOfPaymentsService.getModeOfPaymentFeeBasedOnBranchIdAndModeOfPayment(
		 * branchId, modeOfPaymentId);
		 */
	}
	@GetMapping("getmodeofpaymentlistbasedonbranchid1")
	public List<ModeOfPaymentFees> getModeOfPaymentsBasedOnBranchIdAndModeofPaymentId(@RequestParam String branchId) {
		return modeOfPaymentsService.getModeOfPaymentFeeBasedOnBranchId(branchId);
	}
	@GetMapping("getmodeofpaymentofspecificBranch")
	
	public String getModeOfPaymentOfSpecificBranch(@RequestParam String branchId)
	{
		
		Branch branch= branchService.getBranchBasedOnBranchId(branchId);
		String mop=branch.getModeOfPayment();
	return mop;
	}
	@GetMapping("getBuyRates")
	@ResponseBody
	public double getBuyRates(@RequestParam String fromBranchId,@RequestParam String toBranchId,String p,String rateFlag) {
		System.out.println("from branch form cont:"+fromBranchId+","+toBranchId+","+p+","+rateFlag);
		return currencyRateService.getCurrencyRateBasedOnFromBranchAndToBranch(fromBranchId, toBranchId,p,rateFlag);
		}
	@GetMapping("getCurrencyRate")
	@ResponseBody
	public double getCurrencyRateBasedOnFromBranchAndToBranchId(@RequestParam String fromBranchId,@RequestParam String toBranchId,String p,String rateFlag) {
		System.out.println("getCurrencyRate...controller.."+p);
		System.out.println("from branch form cont:"+fromBranchId+","+toBranchId+","+p+","+rateFlag);
		String replacedString=p.replace("?"," ").replace("�", " ");
		double value= currencyRateService.getCurrencyRateBasedOnFromBranchAndToBranch(fromBranchId, toBranchId,replacedString,rateFlag);
	System.out.println("value======"+value);
		return value;	
	}

	
	@GetMapping("getAdminSellRateBasedOnpaymentType")
	public AdminSellRates getAdminSellRateBasedOnFromBranchAndToBranchId(@RequestParam String fromBranchId,@RequestParam String toBranchId, String p,String rateFlag) {
		System.out.println("from branch form cont:"+fromBranchId+","+toBranchId);
		String replacedString=p.replace("?"," ").replace("�", " ");

		AdminSellRates sellrate= currencyRateService.getCurrencyRateBasedOnFromBranchAndToBranchPtype(fromBranchId, toBranchId,replacedString,rateFlag);
		/* admin sellrate changed to getAdminSellRateBasedOnpaymentType *used in underemit* */
System.out.println("sellrate==="+sellrate);		
	return sellrate;
	}
	@GetMapping("getAdminSellRate")
	public AdminSellRates getAdminSellRateBasedOnFromBranchAndToBranchId(@RequestParam String adminId,@RequestParam String fromBranchId,@RequestParam String toBranchId) {
		System.out.println("from branch form cont:"+fromBranchId+","+toBranchId);
		AdminSellRates sellrate= currencyRateService.getAllAdminSellRateBasedOnFromBranchAndToBranch(adminId,fromBranchId, toBranchId);
		/*
		 * for(AdminSellRates rate:sellrate) {
		 * 
		 * selrate=rate.getSellRate(); }
		 */
	return sellrate;
	}
	@GetMapping("getServieFez")
	public  List<ServiceFees> getAllServiceFeeBasedOnFromBranchAndToBranchIdz(@RequestParam String fromBranchId,@RequestParam String toBranchId,String p){
		System.out.println("fee is  = ="+feeService.getListOfServiceFeeBasedOnFromBranchAndToBranchId(fromBranchId, toBranchId,p));
		String replacedString=p.replace("?"," ").replace("�", " ");
		return feeService.getListOfServiceFeeBasedOnFromBranchAndToBranchId(fromBranchId, toBranchId,replacedString);
	}

	@GetMapping("getServieFee")
	public  List<ServiceFees> getAllServiceFeeBasedOnFromBranchAndToBranchId(@RequestParam String fromBranchId,@RequestParam String toBranchId,String paymentType){
		System.out.println("fee is  = ="+feeService.getListOfServiceFeeBasedOnFromBranchAndToBranchId(fromBranchId, toBranchId,paymentType));
		System.out.println("paymentType===="+paymentType);
		String replacedString=paymentType.replace("?"," ").replace("�", " ");
		return feeService.getListOfServiceFeeBasedOnFromBranchAndToBranchId(fromBranchId, toBranchId,replacedString);
	}
	@GetMapping("getbranchpaymenttypedetailsbasedonbranchidandstatus")
	public List<BranchPaymentTypeDetails> getBranchPaymentTypeDetailsBasedOnBranchIdAndStatus(@RequestParam String branchId,@RequestParam String status){
		return branchPaymentTypeDetailsService.getBranchPaymentTypeDetailsBasedOnBranchIdAndStatus(branchId, status);
	}
	@GetMapping("getStatesBasedOnCountry")
	public List<States> getStatesBasedOnCountry(@RequestParam String countryISO){
		return countryZoneService.findAllBycountryISO(countryISO);
	}
	
	@RequestMapping("/getBanksBasedOnCountry")
	public List<BankIssuerCode> getBanksBasedOnCountry(@RequestParam String countryISO){
		List<BankIssuerCode> banks=issuerCodeService.getBankIssuerCodeList(countryISO);
		return banks;
	}
	
	@PostMapping("checkEmailId")
	public String getCustomer(HttpServletRequest request, @RequestParam String emailId) {
		return customerService.getCustomerListBasedOnEmailId(emailId);
	}
	@GetMapping("VerifyCustomerLoginDetails")
	public Customer getCustomer(HttpServletRequest request, @RequestParam String emailId,String password) {
		System.out.println("before validating:"+emailId+","+password);
		return customerService.validateCustomer(emailId,password);
	}
	
	@PostMapping("checkUsermailid")
	public String getNewUser(HttpServletRequest request, @RequestParam String emailId) {
		return newUserService.getUserListbasedonEmail(emailId);
	}
	@PostMapping("CheckUsersEmail")
	public String getUsers(HttpServletRequest request, @RequestParam String emailId) {
		return userService.getUserListBasedOnEmailId(emailId);
	}	
	@PostMapping("getSpecificCustomerDetails")
	public Customer getSpecificCustomer(@RequestParam String customerid)
	{
		
		Customer c=customerService.findByCustomerId(customerid);
		return c;
	}
	@PostMapping("getCashPickupByCashId")
	public  Cash getCashPickupByCashId(@RequestParam String cashId)
	{
		Cash c=cashService.cashpickupById(cashId);
		System.out.println("c===="+c);
		return c;
	}

@PostMapping("getBenificeriesOfSpecificCustomer")
public List<Beneficiary> getBeneficiariesBasedOnCustomerId(@RequestParam String adminid,@RequestParam String customerid,@RequestParam String ptype)
{
 List<Beneficiary> list=bservice.getBeneficiariesBasedOnCustomerId(adminid, customerid, ptype);
System.out.println("list of beneifi:"+list);
 return list;
} 
@PostMapping("getModeofpaymentfee")
public double getModeofPaymentFee(@RequestParam String adminid,@RequestParam String bid,@RequestParam String mop)
{ double i=0;
ModeOfPaymentFees fees=modeOfPaymentsService.getModeOfPaymentFeeBasedOnBranchIdAndModeOfPayment(bid, mop);
 i=fees.getFee();
return i;
		
} 
@RequestMapping("/searchCustomerForTransaction")
	public List<Customer> getAllBranchCustomer(HttpServletRequest request)
	{HttpSession session = request.getSession(false);
		Customer c=new Customer();
		Branch branch=(Branch)session.getAttribute("branch");
		c.setMobileNumber(request.getParameter("mobileNumber"));
		c.setFirstName(request.getParameter("firstName"));
		c.setLastName(request.getParameter("lastName"));
		c.setDob(request.getParameter("dob"));
		c.setEmailId(request.getParameter("emailId"));
		c.setFirstIdNumber(request.getParameter("firstIdNumber"));
		c.setAddress1(request.getParameter("address"));
		c.setPostalCode(request.getParameter("postalCode"));
		c.setCityOrState(request.getParameter("cityOrState"));
		
		List<Customer>list=customerService.getAllCustomerByBranchId(c, branch.getBranchId());
		
		return list;
		
	}
	@GetMapping("getAllAdminSpecificBranchServiceFee")
	public  List<ServiceFees> getAllAdminSpecificServiceFeeBasedOnFromBranchAndToBranchId(@RequestParam String fromBranchId,@RequestParam String toBranchId,@RequestParam String adminid,String p){
		System.out.println("fee is  = ="+feeService.getListOfServiceFeeBasedOnFromBranchAndToBranchId(fromBranchId, toBranchId,adminid,p));
		return feeService.getListOfServiceFeeBasedOnFromBranchAndToBranchId(fromBranchId, toBranchId,adminid,p);
	}
	@GetMapping("getServiceFee")
	public  double getSpecificServiceFeeBasedOnFromBranchAndToBranchId(@RequestParam String fromBranchId,@RequestParam String toBranchId,@RequestParam String amount,String paymentType){
	System.out.println("fromBranchId"+fromBranchId+"toBranchId"+toBranchId+"amount"+amount+"p="+paymentType);
		double o=0;
		ServiceFees sf=feeService.getSpecificServiceFeeBasedOnFromBranchAndToBranchId(fromBranchId, toBranchId,amount,paymentType);
		System.out.println("value in commo:"+sf.getServiceFee());
		String rateType=sf.getRateType();
		o=sf.getServiceFee(); 
		System.out.println("servicefee rateType==="+rateType);
		 if(rateType.equals("percentage")) {
			long amount1=Long.parseLong(amount);
			  o=(int) ((amount1*o)/100);
			 System.out.println("servicefee in percentage===="+o);
		 }else {
			 o=sf.getServiceFee();
			 System.out.println("servicefee in flatfee=="+o);
		 }

		return o;
	}
	@PostMapping("getCashCenters")
	public List<Cash>getCashCenters(@RequestParam String country,@RequestParam String ptype,@RequestParam String adminid)
	{
		System.out.println("adminid:"+adminid+"country:"+country);
		Branch c=branchService.getBranchBasedOnBranchId(country);
		List<Cash> l=cashService.getCashListBasedonAdminAndCountryIso(adminid, c.getFromCountry().getCountryISO());
		return l;
		
	}
	@PostMapping("getBanksOfAdmin")
	public List<Banks>getBankCenters(@RequestParam String country,@RequestParam String ptype,@RequestParam String adminid)
	{
		Branch c=branchService.getBranchBasedOnBranchId(country);
		List<Banks> l=bankService.getBanksList(c.getFromCountry().getCountryISO());
		return l;
		
	}

	@RequestMapping("getRecBranchTxnListBasedOnFromToDate")
	public List<TransactionInformation> getRecBranchTxnListBasedOnFromToDate(@RequestParam String fromdate,String todate,HttpServletRequest request)
	{
	HttpSession session=request.getSession();
	Branch branch=(Branch)session.getAttribute("branch");
	String adminid=branch.getAdmin().getAdminId();
	List<TransactionInformation> l=txnService.getAllReceivingBranchTransactions(adminid, branch.getBranchId(), fromdate, todate);
		return l;
	}
	  @PostMapping("changeReceivingTransactionStatus")
	  public @ResponseBody String changeTransactionStatus(@RequestParam String transactionstatus,String txnid)
	  {String message="";
		  Object[] txinfo= {};
	/*
	 * ModelAndView mav=new ModelAndView(); String
	 * adminId=sessionDataService.getAdminId(request.getSession());
	 * List<TransactionInformation>list=adminService.getTransactionDetailsByAdmin(
	 * adminId,fromdate,todate); System.out.println("list in admin:"+list.size());
	 * txinfo[0]=list; txinfo[1]=fromdate; txinfo[2]=todate;
	 */
			boolean flag=adminService.updateTransactionStatus(transactionstatus,txnid);
		  if(flag==true)
			  message="success";
		  else
			  message="failed";
		  return message;
		  
	  }
	  @GetMapping("getAllRecBranchesBasedOnFunctionalityAndAdminId")
		public List<Branch> getAllRecBranchesBasedOnFunctionalityAndAdminId(@RequestParam String adminId,@RequestParam String functionality){
			System.out.println("adminId===="+adminId);
			System.out.println("functionality====="+functionality);
		  List<Branch> list= branchService.getRecBranchesBasedOnFunctionalityAndAdminId(adminId, functionality);
		return list;
	  }
		
		
		@GetMapping("getAdminDetails")
		public Admin getAdminDetails(@RequestParam String adminId) {
			return adminService.getAdminDetailsBasedOnAdminId(adminId);
		}
		@GetMapping("getmodeofpaymentlistbasedonadminid")
		public List<ModeOfPaymentFees> getModeOfPaymentsBasedOnAdminId(@RequestParam String adminId) {
			return modeOfPaymentsService.getModeOfPaymentFeeBasedOnBranchId(adminId);
		}
		@GetMapping("getSpecificAdminMopByadminid")
		public String getSpecificAdminMopByadminid(@RequestParam String adminId) {
			 
					Admin admin=adminService.getAdminDetailsBasedOnAdminId(adminId);
					String pt=admin.getModeOfPayments();
					String parray[]=pt.split(",");
					String obj="";
					String keyValue="";
					String orignal= "";
					String objs="";
					System.out.println("parray:"+parray.length);
					for(int i=0;i<parray.length;i++)
					{
						keyValue = parray[i].split("-")[1];
					    obj=obj+keyValue+",";
					}
		/*
		 * for(int i=0;i<keyValue.length-1;i++) { orignal= keyValue[i].split(",")[1];
		 * objs=objs+orignal; }
		 */
					return obj;
		}
		
		@GetMapping(value="getsAdminBranchSellrate")
			public double getsAdminBranchSellrateBasedOnIso(@RequestParam String adminId, String fromcountryiso, String tocountryiso) {
		double rate=0.0;
			/*
		 * System.out.println(" common controller=adminid:"+adminId+"fromiso:"+fromiso+
		 * "toiso:"+toiso);
		 */System.out.println("fromcountrycurrency:"+fromcountryiso+"tocountrycurrency:"+tocountryiso);
		/*
		 * String
		 * frombranchid=branchService.getBranchDetailsBasedOnCountryISOAndAdminId(
		 * fromcountryiso, adminId); String
		 * tobranchid=branchService.getBranchDetailsBasedOnCountryISOAndAdminId(
		 * tocountryiso, adminId);
		 * System.out.println("frombranchid:"+frombranchid+"tobranchid:"+tobranchid);
		 * if(frombranchid.length()==0||tobranchid.length()==0) { rate=0.0;
		 * 
		 * } if(frombranchid==" " || tobranchid==" ") { rate=0.0; } else
		 * if(frombranchid==null || tobranchid==null) {
		 * 
		 * rate=0.0; } else if(frombranchid.equals("")||tobranchid.equals("")) {
		 * rate=0.0; } else if(frombranchid.equals(null)||tobranchid.equals(null)) {
		 * rate=0.0; } else { System.out.println("executing else part"); rate=
		 * adminService.getAdminSellRateBasedOnFromToadminid(adminId, frombranchid,
		 * tobranchid); } */return rate;
		 
			}

	  
	  @RequestMapping("getsBranchIdBasedOnIsoAdmin")
	  public String  getsBranchIdBasedOnIsoAdmin(@RequestParam String adminId,String iso)
	  {
		 // String frombranchid=branchService.getBranchDetailsBasedOnCountryISOAndAdminId(iso, adminId);
		  
		 // return frombranchid;
		  return null;
	  }
	
	  @RequestMapping("getsModeOfPaymentByAdminBranchId")
	  public String  getsModeOfPaymentByAdminBranchId(@RequestParam String adminId,String branchid)
	  {
		  Map<String ,Double> feelist=new HashMap();
		/*
		 * List<ModeOfPaymentFees>
		 * mop=modeOfPaymentsService.getModeOfPaymentFeesBasedOnBranchAdminId(adminId,
		 * branchid); for(ModeOfPaymentFees fees:mop) {
		 * 
		 * feelist.put(fees.getModeOfPaymentId().getModeOfPayment(),fees.getFee());
		 * 
		 * } System.out.println("listoffees:"+feelist.toString());
		 */
		  Entry<String, Double> min = null;
		  for (Entry<String, Double> entry : feelist.entrySet()) {
		      if (min == null || min.getValue() > entry.getValue()) {
		          min = entry;
		      }
		  } 
		  System.out.println("mop:"+min.getKey());
		  return min.getKey();
	  } 
	  
	  @RequestMapping("getBranchDetailsBasedOnId")
	  public Branch getBranchDetailsBasedOnId(@RequestParam String branchid)
	  {
		 return  branchService.getBranchBasedOnBranchId(branchid);  
		  
	  }
	  
	  
	  
	  
	  
	  
		
		
		@GetMapping("getmodeofpaymentlistbasedonbranchid")
		@ResponseBody
		public List<ModeOfPaymentFees> getModeOfPaymentsBasedOnBranchIdAndModeofPaymentIds(@RequestParam String branchId, @RequestParam String  Amount,@RequestParam String display) {
	System.out.println("amount before convert===="+Amount);
		  Double amt=Double.parseDouble(Amount);
		/*
		 * String amount=Math.round(amt)+""; System.out.println("amount==="+amount);
		 */		 
			System.out.println("display===="+display);
			System.out.println("sendingAmount===="+amt);
			List<ModeOfPaymentFees> mopList=	modeOfPaymentsService.getList(branchId, display,amt);
				System.out.println("moplist==="+mopList);
return mopList;
			//System.out.println("mop is"+modeOfPaymentsService.getModeOfPaymentFeeBasedOnBranchIdAndDisplay(branchId, "backend"));
			//return modeOfPaymentsService.getModeOfPaymentFeeBasedOnBranchIdAndDisplay(branchId, "backend");
			
		}


	@GetMapping("getMop")
	public double getMopFee(@RequestParam String adminid,@RequestParam String bid,@RequestParam String mop,@RequestParam String Amount)
	{ double i=0;
	double fee=0;
	ModeOfPaymentFees fees=modeOfPaymentsService.getModeOfPaymentFeeBasedOnBranchIdAndModeOfPaymentAndAmount(bid, mop,Amount);
	 i=fees.getFee();
	 System.out.println("i==="+i);
	 String rateType=fees.getRateType();
	 System.out.println("rateType==="+rateType);
	 if(rateType.equals("percentage")) {
		long amount=Long.parseLong(Amount);
		  fee=(amount*i)/100;
		 System.out.println("fee in percentage===="+fee);
	 }else {
		 fee=i;
		 System.out.println("fee in flatfee=="+fee);
	 }
	return fee;
			
	}





	@GetMapping("saveModeOfPaymentLimits")
			  public ModelAndView saveModeOfPaymentLimitations(HttpServletRequest request) {
				  ModelAndView mav=new ModelAndView("modeofpayments");
				  long minvalue=Long.parseLong(request.getParameter("min"));
				  System.out.println("minvalue==="+minvalue);
				  long maxvalue=Long.parseLong(request.getParameter("max"));
				  System.out.println("maxvalue==="+maxvalue);
				  double feevalue=Double.parseDouble(request.getParameter("fee"));
				  System.out.println("feevalue==="+feevalue);
				  String mopid=request.getParameter("mopid");
				  System.out.println("mopid====="+mopid);
				  ModeOfPayments mop=modeOfPaymentsService.getModeofPaymentIdBasedOnModeOfPayment(mopid);
				  Admin admin=adminService.getAdminDetailsBasedOnAdminId(request.getParameter("adminid"));
				 Branch branch=branchService.getBranchBasedOnBranchId(request.getParameter("branchid"));
				 ModeOfPaymentFees mopfeelimit=new ModeOfPaymentFees();
				 mopfeelimit.setAdmin(admin);
				 mopfeelimit.setBranchId(branch);
				 mopfeelimit.setModeOfPaymentId(mop);
				 mopfeelimit.setMinValue(minvalue);
				 mopfeelimit.setMaxValue(maxvalue);
				 mopfeelimit.setFee(feevalue);
				 mopfeelimit.setStatus("active");
				 mopfeelimit.setRateType(request.getParameter("ratetype"));
		mopfService.saveModeOfPaymentLimitation(mopfeelimit);
				 return mav;
				  
			  }

		  @GetMapping("saveModeOfPaymentLimitation")
		  public String saveModeOfPaymentLimitation(@RequestParam String min,String max, String fee,String adminid,String branchid,String mopid,String ratetype,String dismode, String myIp)
		  {
			  System.out.println("save=-==="+min);
			  double minvalue=Double.parseDouble(min);
			  System.out.println("minvalue==="+minvalue);
			  double maxvalue=Double.parseDouble(max);
			  System.out.println("maxvalue==="+maxvalue);
			  double feevalue=Double.parseDouble(fee);
			  System.out.println("feevalue==="+feevalue);
			  System.out.println("mopid====="+mopid);
			  ModeOfPayments mop=modeOfPaymentsService.getModeofPaymentIdBasedOnModeOfPayment(mopid);
			  Admin admin=adminService.getAdminDetailsBasedOnAdminId(adminid);
			 Branch branch=branchService.getBranchBasedOnBranchId(branchid);
			 ModeOfPaymentFees mopfeelimit=new ModeOfPaymentFees();
			 mopfeelimit.setAdmin(admin);
			 mopfeelimit.setBranchId(branch);
			 mopfeelimit.setModeOfPaymentId(mop);
			 mopfeelimit.setMinValue(minvalue);
			 mopfeelimit.setMaxValue(maxvalue);
			 mopfeelimit.setFee(feevalue);
			 mopfeelimit.setStatus("active");
			 mopfeelimit.setRateType(ratetype);
			 mopfeelimit.setDisplay(dismode);
	String message=mopfService.saveModeOfPaymentLimitation(mopfeelimit);
	AuditTrail atr=new AuditTrail();
	atr.setAdminId(admin.getAdminId());
	atr.setAgent("-");
	atr.setMessage("-");
	atr.setUserId(branch.getAdmin().getAdminId());
	atr.setAdminId(branch.getAdmin().getAdminId());
	atr.setUserType("ROLE_ADMIN");
	atr.setOriginalData("-");
	atr.setChangedData("paymentMode fee added record is:"+minvalue+"to"+maxvalue);
	atr.setIpAddress(myIp);
	atr.setUserName("-");
	atr.setCategory("paymentMode Fee slab added");
	atr.setTransaction("-");
	atr.setSourceCountry("-");
	auditTrailService.save(atr);
		 
	return message;
		  }  
		  @GetMapping("updateModeOfPaymentLimitation")
		  public String updateModeOfPaymentLimitation(@RequestParam String mopfeeid,String fee,String rateType, String myIp)
		  {
			 ModeOfPaymentFees mf=mopfService.getModeofpaymentById(mopfeeid);
				AuditTrail atr=new AuditTrail();
				atr.setAgent("-");
				atr.setMessage("-");
				atr.setUserId(mf.getAdmin().getAdminId());
				atr.setAdminId(mf.getAdmin().getAdminId());
				atr.setUserType("ROLE_ADMIN");
				atr.setOriginalData(mf.getFee()+"");
				atr.setChangedData(fee+"");
				atr.setIpAddress(myIp);
				atr.setUserName("-");
				atr.setCategory("paymentMode Fee slab updated");
				atr.setTransaction("-");
				atr.setSourceCountry("-");
				auditTrailService.save(atr);
 
			 double fees=Double.parseDouble(fee);
			  String message=mopfService.updateModeOfPaymentFeeLimit(mopfeeid,fees,rateType);

			  return message;
		  }
		  @GetMapping("deleteModeOfPaymentLimitation")
		  public String deleteModeOfPaymentLimitation(@RequestParam String mopfeeid, String myIp)
		  {
			  System.out.println("mopfeeid==="+mopfeeid);
				 ModeOfPaymentFees mf=mopfService.getModeofpaymentById(mopfeeid);
			  
			  String message=mopfService.deleteModeOfPaymentLimit(mopfeeid);
				AuditTrail atr=new AuditTrail();
				atr.setAgent("-");
				atr.setMessage("-");
				atr.setUserId(mf.getAdmin().getAdminId());
				atr.setAdminId(mf.getAdmin().getAdminId());
				atr.setUserType("ROLE_ADMIN");
				atr.setOriginalData(mf.getMinValue()+"to"+mf.getMaxValue()+",fee:"+mf.getFee());
				atr.setChangedData("deleted record "+mf.getMinValue()+"to"+mf.getMaxValue());
				atr.setIpAddress(myIp);
				atr.setUserName("-");
				atr.setCategory("paymentMode Fee slab updated");
				atr.setSourceCountry("-");
				atr.setTransaction("-");
				auditTrailService.save(atr);


			  return message;
		  }
	 
		  
		  
		  
			@GetMapping("getIdTypesBasedOnCountry")
			@ResponseBody
			public List<SenderIds> getSenderIds(@RequestParam String branchId,@RequestParam String adminId,@RequestParam String functionality){
	            System.out.println("branchId in demoServer controller====="+branchId);
	            System.out.println("adminId in demo Server controller====="+adminId);
	            System.out.println("functionality in demoserver controller===="+functionality);
				return senderIdTypeService.findByBranchAndAdminAndFunctionality(branchId, adminId, functionality);

			}
			@GetMapping("TxnlistOfSendingBranch")
			@ResponseBody
			public  List<TransactionInformation> getAllTransaction(@RequestParam String fromdate, String todate,
					HttpServletRequest request)

			{
				System.out.println("fromdate in txn====="+fromdate);
				System.out.println("todate in txn-===="+todate);
				HttpSession session=request.getSession();
				Branch branch=(Branch)session.getAttribute("branch");
				System.out.println("branch in txn====="+branch);
				String adminid=branch.getAdmin().getAdminId();
				System.out.println("adminid in txn====="+adminid);
				List<TransactionInformation> l=txnService.getAllSendingBranchTransactions(adminid, branch.getBranchId(), fromdate, todate);
				System.out.println("txn lisyt===="+l.size());	
				return l;
			}

			@GetMapping("txnlistOfAdmin")
			@ResponseBody
			public  List<TransactionInformation> getAllTransactions(@RequestParam String fromdate, String todate,
					HttpServletRequest request)

			{
				System.out.println("fromdate in txn====="+fromdate);
				System.out.println("todate in txn-===="+todate);
				HttpSession session=request.getSession();
			Admin admin=(Admin) session.getAttribute("admin");
			System.out.println("admin===="+admin);
				String adminId = sessionDataService.getAdminId(request.getSession());
				System.out.println("adminIdinid====="+adminId);
				List<TransactionInformation> list = adminService.getTransactionDetailsByAdmin(adminId, fromdate, todate);
				System.out.println("list of transaction:" + list.size());

				return list;

			}
			@PostMapping("changeBranchPaymentStatusInTransaction")
			public @ResponseBody String changePaymentStatusTransaction(@RequestParam String pstatus, String txnid,
					String ckycstatus) {
				String message = "";
				Object[] txinfo = {};
				System.out.println("ckycstatus controller:" + ckycstatus);
						boolean flag = adminService.updateTransactionPaymentStatus(txnid, pstatus, ckycstatus);
				if (flag == true)
					message = "success";
				else
					message = "failed";
				return message;

			}
			@PostMapping("changeBranchTransactionStatus")
			public @ResponseBody String changeBrnxchTransactionStatus(@RequestParam String transactionstatus, String txnid) {
				String message = "";
				Object[] txinfo = {};
				boolean flag = adminService.updateTransactionStatus(transactionstatus, txnid);
				if (flag == true)
					message = "success";
				else
					message = "failed";
				return message;


			}

			
			@GetMapping("getNationalIdTypes")
			public List<NationalIdTypes> getNationalIdTypes(@RequestParam String countryISO){
				return nis.findByIso(countryISO);
			}

			@GetMapping("getAllSendingBranchesExceptGivenBranch")
			public List<Branch> getAllRecBranchesBasedOnFunctionalityAndExceptGivenBranchAndAdminId(@RequestParam String adminId,@RequestParam String functionality,@RequestParam String givenBranch){
				return branchService.getBranchesBasedOnFunctionalityAndExceptGivenBranchAndAdminId(adminId, "sending", givenBranch);
			}
			
			
			@GetMapping("getAdminFee")
			@ResponseBody 
			public  double getAdminFee(@RequestParam String fromBranchId,@RequestParam String toBranchId,@RequestParam double fees){
			System.out.println("fromBranchId"+fromBranchId+"toBranchId"+toBranchId+"fees"+fees);
			Branch b=branchService.getBranchBasedOnBranchId(fromBranchId);
			double o=0;
		RevenuePercentage rp= rps.getByagents(fromBranchId, toBranchId, b.getAdmin().getAdminId());
		  o=Integer.parseInt(rp.getAdminPercentage());
		  System.out.println("01====="+o);
			//double amount1=Double.parseDouble(fees);
		  o= ((fees*o)/100);
		  System.out.println("01====="+o);
		return o;
			}
			
			@GetMapping("getAgentFee")
			@ResponseBody
			public  double getAgentFee(@RequestParam String fromBranchId,@RequestParam String toBranchId, double fees){
			System.out.println("fromBranchId"+fromBranchId+"toBranchId"+toBranchId+"fees"+fees);
			Branch b=branchService.getBranchBasedOnBranchId(fromBranchId);
			double o=0;
		RevenuePercentage rp= rps.getByagents(fromBranchId, toBranchId, b.getAdmin().getAdminId());
		System.out.println("rp======"+rp);
		o=Integer.parseInt(rp.getSourcePercentage());
		//double amount1=Double.parseDouble(fees);
		  o= ((fees*o)/100);
		  System.out.println("0====="+o);
		return o;
			}
			
			
	@GetMapping("/getBanksBasedOnIso")
	public @ResponseBody List<Banks> getBanksBasedOnIso(@RequestParam String branchId){
		Branch b=branchService.getBranchBasedOnBranchId(branchId);
		System.out.println("countryiso======"+b.getFromCountry().getCountryISO());
		return bankService.getBanksList(b.getFromCountry().getCountryISO());
	}
	
	@GetMapping("getServieFees")
	public  List<ServiceFees> getAllServiceFeeBasedOnFromBranchAndToBranchIds(@RequestParam String fromBranchId,@RequestParam String toBranchId){
		System.out.println("fee is  = ="+feeService.getListOfServiceFeeBasedOnFromBranchAndToBranchIds(fromBranchId, toBranchId));
		//String replacedString=p.replace("?"," ").replace("�", " ");
		return feeService.getListOfServiceFeeBasedOnFromBranchAndToBranchIds(fromBranchId, toBranchId);
	}
	

	
	@GetMapping("/getBanksOnCountryIso")
	public @ResponseBody List<Banks> getBanksOnCountryIso(@RequestParam String countryISO){


		return bankService.getBanksList(countryISO);
	}
	

@RequestMapping("checkExistCustomer")
public ResponseEntity<String> checkUsersEmails(@RequestParam String emailId) {
	System.out.println("emailId===" + emailId);
	String result = customerService.getUserListBasedOnEmailIds(emailId);
	System.out.println("result::::" + result);
	return new ResponseEntity<>(result, HttpStatus.OK);
}

/* This URL Request Serves Returns All  ServiceFees slabs Based on AdminId
 */
@GetMapping("getadminservicefees")
public List<ServiceFees> getAllServiceFees(@RequestParam String adminId){
	return  feeService.getAllServiceFeesBasedAdminId(adminId,"Active");
}

 }
