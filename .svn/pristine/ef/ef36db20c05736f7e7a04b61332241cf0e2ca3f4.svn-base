package com.kws.unitedfintech.repository;

import java.util.List;

import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestParam;

import com.kws.unitedfintech.entities.SourceOfFunds1;

@Repository
public interface SourceOfFundsRepository extends CrudRepository<SourceOfFunds1, String> {
	
	@Query("select s from SourceOfFunds1 s where s.admin.adminId=:adminId ")
	 List<SourceOfFunds1> findAll(@RequestParam("adminId") String adminId);
	
	/*
	 * @Transactional
	 * 
	 * @Modifying
	 * 
	 * @Query("update SourceOfFunds1 s set s.sourceOfFund=:sourceOfFund where s.sourceOffundId=:sourceOffundId"
	 * ) public void edit(@RequestParam("sourceOfFund")String sourceOfFund ,int
	 * sourceOffundId);
	 * 
	 */	
	
	@Query("select s from SourceOfFunds1 s where s.admin.adminId=:adminId and s.sourceOffundId=:sourceOffundId")
	public SourceOfFunds1 findbyAdminAndId(@RequestParam("adminId")String adminId,int sourceOffundId);


	@Transactional
	@Modifying
	@Query("delete  from SourceOfFunds1 where sourceOffundId=:sourceOffundId")
	public void deleteBySourceOffundId(@Param("sourceOffundId")int sourceOffundId);





}
