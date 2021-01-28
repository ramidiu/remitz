package com.kws.unitedfintech.repository;

import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.kws.unitedfintech.entities.AuditTrail;

@Repository
public interface AuditTrailRepository extends CrudRepository<AuditTrail,String>{

	
	
	
	
	@Query("select a from AuditTrail a where a.adminId=:adminId")
	public List<AuditTrail> getalllist(String adminId);
	
	@Query("select a from AuditTrail a where a.date>=:date1 and a.date<=:date2 and a.adminId=:adminId ")
public List<AuditTrail> getByDate(@Param("date1")String date1,@Param("date2")String date2,String adminId);
	
	@Query("select a from AuditTrail a where a.date>=:date1 and a.date<=:date2 and a.userName=:username and a.adminId=:adminId")
public List<AuditTrail> getByDateAndUserNmae(@Param("date1")String date1,@Param("date2")String date2,String username,String adminId);

	@Query("select a from AuditTrail a where a.userName=:username and a.adminId=:adminId")
	public List<AuditTrail> getbyusername(@Param("username")String username,String adminId);

	@Query("select a from AuditTrail a where a.userId=:userid and a.adminId=:adminId")
	public List<AuditTrail> getbyuserid(@Param("userid")String userid,String adminId);
	
	@Query("select a from AuditTrail a where a.agent=:agent and a.adminId=:adminId")
	public List<AuditTrail> getbyagent(@Param("agent")String agent,String adminId);

	@Query("select a from AuditTrail  a where a.date>=:date1 and a.date<=:date2 and a.agent=:agent and a.adminId=:adminId")
public List<AuditTrail> getByDateAndAgent(@Param("date1")String date1,@Param("date2")String date2,String agent,String adminId);

	
	@Query("select a from AuditTrail a where a.date>=:date1 and a.date<=:date2 and a.userName=:username and a.agent=:agent and a.adminId=:adminId")
public List<AuditTrail> getByDateAndUserNmaeAndAgent(@Param("date1")String date1,@Param("date2")String date2,String username,@Param("agent")String agent,String adminId);
	
}
