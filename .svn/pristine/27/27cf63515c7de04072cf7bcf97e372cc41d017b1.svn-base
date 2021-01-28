package com.kws.unitedfintech.service;

import java.util.List;

import com.kws.unitedfintech.entities.BranchPaymentTypeDetails;
import com.kws.unitedfintech.entities.PaymentTypes;

public interface BranchPaymentTypeDetailsService {

	public PaymentTypes getPaymentTypeDetails(String paymenttype);

	public List<BranchPaymentTypeDetails> getPaymentTypesBasedOnBranchId(String branchId);

	public List<BranchPaymentTypeDetails> getBranchPaymentTypeDetailsBasedOnBranchIdAndStatus(String branchId,
			String status);

	public List<BranchPaymentTypeDetails> getBranchPaymentTypeBasedOnBranchId(String adminid);

	public boolean updateBranchPaymentType(String branchstatus, String branchid, String paymentstatus,
			String deliverytime, String paymentid);

	public BranchPaymentTypeDetails getDeliveryTime(String paymenttype, String branchId);

	public List<BranchPaymentTypeDetails> getListBasedOnBranch(String branchId);
	
	public String getDeliveryTime(String branchId,String status,String paymentType);

	public BranchPaymentTypeDetails getById(String paymentid);
}
