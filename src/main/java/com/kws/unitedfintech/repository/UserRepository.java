package com.kws.unitedfintech.repository;

import java.util.Optional;

import javax.transaction.Transactional;

import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.web.bind.annotation.RequestParam;

import com.kws.unitedfintech.entities.User;
public interface UserRepository extends CrudRepository<User, String> {

	Optional<User> findByUserName(String userName);
	User findByUserNameAndPassword(String userName,String password);
	
	 @Transactional
	  @Modifying
	@Query("update User u set u.password=:password where u.userType=:userType")
	public void updatePasswordByUserType(@Param("userType")String userType,@Param("password")String password);	

	 @Transactional
	  @Modifying
	@Query("update User u set u.password=:pwd where u.userType=:userType")
public void updateuserpwd(@Param("pwd")String pwd,@Param("userType")String userType);
	 
	 
	 @Query("select u from User u where u.userName=:userName")
	 public User checkByUserName(@RequestParam("userName")String userName);


} 
