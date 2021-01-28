package com.kws.unitedfintech.controller;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;
import java.util.Map;
import java.util.TimeZone;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.repository.query.Param;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;


import com.kws.unitedfintech.entities.Admin;
import com.kws.unitedfintech.entities.BankBalance;

import com.kws.unitedfintech.entities.JournalVoucher;
import com.kws.unitedfintech.entities.MajorHead;
import com.kws.unitedfintech.entities.MinorHead;
import com.kws.unitedfintech.entities.NoGenerator;
import com.kws.unitedfintech.entities.OpeningBalance;
import com.kws.unitedfintech.entities.SubHead;
import com.kws.unitedfintech.service.AdminService;
import com.kws.unitedfintech.service.BankBalanceService;
import com.kws.unitedfintech.service.JournalVoucherService;
import com.kws.unitedfintech.service.MajorHeadService;
import com.kws.unitedfintech.service.MinorHeadService;
import com.kws.unitedfintech.service.NoGeneratorService;
import com.kws.unitedfintech.service.OpeningBalanceService;
import com.kws.unitedfintech.service.SessionDataService;
import com.kws.unitedfintech.service.SubHeadService;

@Controller
public class JvlController {
  @Autowired
	MajorHeadService majorHeadService;
  @Autowired
  OpeningBalanceService openingBalanceService;
  @Autowired
  MinorHeadService minorHeadService;
  @Autowired
	NoGeneratorService noGeneratorService;
	@Autowired
	SessionDataService sessionDataService;
	@Autowired
	AdminService adminService;
	@Autowired
	JournalVoucherService journalVoucherService;	
	@Autowired
SubHeadService subHeadService;
	@Autowired
BankBalanceService bankBalanceService;
	@RequestMapping(value = { "jvls" }, method = {
			org.springframework.web.bind.annotation.RequestMethod.POST })
	public String getJvl(HttpServletRequest req, HttpServletResponse resp,@ModelAttribute JournalVoucher journalVouche) {
		System.out.println("jvl voucher form2 started");
		String result1="";
		String adminId=sessionDataService.getAdminId(req.getSession());
			 if(adminId!=null){
				Admin admin=adminService.getAdminDetailsBasedOnAdminId(adminId);
System.out.println("admin id=="+adminId);
		String finYr = req.getParameter("finYr");
		System.out.println("finYr=="+finYr);
		String narration = req.getParameter("desc");
		System.out.println("narration=="+narration);
		String refno = req.getParameter("refno");
		System.out.println("refno=="+refno);
		double debitTotal = Double.parseDouble(req.getParameter("debitTotal"));
		System.out.println("debitTotal=="+debitTotal);
		double creditTotal = Double.parseDouble(req.getParameter("creditTotal"));
		System.out.println("creditTotal=="+creditTotal);
		Calendar c1 = Calendar.getInstance(); 
		
		c1.setTimeZone(TimeZone.getTimeZone("IST"));
		
		DateFormat  dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		System.out.println("dateFormat=="+dateFormat);
		DateFormat  dateFormat3 = new SimpleDateFormat("HH:mm:ss");

		System.out.println("dateFormat3=="+dateFormat3);

		dateFormat.setTimeZone(TimeZone.getTimeZone("IST"));
		Map<String, SubHead> subHeadMap = subHeadService.getSubHeadWithoutDuplicateMap();
System.out.println("subheadmap");
		System.out.println("narration=="+narration);
		String date1 = (dateFormat.format(c1.getTime())).toString();
		System.out.println("date1=="+date1);
		String time = "";
		try {
			time = dateFormat3.format(dateFormat.parse(date1));
			System.out.println("time in try =="+time);
		} catch (ParseException e) {
			System.out.println("catchblock==");
			e.printStackTrace();
		}
		String date = req.getParameter("dt")+" "+time;
		System.out.println("date=="+date);
		int debitcount = Integer.parseInt(req.getParameter("debitcount"));
		System.out.println("debitcount="+debitcount);
		int creditcount =Integer.parseInt(req.getParameter("creditcount"));
		System.out.println("creditcount=="+creditcount);
		List<JournalVoucher> cpList = new ArrayList<JournalVoucher>();
		System.out.println("cpList=="+cpList);
		String count=req.getParameter("addcount");
		System.out.println("count==="+count);
		NoGenerator  noGenerator=noGeneratorService.getNoGenerator("journalvoucher");
		String journalvcid=noGenerator.getIdPrefix()+noGenerator.getTableId();
		for (int i = 1 ; i <= debitcount; i++)	{
			System.out.println("hi");
				String sub = req.getParameter("sub"+i);
				System.out.println("sub---"+sub);
				if (!sub.trim().equals(""))	{
					//SubHead subhead = subHeadMap.get(sub.split(" ")[0]);
					System.out.println("subhead");
					System.out.println("loop enter");
					double amount = Double.parseDouble(req.getParameter("debit"+i));
					System.out.println("amount=="+amount);
					JournalVoucher journalVoucher=new JournalVoucher(); 
					journalVoucher.setProductId(journalvcid);
					journalVoucher.setFinYr(finYr);
					journalVoucher.setDate(date1);
					journalVoucher.setQuantity("1");
					journalVoucher.setRate(String.valueOf(amount));
					journalVoucher.setTotalAmount(String.valueOf(amount));
					journalVoucher.setJournalvoucherType("withoutbank");
					journalVoucher.setNarration(narration);
					journalVoucher.setAdmin(admin);
					journalVoucher.setTrtype("debit");
					journalVoucher.setBankName(sub);
					journalVoucher.setHoa(adminId);
					journalVoucherService.insertJournalWithOutBank(journalVoucher);
					System.out.println("journal voucher ended"+i);
				}
		}
		for (int j = 1 ; j <= creditcount ; j++)	{
			System.out.println("hiii");
			String sub = req.getParameter("sb"+j);
			System.out.println("sub---"+sub);
			if (!sub.trim().equals(""))	{
				System.out.println("loop enter");
				//SubHead subhead = subHeadMap.get(sub.split(" ")[0]);
				System.out.println("subhead");
				double amount = Double.parseDouble(req.getParameter("credit"+j));
				System.out.println("amount=="+amount);
				JournalVoucher journalVoucher=new JournalVoucher(); 
				journalVoucher.setProductId(journalvcid);
				journalVoucher.setFinYr(finYr);
				journalVoucher.setDate(date1);
				journalVoucher.setQuantity("1");
				journalVoucher.setRate(String.valueOf(amount));
				journalVoucher.setTotalAmount(String.valueOf(amount));
				journalVoucher.setJournalvoucherType("withoutbank");
				journalVoucher.setNarration(narration);
				journalVoucher.setAdmin(admin);
				journalVoucher.setTrtype("credit");
				journalVoucher.setBankName(sub);
				journalVoucher.setHoa(adminId);
				
				journalVoucherService.insertJournalWithOutBank(journalVoucher);
				System.out.println("journal voucher ended");
			}
		}	
			/*
			 * boolean result=journalVoucherService.insertJournalWithOutBank1(cpList);
			 * System.out.println("journal inserted-------"+result);
			 */		//result1= "redirect:jvlnew";
		result1= "redirect:jvldate";
			 }
			 else {
				 result1="redirect:login";
			 }
			return result1;
	}
		@RequestMapping("jvldate")
	public ModelAndView  getJvls() {
		System.out.println("jvl voucher");
		String withbank="CORPORATION BANK-CURRENT ACCOUNT"+","+"STATE BANK OF INDIA- CURRENT A/C+"+",";
		String withloanbank="CORPORATION BANK OD ACCOUNT"+","+"SBI Demand Loan Against FD";
		String cash="CASH";
		ModelAndView mav=new ModelAndView("jvlvoucher");
		//ModelAndView mav=new ModelAndView("rough");
		System.out.println(mav);
		mav.addObject("withbank", withbank);
		mav.addObject("withloanbank", withloanbank);
		mav.addObject("cash", cash);
		System.out.println("journal voucher in mav closed");
		// Your Prepared data. 
        List<double[]> values = new ArrayList<double[]>(2);

        double[] element1 = new double[] { 100, 100, 100, 100, 100 };
        double[] element2 = new double[] { 50, 35, 25, 45, 65 };
System.out.print(element1);
System.out.print(element2);
        values.add(element1);
        values.add(element2);
        System.out.print(values);
        // Add the result to arraylist.
        List<Double> temp = new ArrayList<Double>();
        for(int j=0;j<values.size(); j++) {
            for (int i = 0; i < values.get(0).length; i++) {
                temp.add(values.get(0)[i]);
                temp.add(values.get(1)[i]);
                           }
        } System.out.print("sad"+ values.get(0)[0]);
        System.out.print("sad"+values.get(1)[0]);
        System.out.print("sad"+values.get(0)[1]);
        System.out.print("sad"+values.get(1)[1]);


        // Convert arraylist to int[].
        Double[] result = temp.toArray(new Double[temp.size()]);
        double[] finalResult = new double[result.length]; // This hold final result.
        for (int i = 0; i < result.length; i++) {
            finalResult[i] = result[i].doubleValue();
        }

        for (int i = 0; i < finalResult.length; i++) {
           // System.out.println(finalResult[i]);
        }

		
		
		return mav;
		
	}
	@RequestMapping(value= {"getsubheadsearch"},method = RequestMethod.GET)
	@ResponseBody
	public  List<SubHead>  getSubHeadSearch(HttpServletRequest request) {
		String s=request.getParameter("q");
List<SubHead> subheadsearchlist=subHeadService.getOnlyRevenueSubheads(s);
List<SubHead> MIN_List=null;

SubHead SUB;
for(int i=0; i < subheadsearchlist.size(); i++ ){
	SUB=(SubHead)subheadsearchlist.get(i);
	 //out.println(SUB.getSubHeadId()+","+SUB.getSubHeadName()+","+SUB.getAccNo()+","+SUB.getMajorHead()+","+SUB.getMinorHead());
	}
		return subheadsearchlist;
	}

	@RequestMapping("jvlnew")
	public String  getJvs() {

		return "journalvoucher";
	}
	@RequestMapping("bbal")
	public ModelAndView getbbal() {
		
		ModelAndView mav=new ModelAndView("rough");
		ArrayList<String> arrl = new ArrayList<String>(2);
		
		List<String> SBSACC = new ArrayList<String>();
		    SBSACC.add("BNK1001");
		    SBSACC.add("State Bank Of India Savings Account");
		    SBSACC.add("My Savings Account");
		    SBSACC.add("SBI001001");
		    SBSACC.add("SBOI001");
		    SBSACC.add("Uppal");
		    SBSACC.add("debit");
		    SBSACC.add("active");
		    List<String> SBCACC = new ArrayList<String>();
		    SBCACC.add("BNK1002");
		    SBCACC.add("State Bank Of India Current Account");
		    SBCACC.add("My Current Account");
		    SBCACC.add("SBI002002");
		    SBCACC.add("SBOI002");
		    SBCACC.add("Chintal");
		    SBCACC.add("debit");
		    SBCACC.add("active");
		    List<String> SBFDCC = new ArrayList<String>();
		    SBFDCC.add("BNK1003");
		    SBFDCC.add("State Bank Of India FD Account");
		    SBFDCC.add("My FD Account");
		    SBFDCC.add("SBI003003");
		    SBFDCC.add("SBOI003");
		    SBFDCC.add("Sr Nagar");
		    SBFDCC.add("credit");
		    SBFDCC.add("active");
		    List<String> SBRDCC = new ArrayList<String>();
		    SBRDCC.add("BNK1004");
		    SBRDCC.add("State Bank Of India RD Account");
		    SBRDCC.add("My RD Account");
		    SBRDCC.add("SBI004004");
		    SBRDCC.add("SBOI004");
		    SBRDCC.add("Madhapur");
		    SBRDCC.add("debit");
		    SBRDCC.add("active");
		    List<String> CBODCC = new ArrayList<String>();
		    CBODCC.add("BNK1005");
		    CBODCC.add("Corporation Bank OD Account");
		    CBODCC.add("My OD Account");
		    CBODCC.add("CB005005");
		    CBODCC.add("CBOI005");
		    CBODCC.add("Sr Nagar");
		    CBODCC.add("credit");
		    CBODCC.add("active");
		    List<String> CBCCCC = new ArrayList<String>();
		    CBCCCC.add("BNK1006");
		    CBCCCC.add("Corporation Bank CC Account");
		    CBCCCC.add("My CC Account");
		    CBCCCC.add("CB006006");
		    CBCCCC.add("CBOI006");
		    CBCCCC.add("Alkhapuri");
		    CBCCCC.add("credit");
		    CBCCCC.add("active");
	    arrl.addAll(CBODCC);
	    arrl.addAll(CBCCCC);
	    for(int j=0;j<arrl.size(); j++) {
            for (int i = 0; i < arrl.get(0).length(); i++) {
                   }
        }
	   
	
	 return mav;
	 }
	@RequestMapping(value = { "bblform" }, method = {
			org.springframework.web.bind.annotation.RequestMethod.POST })
	public String saveBankBalanceDetails(HttpServletRequest request, HttpServletResponse response,
			@ModelAttribute BankBalance bankBalance) {
		String result = "";
		DateFormat dateFormat5 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		TimeZone tz = TimeZone.getTimeZone("IST");
		dateFormat5.setTimeZone(tz);
		Calendar c5 = Calendar.getInstance();
		String date2 = (dateFormat5.format(c5.getTime())).toString();
		String adminId = sessionDataService.getAdminId(request.getSession());
		System.out.println("adminId==========" + adminId);
		Admin admin = adminService.getAdminDetailsBasedOnAdminId(adminId);
		System.out.println("admin==========" + admin);
		if ((adminId != null) && (!adminId.trim().equals(""))) {
			String bankname=request.getParameter("bankname");
			String amount=request.getParameter("amount");
			String cdtype=request.getParameter("cdtype");
			String majorHeadNature=request.getParameter("majorHeadNature");
			if (majorHeadNature.equals("Assets")) {
			bankBalance.setMajorHeadId("101");
			bankBalance.setMinorHeadId("101001");

			} else {
				bankBalance.setMajorHeadId("201");
				bankBalance.setMinorHeadId("201001");
			}
			if(bankname.equals("State Bank Of India Savings Account")) {
	               bankBalance.setBankId("101001001");			
			}else if (bankname.equals("State Bank Of India Current Account")) {
				bankBalance.setBankId("101001002");
			}
			else if (bankname.equals("State Bank Of India FD Account")) {
				bankBalance.setBankId("101001003");
			}
			else if (bankname.equals("State Bank Of India RD Account")) {
				bankBalance.setBankId("101001004");
			}else if (bankname.equals("Corporation Bank OD Account")) {
				bankBalance.setBankId("201001001");
			}else  {
				bankBalance.setBankId("201001002");
			}
			System.out.println("majorHeadNature"+majorHeadNature);
			String fin=request.getParameter("fin");
			bankBalance.setBankBal(amount);
			bankBalance.setCreatedBy(adminId);
			bankBalance.setType(cdtype);
			bankBalance.setCreatedDate(date2);
			bankBalance.setFinYr(fin);
			bankBalance.setTypeOfBank(bankname);
	       List<BankBalance> blist=bankBalanceService.getList(adminId, fin, bankname);
	       if(blist.size()==0) {
			bankBalanceService.insertBankBalance(bankBalance);
				result = "redirect:bbal";
			}	else {
				result = "redirect:bbal?msg=You Already inserted bankbalance this year";	
				}
			System.out.println("result==========" + result);
		} else {
			result = "redirect:index?msg=Your Session Expired Please Login Again";
		}
		return result;
	}
@RequestMapping("/checkcurrentYear")
@ResponseBody
	public String checkcurrentyr(HttpServletRequest request) {
	String result="";
	String adminId = sessionDataService.getAdminId(request.getSession());
	System.out.println(adminId+"==========adminId");
	String fin=request.getParameter("fin");
	System.out.println(fin+"fin");
	String bankname=request.getParameter("bankname");
	System.out.println("bankname"+bankname);
	List<BankBalance> blist=bankBalanceService.getList(adminId, fin, bankname);
if(blist.size()==0) {
	result="successfully created";
}
else {
	result="u r already created with ur current yr balance with selected bank";
}
	return result;
		
	}
@RequestMapping("checkexistAdmins")
public ResponseEntity<String> checkUsersEmails(@RequestParam String adminId,@RequestParam String fin,@RequestParam String bankname) {
	System.out.println("emailId==="+adminId);
	 String result=bankBalanceService.getUserListBasedOnEmailIds(adminId, fin, bankname);
   // String result=bankBalanceService.getUserListBasedOnEmailIds(adminId, fin, bankname);
    //System.out.println("result::::"+result);
	return new ResponseEntity<>(result,HttpStatus.OK);
}
@RequestMapping("getledger")
@ResponseBody
public int getAmount() {
return 200;	
}
@RequestMapping(value = { "jvlbanks" }, method = {
		org.springframework.web.bind.annotation.RequestMethod.POST })
public String getJvlBanks(HttpServletRequest req, HttpServletResponse resp,@ModelAttribute JournalVoucher journalVouche)
{
	
	System.out.println("jvl voucher form2 BNK with started");
	String result1="";
	String adminId=sessionDataService.getAdminId(req.getSession());
		 if(adminId!=null){
			Admin admin=adminService.getAdminDetailsBasedOnAdminId(adminId);
System.out.println("admin id=="+adminId);
	String finYr = req.getParameter("finYear");
	System.out.println("finYr=="+finYr);
	
	String narration = req.getParameter("narration");
	System.out.println("narration=="+narration);
	String refno = req.getParameter("voucherRefNo");
	System.out.println("refno=="+refno);
	String jvtype=req.getParameter("jvtype");
	System.out.println("jivtype==="+jvtype);
	String bankname=req.getParameter("bankname");
	String namebank="";
	
	
	
	System.out.println("bankname"+bankname);
	String entryType1=req.getParameter("entryType1");
	System.out.println("entryType1"+entryType1);
	//double debitTotal = Double.parseDouble(req.getParameter("debitTotal"));
	//System.out.println("debitTotal=="+debitTotal);
	//double creditTotal = Double.parseDouble(req.getParameter("creditTotal"));
	//System.out.println("creditTotal=="+creditTotal);
	Calendar c1 = Calendar.getInstance(); 
	
	c1.setTimeZone(TimeZone.getTimeZone("IST"));
	String date2=req.getParameter("date");
	System.out.println("date22222222222222222222==="+date2);
	DateFormat  dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	System.out.println("dateFormat=="+dateFormat);
	DateFormat  dateFormat3 = new SimpleDateFormat("HH:mm:ss");

	System.out.println("dateFormat3=="+dateFormat3);

	dateFormat.setTimeZone(TimeZone.getTimeZone("IST"));
	Map<String, SubHead> subHeadMap = subHeadService.getSubHeadWithoutDuplicateMap();
System.out.println("subheadmap");
	
	String date1 = (dateFormat.format(c1.getTime())).toString();
	System.out.println("date1111111111111111111=="+date1);
	String time = "";
	try {
		time = dateFormat3.format(dateFormat.parse(date1));
		System.out.println("time in try =="+time);
	} catch (ParseException e) {
		System.out.println("catchblock==");
		e.printStackTrace();
	}
	String date = req.getParameter("dt")+" "+time;
	System.out.println("date=="+date);
	//int debitcount = Integer.parseInt(req.getParameter("debitcount"));
	//System.out.println("debitcount="+debitcount);
	//int creditcount =Integer.parseInt(req.getParameter("creditcount"));
	//System.out.println("creditcount=="+creditcount);
	List<JournalVoucher> cpList = new ArrayList<JournalVoucher>();
	System.out.println("cpList=="+cpList);
String total="";
String smallTotal="";
	if(entryType1.equals("credit")) {
		total=req.getParameter("credittotalamnt");
		
	}else {
		total=req.getParameter("debittotalamnt");
		
	}
	String subhead=req.getParameter("subhead");
	String count=req.getParameter("addcount");
	System.out.println("count===="+count);
	NoGenerator  noGenerator=noGeneratorService.getNoGenerator("journalvoucher");
	String journalvcid=noGenerator.getIdPrefix()+noGenerator.getTableId();
	String debitAmt="";
	String creditAmt="";
	String subheadId="";
	int i=0; 
	if(count != null){
		System.out.println("D");
		i=Integer.parseInt(count);
		for(int h=0;h<i;h++){
			System.out.println("DF");
			if(req.getParameter("subId"+h)!="" && req.getParameter("creditAmt"+h)!="0"  && req.getParameter("debitAmt"+h)!="0"  ){
				subheadId=req.getParameter("subId"+h);
System.out.println("II"+subheadId);
debitAmt=req.getParameter("debitAmt"+h);
creditAmt=req.getParameter("creditAmt"+h);
System.out.println("debitAmt"+debitAmt);
System.out.println("creditAmt"+creditAmt);
if(entryType1.equals("credit")) {
	smallTotal=creditAmt;
}else {
	smallTotal=debitAmt;
}
if(jvtype.equals("withbank")) {
	System.out.println("withbank==="+jvtype);
	namebank=req.getParameter("bankname");
			JournalVoucher journalVoucher=new JournalVoucher(); 
							/*
							 * if(bankname.equals("State Bank Of India Savings Account")) {
							 * journalVoucher.setSubHeadId("101001001"); }else if
							 * (bankname.equals("State Bank Of India Current Account")) {
							 * journalVoucher.setSubHeadId("101001002"); } else if
							 * (bankname.equals("State Bank Of India FD Account")) {
							 * journalVoucher.setSubHeadId("101001003"); } else if
							 * (bankname.equals("State Bank Of India RD Account")) {
							 * journalVoucher.setSubHeadId("101001004"); }
							 */   
			journalVoucher.setSubHeadId(subheadId);
			journalVoucher.setMajorHeadId("101");
		    journalVoucher.setMinorHeadId("101001");
			journalVoucher.setFinYr(finYr);
			journalVoucher.setDate(date2);
			//journalVoucher.setDate(date);
			journalVoucher.setQuantity("1");
			//journalVoucher.setRate(String.valueOf(amount));
			//journalVoucher.setTotalAmount(String.valueOf(amount));
			journalVoucher.setJournalvoucherType(jvtype);
			journalVoucher.setNarration(narration);
			journalVoucher.setAdmin(admin);
			journalVoucher.setTrtype(entryType1);
			journalVoucher.setBankName(namebank);
		journalVoucher.setProductId(journalvcid);
		journalVoucher.setTotalAmount(total);
		journalVoucher.setHoa(adminId);
		journalVoucher.setRate(smallTotal);
		journalVoucher.setTypeOfOperation(subhead);
			journalVoucherService.insertJournalWithOutBank(journalVoucher);
			System.out.println("journal voucher ended");
		/*
		 * boolean result=journalVoucherService.insertJournalWithOutBank1(cpList);
		 * System.out.println("journal inserted-------"+result);
		 */		//result1= "redirect:jvlnew";
	result1= "redirect:jvldate";
		 }
else if(jvtype.equals("withloanbank")) {
	System.out.println("withloanbank===="+jvtype);
	namebank=req.getParameter("loanbankname");
	JournalVoucher journalVoucher=new JournalVoucher(); 
							/*
							 * if (bankname.equals("Corporation Bank OD Account")) {
							 * journalVoucher.setSubHeadId("201001001"); }else {
							 * journalVoucher.setSubHeadId("201001002"); }
							 */
	journalVoucher.setSubHeadId(subheadId);	
	journalVoucher.setMajorHeadId("201");
    journalVoucher.setMinorHeadId("201001");
	journalVoucher.setFinYr(finYr);
	journalVoucher.setDate(date1);
	journalVoucher.setQuantity("1");
	//journalVoucher.setRate(String.valueOf(amount));
	//journalVoucher.setTotalAmount(String.valueOf(amount));
	journalVoucher.setJournalvoucherType(jvtype);
	journalVoucher.setNarration(narration);
	journalVoucher.setAdmin(admin);
	journalVoucher.setTrtype(entryType1);
	journalVoucher.setBankName(namebank);
journalVoucher.setProductId(journalvcid);
journalVoucher.setTotalAmount(total);
journalVoucher.setHoa(adminId);
journalVoucher.setRate(smallTotal);
journalVoucher.setTypeOfOperation(subhead);
	journalVoucherService.insertJournalWithOutBank(journalVoucher);
	System.out.println("journal withloanbank voucher ended");
/*
 * boolean result=journalVoucherService.insertJournalWithOutBank1(cpList);
 * System.out.println("journal inserted-------"+result);
 */		//result1= "redirect:jvlnew";
}
 }}
		result1= "redirect:jvldate";}

		 }
		 
		 
		 
		 else {
			 result1="redirect:login";
		 }
		return result1;

}



@RequestMapping("getledgerbysubheads")
public ModelAndView getLedgerReport(HttpServletRequest request) {
		ModelAndView mav=new ModelAndView("NewFile1");
		String finYear=request.getParameter("finYear");
		String subhead=request.getParameter("subhead");

		String fromdate=request.getParameter("fromdate");
		String todate=request.getParameter("todate");	
		System.out.println("fromdate1 in txn====="+fromdate);
		System.out.println("todat1e in txn====="+todate);	
		System.out.println("fromdate1 in txn====="+finYear);

	
	System.out.println("todate1 in txn-===="+subhead);
	List<BankBalance> list1=bankBalanceService.getAllSendingBranchTransactions( finYear, subhead);
	System.out.println("list1.size========"+list1.size());
	//List<JournalVoucher> list=journalVoucherService.getAllSendingBranchTransactions1( finYear, subhead,fromdate+" 00:00:00",todate+" 23:59:59");
	List<JournalVoucher> list=journalVoucherService.getAllSendingBranchTransactions1( finYear, subhead,fromdate,todate);

System.out.println("list=============="+list.size());
mav.addObject("list1",list1);
mav.addObject("list",list);

	mav.addObject("finYear", finYear);
    mav.addObject("fromdate", fromdate);
    mav.addObject("todate", todate);
    mav.addObject("subhead", subhead);
	//mav.setViewName();
	
	System.out.println("ledgerreportby subheads");
	return mav;
}

@RequestMapping("getAllSubHeadsBasedOnLedger")
@ResponseBody
public  List<BankBalance> getAllTransaction(HttpServletRequest request)

{
	String finYear=request.getParameter("finYear");
	String subhead=request.getParameter("subhead");
	System.out.println("fromdate in txn====="+finYear);
	System.out.println("todate in txn-===="+subhead);
	List<BankBalance> list=bankBalanceService.getAllSendingBranchTransactions( finYear, subhead);
	System.out.println("txn lisyt===="+list.size());	
	return list;
}

@RequestMapping("getAllSubHeadsBasedOnLedgers")
@ResponseBody
public  List<JournalVoucher> getAllTransaction1(HttpServletRequest request)

{
	String finYear=request.getParameter("finYear");
	String subhead=request.getParameter("subhead");

	String fromdate=request.getParameter("fromdate");
	String todate=request.getParameter("todate");	
	System.out.println("fromdate in txn====="+fromdate);
	System.out.println("todate in txn====="+todate);	
	System.out.println("fromdate in txn====="+finYear);

	
	System.out.println("todate in txn-===="+subhead);
	List<JournalVoucher> list=journalVoucherService.getAllSendingBranchTransactions1( finYear, subhead,fromdate+" 00:00:00",todate+" 23:59:59");
	System.out.println("txn lisyt===="+list.size());	
	return list;
}



@RequestMapping(value="adminpanel")
public String getMajor() {
	return "adminpanel";
}
@RequestMapping(value="new")
public String getnew() {
	return "NewFile3";
}

@RequestMapping(value= {"getsubhead"},method = RequestMethod.GET)
@ResponseBody
public  List<SubHead>  getSubHead(HttpServletRequest request) {

List<SubHead> subheadsearchlist=subHeadService.getSubheadForLedgerReport();
List<SubHead> MIN_List=null;
System.out.println("working from subheadsearch");
SubHead SUB;
for(int i=0; i < subheadsearchlist.size(); i++ ){
	
SUB=(SubHead)subheadsearchlist.get(i);
 //out.println(SUB.getSubHeadId()+","+SUB.getSubHeadName()+","+SUB.getAccNo()+","+SUB.getMajorHead()+","+SUB.getMinorHead());

}
	return subheadsearchlist;
}
@RequestMapping("ledgerlist")
public ModelAndView getNewLedger(HttpServletRequest request) {
	HttpSession session =request.getSession();
	String subhead=request.getParameter("subhead");
	String finYear=request.getParameter("finYear");
	List<BankBalance>l=bankBalanceService.getAllSendingBranchTransactions(finYear, subhead);
	ModelAndView mav=new ModelAndView();
	 mav.addObject("finYear",finYear);
		mav.addObject("subhead",subhead);
	mav.addObject("blist", l);
	mav.setViewName("ballist");
	return mav;
}
@RequestMapping("ledgerlistbysubhead")
public ModelAndView getNewLedger1(HttpServletRequest request) {
	String subhead=request.getParameter("subhead");
	System.out.println("subhead======"+subhead);
	List<BankBalance> list5=bankBalanceService.getListBySubheads(subhead);
	ModelAndView mav=new ModelAndView("NewFile3");
	System.out.println("subhead======"+subhead);
	mav.addObject("subhead",subhead);
	mav.addObject("list5",list5);
	//mav.setViewName("NewFile3");
	 return mav;
}
@RequestMapping("/gh")
public String viewHomePage(Model model, @Param("subhead") String subhead) {
    //List<Product> listProducts = service.listAll(keyword);
    List<BankBalance> list5=bankBalanceService.getListBySubheads(subhead);
    model.addAttribute("list5", list5);
    model.addAttribute("subhead", subhead);
     
    return "NewFile3";
}
@GetMapping("users")
public String listUsers(Model model,@RequestParam(defaultValue = "")String subhead) {
	
	model.addAttribute("users",bankBalanceService.getListBySubheads(subhead));
	
	return "NewOne";
}


@RequestMapping("getAllSubHeadsfortrailbalance")
@ResponseBody
public  List<MajorHead> getAllMajorHeads(HttpServletRequest request)

{	System.out.println("todate in txn-====");
List<MajorHead> mlist=majorHeadService.getUniqueMajorHeads();
System.out.println("txn lisyt===="+mlist.size());	
	return mlist;
}

@RequestMapping("getAllMajorHeadsBasedOnMajorHeadName")
@ResponseBody
public  List<MajorHead> getgetAllMajorHeadsBasedOnMajorHeadName(HttpServletRequest request)

{	System.out.println("todate in txn-====");
String major=request.getParameter("Current Assets");
List<MajorHead> mlist=majorHeadService.getMajorHeadListBasedOnNature1(major);
System.out.println("txn lisyt===="+mlist.size());
	return mlist;
}
@RequestMapping("newfile")
public ModelAndView getBalance() {
	ModelAndView mav=new ModelAndView("NewFile5");
	System.out.println("trailBalance here");
	return mav;
}
@RequestMapping(value = "/adminDashboard", method = RequestMethod.GET)
public ModelAndView joblistbystatus(HttpServletRequest req, HttpSession session)
{
	ModelAndView mav = null;
	mav = new ModelAndView("NewFile5");
	String status = req.getParameter("status");
	List<MajorHead> list=majorHeadService.getlistbystatus(status);
	System.out.println("list........" + list);
	mav.addObject("list", list);
	mav.addObject("status", status);
	return mav;

	}


@RequestMapping("trailBalances")
public ModelAndView getTrailBalance(HttpServletRequest req) {
	
	System.out.println("trailBalance here");
		ModelAndView mav = null;
	mav = new ModelAndView("trailbalance");
	String adminId=sessionDataService.getAdminId(req.getSession());
	String fromDate = req.getParameter("fromDate");
	String toDate = req.getParameter("toDate");
	String finYear=req.getParameter("finYear");
	String head=req.getParameter("headtype");
	
	System.out.println("wwwwwwwwwwwwwwwwww"+fromDate);
	System.out.println("wwwwwwwwwwwwwwwwww"+toDate);
	System.out.println("wwwwwwwwwwwwwwwwww"+finYear);
	System.out.println("wwwwwwwwwwwwwwwwww"+head);
	String ad="101001";
	List<JournalVoucher> list=journalVoucherService.getlist(finYear, fromDate, toDate);
	System.out.println("list........" + list.size());
	List<MajorHead> incomemajhdlist = majorHeadService.getMajorList("Revenue",adminId);
	List<MajorHead> expendmajhdlist = majorHeadService.getMajorList("Expenses",adminId);
	List<MajorHead> assetsmajhdlist = majorHeadService.getMajorList("Assets",adminId);
	List<MajorHead> liabilmajhdlist = majorHeadService.getMajorList("Liabilities",adminId);
	List<MinorHead> incomeminorheadlistHeads=minorHeadService.getMinorHeadList("Revenue", adminId);
	List<MinorHead> ExpensesminorheadlistHeads=minorHeadService.getMinorHeadList("Expenses", adminId);
	List<MinorHead> AssetsminorheadlistHeads=minorHeadService.getMinorHeadList("Assets", adminId);
	List<MinorHead> LiabilitiesminorheadlistHeads=minorHeadService.getMinorHeadList("Liabilities", adminId);
	List<SubHead> allSubHeads=subHeadService.getAllSubHeadBasedOnNature2(adminId);
	List<JournalVoucher> allSubHeadsJournalEntries=journalVoucherService.getListByAdminId(adminId);
	System.out.println(incomeminorheadlistHeads.size()+ ""+incomeminorheadlistHeads+" =========size minorheadlist");
	System.out.println(ExpensesminorheadlistHeads.size()+""+ExpensesminorheadlistHeads+"=========size minorheadlist");
	System.out.println(AssetsminorheadlistHeads.size()+""+AssetsminorheadlistHeads+"=========size minorheadlist");
	System.out.println(LiabilitiesminorheadlistHeads.size()+""+LiabilitiesminorheadlistHeads+"=========size minorheadlist");
	System.out.println("suheadlist=========="+allSubHeads.size()+"  "+allSubHeads);
	System.out.println("incomemajhdlist.size()======="+incomemajhdlist.size());
	System.out.println("expendmajhdlist.size()======="+expendmajhdlist.size());
	System.out.println("assetsmajhdlist.size()======="+assetsmajhdlist.size());
	System.out.println("liabilmajhdlist.size()======="+liabilmajhdlist.size());
	System.out.println("allSubHeadsJournalEntries=========="+allSubHeadsJournalEntries);
	System.out.println("allSubHeadsJournalEntries.size()=============="+allSubHeadsJournalEntries.size());
	
	
	List<BankBalance> assetsBanks=bankBalanceService.getassetbankbalancelist(finYear, fromDate+" 00:00:00",toDate+" 23:59:59", adminId, ad);
	List<BankBalance> liabBanks=bankBalanceService.getassetbankbalancelist(finYear, fromDate+" 00:00:00",toDate+" 23:59:59", adminId, "201001");
	//long count=bankBalanceService.getassetbankbalancelistbycount(finYear, fromDate+" 00:00:00",toDate+" 23:59:59", adminId, ad);
	System.out.println("assetsBanks=========="+assetsBanks);
	System.out.println("liabBanks=========="+liabBanks);
	//System.out.println("count======="+count);
//String count1=String.valueOf(count);	
	
	
	
	
	if(fromDate!=null && toDate!=null && finYear!=null && head.length()!=0) {
	mav.addObject("incomemajhdlist", incomemajhdlist);
	mav.addObject("expendmajhdlist", expendmajhdlist);
	mav.addObject("assetsmajhdlist", assetsmajhdlist);
	mav.addObject("liabilmajhdlist", liabilmajhdlist);
	mav.addObject("assetsBanks", assetsBanks);
	mav.addObject("liabBanks", liabBanks);
	mav.addObject("incomeminorheadlistHeads", incomeminorheadlistHeads);
	mav.addObject("ExpensesminorheadlistHeads", ExpensesminorheadlistHeads);
	mav.addObject("AssetsminorheadlistHeads", AssetsminorheadlistHeads);
	mav.addObject("LiabilitiesminorheadlistHeads", LiabilitiesminorheadlistHeads);
	mav.addObject("allSubHeads", allSubHeads);
	mav.addObject("allSubHeadsJournalEntries", allSubHeadsJournalEntries);
	//mav.addObject("count", count);	
	//mav.addObject("count1", count1);
	}

	mav.addObject("list", list);
	mav.addObject("fromDate", fromDate);
	mav.addObject("toDate", toDate);
	mav.addObject("finYear", finYear);
		return mav;


}

@RequestMapping(value={"openingB"})
public ModelAndView getchartofaccounts(HttpServletRequest request, HttpServletResponse response) { 
 String adminId=sessionDataService.getAdminId(request.getSession());
 System.out.println("majorheadlist--adminId===="+adminId);
 

 List<MajorHead> majorHeadList=null;
 System.out.println("majorheadlist--adminId====111111");
 List<MinorHead> minorHeadList=null;
 System.out.println("majorheadlist--adminId====2222222");
 List<SubHead> subHeadList=null;
		ModelAndView model=new ModelAndView();
	if(adminId!=null && !adminId.trim().equals("")){
		System.out.println("majorheadlist--adminId====3333333333");
		//return "admin/chartofaccounts";	
	String nature=request.getParameter("natureId");
	System.out.println("jklm");
	if(nature!=null && !nature.equals("")){
		majorHeadList=new ArrayList<MajorHead>();
		System.out.println("majorheadlist--adminId====444444"+majorHeadList);
		minorHeadList=new ArrayList<MinorHead>();
		
		subHeadList=new ArrayList<SubHead>();
		//level5List=new ArrayList<Level5>();
		//level6List = new  ArrayList<Level6>();
		majorHeadList=majorHeadService.getMajorHeadListBasedOnNature(nature,adminId);
		System.out.println("majorheadlist"+majorHeadList);
		minorHeadList=minorHeadService.getAllMinorHeadBasedOnNature(nature,adminId);	
		System.out.println("minorHeadList"+minorHeadList);
		//subHeadList=subHeadService.getAllSubHeadBasedOnNature(adminId,nature, adminId);
		subHeadList=subHeadService.getAllSubHeadBasedOnNature1(adminId, adminId);
		//subHeadList=subHeadService.getAllSubHeadBasedOnNature2(adminId);
		System.out.println("subHeadList"+subHeadList);
		//level5List=levelService.getLevel5BasedOnNatureAndCreatedBy(nature, adminId,adminId);
		//level6List=levelService.getLevel6BasedOnNatureAndCreatedBy(nature,adminId,adminId);
		model.addObject("majorHeadList",majorHeadList);
		model.addObject("minorHeadList",minorHeadList);
		model.addObject("subHeadList",subHeadList);
		model.addObject("nature",nature);
		System.out.println("List=======================");
		
		model.addObject("adminId",adminId);
	}
	model.setViewName("openingBalance");
	
	}else{
		//return "redirect:index";
		System.out.println("List=======================FAiled");
		model.setViewName("redirect:index");
	}
	return model;
	
} 



@RequestMapping(value = { "openBal" }, method = {
		org.springframework.web.bind.annotation.RequestMethod.POST })
public String saveOpeningBalanceDetails(HttpServletRequest request, HttpServletResponse response,
		@ModelAttribute OpeningBalance openingBalance) {
	String result = "";
	DateFormat dateFormat5 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	TimeZone tz = TimeZone.getTimeZone("IST");
	dateFormat5.setTimeZone(tz);
	Calendar c5 = Calendar.getInstance();
	String date2 = (dateFormat5.format(c5.getTime())).toString();
	String adminId = sessionDataService.getAdminId(request.getSession());
	System.out.println("adminId==========" + adminId);
	Admin admin = adminService.getAdminDetailsBasedOnAdminId(adminId);
	System.out.println("admin==========" + admin);
	if ((adminId != null) && (!adminId.trim().equals(""))) {
		String subName=request.getParameter("subName");
		System.out.println("subName"+subName);
		String openingAmount=request.getParameter("openingAmount");
		System.out.println("openingAmount"+openingAmount);
		String cdtype=request.getParameter("cdType");
		System.out.println("cdtype"+cdtype);
		String majorHeadNature=request.getParameter("majorHeadNature");
		System.out.println("majorHeadNature"+majorHeadNature);
		String fin=request.getParameter("fin");
		System.out.println("fin"+fin);
		openingBalance.setFin(fin);
		openingBalance.setMajorHeadNature(majorHeadNature);
		openingBalance.setSubName(subName);
		openingBalance.setOpeningAmount(openingAmount);
		openingBalance.setCdType(cdtype);
	openingBalance.setAdminid(adminId);	
	//openingBalanceService.insertBankBalance(openingBalance);
	List<OpeningBalance> oplist=openingBalanceService.getList(adminId, fin, subName);
	  
      if(oplist.size()==0) {
    	  openingBalanceService.insertBankBalance(openingBalance);
			result = "redirect:openingB";
		}	else {
			result = "redirect:openingB?msg=You Already inserted bankbalance this year";	
			}
		System.out.println("result==========" + result);
	} else {
		result = "redirect:index?msg=Your Session Expired Please Login Again";
	}
	
	
	return result;
}
@RequestMapping("/checkcurrentYr")
@ResponseBody
	public String checkcurrentyrOpeningBalance(HttpServletRequest request) {
	String result="";
	String adminId = sessionDataService.getAdminId(request.getSession());
	System.out.println(adminId+"==========adminId");
	String fin=request.getParameter("fin");
	System.out.println(fin+"fin");
	String subName=request.getParameter("subName");
	System.out.println("subName==========="+subName);
	List<OpeningBalance> oplist=openingBalanceService.getList(adminId, fin, subName);
	
if(oplist.size()==0) {
	result="successfully created";
}
else {
	result="u r already created with ur current yr balance with selected bank";
}
	return result;
		
	}

@RequestMapping(value= {"getsubheadsearches"},method = RequestMethod.GET)
@ResponseBody
public  List<SubHead>  getSubHeadSearches(HttpServletRequest request) {
	String s=request.getParameter("q");
	String adminId = sessionDataService.getAdminId(request.getSession());
List<SubHead> subheadsearchlist=subHeadService.getOnlySubheadsBasedOnAdmin(s, adminId);
List<SubHead> MIN_List=null;

SubHead SUB;
for(int i=0; i < subheadsearchlist.size(); i++ ){
SUB=(SubHead)subheadsearchlist.get(i);
 //out.println(SUB.getSubHeadId()+","+SUB.getSubHeadName()+","+SUB.getAccNo()+","+SUB.getMajorHead()+","+SUB.getMinorHead());
}
	return subheadsearchlist;
}
@RequestMapping("sd")
public String getL() {
	return "NewFile6";
}
}