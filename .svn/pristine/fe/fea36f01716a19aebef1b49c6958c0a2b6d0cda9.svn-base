package com.kws.unitedfintech.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import com.kws.unitedfintech.entities.AdminSellRates;
import com.kws.unitedfintech.entities.Agent;
import com.kws.unitedfintech.entities.AgentSellRates;
import com.kws.unitedfintech.service.AgentService;

@Controller
public class AgentController {
	@Autowired
	private AgentService agentService;
	@GetMapping("brAgent_add_rates")
	public ModelAndView getAgentAddRate(HttpServletRequest request,HttpSession session)
	{
		List<AdminSellRates> branchSellRates=null;
ModelAndView mav=new ModelAndView();
session =request.getSession(false);
String agentid=(String)session.getAttribute("agentid");
Agent agent=agentService.getAgentDetails(agentid);

mav.setViewName("BranchAgentAddRates");
 branchSellRates=agentService.getSpecificFrombranchDetailsbasedonBranchAndadminId(agent.getBranch().getBranchId(),agent.getBranch().getAdmin().getAdminId());
 List<AgentSellRates> agentSellRate=agentService.storeAgentSellRate(branchSellRates,agentid);
 
 mav.addObject("selllist", agentSellRate);
 mav.addObject("agentCountryName", agent.getBranch().getFromCountry().getCountryName());
return mav;
		
	}
	
	
	@GetMapping("/getSpecificbranchDetailsbasedonBranchAndadmin")
	
	public @ResponseBody List<AdminSellRates> getSpecificbranchDetailsbasedonBranchAndadmin(HttpSession session ,HttpServletRequest request){
		session =request.getSession(false);
		String agentid=(String)session.getAttribute("agentId");
		Agent agent=agentService.getAgentDetails(agentid);
		/*
		 * List<Branch> branchList =
		 * branchService.getAllBranchDetailsBasedOnFromBranchAdminId(branchid,adminId);
		 */
		/*
		 * Branch branchdetails=null; List<AdminSellRates> sellRates =
		 * currencyRateService.getAllAdminSellRateBasedOnAdminId(adminId);
		 */
		List<AdminSellRates> branchSellRates=agentService.getSpecificFrombranchDetailsbasedonBranchAndadminId(agent.getBranch().getBranchId(), agent.getAdmin().getAdminId());
		return branchSellRates;
	}

	  @PostMapping("updateAgentSellRate")
	 
	 public @ResponseBody String  updateAgentSellRate(@RequestParam double amasterrate,double amarkup,double asellrate,String crid,String agentid)
	  
	  { String message ="";
	boolean flag=agentService.updateAgentSellRate(amasterrate, amarkup, asellrate, crid,agentid);
	if(flag==true)
		
	{message="success";}else {message="failed";}
	
	return message; }
	 

}
