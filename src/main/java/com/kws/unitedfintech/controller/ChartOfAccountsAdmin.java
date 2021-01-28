package com.kws.unitedfintech.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.kws.unitedfintech.entities.Admin;
import com.kws.unitedfintech.entities.MajorHead;
import com.kws.unitedfintech.entities.MinorHead;
import com.kws.unitedfintech.entities.SubHead;
import com.kws.unitedfintech.service.AdminService;
import com.kws.unitedfintech.service.MajorHeadService;
import com.kws.unitedfintech.service.MinorHeadService;
import com.kws.unitedfintech.service.OpeningBalanceService;
import com.kws.unitedfintech.service.SessionDataService;
import com.kws.unitedfintech.service.SubHeadService;


@Controller
public class ChartOfAccountsAdmin {

	  SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	  Calendar cal = Calendar.getInstance();
	  Date d = cal.getTime();
	 @Autowired
	OpeningBalanceService openingBalanceService;
	@Autowired
	SessionDataService sessionDataService;
	@Autowired
	MajorHeadService majorHeadService;
	@Autowired
	AdminService adminService;
	@Autowired
   MinorHeadService minorHeadService;
@Autowired
SubHeadService subHeadService;
	
@RequestMapping(value="majorheads")
public String getMajor() {
	return "form1";
}

	@RequestMapping(value={"chartofaccounts"})
	public ModelAndView getchartofaccounts(HttpServletRequest request, HttpServletResponse response) { 
	 String adminId=sessionDataService.getAdminId(request.getSession());
	 List<MajorHead> majorHeadList=null;
	 List<MinorHead> minorHeadList=null;
	 List<SubHead> subHeadList=null;
		//List<Level5> level5List=null;
		//List<Level6> level6List=null;
	 
		ModelAndView model=new ModelAndView();
		if(adminId!=null && !adminId.trim().equals("")){
			//return "admin/chartofaccounts";	
		String nature=request.getParameter("natureId");
		if(nature!=null && !nature.equals("")){
			majorHeadList=new ArrayList<MajorHead>();
			minorHeadList=new ArrayList<MinorHead>();
			
			subHeadList=new ArrayList<SubHead>();
			//level5List=new ArrayList<Level5>();
			//level6List = new  ArrayList<Level6>();
			majorHeadList=majorHeadService.getMajorHeadListBasedOnNature(nature,adminId);
			minorHeadList=minorHeadService.getAllMinorHeadBasedOnNature(nature,adminId);	
			//subHeadList=subHeadService.getAllSubHeadBasedOnNature(adminId,nature, adminId);
			subHeadList=subHeadService.getAllSubHeadBasedOnNature1(adminId, adminId);
			//subHeadList=subHeadService.getAllSubHeadBasedOnNature2(adminId);
			//level5List=levelService.getLevel5BasedOnNatureAndCreatedBy(nature, adminId,adminId);
			//level6List=levelService.getLevel6BasedOnNatureAndCreatedBy(nature,adminId,adminId);
			model.addObject("majorHeadList",majorHeadList);
			model.addObject("minorHeadList",minorHeadList);
			model.addObject("subHeadList",subHeadList);
			model.addObject("nature",nature);
			//model.addObject("level5List" ,level5List );
			//model.addObject("level6List" ,level6List);
			model.addObject("adminId",adminId);
		}
		model.setViewName("form1");
		
		}else{
			//return "redirect:index";
			model.setViewName("redirect:index");
		}
		return model;
		
	} 
	
	
	
	

	@RequestMapping(value={"insert"}, method={org.springframework.web.bind.annotation.RequestMethod.POST})
	  public String insert(HttpServletRequest request) {
			 String adminId=sessionDataService.getAdminId(request.getSession());
			 if(adminId!=null){
				Admin admin=adminService.getAdminDetailsBasedOnAdminId(adminId);
				String accNo=request.getParameter("newAcc");
				String nature=request.getParameter("nature");
				String type=request.getParameter("optradio");
				String parent[]=request.getParameter("parent").split(",");
				String nextLevel=request.getParameter("nextLevel");
				String newAcc=request.getParameter("newAcc");
				String accDesc=request.getParameter("accDesc");
				String zako=request.getParameter("zako");
				String needApproval=request.getParameter("needApproval");
				String accCode=request.getParameter("accCode");
				String extra1=accNo+newAcc;
				MinorHead minorHead=null;
				SubHead subHead=null;
				
				MajorHead majorHead=null;
				if(nextLevel.equals("3")){
					majorHead=new MajorHead();
					minorHead=new MinorHead();
					
				/*
				 * //majorHead=majorHeadService.getMajorHeadBasedOnAccNo(parent[0],adminId);
				 */					
					majorHead=majorHeadService.getMajorHeadBasedOnAccNo1(parent[0],adminId,nature);
					String majorname=majorHead.getMajorHeadName();
					minorHead.setAccCode(accCode);
					minorHead.setAdmin(admin);
					minorHead.setCreatedBy(adminId);
					minorHead.setCreatedDate(sdf.format(d));
					minorHead.setDescription(accDesc);
					minorHead.setHeadOfAccount(adminId);
					minorHead.setLevel(nextLevel);
					minorHead.setMajorHead(majorHead);
					minorHead.setAccNo(newAcc);
					minorHead.setMinorHeadName(accCode);
					minorHead.setNature(nature);

					minorHead.setType(majorname);
					minorHead.setUpdatedDate(sdf.format(d));
					minorHead.setApprovalStatus("approved");
					minorHead.setApprovalStatus(extra1);
					minorHead.setFlag("no");
					minorHeadService.insertMinorHead(minorHead);
				}
				
				
				if(nextLevel.equals("4")){
				MinorHead minorHead2=minorHeadService.getMinorHeadBasedOnId(parent[2]);
				String mh2=minorHead2.getMinorHeadName();
				String mh3=minorHead2.getAccNo();
				MinorHead mm=minorHeadService.getMinorHeadBasedOnId(parent[1]);
				
				//String ss=mm.getAccCode();
				//System.out.println("sssssssssssssssssss"+ss);
				majorHead=new MajorHead();
				majorHead=majorHeadService.getMajorHeadBasedOnAccNo1(minorHead2.getMajorHead().getAccNo(),admin.getAdminId(),nature);
		String ssk=majorHead.getMajorHeadName();
				subHead=new SubHead();	
				
				subHead.setAccCode(accCode);
					subHead.setAdmin(admin);
					subHead.setCreatedBy(adminId);
					subHead.setCreatedDate(sdf.format(d));
					subHead.setHeadOfAccount(adminId);
					subHead.setAccDesc(accDesc);
					subHead.setLevel(nextLevel);
					subHead.setMajorHead(majorHead);
					subHead.setMinorHead(minorHead2);
					subHead.setNature(nature);
					subHead.setAccNo(newAcc);
					subHead.setSubHeadName(accCode);
					subHead.setType(ssk);
					subHead.setUpdatedDate(sdf.format(d));
					subHead.setApprovalStatus("approved");
					subHead.setStatus(mh3);
					subHead.setAccType(mh2);
					subHeadService.insertSubHead(subHead);
				}
				return "redirect:chartofaccounts";	
			 }else{
				 return "redirect:index";
					
			 }
	  }
	
	@RequestMapping(value={"update"}, method={org.springframework.web.bind.annotation.RequestMethod.POST})
	  public String updateSubHead(HttpServletRequest request) {
		String adminId=sessionDataService.getAdminId(request.getSession());
		 if(adminId!=null){
			Admin admin=adminService.getAdminDetailsBasedOnAdminId(adminId);
			String accNo=request.getParameter("newAcc");
			String nature=request.getParameter("nature");
			String type=request.getParameter("optradio");
			String parent[]=request.getParameter("parent").split(",");
			String nextLevel=request.getParameter("nextLevel");
			String newAcc=request.getParameter("newAcc");
			String accDesc=request.getParameter("accDesc");
			String zako=request.getParameter("zako");
			String needApproval=request.getParameter("needApproval");
			String accCode=request.getParameter("accCode");
			String extra1=accNo+newAcc;
			
			SubHead subHead=null;
			subHeadService.updateSubHeadChartOfAccounts(accNo, accCode, accDesc);
				
		 }
			return "redirect:chartofaccounts";	
		 }

	
	
	
	@RequestMapping(value = "majorhead" , method = RequestMethod.GET)
	public ModelAndView getmajorhead(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView modelAndView = new ModelAndView();
		String adminId = sessionDataService.getAdminId(request.getSession());
		if ((adminId != null) && (!adminId.trim().equals(""))) {
			
			List<MajorHead> majorHeadList = majorHeadService.getAllMajoHeads(adminId);
			modelAndView.setViewName("form2");
			modelAndView.addObject("majorHeadList", majorHeadList);
		} else {
			modelAndView.setViewName("redirect:index");
			modelAndView.addObject("msg", "Session Expired Please Login Again");
		}
		return modelAndView;
	}
		
	
	

	@RequestMapping({ "checkmajorheadid" })
	@ResponseBody
	public String checkMajorHeadId(@RequestParam String majorHeadId,String majorHeadNature, HttpServletRequest request) {
		String result = "";
		String adminId = sessionDataService.getAdminId(request.getSession());
		
		result = majorHeadService.checkMajorHead(majorHeadId, adminId,majorHeadNature);
		return result;
	}

	@RequestMapping(value = { "insertmajorhead" }, method = {
			org.springframework.web.bind.annotation.RequestMethod.POST })
	public String saveMajorHeadDetails(HttpServletRequest request, HttpServletResponse response,
			@ModelAttribute MajorHead majorHead) {
		String result = "";
		String adminId = sessionDataService.getAdminId(request.getSession());

		Admin admin = adminService.getAdminDetailsBasedOnAdminId(adminId);
		if ((adminId != null) && (!adminId.trim().equals(""))) {
			majorHead.setAdmin(admin);
			majorHead.setHeadOfAccount(adminId);
			majorHead.setFlag("No");
			majorHeadService.insertMajorHead(majorHead);
			result = "redirect:majorhead";
		} else {
			result = "redirect:index?msg=Your Session Expired Please Login Again";
		}
		return result;
	}

	@RequestMapping({ "checkminorheadid" })
	@ResponseBody
	public String checkMinorHeadId(@RequestParam String id, HttpServletRequest request) {
		String adminId = sessionDataService.getAdminId(request.getSession());
		String result = "";
		result =minorHeadService.checkMinorHead(id, adminId);
		return result;
	}

	@RequestMapping(value={"getMinorHeadBasedOnMajorHeadId"}, method= {RequestMethod.POST})
	  @ResponseBody
	  public List<MinorHead> getListOfMinorHeadBasedOnMajorHead(HttpServletRequest request, @RequestParam String majorHeadId) { 
		String adminId = sessionDataService.getAdminId(request.getSession());
	    
	  
	  return minorHeadService.getMinorHeadBasedOnMajorHeadAndAdminId(majorHeadId, adminId);
	  }

	@RequestMapping(value = "getMajorHeadListByNature", method = RequestMethod.POST,headers = "Accept=application/json")
	@ResponseBody 
	public  List<MajorHead> getMajorHeadListByNature(@RequestParam String MajorHeadNature){
		
		List<MajorHead> majorHeadList =majorHeadService.getMajorHeadListBasedOnNature(MajorHeadNature);
		return majorHeadList;
	}
	@RequestMapping(value = "getMajorHeadCount", method = RequestMethod.GET,headers = "Accept=application/json")
	@ResponseBody 
	public  int getMajorHeadCOunt(@RequestParam String majorHeadNature,HttpServletRequest request){
		String adminId=sessionDataService.getAdminId(request.getSession());
		List<MajorHead> majorHeadListingcount =majorHeadService.getMajorHeadListCountByNature(majorHeadNature,adminId);
		int value=majorHeadListingcount.size()+1;
		return value;
	}	
	
	
	
	@RequestMapping(value={"getSubHeadBasedOnMinorHeadId"}, method={org.springframework.web.bind.annotation.RequestMethod.POST})
	  @ResponseBody
	  public List<SubHead> getListOfSubHeadBasedOnMajorHead(HttpServletRequest request, @RequestParam String minorHeadId) { String adminId = sessionDataService.getAdminId(request.getSession());
	  return subHeadService.getSubHeadsBasedOnAdminIdAndMinorIdForAdmin(adminId, minorHeadId);
	  }


	@RequestMapping({"checkmajorheadids"})
	  @ResponseBody
	  public String checkMajorHeadIdfor(@RequestParam String majorHeadId,String majorHeadNature, HttpServletRequest request) { 
		String result = "";
	    String adminId = sessionDataService.getAdminId(request.getSession());
	    result = majorHeadService.checkMajorHead(majorHeadId, adminId,majorHeadNature);
	    return result;
	  }

	/*
	 * @RequestMapping("checkexistmajorHeadId") public ResponseEntity<String>
	 * checkExistMajorHeadId(@RequestParam String majorHeadId,HttpServletRequest
	 * request) { System.out.println("emailId==="+majorHeadId); String adminId =
	 * sessionDataService.getAdminId(request.getSession()); String
	 * result=majorHeadService.checkmajorHeadId(majorHeadId, adminId);
	 * System.out.println("result::::"+result); return new
	 * ResponseEntity<>(result,HttpStatus.OK); }
	 */
	 @RequestMapping(value={"getAllSubHeadsBasedOnAdminId"}, method={org.springframework.web.bind.annotation.RequestMethod.POST})
	  @ResponseBody
	  public List<SubHead> getAllSubHeadsBasedOnAdminId(HttpServletRequest request) {
		 String adminId = sessionDataService.getAdminId(request.getSession());
	    List<SubHead> list = subHeadService.getAllSubHeadBasedOnAdminId(adminId);
	    return list;
	  }
	 @RequestMapping(value={"getAllSubHeadsBasedOnAdminId1"}, method={org.springframework.web.bind.annotation.RequestMethod.POST})
	  @ResponseBody
	  public List<SubHead> getAllSubHeadsBasedOnAdminId1(HttpServletRequest request) {
		 String adminId = sessionDataService.getAdminId(request.getSession());
		 
	    List<SubHead> list = subHeadService.getAllSubHeadBasedOnAdminId(adminId);
	    return list;
	  }
	 

//openingbalance start here

		@RequestMapping(value={"openingBalance"})
		public ModelAndView getOpeningBalance(HttpServletRequest request, HttpServletResponse response) { 
		 String adminId=sessionDataService.getAdminId(request.getSession());
		 List<MinorHead> minorHeadList=null;
		 ModelAndView model=new ModelAndView();
			if(adminId!=null && !adminId.trim().equals("")){
				String nature=request.getParameter("majorHeadNature");
			if(nature!=null && !nature.equals("")){
				
				minorHeadList=new ArrayList<MinorHead>();
				minorHeadList=minorHeadService.getAllMinorHeadBasedOnNature(nature,adminId);	
				System.out.println("minorHeadList"+minorHeadList);
				model.addObject("minorHeadList",minorHeadList);
				model.addObject("nature",nature);
				model.addObject("adminId",adminId);
			}
			model.setViewName("openingBalance");
			
			}else{
			
				model.setViewName("redirect:index");
			}
			return model;
			
		} 
		
}
