package com.kws.unitedfintech.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import com.kws.unitedfintech.entities.Admin;
import com.kws.unitedfintech.entities.Branch;
import com.kws.unitedfintech.entities.Country;
import com.kws.unitedfintech.entities.Processbank;
import com.kws.unitedfintech.service.AdminService;
import com.kws.unitedfintech.service.BranchService;
import com.kws.unitedfintech.service.CountryService;
import com.kws.unitedfintech.service.ProcessService;
import com.kws.unitedfintech.service.SessionDataService;

@Controller
public class ProcessController {
	@Autowired
	private ProcessService processservice;
	
	@Autowired
	private SessionDataService sd;
	
	@Autowired
	private AdminService adminService;
	@Autowired
	private CountryService countryService;
	
	@Autowired
	private BranchService bs;
	
	@PostMapping("/insertprocess")
	public String getinsertprocess(@ModelAttribute Processbank processbank,HttpServletRequest request)
	{
		String adminId=sd.getAdminId(request.getSession());
		if(adminId!=null)
		{
			
			Admin admin=adminService.getAdminDetailsBasedOnAdminId(adminId);
			String country=request.getParameter("country");
			Branch b=bs.getBranchBasedOnBranchId(country);
			System.out.println("country===="+country);
			processbank.setCountry(b.getFromCountry());
			processbank.setBranch(b);
			processbank.setAdmin(admin);
		    processservice.saveprocessbankdetails(processbank);
		}
			
		
		return "redirect:/process";
		
	}
	

}
