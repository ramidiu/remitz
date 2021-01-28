package com.kws.unitedfintech.serviceimpl;

import java.text.SimpleDateFormat;
import java.util.List;
import java.util.TimeZone;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kws.unitedfintech.entities.AdminSellRates;
import com.kws.unitedfintech.entities.Agent;
import com.kws.unitedfintech.entities.AgentSellRates;
import com.kws.unitedfintech.entities.NoGenerator;
import com.kws.unitedfintech.helpers.SenditoConvertNullsToEmpty;
import com.kws.unitedfintech.helpers.SenditoDateUtil;
import com.kws.unitedfintech.repository.AdminSellRateRepository;
import com.kws.unitedfintech.repository.AgentRepository;
import com.kws.unitedfintech.repository.AgentSellRateRepository;
import com.kws.unitedfintech.service.AgentService;
import com.kws.unitedfintech.service.NoGeneratorService;

@Service
public class AgentServiceImpl implements AgentService {

	@Autowired
	AdminSellRateRepository repository;
	
	@Autowired
	AgentRepository agentRepository;
	@Autowired
	private NoGeneratorService noGeneratorService;
	@Autowired
	AgentSellRateRepository agentSellRateRepo;
	
	
	SenditoConvertNullsToEmpty convertNullsToEmpty= new SenditoConvertNullsToEmpty();
	SimpleDateFormat yyyyMMdd = new SimpleDateFormat("yyyy-MM-dd");
	
	@Override
	public List<AdminSellRates> getSpecificFrombranchDetailsbasedonBranchAndadminId(String branchid, String adminid) {
		
		System.out.println("branchid:"+branchid+"adminid:"+adminid);
		List<AdminSellRates> list=null;
		 list =repository.findSpecificBranchSellRateBasedOnFromBranchAdmin(branchid, adminid);
		
		return list;
		
	}
	@Override
	public Agent getAgentDetails(String agentid) {
		return agentRepository.findAgentById(agentid);
		 
	}
	
	@Override
	public List<AgentSellRates> storeAgentSellRate(List<AdminSellRates> branchSellRates,String agentid) {
		TimeZone timeZone = TimeZone.getTimeZone("IST");
		String createdDate = SenditoDateUtil.timeNow(yyyyMMdd, timeZone);
		String frombranch="";
		String Adminid="";
		for(AdminSellRates rates:branchSellRates)
		{
			 AgentSellRates flag=checkBeforeStore(rates,agentid);
			if(flag==null)
			{
				NoGenerator noGenerator = noGeneratorService.getNoGenerator("agent_sell_rate");
			String agentCurrId=noGenerator.getIdPrefix() + noGenerator.getTableId();
				AgentSellRates ag=new AgentSellRates();
				ag.setFromBranch(rates.getFromBranch());
				System.out.println("tobranch:"+rates.getToBranch());
				
				ag.setBranchAgentMasterRate(rates.getSellRate());
				ag.setCrid(rates.getCrId());
				ag.setAddDate(createdDate);
				ag.setUpdateDate(createdDate);
				ag.setAgentCurrSellRateId(agentCurrId);
				 ag.setToBranch(rates.getToBranch()); 
				 ag.setAgentId(agentid);
				ag = convertNullsToEmpty.convertNullFieldToEmpty(ag,AgentSellRates.class);
				agentSellRateRepo.save(ag);
				noGeneratorService.updateNoGenerator(noGenerator);
			}else {
				
				flag.setBranchAgentMasterRate(rates.getSellRate());
				System.out.println("sellrate:"+rates.getSellRate());
				flag.setAgentCurrencySellRate(rates.getSellRate());
				if(rates.getSellRate()!=0.0)
				{
					if(flag.getAgentMarkupRate()!=0.0) {
				double per=(rates.getSellRate()*flag.getAgentMarkupRate())/100;
				System.out.println("per vlaue:"+per);
				double sell_rate=flag.getAgentCurrencySellRate()-per;
				flag.setAgentCurrencySellRate(sell_rate);}}
				/*
				 * flag.setToBranch(rates.getToBranch());
				 * System.out.println("yes its executing:"+rates.getToBranch());
				 */
				agentSellRateRepo.save(flag);
			}
			
			frombranch=rates.getFromBranch().getBranchId();
			Adminid = rates.getAdmin().getAdminId();

		}
		
		List<AgentSellRates> agentsellrate=(List<AgentSellRates>)agentSellRateRepo.findAgentRecordsByBranchAndAdmin(frombranch,Adminid,agentid);
		return agentsellrate;
	}

	public AgentSellRates checkBeforeStore(AdminSellRates branchSellRates,String agentid) {
		
		AgentSellRates rates=agentSellRateRepo.getAgentSellRateRecord(branchSellRates.getCrId(),agentid);
		
		return rates;
	}
	@Override
	public boolean updateAgentSellRate(double masterrate, double markup, double sellrate, String crid,String agentid) {
		AgentSellRates rate=agentSellRateRepo.getAgentSellRateRecord(crid,agentid);
		
		rate.setAgentMarkupRate(markup);
		rate.setBranchAgentMasterRate(masterrate);
		rate.setAgentCurrencySellRate(sellrate);
		agentSellRateRepo.save(rate);
		
		return true;
	}

	

}
