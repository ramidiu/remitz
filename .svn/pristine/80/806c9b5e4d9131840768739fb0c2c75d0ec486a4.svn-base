package com.kws.unitedfintech.service;

import javax.servlet.http.HttpSession;

import com.kws.unitedfintech.entities.Admin;
import com.kws.unitedfintech.entities.Branch;
import com.kws.unitedfintech.entities.Customer;
import com.kws.unitedfintech.entities.States;



public interface SessionDataService {
	public boolean storeAdminInformation(HttpSession session,Admin admin);
	public boolean deleteAdminInformation(HttpSession session);
	public String getAdminId(HttpSession session); 
	
	public String storeBranchId(HttpSession session,String branchId);
	public String getBranchId(HttpSession session);
	public String storeBranchFunctionality(HttpSession session,String functionality);
	
	public String getBranchFunctionality(HttpSession session);
	public String getAdminName(HttpSession session);
	
	public void storeCustomerInfo(HttpSession session,Customer customer);
	public void storeCustomerIdInSession(HttpSession session,String customerId);
	public String getCustomerId(HttpSession session);
	public String getCustomerCountryISO(HttpSession session);
	public String getCustomerName(HttpSession session);
	public String getAdminKey(HttpSession session);
	public String getCustomerEmailId(HttpSession session);
	public void setAdminKey(HttpSession session,String key);
	public void setAdminLogo(HttpSession session,String logo);
	public void setAdminId(HttpSession session,String adminId);
	
	public void deleteCustomerInfo(HttpSession session);

	public String getBranchName(HttpSession session);
	
	public boolean storeBranchInformation(HttpSession session,Branch branch);
	
	public boolean deleteBranchInformation(HttpSession session);
	

	public boolean storeSuperAdminName(HttpSession session,String name);
	public void deleteSuperAdminName(HttpSession session);
	
	public boolean  setAdminTopUpTransaction(HttpSession session,String topUpTransaction);
	public String  getAdminTopUpTransaction(HttpSession session);
	
	
	public void storeStateId(HttpSession session,States states);
	public String storeBranchFunctionality(String functionality);
	public void storeAdminId(HttpSession session, String userType);
	
	public String getAdminLogo(HttpSession session);
	public void storeFlutterStatus(HttpSession session,String flutter);
	public String getFlutterStatus(HttpSession session);

}
