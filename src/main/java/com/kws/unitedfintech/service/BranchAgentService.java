package com.kws.unitedfintech.service;

import java.util.List;

import com.kws.unitedfintech.entities.Agent;

public interface BranchAgentService {
	
	public boolean getSubmitBranchAgent(Agent agent);
	public List<Agent> getBranchAllAgents(String branchid);

}
