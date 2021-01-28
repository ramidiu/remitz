package com.kws.unitedfintech.service;

import java.util.List;

import org.springframework.data.repository.query.Param;

import com.kws.unitedfintech.entities.ModeOfPaymentFees;
import com.kws.unitedfintech.entities.ModeOfPayments;


public interface ModeOfPaymentsService {
	
	//public void saveModeOfPayments(ModeOfPaymentFees modeOfPaymentFees,Admin admin,String branchId);
	
	public List<ModeOfPaymentFees> getAllModeOfPaymentFees();
	
	
	//public List<ModeOfPaymentFees> getAllModeOfPaymentFeesBasedOnAdminId(String adminId);
	
	public List<ModeOfPayments> getAllModeOfPaymets();
	
	public void updateModeOfPaymentFees(ModeOfPaymentFees modeOfPaymentFees);
	
	public ModeOfPayments getModeOfPaymentBasedOnId(String id);
	
	public ModeOfPayments getModeofPaymentIdBasedOnModeOfPayment(String modeOfPayment);

	
	public ModeOfPayments getModeOfPaymentBasedOnName(String branchname);
	
	public ModeOfPaymentFees getModeOfPaymentFeeBasedOnBranchIdAndModeOfPayment(String branchId,String modeOfPayment);
	public List<ModeOfPaymentFees> getModeOfPaymentFeeBasedOnBranchId(String branchId);
	public List<ModeOfPaymentFees> getModeOfPaymentFeeBasedOnBranchIdAndDisplay(String branchId,String display);
	public ModeOfPaymentFees getModeOfPaymentFeeBasedOnBranchIdAndModeOfPaymentAndAmount(String branchId,String modeOfPayment,String Amount);
	public ModeOfPaymentFees getdoubleAmount(String branchId,String modeOfPayment,Long Amount);
	
	public List<ModeOfPaymentFees> getList(String branchId,String display,double Amount);
	public List<ModeOfPaymentFees> getModeOfPaymentFeeBasedOnBranchIdAndModeOfPayments(String branchId,String modeOfPayment);

	//void saveModeOfPayments(ModeOfPaymentFees modeOfPaymentFees, Double fee);
}
