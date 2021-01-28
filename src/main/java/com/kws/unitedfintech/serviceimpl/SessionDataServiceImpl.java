package com.kws.unitedfintech.serviceimpl;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;

import com.kws.unitedfintech.entities.Admin;
import com.kws.unitedfintech.entities.Branch;
import com.kws.unitedfintech.entities.Customer;
import com.kws.unitedfintech.entities.States;
import com.kws.unitedfintech.service.SessionDataService;

@Service
public class SessionDataServiceImpl implements SessionDataService {

	@Override
	public boolean storeAdminInformation(HttpSession session, Admin admin) {
		if(session!=null){
			session.setAttribute("adminId",admin.getAdminId());
			session.setAttribute("adminName",admin.getFirstName());
			session.setAttribute("companyName",admin.getCompanyName());
			session.setAttribute("noOfBranches",admin.getNoOfBranches());
			session.setAttribute("branchCount",admin.getBranchCount());
			session.setAttribute("adminLogo", admin.getLogo());
			session.setAttribute("adminKey",admin.getAdminKey());
			return true;
		}
		return false;
	}

	@Override
	public boolean deleteAdminInformation(HttpSession session) {
		if(session!=null){
			session.setAttribute("adminId",null);
			session.setAttribute("adminName",null);
			return true;
		}
		return false;
	}

	@Override
	public String getAdminId(HttpSession session) {
		if(session!=null){
			return (String)session.getAttribute("adminId");
		}else{
			return null;
		}
	}

	@Override
	public boolean deleteBranchInformation(HttpSession session) {
		if(session!=null){
			session.setAttribute("branchId",null);
			session.setAttribute("branchName",null);
			session.setAttribute("adminId",null);
//			session.setAttribute("role",null);
			return true;
		}else{
			return false;
		}
	}
	@Override
	public String getBranchId(HttpSession session) {
		if(session!=null){
			return (String)session.getAttribute("branchId");
		}else{
			return null;
		}
	}

	@Override
	public String getAdminName(HttpSession session) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void storeCustomerInfo(HttpSession session, Customer customer) {
		if(session!=null){
			session.setAttribute("customerId",customer.getCustomerId());
			session.setAttribute("customerCountryISO",customer.getCountry().getCountryISO());
			session.setAttribute("customerName",customer.getFirstName());
			session.setAttribute("customerLastName",customer.getLastName());
			session.setAttribute("mobileNumber",customer.getMobileNumber());
			session.setAttribute("emailId",customer.getEmailId());
		}	
	}

	@Override
	public String getCustomerId(HttpSession session) {
		if(session!=null){
			return (String)session.getAttribute("customerId");
		}else{
		 return null;
		}
	}

	@Override
	public String getCustomerCountryISO(HttpSession session) {
		if(session!=null){
			return (String)session.getAttribute("customerCountryISO");
		}else{
		return null;
		}
	}

	@Override
	public void deleteCustomerInfo(HttpSession session) {
		if(session!=null){
			session.setAttribute("customerId",null);
			session.setAttribute("customerCountryISO",null);
			session.setAttribute("customerName",null);
		}
	}

	@Override
	public String getCustomerName(HttpSession session) {
		if(session!=null){
		
			return (String)session.getAttribute("customerName");
		}else{
		return null;
		}
	}
	@Override
	public String getBranchName(HttpSession session) {
		if(session!=null){
			 return (String)session.getAttribute("branchName");	
			}else{
			return null;
			}
	}
	@Override
	public boolean storeBranchInformation(HttpSession session, Branch branch) {
		if(session!=null){
			session.setAttribute("branchId", branch.getBranchId());
			session.setAttribute("branchName", branch.getBranchName());
			session.setAttribute("adminId",branch.getAdmin().getAdminId());
			session.setAttribute("functionality",branch.getFunctionality());
//			session.setAttribute("role",branch.getRole());
			return true;
		}else{
			return false;
		}
	}

	@Override
	public String getBranchFunctionality(HttpSession session) {
			if(session!=null){
				 return (String)session.getAttribute("functionality");	
				}else{
				return null;
				}
	}

	@Override
	public boolean storeSuperAdminName(HttpSession session, String name) {
		if(session!=null){
			session.setAttribute("name",name);
			
			return true;
		}else{
			return false;
	}
	}

	@Override
	public void deleteSuperAdminName(HttpSession session) {
		if(session!=null){
			session.setAttribute("name",null);
		}
	}

	@Override
	public String getAdminKey(HttpSession session) {
		if(session!=null){
			return (String)session.getAttribute("adminKey");
		}else{
		 return null;
		}
	}

	@Override
	public void setAdminKey(HttpSession session, String key) {
		if(session!=null){
			session.setAttribute("adminKey",key);
		}	
	}

	@Override
	public void setAdminLogo(HttpSession session, String logo) {
		if(session!=null){
			session.setAttribute("adminLogo",logo);
		}	
	}

	@Override
	public void setAdminId(HttpSession session, String adminId) {
		if(session!=null){
			session.setAttribute("adminId",adminId);
		}	
	}

	@Override
	public boolean setAdminTopUpTransaction(HttpSession session, String topUpTransaction) {
		if(session!=null){
			session.setAttribute("topUpTransaction",topUpTransaction);
			
			return true;
		}else{
			return false;
		}
	}

	@Override
	public String getAdminTopUpTransaction(HttpSession session) {
		if(session!=null){
			return (String)session.getAttribute("topUpTransaction");
		}else{
		 return null;
		}
	}

	@Override
	public String getCustomerEmailId(HttpSession session) {
		if(session!=null){
			return (String)session.getAttribute("emailId");
		}else{
		 return null;
		}
	}

	@Override
	public void storeStateId(HttpSession session, States states) {
		if(session!=null){
			session.setAttribute("stateId",states.getStateId());
		}
	}

	@Override
	public String storeBranchId(HttpSession session,String branchId) {
		String BranchId=null;
		// TODO Auto-generated method stub
		if(session!=null) {
			session.setAttribute("branchId",branchId);
		}
		return BranchId;
	}

	@Override
	public String storeBranchFunctionality(HttpSession session, String functionality) {
		// TODO Auto-generated method stub
		//String functionality=null;
		if(session!=null) {
			session.setAttribute("functionality", functionality);
		}
		
		return functionality;
	}

	@Override
	public String storeBranchFunctionality(String functionality) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void storeAdminId(HttpSession session, String userType) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void storeCustomerIdInSession(HttpSession session, String customerId) {
		if(session!=null){
			session.setAttribute("customerId",customerId);
		}	
		
	}

	@Override
	public String getAdminLogo(HttpSession session) {
		if(session!=null) {
			return (String)session.getAttribute("adminLogo");
		}else {
			return null;	
		}
		
	}

	@Override
	public void storeFlutterStatus(HttpSession session, String flutter) {
		if(session!=null){
			session.setAttribute("flutter",flutter);
		}	
	}

	@Override
	public String getFlutterStatus(HttpSession session) {
		if(session!=null){
			return (String)session.getAttribute("flutter");
		}else{
		 return null;
		}
	}
}
