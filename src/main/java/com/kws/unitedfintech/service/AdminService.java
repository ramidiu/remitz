package com.kws.unitedfintech.service;

import java.util.List;

import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.kws.unitedfintech.entities.Admin;
import com.kws.unitedfintech.entities.ServiceFees;
import com.kws.unitedfintech.entities.TransactionInformation;

public interface AdminService {
	
	public Admin validateAdmin(String username , String password);
	public String validateAdminBasedOnEmailId(String emailId);
	public Admin getAdminDetailsBasedOnAdminId(String adminId);
	public List<Admin> getAllAdmin();
	public void updateAdmin(Admin admin,MultipartHttpServletRequest request);
	public List<ServiceFees> getAllLimits();
	String insertAdmin(Admin admin,MultipartHttpServletRequest request);
	public Admin checkIdPrefix(String tnxIDPrefix);
	public List<TransactionInformation> getTransactionDetailsByAdmin(String admin,String fromdate,String todate);
	public boolean updateTransactionPaymentStatus(String txnid,String paymentstatus,String ckycstatus);
	public boolean updateTransactionStatus(String tstatus,String txnid);
	//public Admin getAdminBasedOnAdminId()
	public Admin findByAdminKey(String adminKey);
	public Admin saveRemitAdmin(Admin admin);
	public void updateRemitAdmin(Admin admin,MultipartHttpServletRequest request);
	public void updateAdminNewKey(String adminId);
	public double getAdminSellRateBasedOnFromToadminid(String adminid,String fromiso,String toiso);

	public Admin gettrialDate(String trialdate,String adminId); 
}
