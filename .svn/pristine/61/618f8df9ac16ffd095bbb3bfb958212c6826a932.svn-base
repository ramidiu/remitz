package com.kws.unitedfintech.repository;

import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;

import com.kws.unitedfintech.entities.AgentSellRates;

public interface AgentSellRateRepository extends CrudRepository<AgentSellRates, String>{

	
	
	@Query("select r from AgentSellRates r where r.crid=:crid and r.agentId=:agentid")
	public AgentSellRates getAgentSellRateRecord(String crid,String agentid);
	
	
	@Query("select r from AgentSellRates r where r.fromBranch.branchId=:frombranch and r.fromBranch.admin.adminId=:adminid and r.agentId=:agentid")
	public List<AgentSellRates>findAgentRecordsByBranchAndAdmin(String frombranch,String adminid,String agentid);
}
