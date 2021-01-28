package com.kws.unitedfintech.repository;

import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.kws.unitedfintech.entities.AgentDeposit;

@Repository
public interface AgentDepositRepository extends CrudRepository<AgentDeposit, String>{

	
	@Query("select a from AgentDeposit a where a.branch.branchId=:id")
	public List<AgentDeposit> getbyagent(@Param("id")String id);





	@Query("select a from AgentDeposit a where a.branch.branchId=:id and a.Date>=:fromDate and a.Date<=:toDate and a.status=:status")
	public List<AgentDeposit> getAllDepositsByBranch(@Param("id")String id,@Param("fromDate") String fromDate,@Param("toDate") String toDate,@Param("status")String status);


@Query("select a from AgentDeposit a where a.branch.branchId=:id and a.status=:status")
	public List<AgentDeposit> getByBranch(@Param("id")String id,@Param("status")String status);

@Query("select a from AgentDeposit a where a.admin.adminId=:adminId")
public List<AgentDeposit> getByAdmin(@Param("adminId")String adminId);

@Query("select a from AgentDeposit a where a.adId=:Id")
public AgentDeposit getByadId(@Param("Id")String Id);
}
