package com.kws.unitedfintech.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartHttpServletRequest;

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
import com.kws.unitedfintech.entities.ModeOfPaymentFees;
import com.kws.unitedfintech.entities.ModeOfPayments;
import com.kws.unitedfintech.entities.NationalIdTypes;
import com.kws.unitedfintech.entities.OnlineMop;
import com.kws.unitedfintech.entities.PurposeCodes;
import com.kws.unitedfintech.entities.RealationShips1;
import com.kws.unitedfintech.entities.ReasonForTransfer;
import com.kws.unitedfintech.entities.Relationship;
import com.kws.unitedfintech.entities.SanctionSearch;
import com.kws.unitedfintech.entities.SenderIdType;
import com.kws.unitedfintech.entities.SenderIds;
import com.kws.unitedfintech.entities.SourceOfFund;
import com.kws.unitedfintech.entities.SourceOfFunds1;
import com.kws.unitedfintech.entities.States;
import com.kws.unitedfintech.entities.TransactionInformation;
import com.kws.unitedfintech.entities.TrulioCustomer;
import com.kws.unitedfintech.entities.User;
import com.kws.unitedfintech.service.AdminService;
import com.kws.unitedfintech.service.BankService;
import com.kws.unitedfintech.service.BeneficiaryService;
import com.kws.unitedfintech.service.BranchPaymentTypeDetailsService;
import com.kws.unitedfintech.service.BranchService;
import com.kws.unitedfintech.service.CountryService;
import com.kws.unitedfintech.service.CountryZonService;
import com.kws.unitedfintech.service.CustomerService;
import com.kws.unitedfintech.service.EmailTemplateService;
import com.kws.unitedfintech.service.IDProofService;
import com.kws.unitedfintech.service.IssuerCodeService;
import com.kws.unitedfintech.service.ModeOfPaymentsService;
import com.kws.unitedfintech.service.NationalIdService;
import com.kws.unitedfintech.service.OnlineMopService;
import com.kws.unitedfintech.service.PurposeCodeService;
import com.kws.unitedfintech.service.RealationShips1Service;
import com.kws.unitedfintech.service.ReasonForTransferService;
import com.kws.unitedfintech.service.RelationshipService;
import com.kws.unitedfintech.service.SanctionSearchService;
import com.kws.unitedfintech.service.SenderIdTypeService;
import com.kws.unitedfintech.service.SessionDataService;
import com.kws.unitedfintech.service.SourceOfFundService;
import com.kws.unitedfintech.service.SourceOfFundsService;
import com.kws.unitedfintech.service.TransactionInformationService;
import com.kws.unitedfintech.service.TrulioCustomerService;
import com.kws.unitedfintech.service.UserService;
import com.kws.unitedfintech.service.cashService;
import com.kws.unitedfintech.soap.client.MFSsoapClient;
@RestController
@RequestMapping("api/")
public class DemoServerController {
	 @Autowired
	 private NationalIdService nis;
	 @Autowired
	 private TrulioCustomerService tcs;
	 
	@Autowired
	private SourceOfFundsService sourceOfFundsService;
    @Autowired
    private ReasonForTransferService reasonForTransferService;
	@Autowired
	private UserService userService;
	@Autowired
	private OnlineMopService onlineMopService;
	
	@Autowired
	private BranchService branchService;
	@Autowired
	private CustomerService customerService;
	
	@Autowired
	private SenderIdTypeService senderIdTypeService;
	
	@Autowired
	private SessionDataService sessionDataService;
	@Autowired
	private EmailTemplateService emailTemplateService;
	@Autowired
	private CountryZonService   countryZoneService;
	@Autowired
	private CountryService countryService;
	@Autowired
	private BankService bankService; 
	@Autowired
	private cashService cashService; 
	@Autowired
	private IssuerCodeService issuerCodeService;
	@Autowired
	private IDProofService iDProofService;
	@Autowired
	private RelationshipService relationshipService;
	@Autowired
	private PurposeCodeService purposeCodeService;
	@Autowired
	private RealationShips1Service realationShips1Service;
	@Autowired
	private AdminService  adminService; 
	@Autowired
	private SourceOfFundService sourceOfFundService; 
	@Autowired
	private  BeneficiaryService beneficiaryService;
	@Autowired
	private  ModeOfPaymentsService modeOfPaymentsService;
	@Autowired
	private BranchPaymentTypeDetailsService branchPaymentTypeDetailsService;
	@Autowired
	private TransactionInformationService transactionInformationService;
	@Autowired
	private SanctionSearchService  sanctionSearchService;
 	@Autowired
	private MFSsoapClient mFSsoapClient; 
	
	
	@RequestMapping(value = "/saveCustomer", method = RequestMethod.POST)
	public ResponseEntity<String> saveCustomerDetails(@RequestBody Customer customer,HttpServletRequest request){
System.out.println("saveeeeeeeeeeee customer....");
		List<SanctionSearch> sanctionSearchList=sanctionSearchService.getSanctionSearchResult(customer.getFirstName(),customer.getLastName());
		System.out.println("sanctionSearchList::::"+sanctionSearchList);
		if(sanctionSearchList.size()>0) {
			customer.setSanctionSearchFlag("yes");
		}else {
			customer.setSanctionSearchFlag("no");
		}

		Branch branch = branchService.getBranchBasedOnBranchId(customer.getBranchId());
		customer.setBranch(branch);
		customer.setCitizenship("yes");

		customer.setOccupation("yes");
		customer.setCountry(branch.getFromCountry());
		customer.setIssuingCountry(branch.getFromCountry());
		customer.setAdmin(branch.getAdmin());
		
		customer.setCustomerDetailsFlag("partial");
		customer.setFirstIdProofStatus("no");
		customer.setSecondIdProofStatus("no");
		String custId = customerService.saveCustomerDetails(customer);
		//System.out.println("custId = =" + custId);
		sessionDataService.storeCustomerIdInSession(request.getSession(), custId);
		
		
		/*
		 * EmailTemplate emailTemplate =
		 * emailTemplateService.getEmailTemplateByTitleAndAdmin(customer.getAdmin().
		 * getAdminId(), "first signup messages");
		 * //System.out.println("message======="+emailTemplate); String bodyContent =
		 * emailTemplate.getTemplate();
		 * //System.out.println("bodyContent========"+bodyContent); //String
		 * firstName=request.getParameter("firstName"); //String
		 * emailId=request.getParameter("emailId"); String replacedBodyContent =
		 * bodyContent.replace("{FIRST_NAME}", customer.getFirstName()); String
		 * replacedBodyContent1 =
		 * replacedBodyContent.replace("{SENDER_EMAIL_ID}",customer.getEmailId());
		 * String replacedBodyContent2=replacedBodyContent1.replace("{CUSTOMER_NUMBER}",
		 * customer.getCustomerId());
		 */
		
		
		
		//SendMailBean sendMailBean=new SendMailBean(); 
		
	
			//sendMailBean.send1("info@remitz.co.uk", emailId,"","", emailTemplate.getSubject(),
				//	hederContent + bodyStartsContent + replacedBodyContent2 + bodyEndContent + footerContent,"localhost");

		return new ResponseEntity<>(custId,HttpStatus.OK);

	}
	@RequestMapping("getallrecevingbranches")
	public List<Branch> getAllRecevingBranches(@RequestParam String adminId){
		List<Branch> list = branchService.getBranchesBasedOnFunctionalityAndAdminId(adminId, "receiving");
		return list;
	}
	@RequestMapping("getallrecbranches")
	public List<Branch> getAllRecBranches(@RequestParam String adminId){
		List<Branch> list = branchService. getRecBranchesBasedOnFunctionalityAndAdminId(adminId, "receiving");
		return list;
	}

	
	  @RequestMapping("getcustomerdetails") 
	  public Customer getCustomerById(@RequestParam("customerId")String customerId) {
	  Customer customer = customerService.findByCustomerId(customerId);
	   return customer;
	  }
	  @RequestMapping("getstates")
	  public List<States> getStatesByCustomerCountryISO(@RequestParam("countryISO")String countryISO){
		  return countryZoneService.findAllBycountryISO(countryISO);  
	  }
	 @RequestMapping(value = "updatecustomerfulldetails", method = RequestMethod.POST)
	  public String  updatecustomer(HttpServletRequest request,@RequestBody Customer customerData)  {
				
		 
		       System.out.println("customer:::::"+customerData);
		       Customer customer = customerService.findByCustomerId(customerData.getCustomerId());
		       System.out.println("customer details:"+customer);
				Country customerCountry = countryService.getCountryBasedOnIso(customerData.getCustomerCountry());
				System.out.println("customerCountry::::"+customerCountry);
				customer.setCountry(customerCountry);
				Country issuingCountryISO=null;
				if(customerData.getIssuingCountryISO().equals("") || customerData.getIssuingCountryISO().equals("null")) {
					issuingCountryISO=countryService.getCountryBasedOnIso("du");	
				}else {
					issuingCountryISO=countryService.getCountryBasedOnIso(customerData.getIssuingCountryISO());	
				}
				customer.setHouseNumber(customerData.getHouseNumber());
				customer.setIssuingCountry(issuingCountryISO);
				System.out.println("issuingCountryISO::::"+issuingCountryISO);
				customer.setCustomerDetailsFlag("full");
				if(customer.getTrulioResponse().equals("match")|| customer.getTrulioResponse()=="match") {
					customer.setCustomerKYCMode("Auto");
					customer.setCustomerKYCStatus("completed");
				}else {
					  customer.setCustomerKYCMode(customerData.getCustomerKYCMode());
					  customer.setCustomerKYCStatus(customerData.getCustomerKYCStatus());

				}
				
		
		  customer.setFirstName(customerData.getFirstName());
		  customer.setOccupation(customerData.getOccupation());
		  customer.setLastName(customerData.getLastName());
		  customer.setDob(customerData.getDob());
		  customer.setAddress1(customerData.getAddress1());
		  customer.setMobileNumber(customerData.getMobileNumber());
		  customer.setPostalCode(customerData.getPostalCode());
		  customer.setFirstIdProofDoc(customerData.getFirstIdProofDoc());
		  customer.setFirstIdProofType(customerData.getFirstIdProofType().split(",")[0]);
		  customer.setFirstIdExpireDate(customerData.getFirstIdExpireDate());
		  customer.setFirstIdNumber(customerData.getFirstIdNumber());
		  
		 customer.setFirstIdProofStatus(customerData.getFirstIdProofStatus());
		  customer.setSecondIdProofDoc(customerData.getSecondIdProofDoc());
		  customer.setSecondIdProofStatus(customerData.getSecondIdProofStatus()); 
		  customer.setGender(customerData.getGender());
		  customer.setCityOrState(customerData.getCityOrState());
		  
		  customer.setCustomerDetailsFlag("full");
		  
		  customer.setCitizenship(customerData.getCitizenship());
		  customer.setOccupation(customerData.getOccupation());
		  
		 customer.setFirstIdProofDoc(customerData.getFirstIdProofDoc());
		customer.setFirstIdProofStatus(customerData.getFirstIdProofStatus());		
customer.setSecondIdProofDoc(customerData.getSecondIdProofDoc());
customer.setSecondIdProofStatus(customerData.getSecondIdProofStatus());		
customerService.updateCustomerDetails(customer);
				return  "updated";

		}
     @RequestMapping("getallbanks")
	 public List<Banks> getallbanks(@RequestParam("countryISO")String countryISO){
		 System.out.println("countryIso  in demo server===="+countryISO);
    	 List<Banks> bankIssuerCodeList = bankService.getBanksList(countryISO);
		 System.out.println("bankIssuerCodeList in demo server==="+bankIssuerCodeList);
    	 return bankIssuerCodeList;
	 }
     @RequestMapping("getcashlist")
     public List<Cash> getAllCashList(@RequestParam("adminId")String adminId,@RequestParam("countryISO") String countryISO){
    	 return cashService.getCashListBasedonAdminAndCountryIso(adminId,countryISO);
    	 
     }
	 @RequestMapping("getewalletissuercode")
     public List<EWalletIssuerCode> getEwalletIssuerCode(@RequestParam("countryISO")String countryISO){
		 return  issuerCodeService
					.getEWalletIssuerCodeList(countryISO);  
     }
	 @RequestMapping("getcountrydetails")
	 public Country  getCountryBasedOnCountryISO(@RequestParam("countryISO")String countryISO) {
		 return  countryService.getCountryBasedOnIso(countryISO);
		 
	 }
	 @RequestMapping("getsenderidtypes")
	 public List<SenderIdType> getIdProofs(){
		 return  iDProofService.getIdProof();
		 
	 }
	 @RequestMapping("getrelationships")
	 public List<Relationship> getAllRelationShips(){
		 return relationshipService.getRelationship();
	 }

	 @RequestMapping("getrelationship")
	 public List<RealationShips1> getAllRelationShip(String adminId){
		 return realationShips1Service.RelationshipsListBasedOnAdmin(adminId);
	 }
	 @RequestMapping("getpurposecodes")
	 public List<PurposeCodes> getPurposeCodes(){
		 return  purposeCodeService.getPurposeCodesList();
		 
	 }
	 @RequestMapping("getadmindetails")
	 public Admin getAdminDetails(@RequestParam("adminId")String adminId) {
		 return  adminService.getAdminDetailsBasedOnAdminId(adminId);
	 }
	 @RequestMapping("getsourceoffunds")
	 public List<SourceOfFund> getSourceOfFunds() {
	    return sourceOfFundService.getSourceOfFundList();	 
	 }

	 @RequestMapping("getsourceoffund")
	 public List<SourceOfFunds1> getSourceOfFund(String adminId) {
	    return 	sourceOfFundsService.SourceOfFundsListBasedOnAdmin(adminId); 
	 }
	 @RequestMapping("getbeneficiarydetails")
	 public Beneficiary getBeneficiaryDetails(@RequestParam("existedbeneficiary")String existedbeneficiary) {
		 return  beneficiaryService.getBeneficiaryDetails(existedbeneficiary);
	 }
	 @RequestMapping("getmodeofpaymentfee")
	 public List<ModeOfPaymentFees> getModeOfPaymentsBasedOnBranchIdAndModeofPaymentId(@RequestParam("branchId")String branchId,@RequestParam("modeOfPayment")String modeOfPayment) {
		return  modeOfPaymentsService.getModeOfPaymentFeeBasedOnBranchIdAndModeOfPayments(branchId,modeOfPayment);
	 }
	 @RequestMapping("getbranchpaymentypedetails")
	 public BranchPaymentTypeDetails getDeliveryTime(@RequestParam("branchId")String branchId,@RequestParam("modeOfPayment")String modeOfPayment) {
		return branchPaymentTypeDetailsService.getDeliveryTime(branchId,modeOfPayment);
		 
	 }
	 @RequestMapping("getbranchdetails")
	 public Branch getBranchDetails(@RequestParam("branchId")String branchId) {
		 return  branchService.getBranchBasedOnBranchId(branchId);
	 }
	 @RequestMapping("getallmodeofpayments")
	 public List<ModeOfPayments> getAllModeOfPayments(){
		 return modeOfPaymentsService.getAllModeOfPaymets();
	 }
	 @RequestMapping("savebeneficiarydetails")
		public ResponseEntity<String> saveBeneficiarydetails(@RequestBody Beneficiary beneficiary) {
			Customer customer = customerService.findByCustomerId(beneficiary.getCustomerId());
			Admin admin = adminService.getAdminDetailsBasedOnAdminId(beneficiary.getAdminId());
			Branch branch = branchService.getBranchBasedOnBranchId(beneficiary.getToBranchId());
			System.out.println("countryiso...save in...eneficiary..."+beneficiary.getCountryISO());
			Country country =countryService.getCountryBasedOnIso(branch.getFromCountry().getCountryISO());
			System.out.println("country...save in...eneficiary..."+country);
			beneficiary.setCustomer(customer);
			beneficiary.setAdmin(admin);
			beneficiary.setBeneficiaryCountry(country);
			String benificiaryId = beneficiaryService.saveBeneficiaryDetailsWhileTransaction(beneficiary);
			return new ResponseEntity<String>(benificiaryId, HttpStatus.OK);
		}
		
	 @RequestMapping("savetransaction")
		public ResponseEntity<String> saveTransactiondetails(@RequestBody TransactionInformation transactionInformation) {
			Customer customer = customerService.findByCustomerId(transactionInformation.getCustomerId());
			Admin admin = adminService.getAdminDetailsBasedOnAdminId(transactionInformation.getAdminId());
			Branch fromBranch = branchService.getBranchBasedOnBranchId(transactionInformation.getFromBranchId());
			Branch toBranch = branchService.getBranchBasedOnBranchId(transactionInformation.getToBranchId());
			Country sendingCountry = countryService.getCountryBasedOnIso(fromBranch.getFromCountry().getCountryISO());
			Country receivingCountry = countryService.getCountryBasedOnIso(toBranch.getFromCountry().getCountryISO());
			Beneficiary beneficiary = beneficiaryService.getBeneficiaryDetails(transactionInformation.getBeneficiaryId());
			transactionInformation.setCustomer(customer);
			transactionInformation.setFromBranch(fromBranch);
			transactionInformation.setToBranch(toBranch);
			transactionInformation.setAdmin(admin);
			transactionInformation.setSendingCountry(sendingCountry);
			transactionInformation.setReceivingCountry(receivingCountry);
			transactionInformation.setBeneficiary(beneficiary);
			String transactionId = transactionInformationService.saveTransactionInformation(transactionInformation);

			return new ResponseEntity<String>(transactionId, HttpStatus.OK);

		}

	 @RequestMapping("saveNewReciepent")
		public ResponseEntity<String> saveNewBenficiaryDetails(@RequestBody Beneficiary b) {
		
		
		Customer customer = customerService.findByCustomerId(b.getCustomerId());
	
		Admin admin = adminService.getAdminDetailsBasedOnAdminId(b.getAdminId());
	
		Branch branch = branchService.getBranchBasedOnBranchId(b.getToBranchId());
			Country country =countryService.getCountryBasedOnIso(b.getCountryISO());
	
			b.setCustomer(customer);
			b.setAdmin(admin);
			b.setBeneficiaryCountry(country);
		
		 
		 String beneficiaryId = beneficiaryService.saveNewBenficiaryDetails(b);

			return new ResponseEntity<String>(beneficiaryId, HttpStatus.OK);

		}

	 @RequestMapping("saveUpdatedReciepent")
		public void saveUpdatedBenficiaryDetails(@RequestBody Beneficiary b) {
		 System.out.println("beneficiafy updated service staarts");
		
		Customer customer = customerService.findByCustomerId(b.getCustomerId());
		Admin admin = adminService.getAdminDetailsBasedOnAdminId(b.getAdminId());
		/*
		 * Branch branch = branchService.getBranchBasedOnBranchId(b.getToBranchId());
		 * System.out.println("beneficiafy updated service 3333333"+branch);
		 */
		Country country =countryService.getCountryBasedOnIso(b.getCountryISO());
	Beneficiary beneficiary=beneficiaryService.findBeneficiary(b.getBeneficiaryId());
	System.out.println();
	System.out.println("beneficiary....."+beneficiary);
	System.out.println();
	beneficiary.setCustomer(customer);
	beneficiary.setAdmin(admin);
	beneficiary.setBeneficiaryCountry(country);
		beneficiary.setFirstName(beneficiary.getFirstName());
		 beneficiaryService.updatedBenef(beneficiary);
		 System.out.println("beneficiafy updated service dends");
	

		}

	 
	 @RequestMapping("gettransactiondetails")
		public TransactionInformation getTransactiondetails(@RequestParam("txnId") String txnId) {
			return transactionInformationService.getTransactionDetails(txnId);
		}
	 @RequestMapping("getdeliverytime")
	 public String getDeliverTime(@RequestParam("branchId")String branchId,@RequestParam("status")String status,@RequestParam("paymentType")String paymentType) {
		 String response;
		 response=branchPaymentTypeDetailsService.getDeliveryTime(branchId, status, paymentType);
		 System.out.println("parameters are::"+branchId+" "+status+" "+paymentType);
		 System.out.println("delivery time response server:::"+response);
		 return response;
	 }
	 @RequestMapping("getcustomerbeneficiarys")
	 public List<Beneficiary> getBeneficiaryBasedOnCustomerCountryISOPaymentType(@RequestParam String customerId,@RequestParam String paymentType,@RequestParam String customerCountryISO){
		return beneficiaryService.getBeneficiaryBasedOnCustomerCountryISOPaymentType(
				 customerId,paymentType,customerCountryISO);	 
	 }
	 @RequestMapping("updatetransactionstatus")
	 public void UpdateTransactionstatus(@RequestParam String txnId,@RequestParam String status,@RequestParam String updatedBy,@RequestParam  String comments ) {
		 transactionInformationService.updateTransactionStatus(txnId, status, updatedBy, comments);
	 }
	 
	 
		@RequestMapping("updateViewCustomer")
		public void updateViewCustomer(@RequestBody Customer customerData)  {
		       System.out.println("customer in democlient:::::"+customerData);
		       System.out.println("city===="+customerData.getCityOrState());
				
				Customer  customer=customerService.findByCustomerId(customerData.getCustomerId());
				customer.setFirstName(customerData.getFirstName());
				customer.setLastName(customerData.getLastName());
				customer.setEmailId(customerData.getEmailId());
				customer.setMobileNumber(customerData.getMobileNumber());
				customer.setPostalCode(customerData.getPostalCode());
				customer.setOccupation(customerData.getOccupation());
				customer.setCityOrState(customerData.getCityOrState());
				 customerService.updateCustomerDetails(customer);
			

		}

		@RequestMapping("getSenderIds")
		public List<SenderIds> getSenderIds(@RequestParam String branchId,@RequestParam String adminId,@RequestParam String functionality){
            System.out.println("branchId in demoServer controller====="+branchId);
            System.out.println("adminId in demo Server controller====="+adminId);
            System.out.println("functionality in demoserver controller===="+functionality);
			return senderIdTypeService.findByBranchAndAdminAndFunctionality(branchId, adminId, functionality);

		}
		@RequestMapping("getSenderIdss")
		public List<SenderIds> getSenderId(@RequestParam String adminId){

            System.out.println("adminId in demo Server controller====="+adminId);

			return senderIdTypeService.findByAdmin(adminId);

		}

		@RequestMapping("updateFirstIds")
		public String updateFirstIdProof(@RequestBody Customer customer,MultipartHttpServletRequest multipartHttpServletRequest)  {
	 
		  customerService.updateCustomerDetailsWithIDImage(customer, multipartHttpServletRequest);
		return "updated";
		}
		@RequestMapping("updateSecondIds")
		public String updateSecondIdProof(@RequestBody Customer customer,MultipartHttpServletRequest multipartHttpServletRequest)  {
	 
		  customerService.updateSecondId(customer, multipartHttpServletRequest);
		return "updated";
		}
		

		 @RequestMapping(value = "updateFirstId", method = RequestMethod.POST)
		  public String  updateFirstId(HttpServletRequest request,@RequestBody Customer customerData)  {
					
			 
			       System.out.println("customer:::::"+customerData);
			       Customer customer = customerService.findByCustomerId(customerData.getCustomerId());
			       System.out.println("customer details:"+customer);
					Country issuingCountryISO=null;
					if(customerData.getIssuingCountryISO().equals("") || customerData.getIssuingCountryISO().equals("null")) {
						issuingCountryISO=countryService.getCountryBasedOnIso("du");	
					}else {
						issuingCountryISO=countryService.getCountryBasedOnIso(customerData.getIssuingCountryISO());	
					}
	               
					customer.setIssuingCountry(issuingCountryISO);
					System.out.println("issuingCountryISO::::"+issuingCountryISO);
					customer.setCustomerDetailsFlag("full");
					customer.setFirstIdIssueDate(customerData.getFirstIdIssueDate());
			  customer.setFirstIdProofDoc(customerData.getFirstIdProofDoc());
			  customer.setFirstIdProofType(customerData.getFirstIdProofType());
			  customer.setFirstIdExpireDate(customerData.getFirstIdExpireDate());
			  customer.setFirstIdNumber(customerData.getFirstIdNumber());
			  
			 customer.setFirstIdProofStatus(customerData.getFirstIdProofStatus());
			 
					customerService.updateCustomerDetails(customer);
					return  "updated";

			}
		 @RequestMapping(value = "updateSecondId", method = RequestMethod.POST)
		  public String  updateSecondId(HttpServletRequest request,@RequestBody Customer customerData)  {
					
			 
			       System.out.println("customer:::::"+customerData);
			       Customer customer = customerService.findByCustomerId(customerData.getCustomerId());
			       System.out.println("customer details:"+customer);
			       customer.setSecondIdIssueDate(customerData.getSecondIdIssueDate());
			       customer.setSecondIdProofDoc(customerData.getSecondIdProofDoc());
			  customer.setSecondIdProofType(customerData.getSecondIdProofType());
			  customer.setSecondIdExpireDate(customerData.getSecondIdExpireDate());
			  customer.setSecondIdNumber(customerData.getSecondIdNumber());
			 customer.setSecondIdProofStatus(customerData.getSecondIdProofStatus());
					customerService.updateCustomerDetails(customer);
					return  "updated";

			}

	 
		 @RequestMapping("getmodeofpaymentsonsendingamount")
		 public List<ModeOfPaymentFees> getModeOfPaymentFees(@RequestParam String branchId,@RequestParam String sendingAmount) {
			 return modeOfPaymentsService.getList(branchId,"backend",Double.parseDouble(sendingAmount));
		 }

		 
		 
		 @RequestMapping("getOnlineMopPage")
		 public OnlineMop  getOnlinePage(@RequestParam String adminId) {
			 return onlineMopService.findOneByAdmin(adminId);
		 }
		 
		 
		 
		@RequestMapping("getbranchexceptgivenbranch")
		public List<Branch> getListExceptBr(@RequestParam String adminId,String functionality,String branchId){
			System.out.println("adminId==="+adminId+"branchID===="+branchId+"functionality===="+functionality);
			return branchService.getAllSendingBranchesExceptGivenBranch(adminId, functionality,branchId);
				
		}
		@RequestMapping("getcustomertransactions")
		 public List<TransactionInformation> getCustomertransactions(@RequestParam String  customerId){
			 
			return  transactionInformationService.getTransactionDetailsBasedOnCustomerId(customerId);
		 }

		@RequestMapping("getAllBeneficiarys")
		 public List<Beneficiary> getAllBeneficiarys(@RequestParam String  customerId){
			List<Beneficiary> list=  beneficiaryService.getAllBeneficiarys(customerId);
		System.out.println("list in demo===="+list);
		System.out.println("customerId===="+customerId);
			return list;
		
		}
		@RequestMapping("getRelationships")
		 public List<RealationShips1> getRelationships(@RequestParam String  adminId){
			 
			return  realationShips1Service.RelationshipsListBasedOnAdmin(adminId);
		 }

		
		@RequestMapping("getBanks")
		public List<Banks> getBanks(@RequestParam String countryISO){
			return bankService.getBanksList(countryISO);
		}
		
		
		@RequestMapping("getSenderId")
		public List<SenderIds> getSenderIdS(@RequestParam String adminId){

			return senderIdTypeService.findByAdmin(adminId);

		}
		
		
		
		@RequestMapping("getcash")
		public List<Cash> getcash(@RequestParam String adminId){

		return cashService.getListByAdmin(adminId);
		}
		
		
@RequestMapping("deleteByBeneficiaryId")
public Beneficiary deleteReceipent(@RequestParam String beneficiaryId ) {
	 beneficiaryService.deleteByBeneficiaryId(beneficiaryId);
	return null;
 
}


@RequestMapping("getBeneficiaryById")
public Beneficiary getBeneficiaryById(@RequestParam String beneficiaryId ) {

Beneficiary beneficiary = beneficiaryService.getBeneficiaryDetails(beneficiaryId);

return beneficiary;

}


@RequestMapping("saveReceipentdetails")
public ResponseEntity<String> savebeReceipentdetails(@RequestBody Beneficiary beneficiary,HttpServletRequest request) {
System.out.println("beneficiary......saveReceipentdetails.."+beneficiary);
	Customer customer = customerService.findByCustomerId(beneficiary.getCustomerId());
	
	Admin admin = adminService.getAdminDetailsBasedOnAdminId(beneficiary.getAdminId());
	Country country = countryService.getCountryBasedOnIso(beneficiary.getCountryISO());
	System.out.println("country in demo===="+country);
	beneficiary.setCustomer(customer);
	beneficiary.setAdmin(admin);
	beneficiary.setBenificiaryStatus("New Receipent");
	beneficiary.setBeneficiaryCountry(country);
	beneficiary.setAccType("1");
	beneficiary.setCountryISO(country.getCountryISO());
	beneficiary.setCustomerId(beneficiary.getCustomerId());
	beneficiary.setToBranchId(country.getCountryISO());
	Beneficiary beneficiar=beneficiaryService.saveReceipentDetail(beneficiary);
	//System.out.println("beneficiary1 in demo====="+beneficiary1);
	return new ResponseEntity<String>(beneficiar.getAccType(), HttpStatus.OK);
}


@RequestMapping("/changePassword")
public String changePassword(@RequestBody Customer customerData) {
	System.out.println("custmerpwd in demo===="+customerData.getPassword());
	System.out.println("customerId in demo===="+customerData.getCustomerId());
	Customer customer=customerService.findByCustomerId(customerData.getCustomerId());
	customer.setPassword(customerData.getPassword());
	customer.setUpdatedDate(customerData.getUpdatedDate());
	Customer cust=customerService.customerDetails(customer);
	System.out.println("cust==="+cust);
	return "updated";
	
}



@RequestMapping("editBeneficiaryDetails")
public ResponseEntity<String> editBeneficiaryDetails(@RequestBody Beneficiary beneficiary) {
	Customer customer = customerService.findByCustomerId(beneficiary.getCustomerId());
	Admin admin = adminService.getAdminDetailsBasedOnAdminId(beneficiary.getAdminId());
	Country country = countryService.getCountryBasedOnIso(beneficiary.getCountryISO());
	System.out.println("country in demo===="+country);
	beneficiary.setCustomer(customer);
	beneficiary.setAdmin(admin);
	System.out.println("countryiso in demo====="+beneficiary.getCountryISO());
	beneficiary.setBeneficiaryCountry(country);
 beneficiaryService.editBeneficiaryDetails(beneficiary);
	return new ResponseEntity<String>(beneficiary.getAccType(), HttpStatus.OK);
}


@RequestMapping("editBeneficiaryDetailz")
public ResponseEntity<String> editBeneficiaryDetailz(@RequestBody Beneficiary beneficiary) {
	Customer customer = customerService.findByCustomerId(beneficiary.getCustomerId());
	Admin admin = adminService.getAdminDetailsBasedOnAdminId(beneficiary.getAdminId());
	Country country = countryService.getCountryBasedOnIso(beneficiary.getCountryISO());
	System.out.println("country in demo===="+country);
	beneficiary.setCustomer(customer);
	beneficiary.setAdmin(admin);
	System.out.println("countryiso in demo====="+beneficiary.getCountryISO());
	beneficiary.setBeneficiaryCountry(country);
 beneficiaryService.editBeneficiaryDetailz(beneficiary);
	return new ResponseEntity<String>(beneficiary.getAccType(), HttpStatus.OK);
}

@RequestMapping("findByEmail")
public Customer findByEmail(@RequestParam String emailId) {
	System.out.println("emailid in demo===="+emailId);
	Customer customer=customerService.findByEmail(emailId);
	return customer;
	
}
@RequestMapping("emailTemplatesByAdmin")
public EmailTemplate emailTemplatesByAdmin(@RequestParam String adminId,String title) {
 System.out.println("adminId in demo====="+adminId);
 System.out.println("title in demo====="+title); 
	EmailTemplate emailTemplate=emailTemplateService.getEmailTemplateByTitleAndAdmin(adminId, title);
	
	System.out.println("emailTemplate in demo==="+emailTemplate);
	return emailTemplate;

}

@RequestMapping("updatePasswordinuser")
public User updatePasswordinuser(@RequestParam String pwd,String usertype) {
	userService.updateCustomerPwd(pwd, usertype);
	return null;
	
}



@RequestMapping("gettransactionofcustomer")
public List<TransactionInformation> gettransactionofcustomer(@RequestParam String customerId)
{
	return transactionInformationService.getTransactionDetailsBasedOnCustomerId(customerId);
}

@RequestMapping("gettxnById")
public TransactionInformation gettxnById(@RequestParam String txnid) {
	return transactionInformationService.getTransactionDetails(txnid);
	
}
@GetMapping("getStatesBasedOnCountry")
public List<States> getStatesBasedOnCountry(@RequestParam String countryISO){
	return countryZoneService.findAllBycountryISO(countryISO);
}

@RequestMapping("getallcountrys")
public  List<Country> getAllCountries() {
	System.out.println("hi its working from controller");
	return countryService.getAllCountries();
}
@GetMapping("SourceOfFunds1ByAdmin")
public List<SourceOfFunds1> SourceOfFunds1ByAdmin(@RequestParam String adminId){
	return sourceOfFundsService.SourceOfFundsListBasedOnAdmin(adminId);
}
@GetMapping("ReasonForTransferByAdmin")
public List<ReasonForTransfer> ReasonForTransferByAdmin(@RequestParam String adminId){
	return reasonForTransferService.findByAdmin(adminId);

}
@GetMapping("getbranchpaymenttypes")
public List<BranchPaymentTypeDetails> getPaymentTypes(@RequestParam String branchId,@RequestParam String status){
	System.out.println("branchId::::"+branchId);
	System.out.println("hitting:::::::::");
	return branchPaymentTypeDetailsService.getBranchPaymentTypeDetailsBasedOnBranchIdAndStatus(branchId,status);
}


@GetMapping("getNationalIdTypes")
public List<NationalIdTypes> getNationalIdTypes(@RequestParam String countryISO){
	return nis.findByIso(countryISO);
}

@GetMapping("getTrulioCustomer")
public TrulioCustomer getTrulioCustomer(@RequestParam String countryISO) {
	TrulioCustomer tr=tcs.findByCountryIso(countryISO);
	return tr;
}
@RequestMapping("updatecustomerpassword")
public void updateCustomerPwd(@RequestParam String pwd,String custId) {
	System.out.println("update password of customer.......!"+pwd+" .. "+custId);
	customerService.updatepassword(pwd, custId);
}
@RequestMapping("getmfsrate")
public void getCur() {
	String res=mFSsoapClient.getCurrencyRate();
	System.out.println("resss:::"+res);
}

}