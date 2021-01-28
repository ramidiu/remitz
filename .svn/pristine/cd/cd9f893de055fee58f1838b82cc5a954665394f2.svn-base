package com.kws.unitedfintech.serviceimpl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kws.unitedfintech.entities.Agent;
import com.kws.unitedfintech.entities.NoGenerator;
import com.kws.unitedfintech.entities.User;
import com.kws.unitedfintech.helpers.SenditoConvertNullsToEmpty;
import com.kws.unitedfintech.repository.AgentRepository;
import com.kws.unitedfintech.service.BranchAgentService;
import com.kws.unitedfintech.service.NoGeneratorService;
import com.kws.unitedfintech.service.UserService;
@Service
public class BranchAgentServiceImpl implements BranchAgentService {
	@Autowired
	private  UserService userService;
	
	@Autowired
	AgentRepository branchAgent;
	@Autowired
	private NoGeneratorService noGeneratorService;
	SenditoConvertNullsToEmpty convertNullsToEmpty=new SenditoConvertNullsToEmpty();
	@Override
	public boolean getSubmitBranchAgent(Agent agent) {
		boolean flag=false;
		NoGenerator ngs=noGeneratorService.getNoGenerator("agent");
		String agentId=ngs.getIdPrefix()+ngs.getTableId();
		System.out.println("agentid:"+agentId);
		agent.setAgentId(agentId);
		agent = convertNullsToEmpty.convertNullFieldToEmpty(agent, Agent.class);
		branchAgent.save(agent);
		noGeneratorService.updateNoGenerator(ngs);
		User user=new User();
		user.setPassword(agent.getAgentPassword());
		user.setUserName(agent.getAgentEmail());
		user.setRoles("ROLE_AGENT");
		user.setActive(true);
		user.setUserType(agentId);
		userService.saveUserDetails(user);
		flag=true;
		return flag;
	}
	@Override
	public List<Agent> getBranchAllAgents(String branchid) {
		List<Agent> list=null;
		list=branchAgent.findAllAgentsOfBranch(branchid);
		System.out.println("agents count:"+list.size());
		return list;
	}

}
