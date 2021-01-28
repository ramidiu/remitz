package com.kws.unitedfintech.repository;

import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.RequestParam;

import com.kws.unitedfintech.entities.MaxAmount;

@Repository
public interface MaxAmountRepository extends CrudRepository<MaxAmount,String>{

	
	@Query("select m from MaxAmount m where m.branch.branchId=:branchId")
	public MaxAmount getAmtByBranchId(@RequestParam("branchId")String branchId);

	@Query("select m from MaxAmount m where m.admin.adminId=:adminId")
	public List<MaxAmount> getbyAdmin(@RequestParam("adminId") String adminId);



	@Query("select m from MaxAmount m where m.maxAmountId=:maxAmountId")
	public MaxAmount getbymaxAmountId(@RequestParam("maxAmountId") String maxAmountId);



}
