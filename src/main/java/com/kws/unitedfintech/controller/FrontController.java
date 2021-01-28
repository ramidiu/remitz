package com.kws.unitedfintech.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class FrontController {

	@RequestMapping("/")
	public String getNew() {
		return "NewFile";
	}
	
	@RequestMapping("/header")
	public String getHeader() {
		return "headerNew";
	}
	
	@RequestMapping("/agentdashboard")
	public String agentdashboard() {
		return "agentdashboard";
	}
	
	@RequestMapping("/receipt")
	public String Receipt() {
		return "receipt";
	}
	
	@RequestMapping("agentdashbord")
	public String agentdashbord() {
		return "agentdashbord";
	}
}
