package com.kws.unitedfintech.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.kws.unitedfintech.entities.AdminSellRates;
import com.kws.unitedfintech.entities.Agent;
import com.kws.unitedfintech.entities.AgentSellRates;

public interface AgentService {
	public  Agent getAgentDetails(String agentid);
	 public List<AdminSellRates> getSpecificFrombranchDetailsbasedonBranchAndadminId(String branchid,String adminid);
public List<AgentSellRates> storeAgentSellRate(List<AdminSellRates> branchSellRates,String agentid );
public boolean updateAgentSellRate(double masterrate,double markup,double sellrate,String crid,String agentid);

}
