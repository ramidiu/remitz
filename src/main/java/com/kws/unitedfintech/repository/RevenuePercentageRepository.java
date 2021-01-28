package com.kws.unitedfintech.repository;

import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.kws.unitedfintech.entities.RevenuePercentage;


@Repository
public interface RevenuePercentageRepository extends CrudRepository<RevenuePercentage, String> {

	
	@Query("select r from RevenuePercentage r where r.fromBranch.branchId=:fagent and r.toBranch.branchId=:tagent and r.admin.adminId=:admin")
	public RevenuePercentage findByAgents(@Param("fagent")String fagent,@Param("tagent")String tagent,@Param("admin")String admin);

@Query("select r from RevenuePercentage r where r.rpId=:rpId")
public RevenuePercentage getById(@Param("rpId")String rpId);



@Query("select r from RevenuePercentage r where r.admin.adminId=:adminId")
public List<RevenuePercentage> getByAdminId(@Param("adminId")String adminId);



}
