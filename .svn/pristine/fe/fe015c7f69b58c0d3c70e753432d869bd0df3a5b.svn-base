package com.kws.unitedfintech.repository;



import java.util.List;

import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.kws.unitedfintech.entities.Admin;
@Repository
public interface AdminRepository extends CrudRepository<Admin, String>{

	public Admin getAdminByemailId(String emailId);
	public Admin getAdminByadminId(String adminId);
	
	@Query("select a  from Admin a where a.transactionPrefix=:transactionidprefix")
	public Admin getTransactionIdPrefix(@Param("transactionidprefix")String transactionidprefix);
	@Query("select a from  Admin  a where a.adminKey=:adminKey")
	public Admin findByAdminKey(@Param("adminKey")String adminKey);
	@Modifying
	@Transactional
	@Query(" update Admin set address=:address,companyName=:companyName,baseCurrency=:baseCurrency,businessCountries=:businessCountries,paymentTypes=:ptypes where adminId=:adminId")
	public void updateRemitAdminDetails(@Param("address")String addres,@Param("companyName")String companyName,@Param("baseCurrency")String baseCurrency,@Param("businessCountries")String businessCountries,@Param("ptypes")String ptypes,@Param("adminId")String adminId);
	@Modifying
	@Transactional
	@Query("update Admin set adminKey=:adminKey,url=:url where adminId=:adminId")
	public void updateAdminNewKey(@Param("adminId")String adminId,@Param("adminKey")String adminKey,@Param("url")String url);
	@Query("select a from Admin a order by a.createdDate desc")
	public List<Admin> getAllAdmins();
	
	@Query("select a from Admin a where a.packageExpireDate<=:packageExpireDate and a.adminId=:adminId")
	public Admin getbyidandtrialdate(@Param("adminId")String adminId,@Param("packageExpireDate")String packageExpireDate);
}
