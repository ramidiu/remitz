package com.kws.unitedfintech.service;

import java.util.List;

import org.springframework.web.multipart.MultipartRequest;

import com.kws.unitedfintech.entities.AgentDeposit;

public interface AgentDepositService {

	
	
	public AgentDeposit save(AgentDeposit ad,MultipartRequest multipartRequest);
	public List<AgentDeposit> getAllByAgent(String id);
	
	public List<AgentDeposit> getByBranchAndDates(String id,String fromDate,String toDate,String status);

	public List<AgentDeposit> getAll();
	
	public List<AgentDeposit> getByBranch(String id,String status);
	public AgentDeposit save2(AgentDeposit a);
	
	public List<AgentDeposit> getbyadmin(String adminId);
	
	public AgentDeposit updateStatus(AgentDeposit a);
	
	public AgentDeposit getbyId(String Id);
}
