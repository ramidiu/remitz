package com.kws.unitedfintech.serviceimpl;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kws.unitedfintech.entities.Branch;
import com.kws.unitedfintech.entities.BranchPaymentTypeDetails;
import com.kws.unitedfintech.entities.Customer;
import com.kws.unitedfintech.entities.NoGenerator;
import com.kws.unitedfintech.entities.TransactionInformation;
import com.kws.unitedfintech.entities.User;
import com.kws.unitedfintech.helpers.SenditoConvertNullsToEmpty;
import com.kws.unitedfintech.repository.BranchPaymentTypeDetailsRepository;
import com.kws.unitedfintech.repository.BranchRepository;
import com.kws.unitedfintech.service.BranchService;
import com.kws.unitedfintech.service.CustomerService;
import com.kws.unitedfintech.service.NoGeneratorService;
import com.kws.unitedfintech.service.TransactionInformationService;
import com.kws.unitedfintech.service.UserService;
@Service
public class BranchServiceImpl implements BranchService{

	@Autowired
	NoGeneratorService noGeneratorService;
	@Autowired
	private  UserService userService;
	SenditoConvertNullsToEmpty convertNullsToEmpty=new SenditoConvertNullsToEmpty();
	@Autowired
	private  final BranchRepository repository;
	@Autowired
	BranchPaymentTypeDetailsRepository paymentRepository;
	@Autowired
	CustomerService customerService;
	@Autowired
	TransactionInformationService tinfos;
	  public BranchServiceImpl(BranchRepository repository) { 
		  super();
		  this.repository = repository; 
	  }
	 

	@Override
	public String saveBranchDetails(Branch branch,List<BranchPaymentTypeDetails> payment) {
		NoGenerator noGenerator =	noGeneratorService.getNoGenerator("branch");	
		NoGenerator noGenerator1=noGeneratorService.getNoGenerator("branch_payment_type_details");
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Calendar cal = Calendar.getInstance();
		Date d = cal.getTime();
		
		String branchName=branch.getBranchName();
		String branchId=noGenerator.getIdPrefix()+noGenerator.getTableId();
		
		if(branch.getFunctionality().equals("both")) {
		branch.setDefaultFlag("normal");	
		}else {
			List<Branch> list=repository.getAllBranchesBasedOnFunctionalityAndCountryISoAndAdminId(branch.getFunctionality(), branch.getFromCountry().getCountryISO(),branch.getAdmin().getAdminId());
			System.out.println("list====="+list.size());
			if(list.size()>0) {
			branch.setDefaultFlag("normal");
		}else {
			branch.setDefaultFlag("default");	
		}
		}
		if(branchName.equals("dummy")){
			branch.setBranchId("dummy");
		}else{
			branch.setBranchId(branchId);	
		}
		branch.setCreatedDate(sdf.format(d));  		
		branch.setUpdatedDate(sdf.format(d));
		branch = convertNullsToEmpty.convertNullFieldToEmpty(branch, Branch.class);
		repository.save(branch);
		if(branch.getFunctionality().equals("receiving")|| branch.getFunctionality().equals("both")) {
	for(BranchPaymentTypeDetails p:payment)
		{
			  BranchPaymentTypeDetails p1= new BranchPaymentTypeDetails();
			  p1.setDeliveryTime(p.getDeliveryTime());
			  p1.setPaymentTypes(p.getPaymentTypes());
			  p1.setStatus(p.getStatus());
			  p1.setBranchId(p.getBranchId());
			 
		String branchPaymentTypeId=noGenerator1.getIdPrefix()+noGenerator1.getTableId();
		p1.setBranchPaymentTypeDetailId(branchPaymentTypeId);
		p1.setBranchId(branch);
		p1.setAdmin(branch.getAdmin());
		p1 = convertNullsToEmpty.convertNullFieldToEmpty(p1, BranchPaymentTypeDetails.class);
		
		paymentRepository.save(p1);
		noGeneratorService.updateNoGenerator(noGenerator1);
	}
		}
		noGeneratorService.updateNoGenerator(noGenerator);
		User user=new User();
		user.setPassword(branch.getPassword());
		user.setUserName(branch.getEmailId());
		user.setRoles("ROLE_BRANCH");
		user.setActive(true);
		user.setUserType(branchId);
		userService.saveUserDetails(user);
		return branchId;
	}

	@Override
	public List<Branch> getAllBranches(String adminId) {
		
		 return repository.findAllByadmin(adminId);
	}

	@Override
	public Branch getBranchDetails(String emailId, String password) {
//		Branch branch=new Branch();
//	branch=branchDao.getBranchDetails(emailId, password);
//		return branch;
		return repository.findAllByEmailidAndPassword(emailId, password);
	}

	@Override
	public Branch getBranchBasedOnBranchId(String branchId) {
		return repository.findBybranchId(branchId);
	}

	@Override
	public List<Branch> getAllBranchesBasedOnCountryISO(String countryISO,String adminId) {
		/*
		 * List<Branch> branchs=new ArrayList<Branch>();
		 * branchs=branchDao.getAllBranchesBasedOnCountryISO(countryISO,adminId); return
		 * branchs;
		 
		 */
		return null;
	}

	@Override
	public void updateBranchDetails(Branch branch) {
		//Branch br=repository.findBybranchIdAndAdminId(adminId, branchId);
		System.out.println("br........."+branch);
		branch = convertNullsToEmpty.convertNullFieldToEmpty(branch, Branch.class);

		repository.save(branch);
		System.out.println("br......"+branch);
		//branchDao.updateBranchDetails(branch);
	}

	@Override
	public List<String> getSendingBranchIds(String adminId) {
		/*
		 * List<String> sendingBranchIds=branchDao.getSendingBranchIds(adminId); return
		 * sendingBranchIds;
		 */
		return null;	
	}
	

	@Override
	public List<String> getReceivingBranchIds(String adminId) {
//		List<String> receivingBranchIds=branchDao.getReceivingBranchIds(adminId);
//		return receivingBranchIds;
		return null;
		
	}

	@Override
	public void updateBranchMaxLimit(String branchId, double amt) {
	//branchDao.updateBranchMaxLimit(branchId, amt);
	}

	@Override
	public Branch getBranchBasedOnTransactionId(String txnId) {
		/*
		 * Branch branch=branchDao.getBranchBasedOnTransactionId(txnId); return branch;
		 */
		return null;
	}

	@Override
	public String getBranchListBasedOnEmailId(String emailId) {
		Branch branch=repository.findByemailId(emailId);
		String result="";
		if(branch !=null){
			result="exist";
		}
		return result;
	}

	@Override
	public List<Branch> getAllBranchDetails() {
		//return branchDao.getAllBranchDetails();
		return null;
	}

	@Override
	public List<Branch> getAllReceivingBranches(String branchId,String adminId) {
		//return branchDao.getAllReceivingBranches(branchId,adminId);
		return null;
	}

	@Override
	public Branch getBranchDetailsBasedOnISO(String countryISO) {
		
		//return branchDao.getBranchDetailsBasedOnISO(countryISO);
		return null;
	}

	@Override
	public List<Branch> getAllSendingBranchesExceptGivenBranch(String adminId,String functionality,String branchId) {
		List<Branch> list= repository.getAllBranchesBasedOnFunctionalityAndExceptGivenBranchAndAdminId(adminId,functionality,branchId,"active","default");
	System.out.println("list====="+list);
	return list;
	}

	@Override
	public List<Branch> getAllBranchesToAddLimits(String adminId) {
		//return branchDao.getAllBranchesToAddLimits(adminId);	
		return null;
	}

	@Override
	public List<Branch> getAllBranchesBasedOnAdminId(String adminId) {
		return repository.findAllByadmin(adminId); 
	}

	@Override
	public List<Branch> getAllReceiveingBranchesBasedOnAdmin(String adminId) {
		String functionality="sending";
		return repository.findByFunctionalityAndAdminId(functionality, adminId);
	}

	@Override
	public List<Branch> getAllSendingBranchesBasedOnAdminId(String adminId) {
		String functionality="receiving";
		return repository.findByFunctionalityAndAdminId(functionality, adminId);
	}

	@Override
	public List<Branch> getAllReceiveingBranchesBasedOnAdminId(String branchId, String adminId) {
		//return branchDao.getAllReceiveingBranchesBasedOnAdminId(branchId,adminId);
		return null;
	}

	@Override
	public void updateBranchInformation(String branchIds,String bankStatuses,String cashStatuses,String branchStuses) {
		int length=branchIds.split(",").length;
		Branch branch=null;
		for(int i=0;i<length;i++) {
			branch=new Branch();
			branch.setBranchId(branchIds.split(",")[i]);
			/*
			 * branch.setBankStatus(bankStatuses.split(",")[i]);
			 * branch.setCashStatus(cashStatuses.split(",")[i]);
			 */
			branch.setStatus(branchStuses.split(",")[i]);
		}
		updateBranchPaymentTypes(branch);
	}

	@Override
	public void updateBranchPaymentTypes(Branch branch) {
	    //branchDao.updateBranchInformation(branch);
	}


	@Override
	public String getBranchBasedOnCountryISOAndAdminId(String countryISO, String adminId) {
		Branch branch= repository.findBranchByCountryAndAdminId(countryISO, adminId);
		if(branch!=null) {
			return "existed";
		}else {
			return "not existed";
		}
	}


	@Override
	public List<Branch> getBranchesBasedOnFunctionalityAndAdminId(String adminId, String functionality) {
		return repository.getAllBranchesBasedOnFunctionalityAndAdminId(adminId, functionality,"active","default");
	}
	@Override
	public List<Branch> getRecBranchesBasedOnFunctionalityAndAdminId(String adminId, String functionality) {
		return repository.getAllRecBranchesBasedOnFunctionalityAndAdminId(adminId, functionality,"active","default");
	}

	@Override
	public List<Branch> getBranchesBasedOnFunctionalityAndExceptGivenBranchAndAdminId(String adminId,
			String functionality, String givenBranch) {
		return repository.getAllBranchesBasedOnFunctionalityAndExceptGivenBranchAndAdminId(adminId, functionality, givenBranch,"active","default");
	}


	@Override
	public List<Branch> getBranchesBasedOnFunctionality(String functionality) {
		// TODO Auto-generated method stub
		return repository.getAllBranchesBasedOnFunctionality(functionality);
	}


	@Override
	public List<Branch> getAll() {
		// TODO Auto-generated method stub
		return (List<Branch>) repository.findAll();
	}


	@Override
	public List<Branch> getAllReceivingAndBothBasedObAdminId(String admin) {
		
		return repository.getAllReceivingAndBothBasedOnAdminid(admin,"default");
	}


	@Override
	public void updateStatus(String branchid, String bstatus) {
		
		repository.udpateBranchStatus(branchid, bstatus);
	}


	@Override
	public List<Branch> getBranchBasedOnAdminId(String adminId) {
		// TODO Auto-generated method stub
		return repository.findAllByadmin(adminId);
	}


	@Override
	public List<Customer> getAllBranchCustomers(String branchid) {
		
	
		/* customerService.getAllCustomerByBranchId(branchid); */
				return  null;
	}


	@Override
	public List<TransactionInformation> getAllRecBtrnBasedOnStatus(String status, String fromdate, String todate,
			String adminid) {
		
		return tinfos.getAllTrnbasedOnStatus(status, fromdate, todate, adminid);
	}
	@Override
	public List<Branch> getRecevingBranchesBasedOnAdminId(String adminId) {
		return repository.getRecevingBranchesBasedOnAdminId(adminId, "receiving","default")  ;
	}


	@Override
	public List<Branch> getBranchlistBasedOnBranchId(String branchId) {
		// TODO Auto-generated method stub
		return repository.findListBybranchIds(branchId);
	}


	@Override
	public Branch getbyfunctionalityandisoanddefaultflag(String functionality, String countryiso, String defaultFlag,String adminId) {
		// TODO Auto-generated method stub
		return repository.getbyfunctionalityisoanddefaultflag(functionality, countryiso, defaultFlag,adminId);
	}


	@Override
	public List<Branch> getBranchesBasedOnFunctionalityAndAdminIdbackend(String adminId, String functionality) {
		return repository.getAllBranchesBasedOnFunctionalityAndAdminIdBackend(adminId, functionality,"active");
	}


	@Override
	public List<Branch> getAllBranchesBasedOnFunctionalityAndAdminIdwithoutFlag(String adminId, String functionality) {
		// TODO Auto-generated method stub
		return repository.getAllBranchesBasedOnFunctionalityAndAdminIdwithoutFlag(adminId, functionality, "active");
	}


	@Override
	public List<Branch> getByAdminAndFunctionality(String adminId, String functionality) {
		// TODO Auto-generated method stub
		return repository.getByAdminAndFunctionality(adminId, functionality);
	}


	@Override
	public List<Branch> getBranchBasedOnCountryISOAndAdminIdAndFunctionality(String countryISO, String adminId,
			String functionality) {
		// TODO Auto-generated method stub
		return repository.getByAdminAndFunctionalityAndCountryiso(countryISO, adminId, functionality);
	}


	@Override
	public List<Branch> getbyprocessbankflag(String adminId, String functionality) {
		// TODO Auto-generated method stub
		return repository.getbyprocessbankflag(adminId, functionality, "active", "yes");
	}
	
	}



	
	
	

