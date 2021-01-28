package com.kws.unitedfintech.repository;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;

import com.kws.unitedfintech.entities.Branch;

public interface BranchRepository extends CrudRepository<Branch, String>{

	//
	//public List<Branch> getBranchBasedOnAdminId(@Param("adminId") String adminId);
	
	
	@Query("SELECT b FROM Branch b WHERE b.admin.adminId=:adminId")
	public List<Branch> findAllByadmin(@Param("adminId") String adminId);
	
	
	
	@Query("SELECT b FROM Branch b WHERE b.emailId=:emailId AND b.password=:password")
	public Branch findAllByEmailidAndPassword(@Param("emailId") String emailId,@Param("password") String password);
	
	
	
	
	public Branch findByemailId(String emailId);
	
	@Query("SELECT b FROM Branch b WHERE b.admin.adminId=:adminId AND b.fromCountry.countryISO=:countryISO")
	public Branch findBranchByCountryAndAdminId(@Param("countryISO") String countryISO,@Param("adminId") String adminId);
	
	@Query("select b from Branch b where b.branchId=:branchId")
	public Branch findBybranchIds(String branchId);
	
	@Query("select b from Branch b where b.admin.adminId=:adminId")
	public List<Branch> findByAdminId(@Param("adminId") String adminId);
	
    @Query("select b from Branch b where b.functionality!=:functionality and b.admin.adminId=:adminId")
	public List<Branch> findByFunctionalityAndAdminId(@Param("functionality") String functionality ,@Param("adminId")String adminId);
	
	
	
	@Query("SELECT b FROM Branch b WHERE b.branchId=:branchId")
	public Branch findBybranchId(String branchId);
	
	@Query("SELECT b FROM Branch b WHERE b.branchId=:branchId AND b.admin.adminId=:adminId")
	public Branch findBybranchIdAndAdminId(@Param("adminId") String adminId,@Param("branchId") String branchId);
	
	@Query("SELECT b FROM Branch b WHERE b.admin.adminId=:adminId AND b.functionality!=:functionality and b.status=:status and b.defaultFlag=:defaultFlag")
	public List<Branch> getAllBranchesBasedOnFunctionalityAndAdminId(@Param("adminId") String adminId,@Param("functionality") String functionality,String status,String defaultFlag);
	
	@Query("SELECT b FROM Branch b WHERE b.admin.adminId=:adminId AND b.functionality!=:functionality and b.status=:status")
	public List<Branch> getAllBranchesBasedOnFunctionalityAndAdminIdwithoutFlag(@Param("adminId") String adminId,@Param("functionality") String functionality,String status);
	
	
	
	@Query("SELECT b FROM Branch b WHERE b.admin.adminId=:adminId AND b.functionality!=:functionality and b.status=:status")
	public List<Branch> getAllBranchesBasedOnFunctionalityAndAdminIdBackend(@Param("adminId") String adminId,@Param("functionality") String functionality,String status);
	
	
	
	@Query("SELECT b FROM Branch b WHERE b.admin.adminId=:adminId AND b.functionality=:functionality and b.status=:status and b.defaultFlag=:defaultFlag")
	public List<Branch> getAllRecBranchesBasedOnFunctionalityAndAdminId(@Param("adminId") String adminId,@Param("functionality") String functionality,@Param("status")String status,@Param("defaultFlag")String defaultFlag);
	
	@Query("SELECT b FROM Branch b WHERE b.admin.adminId=:adminId AND b.functionality!=:functionality AND b.branchId!=:branchId and b.status=:status and b.defaultFlag=:defaultFlag")
	public List<Branch> getAllBranchesBasedOnFunctionalityAndExceptGivenBranchAndAdminId(@Param("adminId") String adminId,@Param("functionality") String functionality,@Param("branchId") String givenBranch,String status,@Param("defaultFlag")String defaultFlag);
	
	
	@Query("SELECT b FROM Branch b WHERE b.functionality!=:functionality")
	public List<Branch> getAllBranchesBasedOnFunctionality(@Param("functionality") String functionality);
	
	
	@Query("select b from Branch b where b.admin.adminId=:adminid and (b.functionality='receiving' or b.functionality='both') and b.defaultFlag=:defaultFlag")
	public List<Branch> getAllReceivingAndBothBasedOnAdminid(String adminid,String defaultFlag);

	@Query("select b from Branch b where b.admin.adminId=:adminid and b.functionality=:functionality and b.defaultFlag=:defaultFlag")
	public List<Branch> getRecevingBranchesBasedOnAdminId(String adminid,String functionality,String defaultFlag);
	
	@Transactional
	@Modifying
	@Query("update Branch b set b.status=:bstatus where b.branchId=:bid")
	public void udpateBranchStatus(String bid,String bstatus);

	@Query("select b from Branch b where b.branchId=:branchId")
	public List<Branch> findListBybranchIds(String branchId);
	
	
	
	
	@Query("SELECT b FROM Branch b WHERE b.functionality=:functionality and b.fromCountry.countryISO=:countryIso and b.admin.adminId=:adminId")
	public List<Branch> getAllBranchesBasedOnFunctionalityAndCountryISoAndAdminId(@Param("functionality") String functionality,@Param("countryIso") String countryIso,@Param("adminId")String adminId);

	
	
	
	@Query("SELECT b FROM Branch b WHERE b.functionality=:functionality and b.fromCountry.countryISO=:countryiso and b.defaultFlag=:defaultFlag and b.admin.adminId=:adminId")
	public Branch getbyfunctionalityisoanddefaultflag(@Param("functionality")String functionality,@Param("countryiso")String countryiso,@Param("defaultFlag")String defaultFlag,@Param("adminId")String adminId);



	@Query("SELECT b FROM Branch b WHERE b.admin.adminId=:adminId and b.functionality!=:functionality")
	public List<Branch>  getByAdminAndFunctionality(@Param("adminId")String adminId,@Param("functionality")String functionality);

	
	@Query("SELECT b FROM Branch b WHERE b.admin.adminId=:adminId and b.functionality!=:functionality and b.fromCountry.countryISO=:countryiso")
public List<Branch>  getByAdminAndFunctionalityAndCountryiso(@Param("countryiso")String countryiso,@Param("adminId")String adminId,@Param("functionality")String functionality);
	
	@Query("SELECT b FROM Branch b WHERE b.admin.adminId=:adminId AND b.functionality!=:functionality and b.status=:status and b.procesBank=:pb")
	public List<Branch> getbyprocessbankflag(@Param("adminId") String adminId,@Param("functionality") String functionality,String status,String pb);
	
}
