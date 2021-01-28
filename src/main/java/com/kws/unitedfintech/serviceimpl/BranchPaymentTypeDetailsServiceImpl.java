package com.kws.unitedfintech.serviceimpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kws.unitedfintech.entities.BranchPaymentTypeDetails;
import com.kws.unitedfintech.entities.PaymentTypes;
import com.kws.unitedfintech.repository.BranchPaymentTypeDetailsRepository;
import com.kws.unitedfintech.service.BranchPaymentTypeDetailsService;
import com.kws.unitedfintech.service.BranchService;
@Service
public class BranchPaymentTypeDetailsServiceImpl implements BranchPaymentTypeDetailsService {
	@Autowired
	BranchPaymentTypeDetailsRepository bptdr;
	@Autowired
	BranchService b;
	@Override
	public PaymentTypes getPaymentTypeDetails(String paymenttype) {
		
		return bptdr.findPaymentDetailsBasedOnType(paymenttype);
	}
	@Override
	public List<BranchPaymentTypeDetails> getPaymentTypesBasedOnBranchId(String branchId) {
		return bptdr.findByBranchId(branchId);
	}
	
	@Override
	public List<BranchPaymentTypeDetails> getBranchPaymentTypeDetailsBasedOnBranchIdAndStatus(String branchId,
			String status) {
		return bptdr.findBranchPaymentDetailsBasedOnBranchIdAndStatus(branchId, status);
	}
	@Override
	public List<BranchPaymentTypeDetails> getBranchPaymentTypeBasedOnBranchId(String adminId ) {
return bptdr.getBranchPTypeBaseOnBranchId(adminId);		 
	}


	@Override
	public boolean updateBranchPaymentType(String branchid, String branchstatus, String paymentid,
			String paymentstatus,String deliverytime) {
		System.out.println("branchstatus"+branchstatus+"branchid"+branchid+"paymentstatus:"+paymentstatus+"deliverytime:"+deliverytime+"paymentid:"+paymentid);
		bptdr.UpdateByPid(paymentstatus, deliverytime, paymentid);
		b.updateStatus(branchid, branchstatus);
		return true;
}
	@Override
	public BranchPaymentTypeDetails getDeliveryTime(String paymenttype, String branchId ) {
		// TODO Auto-generated method stub
		return bptdr.findBranchPaymentDetailsBasedOnPaymentType(paymenttype, branchId);
	}
	@Override
	public List<BranchPaymentTypeDetails> getListBasedOnBranch(String branchId) {
		// TODO Auto-generated method stub
		return bptdr.findByBranchId(branchId);
	}
	@Override
	public String getDeliveryTime(String branchId, String status, String paymentType) {
		return bptdr.getDeliveryTime(branchId, status, paymentType);
	}
	@Override
	public BranchPaymentTypeDetails getById(String paymentid) {
		// TODO Auto-generated method stub
		return bptdr.findByPaymentId(paymentid);
	}
	
}