package com.kws.unitedfintech.repository;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.RequestParam;

import com.kws.unitedfintech.entities.Customer;

@Repository
public interface CustomerRepository extends JpaRepository<Customer, String> {
	 
	 @Query("select u from Customer u where u.emailId=:userName")
	 public Customer checkByUserNames(@RequestParam("userName")String userName);

	@Query("from Customer c where  c.status=:customerStatus and  c.branch.branchId = :branchId order by createdDate desc")
	 List<Customer> findAllByBranchIdAndCustomerStatus(@Param("branchId") String branchId,@Param("customerStatus") String customerStatus);

	
	 @Transactional
	  @Modifying
	@Query("update Customer c set c.status=:status where c.customerId=:customerId")
	public void UpdateCustomerStatusByCustomerID(@Param("customerId") String customerId,@Param("status") String status);

	 @Query("from Customer c where c.status=:customerStatus and c.admin.adminId=:adminId order by createdDate desc")
	 List<Customer> findAllByAdminIdAndCustomerStatus(@Param("adminId") String adminId,@Param("customerStatus") String customerStatus);
	 
	 
	 @Query("FROM Customer c WHERE c.customerId=:customerId")
	 public Customer findBycustomerId(@Param("customerId") String customerId);
	
	 @Query("FROM Customer c WHERE c.admin.adminId=:adminid")
	 public List<Customer> getAllCustomerById(@Param("adminid") String adminid);
	 
	 @Transactional
	  @Modifying
	 @Query("UPDATE  Customer c SET c.firstName=:firstName,c.occupation=:occupation,c.lastName=:lastName,c.emailId=:emailId,c.dob=:dob,c.mobileNumber=:mobileNumber,c.postalCode=:postalCode WHERE c.customerId=:customerId")
	 public void updateCustomer(@Param("customerId") String customerId,@Param("occupation")String occupation,@Param("firstName")String firstName,@Param("lastName")String lastName,@Param("emailId")String emailId,@Param("dob")String dob,@Param("mobileNumber")String mobileNumber,@Param("postalCode")String postalCode);




	 @Transactional
	  @Modifying
	 @Query("update Customer c set c.password=:pwd where c.customerId=:custId")
	 public void updatepwd(@Param("pwd")String pwd,@Param("custId") String custId);
	 
	 
	 
	 @Query("from Customer c where c.userName=:userName and c.password=:password")
	 public Customer validateCustomer(@Param("userName")String userName,@Param("password")String password)
;

	 
	 @Query("from Customer c where c.emailId=:emailId")
	 public Customer findByEmail(@Param("emailId")String emailId);
	 
	
	 @Query("from Customer c where c.emailId=:emailId")
	 public Customer findByEmailId(@Param("emailId")String emailId);

	 @Query("from Customer mt where mt.branch.branchId=:branchid and(mt.mobileNumber=:mobileno or mt.firstName=:firstname or mt.lastName =:lastname or mt.dob =:dob or mt.emailId =:emailid or mt.firstIdNumber =:firstidnumber or mt.address1 =:address or mt.postalCode=:postalcode or mt.cityOrState=:citystate)") 
		public List<Customer> getAllCustomerBasedOnBranchId(@Param("branchid")String branchid,@Param("mobileno")String mobileno,@Param("firstname")String firstname,@Param("lastname")String lastname,@Param("dob")String dob,@Param("emailid") String emailid,@Param("firstidnumber") String firstidnumber,@Param("address") String address,@Param("postalcode")String postalcode ,@Param("citystate")String citystate);
	 @Query(" from Customer c where c.admin.adminId=:adminId and sanctionSearchFlag=:sanctionSearchFlag")
	 public List<Customer> getSanctionCustomers(String adminId,String sanctionSearchFlag);
	 @Transactional
	 @Modifying
	 @Query("update Customer c set c.sanctionSearchFlag=:sanctionSearchFlag where c.customerId=:customerId")
	 public void updateSanctionSearchStatus(String customerId,String sanctionSearchFlag);

@Query("from Customer c where c.sanctionSearchFlag=:sanctionSearchFlag and c.admin.adminId=:adminId")
public List<Customer> getBysanctionSearchFlag(@RequestParam("sanctionSearchFlag")String sanctionSearchFlag,@RequestParam("adminId")String adminId);

@Query("from Customer c where c.firstIdExpireDate<=:firstIdExpireDate")
public List<Customer> getByexpiredate(@RequestParam("firstIdExpireDate") String firstIdExpireDate);







@Query("from Customer c where c.firstName like %:frstName% and c.branch.branchId=:branchId")
public List<Customer> SearchCustomer(@Param("frstName")String frstName,@Param("branchId")String branchId);




@Query("from Customer c where c.firstName=:firstName and c.lastName=:lastName or c.emailId=:emailId and c.dob=:dob and c.address1=:address1 and c.mobileNumber=:mobileNumber")
public List<Customer> getDuplicateCustomer(@Param("firstName") String firstName,@Param("lastName") String lastName,@Param("emailId")String emailId,@Param("dob")String dob,@Param("address1") String address1,@Param("mobileNumber") String mobileNumber);
}
