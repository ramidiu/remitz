package com.kws.unitedfintech.repository;

import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;

import com.kws.unitedfintech.entities.Agent;

public interface AgentRepository extends CrudRepository<Agent, String> {

	@Query("select a from Agent a where a.branch.branchId=:branchid")
	public List<Agent> findAllAgentsOfBranch(String branchid);
	
	@Query("select a from Agent a where a.agentId=:agentid")
	public Agent findAgentById(String agentid);
}
