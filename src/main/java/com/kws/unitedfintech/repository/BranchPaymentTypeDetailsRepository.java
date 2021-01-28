package com.kws.unitedfintech.repository;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.web.bind.annotation.RequestParam;

import com.kws.unitedfintech.entities.BranchPaymentTypeDetails;
import com.kws.unitedfintech.entities.PaymentTypes;

public interface BranchPaymentTypeDetailsRepository extends CrudRepository<BranchPaymentTypeDetails, String>{

	@Query("select p from PaymentTypes p where p.paymentType=:paymenttype")
	public PaymentTypes findPaymentDetailsBasedOnType(String paymenttype);
	
	
	
	@Query("SELECT bpd FROM BranchPaymentTypeDetails bpd WHERE bpd.branchId=:branchId")
	public  List<BranchPaymentTypeDetails> findByBranchId(@RequestParam("branchId") String branchId);
	
	@Query("SELECT bpd FROM BranchPaymentTypeDetails bpd WHERE bpd.branchId.branchId=:branchId and bpd.status=:status")
	public List<BranchPaymentTypeDetails> findBranchPaymentDetailsBasedOnBranchIdAndStatus(@Param("branchId")String branchId,@Param("status")String status);
	
	@Query("select ptd from BranchPaymentTypeDetails ptd where  ptd.admin.adminId=:adminid")
	public List<BranchPaymentTypeDetails> getBranchPTypeBaseOnBranchId(String adminid);
	
	@Query("SELECT bpd FROM BranchPaymentTypeDetails bpd WHERE bpd.paymentTypes.paymentType=:paymenttype and   bpd.branchId.branchId=:branchId ")
	public BranchPaymentTypeDetails findBranchPaymentDetailsBasedOnPaymentType(@Param("paymenttype")String paymenttype,@Param("branchId")String branchId);

	/*
	 * @Transactional
	 * 
	 * @Modifying
	 * 
	 * @Query("UPDATE BranchPaymentTypeDetails ptd SET ptd.status=:status,ptd.deliveryTime=:deliverytime WHERE ptd.branchPaymentTypeDetailId=:paymentid"
	 * ) public void updateBranchPaymentType(@Param("status")String
	 * status,@Param("deliverytime")String deliverytime,@Param("paymentid")String
	 * paymentid);
	 * 
	 * @Transactional
	 * 
	 * @Modifying
	 * 
	 * @Query("update BranchPaymentTypeDetails p set p.status=:status,p.deliveryTime=:dtime where p.branchPaymentTypeDetailId=:pid"
	 * ) public void updateBPaymentTypeDetails(@Param("status")String
	 * status,@Param("dtime") String dtime,@Param("pid") String pid);
	 */

	@Transactional
	@Modifying
	@Query("update BranchPaymentTypeDetails a set a.status=:status,a.deliveryTime=:dtime where a.branchPaymentTypeDetailId=:pid")
	public void UpdateByPid(@Param("status")String status,@Param("dtime")String dtime,@Param("pid") String pid);	
	@Query("select b from BranchPaymentTypeDetails b where b.branchId.branchId=:branchId ")
	public List<BranchPaymentTypeDetails> FindByBranchId(@Param("branchId")String branchId);
	@Query("select b.deliveryTime from BranchPaymentTypeDetails b where b.branchId.branchId=:branchId and b.status=:status  and b.paymentTypes.paymentType=:paymentType")
	public String getDeliveryTime(@Param("branchId")String branchId,@Param("status")String status,@Param("paymentType")String paymentType); 
	@Query("select b from BranchPaymentTypeDetails b where b.branchPaymentTypeDetailId=:paymentid")
	public	BranchPaymentTypeDetails findByPaymentId(@Param("paymentid")String paymentid);
}
