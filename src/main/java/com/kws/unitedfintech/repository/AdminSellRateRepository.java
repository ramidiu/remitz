package com.kws.unitedfintech.repository;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;

import com.kws.unitedfintech.entities.AdminSellRates;

public interface AdminSellRateRepository extends CrudRepository<AdminSellRates, String>{
	
	@Query("SELECT ASRC FROM AdminSellRates ASRC WHERE ASRC.admin.adminId=:adminId AND ASRC.rateFlag=:rateFlag AND ASRC.status=:status")
	public List<AdminSellRates> findAllByAdminId(@Param("adminId") String adminId,@Param("rateFlag")String rateFlag,@Param("status")String status);


	
	@Query("SELECT ASRC FROM AdminSellRates ASRC WHERE ASRC.admin.adminId=:adminId AND ASRC.fromBranch.branchId=:fromBranchId AND ASRC.toBranch.branchId=:toBranchId")
	public AdminSellRates getAllAdminSellRateBasedOnFromBranchIdAndToBranchId(@Param("adminId") String adminId,@Param("fromBranchId") String fromBranchId,@Param("toBranchId") String toBranchId);
	@Query("SELECT ASRC FROM AdminSellRates ASRC WHERE ASRC.admin.adminId=:adminId AND ASRC.fromBranch.fromCountry.currencyCode=:fromIso AND ASRC.toBranch.fromCountry.currencyCode=:toIso")
	public double getAdminSellRateBasedOnFromAndToIso(@Param("adminId") String adminId,@Param("fromIso") String fromIso,@Param("toIso") String toIso);
	
	@Transactional
	@Modifying
	@Query("update AdminSellRates a set a.masterRate=:masterRate,a.rateUpdatedDate=:updatedDate where a.crId=:crId")
	public void UpdateMasterRateByCrid(@Param("masterRate")Object masterRate,@Param("updatedDate")String updatedDate,@Param("crId") String crId);	

	@Query("SELECT  ASRC FROM AdminSellRates ASRC WHERE ASRC.fromBranch.branchId=:fromBranchId AND ASRC.toBranch.branchId=:toBranchId AND ASRC.paymentType=:paymentType AND ASRC.rateFlag=:rateFlag")
	public AdminSellRates getCurrencyRateBasedOnFromBranchIdAndToBranchId(@Param("fromBranchId") String fromBranchId,@Param("toBranchId") String toBranchId,@Param("paymentType")String paymentType,@Param("rateFlag")String rateFlag);
	
	//ASRC.sellRate
	@Query("select bsr from AdminSellRates bsr where bsr.fromBranch.branchId=:branchid and bsr.admin.adminId=:adminid")
	public List<AdminSellRates>findSpecificBranchSellRateBasedOnFromBranchAdmin(String branchid,String adminid);
	
	@Query("SELECT ASRC FROM AdminSellRates ASRC WHERE ASRC.admin.adminId=:adminId AND ASRC.fromBranch.branchId=:fromBranchId AND ASRC.toBranch.branchId=:toBranchId")
	public AdminSellRates getSpecificAdminSellRateBasedOnFromBranchIdAndToBranchId(@Param("adminId") String adminId,@Param("fromBranchId") String fromBranchId,@Param("toBranchId") String toBranchId);
	
	@Query("SELECT ASRC FROM AdminSellRates ASRC WHERE ASRC.admin.adminId=:adminId AND ASRC.fromBranch.branchId=:fromBranchId AND ASRC.toBranch.branchId=:toBranchId and ASRC.paymentType=:paymentType and ASRC.rateFlag=:rateFlag")
	public List<AdminSellRates> getSpecificAdminSellRateBasedOnFromBranchIdAndToBranchIdAndPaymentType(@Param("adminId") String adminId,@Param("fromBranchId") String fromBranchId,@Param("toBranchId") String toBranchId,@Param("paymentType")String paymentType,@Param("rateFlag")String rateFlag);

	
	@Query("select a from AdminSellRates a where a.rateType=:paymentType and a.toBranch.branchId=:branchId")
	public List<AdminSellRates> finByBranchAndPayment(@Param("branchId") String branchId,@Param("paymentType")String paymentType);

@Query("SELECT ASRC FROM AdminSellRates ASRC WHERE ASRC.toBranch.branchId=:toBranchId AND ASRC.rateFlag=:rateFlag")
public List<AdminSellRates> findAllByToBranchId(@Param("toBranchId") String toBranchId,@Param("rateFlag")String rateFlag);

@Query("SELECT ASRC FROM AdminSellRates ASRC WHERE ASRC.crId=:crId")
public AdminSellRates findAllByCrId(@Param("crId") String crId);


@Query("SELECT A FROM AdminSellRates A  WHERE A.toBranch.branchId=:branchId AND A.paymentType=:paymentType")
public List<AdminSellRates> findByToBranch(@Param("branchId")String branchId,@Param("paymentType")String paymentType);


@Query("SELECT  ASRC FROM AdminSellRates ASRC WHERE ASRC.fromBranch.branchId=:fromBranchId AND ASRC.toBranch.branchId=:toBranchId  AND ASRC.rateFlag=:rateFlag")
public List<AdminSellRates> getbyfromTobranchRateflag(@Param("fromBranchId") String fromBranchId,@Param("toBranchId") String toBranchId,@Param("rateFlag")String rateFlag);


}
