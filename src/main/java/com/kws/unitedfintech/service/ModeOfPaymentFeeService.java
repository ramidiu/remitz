package com.kws.unitedfintech.service;

import java.util.List;

import com.kws.unitedfintech.entities.Admin;
import com.kws.unitedfintech.entities.ModeOfPaymentFees;

public interface ModeOfPaymentFeeService {
	
	public void saveModeOfPayments(ModeOfPaymentFees modeOfPaymentFees,Admin admin);

	public List<ModeOfPaymentFees> getAllList();
	public ModeOfPaymentFees getModeOfPaymentBasedOnName(String name);
	public String saveModeOfPaymentLimitation(ModeOfPaymentFees mop);
	public List<ModeOfPaymentFees> getAllByBranchId(String branchId);
	public String updateModeOfPaymentFeeLimit(String mopfeeid,Double fee,String rateType);
	public boolean updateFee(String modeOfPaymentFeeId,Double fee,String adminId);
	public String deleteModeOfPaymentLimit(String mopfeeid);
	
	//public List<ModeOfPaymentFees> getAllGroupByBranchIdBasedOnAdminId(String adminId);
	public List<ModeOfPaymentFees> getAllMopFeesBasedOnAdminidBranchidPaymentId(String adminid,String branchid,String mopid);
	
	public List<ModeOfPaymentFees> getAllModeOfPaymentFeesBasedOnAdminId(String adminId);

	List<ModeOfPaymentFees> getAllGroupByBranchId(String adminId,String status);
	
	public void updateStatusByBranchId(String branchId,String adminId,String modeofpayments);

	public ModeOfPaymentFees getModeofpaymentById(String id);
}
