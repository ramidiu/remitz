package com.kws.unitedfintech.service;

import java.util.List;

import com.kws.unitedfintech.entities.ServiceFees;

public interface FeeService {
	public List<ServiceFees> getListOfServiceFeeBasedOnFromBranchAndToBranchIds(String fromBranchId, String toBranchId);

	public List<ServiceFees> getAllBranchesBasedOnAdminId(String adminid);

	public boolean addFeeLimitation(double minvalue, double maxvalue, double fee, String frombranch, String tobranch,
			String adminid, String rateType);

	public boolean updateFeeLimitation(String servicefeeid, int fee, String adminid, String rateType);

	public boolean deleteFeeLimitation(String sfid, String adminid);

	public List<ServiceFees> getListOfServiceFeeBasedOnFromBranchAndToBranchId(String fromBranchId, String toBranchId,
			String p);

	public List<ServiceFees> getListOfServiceFeeBasedOnFromBranchAndToBranchId(String fromBranchId, String toBranchId,
			String adminid, String p);

	public double getServiceFeeBasedonMinMaxFromBranchIdtoBranchIdAndAdminId(String minvalue, String maxvalue,
			String fromBranchId, String toBranchId, String adminId);

	public ServiceFees getSpecificServiceFeeBasedOnFromBranchAndToBranchId(String fromBranchId, String toBranchId,
			String amount, String p);

	public boolean addFeeLimitation1(double minvalue, double maxvalue, double sfee, double pfee, String frombranch,
			String tobranch, String adminid, String rateType, String ptype);

	public List<ServiceFees> getByFromBranchToBranchAndPaymentType(String fromBranch, String toBranch, String ptype);

	public ServiceFees getByServiceFeeId(String sfid);

	public void updtefee(ServiceFees sf);

	public double getmaxvalue(String fromBranch, String toBranch, String paymentType);

	public ServiceFees getbymaxvalueptype(String fromBranch, String toBranch, String ptype, double maxValue);

	public List<ServiceFees> getbyfromtobranchhes(String fromBranch, String toBranch);
	/** This Service Returns the All ServiceFee Slabs Based On AdminId*/
	public List<ServiceFees> getAllServiceFeesBasedAdminId(String adminId,String status);
}
