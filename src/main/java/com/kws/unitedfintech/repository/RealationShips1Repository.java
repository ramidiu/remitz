package com.kws.unitedfintech.repository;

import java.util.List;

import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestParam;

import com.kws.unitedfintech.entities.RealationShips1;


@Repository
public interface RealationShips1Repository extends CrudRepository<RealationShips1, String>{


	
	
	
	@Query("select r from RealationShips1 r where r.admin.adminId=:adminId ")
	 List<RealationShips1> findAll(@RequestParam("adminId") String adminId);

	
	
	@Query("select r from RealationShips1 r where r.admin.adminId=:adminId and r.relationId=:relationId")
	public RealationShips1 findbyAdminAndId(@RequestParam("adminId")String adminId,int relationId);


	@Transactional
	@Modifying
	@Query("delete  from RealationShips1 where relationId=:relationId")
	public void deleteById(@Param("relationId")int relationId);





}
