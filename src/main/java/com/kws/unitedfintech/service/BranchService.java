package com.kws.unitedfintech.service;

import java.util.List;

import com.kws.unitedfintech.entities.Branch;
import com.kws.unitedfintech.entities.BranchPaymentTypeDetails;
import com.kws.unitedfintech.entities.Customer;
import com.kws.unitedfintech.entities.TransactionInformation;
public interface BranchService {
	public String saveBranchDetails(Branch branch,List<BranchPaymentTypeDetails> payments);//usefull
	
	public List<Branch> getAll();
	
	public List<Branch> getAllBranches(String adminId);
	
	public List<Branch> getAllBranchesToAddLimits(String adminId);
	
	public List<Branch> getAllBranchDetails();
	
	public List<Branch> getAllReceivingBranches(String sendinCountryISO,String adminId);
	
	public Branch getBranchDetailsBasedOnISO(String countryISO);
	
	public Branch getBranchDetails(String emailId,String password);
	
	public Branch getBranchBasedOnBranchId(String branchId);
	
	public List<Branch> getBranchlistBasedOnBranchId(String branchId);

	public List<Branch> getBranchBasedOnAdminId(String adminId);

	
	public List<Branch> getAllBranchesBasedOnCountryISO(String countryISO,String adminId);
	
	//public void updateBranchDetails(Branch  branch,String branchId);
	
	public List<String> getSendingBranchIds(String adminId);
	
	public List<String> getReceivingBranchIds(String adminId);
	
	public void updateBranchMaxLimit(String branchId , double amt);
	
	public Branch getBranchBasedOnTransactionId(String txnId);
	
	public String getBranchListBasedOnEmailId(String emailId);
	
	public List<Branch> getAllSendingBranchesExceptGivenBranch(String adminId,String functionality,String branchId);
	
	public List<Branch> getAllBranchesBasedOnAdminId(String adminId);
	
	public List<Branch> getAllReceiveingBranchesBasedOnAdmin(String adminId);
	
	public List<Branch> getAllSendingBranchesBasedOnAdminId(String adminId);
	
	public List<Branch> getAllReceiveingBranchesBasedOnAdminId(String branchId,String adminId);
	
	public void updateBranchInformation(String branchIds,String bankStatuses,String cashStatuses,String branchStuses);
	
	public void updateBranchPaymentTypes(Branch branch);


	public String getBranchBasedOnCountryISOAndAdminId(String countryISO,String adminId);//for branch_registration we can't create more than one country in same country
	
	public List<Branch> getBranchesBasedOnFunctionalityAndAdminId(String adminId,String functionality);
	public List<Branch> getRecBranchesBasedOnFunctionalityAndAdminId(String adminId,String functionality);
	
	public List<Branch> getBranchesBasedOnFunctionalityAndExceptGivenBranchAndAdminId(String adminId,String functionality,String givenBranch);
	
	public List<Branch> getBranchesBasedOnFunctionality(String functionality);

	void updateBranchDetails(Branch branch);
    
	public List<Branch> getAllReceivingAndBothBasedObAdminId(String admin);
	public void updateStatus(String branchid,String bstatus);
public List<Customer> getAllBranchCustomers(String branchid);
public List<TransactionInformation> getAllRecBtrnBasedOnStatus(String status,String fromdate,String todate,String adminid);
public List<Branch> getRecevingBranchesBasedOnAdminId(String adminId);


public Branch getbyfunctionalityandisoanddefaultflag(String functionality,String countryiso,String defaultFlag,String adminId);


public List<Branch> getBranchesBasedOnFunctionalityAndAdminIdbackend(String adminId,String functionality);
public List<Branch> getAllBranchesBasedOnFunctionalityAndAdminIdwithoutFlag(String adminId,String functionality);

public List<Branch>  getByAdminAndFunctionality(String adminId,String functionality);



public List<Branch> getBranchBasedOnCountryISOAndAdminIdAndFunctionality(String countryISO,String adminId,String functionality);//for branch_registration we can't create more than one country in same country


public List<Branch> getbyprocessbankflag(String adminId,String functionality);

}



