package com.kws.unitedfintech.serviceimpl;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.TimeZone;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;

import com.kws.unitedfintech.entities.Admin;
import com.kws.unitedfintech.entities.AdminSellRates;
import com.kws.unitedfintech.entities.Branch;
import com.kws.unitedfintech.entities.NoGenerator;
import com.kws.unitedfintech.repository.AdminSellRateRepository;
import com.kws.unitedfintech.service.CurrencyRateService;
import com.kws.unitedfintech.service.NoGeneratorService;

@Service
public class CurrencyRateServiceImpl implements CurrencyRateService{

	@Autowired
	private AdminSellRateRepository adminSellRateRepository;
	@Autowired
	NoGeneratorService noGeneratorService;
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	TimeZone timeZone = TimeZone.getTimeZone("IST");
	Calendar cal = Calendar.getInstance();
	Date d = cal.getTime();
	private RestTemplate restTemplate = new RestTemplate();

	private final String baseUrl = "http://data.fixer.io/api/latest";
	private final String key = "b8c8c545ef0ca188863ce2cdfcfb44dc";
	private String finalUrl = "";
    private String updatedDate="";

	@Override
	public void saveAdminSellRate(AdminSellRates rates,Admin admin,Branch fromBranch,Branch toBranch) {
	//AdminSellRates list=adminSellRateRepository.getSpecificAdminSellRateBasedOnFromBranchIdAndToBranchId(admin.getAdminId(), fromBranch.getBranchId(), toBranch.getBranchId());
			double ob=1.0;
			try {
				ob = getCurrencyRatesFromFixer(fromBranch.getFromCountry().getCurrencyCode(),toBranch.getFromCountry().getCurrencyCode());
			} catch (ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
	System.out.println("ob======"+ob);
		String[] pt=admin.getPaymentTypes().split(",");
		String[] pt1=toBranch.getPaymentMode().split(",");
		Map<String, String> map = new HashMap<String, String>();
		for (String payment : pt1) {
			map.put(payment, payment);
		}
			
		for (String s1 : pt) {
				List<AdminSellRates> list1=adminSellRateRepository.getSpecificAdminSellRateBasedOnFromBranchIdAndToBranchIdAndPaymentType(admin.getAdminId(), fromBranch.getBranchId(), toBranch.getBranchId(), s1,"selling");
	if(list1.size()>0) {
		System.out.println("list already there");
	}else {
	NoGenerator noGenerator = noGeneratorService.getNoGenerator("admin_sell_rates");
		String id = noGenerator.getIdPrefix() + noGenerator.getTableId();
		if (map.containsKey(s1)) {
			rates.setStatus("active");
		} else {
			rates.setStatus("inactive");
		}

		rates.setPaymentType(s1);
		rates.setCrId(id);
		rates.setFromBranch(fromBranch);
		rates.setToBranch(toBranch);
		rates.setAdmin(admin);
		rates.setMasterRate(ob);
		rates.setSellRate(ob);
		rates.setMarkup(1.0);
		rates.setRateFlag("selling");
		rates.setCreatedDate(sdf.format(d));
		rates.setUpdatedDate(sdf.format(d));
		AdminSellRates r=adminSellRateRepository.save(rates);
		System.out.println("r in rates===="+r);
		noGeneratorService.updateNoGenerator(noGenerator);
	}}
	}
	public Double getCurrencyRatesFromFixer(String baseCurrency,String symbols) throws ParseException {
		double rate=1.0;
		if(!baseCurrency.equals(symbols)) {
		System.out.println("ssssssss"+symbols);
		HttpHeaders httpHeaders=new HttpHeaders();
		httpHeaders.setContentType(MediaType.APPLICATION_JSON);
		HttpEntity<String> entity=new HttpEntity<String>(httpHeaders);
		finalUrl=finalUrl+baseUrl+"?access_key="+key+"&base="+baseCurrency+"&symbols="+symbols;
		ResponseEntity<String> response=restTemplate.exchange(finalUrl,HttpMethod.POST,entity,String.class);
		JSONParser jSONParser=new JSONParser();
       JSONObject json = (JSONObject)jSONParser.parse(response.getBody());
       Map<String,Object> ress=(Map<String,Object>) json.get("rates");
       updatedDate=(String)json.get("date");
        Object obj=ress.get(symbols);
        rate=(double) obj;
    //   System.out.println("base"+baseCurrency+"-"+symbols+"rate::::::"+obj);
		
		  
		  //adminSellRateRepository.UpdateMasterRateByCrid(obj,updatedDate,crid); 
			return rate;
	 
	   	
	}else {
		//adminSellRateRepository.UpdateMasterRateByCrid(1.0,updatedDate,crid);
		Object ob=new Object();
		return rate;
	}
	}

	@Override
	public List<AdminSellRates> getAllAdminSellRateBasedOnAdminId(String adminId,String rateFlag,String status) {
		return adminSellRateRepository.findAllByAdminId(adminId,rateFlag,status);
	}

	@Override
	public void updateAdminSellRate(AdminSellRates rate) {
		adminSellRateRepository.save(rate);
	}

	@Override
	public AdminSellRates getAllAdminSellRateBasedOnFromBranchAndToBranch(String adminId, String fromBranchId,
			String toBranchId) {
		return adminSellRateRepository.getAllAdminSellRateBasedOnFromBranchIdAndToBranchId(adminId, fromBranchId, toBranchId);
	}

	@Override
	public double getCurrencyRateBasedOnFromBranchAndToBranch(String fromBranchId, String toBranchId,String paymentType,String rateFlag) {
		AdminSellRates  i=adminSellRateRepository.getCurrencyRateBasedOnFromBranchIdAndToBranchId(fromBranchId, toBranchId,paymentType,rateFlag);
		double v=i.getSellRate(); 
		System.out.println("i"+v);
		 return v;
	}

	@Override
	public List<AdminSellRates> getCurrencyRateForSendingCountry(String branchId, String paymentType) {
		// TODO Auto-generated method stub
		return adminSellRateRepository.finByBranchAndPayment(branchId, paymentType);
	}

	@Override
	public void saveAdminBuyRate(AdminSellRates rates, Admin admin, Branch fromBranch, Branch toBranch) {
		String[] pt=admin.getPaymentTypes().split(",");
		String[] pt1=toBranch.getPaymentMode().split(",");
		Map<String, String> map = new HashMap<String, String>();
		for (String payment : pt1) {
			map.put(payment, payment);
		}

		for (String s1 : pt) {
			List<AdminSellRates> list1=adminSellRateRepository.getSpecificAdminSellRateBasedOnFromBranchIdAndToBranchIdAndPaymentType(admin.getAdminId(), fromBranch.getBranchId(), toBranch.getBranchId(), s1,"buy");
if(list1.size()>0) {
	System.out.println("list already there");
}else {
NoGenerator noGenerator = noGeneratorService.getNoGenerator("admin_sell_rates");
	String id = noGenerator.getIdPrefix() + noGenerator.getTableId();
	if (map.containsKey(s1)) {
		rates.setStatus("active");
	} else {
		rates.setStatus("inactive");
	}

	rates.setPaymentType(s1);
	rates.setCrId(id);
	rates.setFromBranch(fromBranch);
	rates.setToBranch(toBranch);
	rates.setAdmin(admin);
	rates.setRateFlag("buy");
	rates.setCreatedDate(sdf.format(d));
	rates.setUpdatedDate(sdf.format(d));
	adminSellRateRepository.save(rates);
	noGeneratorService.updateNoGenerator(noGenerator);
}}
		
	}

	@Override
	public List<AdminSellRates> getAllAdminSellRateBasedOnBranch(String toBranchId, String rateFlag) {
		// TODO Auto-generated method stub
		return adminSellRateRepository.findAllByToBranchId(toBranchId, rateFlag);
	}

	@Override
	public AdminSellRates getByCrId(String crId) {
		// TODO Auto-generated method stub
		return adminSellRateRepository.findAllByCrId(crId);
	}
	@Override
	public List<AdminSellRates> findByToBranch(String branchId,String ptype) {
		// TODO Auto-generated method stub
		return adminSellRateRepository.findByToBranch(branchId,ptype);
	}
	@Override
	public List<AdminSellRates> getAllAdminSellRateBasedOnFromBranchAndToBranchRateType(String adminId, String fromBranchId,
			String toBranchId, String rateFlag) {
		// TODO Auto-generated method stub
		return adminSellRateRepository.getbyfromTobranchRateflag(fromBranchId, toBranchId, rateFlag);
	}
	@Override
	public AdminSellRates getCurrencyRateBasedOnFromBranchAndToBranchPtype(String fromBranchId, String toBranchId,
			String paymentType, String rateFlag) {
		// TODO Auto-generated method stub
		return adminSellRateRepository.getCurrencyRateBasedOnFromBranchIdAndToBranchId(fromBranchId, toBranchId, paymentType, rateFlag);
	}

	
	
}
