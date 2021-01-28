package com.kws.unitedfintech.repository;

import java.util.List;
import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.kws.unitedfintech.entities.AddNewUser;
@Repository
public interface NewUserRepository extends JpaRepository<AddNewUser, String> {

	
	@Query("select a from AddNewUser a where a.admin.adminId=:adminId")
	public List<AddNewUser> findByAdminId(@Param("adminId") String adminId);
	
	@Query("select a from AddNewUser a")
	public List<AddNewUser> findAll();
	
	
	@Query("select a from AddNewUser a where a.newUserId=:newUserId")
	public AddNewUser findBynewUserId(@Param("newUserId") String newUserId);
	
	@Query("select a from AddNewUser a where a.emailId=:emailId")
	public AddNewUser findByEmail(@Param("emailId")String emailId);
}
