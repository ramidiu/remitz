package com.kws.unitedfintech.repository;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;

import com.kws.unitedfintech.entities.Beneficiary;

public interface BeneficiaryRepository extends CrudRepository<Beneficiary, String>{

	@Query("SELECT b FROM Beneficiary b WHERE b.customer.customerId=:customerId AND b.accType=:paymentType AND b.beneficiaryCountry.countryISO=:countryISO")
	public List<Beneficiary> getBeneficiaryBasedOnCustomerCountryISOPaymentType(@Param("customerId")String customerId,@Param("paymentType")String paymentType,@Param("countryISO")String receivingCountryISO);

	@Query("select b from Beneficiary b where b.beneficiaryId=:beneficiaryId")
	public Beneficiary findByBeneficiaryId(@Param("beneficiaryId")String beneficiaryId);

	
	
	
	@Query("select b from Beneficiary b where b.customer.customerId=:customerId")
	public List<Beneficiary> getAll(@Param("customerId")String customerId);
	
	
	@Transactional
	@Modifying
	@Query("update Beneficiary t set t.firstName=:firstName,t.lastName=:lastName, t.relationShip=:relationShip,t.mobileNumber=:mobileNumber, t.sendingReason=:sendingReason,t.idProofNo=:idProofNo,t.bankName=:bankName where t.beneficiaryId=:beneficiaryId")
	public void updatedByBeneficiaryId(String firstName,String lastName,String relationShip,String mobileNumber,String sendingReason,String idProofNo, String bankName,String beneficiaryId);
	
	@Transactional
	@Modifying
	@Query("delete  from Beneficiary where beneficiaryId=:beneficiaryId")
	public void deleteByBeneficiaryId(@Param("beneficiaryId")String beneficiaryId);

	
	@Query("from Beneficiary b where b.admin.adminId=:adminid and b.customer.customerId=:custid and b.accType=:ptype")
	public List<Beneficiary> getBeneficiariesBasedOnCustomerid(String adminid,String custid,String ptype);
	

	
	
	@Query("from Beneficiary c where c.firstName like %:firstName% and c.customer.customerId=:customerId")
public List<Beneficiary> getBysearch(@Param("firstName")String firstName,@Param("customerId")String customerId);



@Query("from Beneficiary b where b.firstName=:firstName and b.lastName=:lastName and b. mobileNumber=:mobileNumber or b.addressLine1=:addressLine1")
public List<Beneficiary> getDuplicateBeneficiary(@Param("firstName") String firstName,@Param("lastName") String lastName,@Param("mobileNumber")String mobileNumber,@Param("addressLine1")String addressLine1);


}
