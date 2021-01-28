package com.kws.unitedfintech.repository;



import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;

import com.kws.unitedfintech.entities.ServiceFees;

public interface ServiceFeeRepo extends CrudRepository<ServiceFees, String> {

	
	
	@Query("select sf from ServiceFees sf where sf.admin.adminId=:adminid and  sf.status=:status")
	public List<ServiceFees> getAllByAdminId(@Param("adminid")String adminid,@Param("status")String status);
	
	@Query("select sf from ServiceFees sf where sf.serviceFeeId=:sfid and sf.admin.adminId=:adminid")
	public ServiceFees findDetailsByServicefeeId(@Param("sfid")String sfid,@Param("adminid")String adminid);
	


	@Query("SELECT sf FROM ServiceFees sf WHERE sf.fromBranch.branchId=:fromBranchId AND sf.toBranch.branchId=:toBranchId")
	public List<ServiceFees> getServiceFeeBasedonFromBranchIdtoBranchIds(@Param("fromBranchId")String fromBranchId,@Param("toBranchId")String toBranchId);
	

	
	

	@Query("SELECT sf FROM ServiceFees sf WHERE sf.fromBranch.branchId=:fromBranchId AND sf.toBranch.branchId=:toBranchId AND sf.paymentType=:p")
	public List<ServiceFees> getServiceFeeBasedonFromBranchIdtoBranchId(@Param("fromBranchId")String fromBranchId,@Param("toBranchId")String toBranchId,@Param("p")String p);
	
	@Query("SELECT sf FROM ServiceFees sf WHERE sf.fromBranch.branchId=:fromBranchId AND sf.toBranch.branchId=:toBranchId AND sf.admin.adminId=:adminid AND sf.paymentType=:p")
	public List<ServiceFees> getServiceFeeBasedonFromBranchIdtoBranchId(@Param("fromBranchId")String fromBranchId,@Param("toBranchId")String toBranchId,@Param("adminid")String adminid,@Param("p")String p);
	
	@Query("SELECT sf FROM ServiceFees sf WHERE   sf.fromBranch.branchId=:fromBranchId AND sf.toBranch.branchId=:toBranchId AND sf.minValue<=:amount AND sf.maxValue>=:amount AND sf.paymentType=:p")
	public ServiceFees getSpecificServiceFee(@Param("fromBranchId")String fromBranchId,@Param("toBranchId")String toBranchId,@Param("amount")double amount,@Param("p")String p);
	
	@Query("SELECT sf FROM ServiceFees sf WHERE   sf.fromBranch.branchId=:fromBranchId AND sf.toBranch.branchId=:toBranchId AND sf.admin.adminId=:adminId AND sf.minValue=:minValue AND sf.maxValue=:maxValue AND sf.serviceFee=:serviceFee AND sf.rateType=:rateType AND sf.paymentType=:paymentType")
public List<ServiceFees> getduplicate(@Param("fromBranchId")String fromBranchId,@Param("toBranchId")String toBranchId,@Param("adminId")String adminId,@Param("minValue")double minValue,@Param("maxValue")double maxValue,@Param("serviceFee")double serviceFee,@Param("rateType")String rateType,@Param("paymentType")String paymentType);

	@Query("SELECT sf FROM ServiceFees sf WHERE   sf.fromBranch.branchId=:fromBranchId AND sf.toBranch.branchId=:toBranchId AND sf.paymentType=:ptype ORDER BY sf.maxValue ASC")
	public List<ServiceFees> getbyfrombranchAndtobranchAndpaymenttype(@Param("fromBranchId")String fromBranchId,@Param("toBranchId")String toBranchId,@Param("ptype")String ptype);

	@Query("SELECT sf FROM  ServiceFees sf WHERE sf.serviceFeeId=:sfid")
	public ServiceFees getByServiceFeeId(@Param("sfid")String sfid);



	@Query("SELECT  coalesce(max(s.maxValue), 0) FROM ServiceFees s WHERE s.fromBranch.branchId=:fromBranch AND s.toBranch.branchId=:toBranch AND s.paymentType=:paymentType")
	double getMaxValue(@Param("fromBranch")String fromBranch,@Param("toBranch")String toBranch,@Param("paymentType")String paymentType);
 
	@Query("SELECT s FROM ServiceFees s WHERE s.fromBranch.branchId=:fromBranch AND s.toBranch.branchId=:toBranch AND s.paymentType=:paymentType AND s.maxValue=:maxValue")
	public ServiceFees getByMaxValueAndPtype(@Param("fromBranch")String fromBranch,@Param("toBranch")String toBranch,@Param("paymentType")String paymentType,@Param("maxValue")double maxValue);

	
	@Query("SELECT sf FROM ServiceFees sf WHERE sf.fromBranch.branchId=:fromBranch AND sf.toBranch.branchId=:toBranch")
	public List<ServiceFees> getbyfromtobranches(@Param("fromBranch")String fromBranch,@Param("toBranch")String toBranch);
	

}
