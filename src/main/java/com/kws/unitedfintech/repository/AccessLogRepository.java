package com.kws.unitedfintech.repository;

import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.kws.unitedfintech.entities.AccessLog;

@Repository
public interface AccessLogRepository extends CrudRepository<AccessLog, String> {

	
	@Query("select a from AccessLog a where a.adminId=:adminId")
	public List<AccessLog> getList(@Param("adminId")String adminId);
	
	@Query("select a from AccessLog a where a.acessId=:aid and a.userid=:userid and a.adminId=:adminId")
public AccessLog AccessLogbyid(@Param("aid")String aid,@Param("userid")String userid,String adminId);

	@Query("select a from AccessLog a where a.acessId=:aid")
public AccessLog getbyaid(@Param("aid")String aid);
	
	@Query("select a from AccessLog a where  a.logOnTime>=:logondate and a.logOnTime<=:logoffdate and a.adminId=:adminId")
public List<AccessLog> getlistbetweendates(@Param("logondate")String logondate,@Param("logoffdate") String logoffdate,String adminId);

	@Query("select a from AccessLog a where  a.logOnTime>=:logondate and a.logOnTime<=:logoffdate and a.userType=:userType and a.adminId=:adminId")
public List<AccessLog> getlistbwdatesandusertype(@Param("logondate")String logondate,@Param("logoffdate")String logoffdate,@Param("userType")String userType,String adminId);	

	@Query("select a from AccessLog a where  a.logOnTime>=:logondate and a.logOnTime<=:logoffdate and a.userType=:userType and a.userName=:username and a.adminId=:adminId")
public List<AccessLog> getlistbwdatesandusertypeandusername(@Param("logondate")String logondate,@Param("logoffdate")String logoffdate,@Param("userType")String userType,@Param("username")String username,String adminId);	

	@Query("select a from AccessLog a where a.userType=:userType and a.adminId=:adminId")
	public List<AccessLog> getListByUserType(@Param("userType")String userType,String adminId); 	

	@Query("select a from AccessLog a where a.userName=:username and a.adminId=:adminId")
	public List<AccessLog> getListByUsername(@Param("username")String username,String adminId); 	

	@Query("select a from AccessLog a where  a.logOnTime>=:logondate and a.logOnTime<=:logondate and a.logOffTime>=:logoffdate and a.logOffTime<=:logoffdate and a.userName=:username and a.adminId=:adminId")
public List<AccessLog> getlistbwdatesandusername(@Param("logondate")String logondate,@Param("logoffdate")String logoffdate,@Param("username")String username,String adminId);	

	
	@Query("select a from AccessLog a where a.userType=:userType and a.userName=:username and a.adminId=:adminId")
	public List<AccessLog> getListByUserTypeAnduserName(@Param("userType")String userType,@Param("username")String username,String adminId); 	

}
