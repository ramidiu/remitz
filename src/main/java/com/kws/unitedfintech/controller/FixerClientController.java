package com.kws.unitedfintech.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.servlet.ModelAndView;

import com.kws.unitedfintech.entities.AdminSellRates;
import com.kws.unitedfintech.repository.AdminSellRateRepository;


@RestController
public class FixerClientController {

	@Autowired
	private AdminSellRateRepository adminSellRateRepository;

	private RestTemplate restTemplate = new RestTemplate();

	private final String baseUrl = "http://data.fixer.io/api/latest";
	private final String key = "b8c8c545ef0ca188863ce2cdfcfb44dc";
	private String finalUrl = "";
    private String updatedDate="";
	@RequestMapping(value = "/getcurrencysrates")
	public ModelAndView  getCurrencyRates(HttpServletRequest request, String crid) throws ParseException {
		HttpSession session = request.getSession();
		String adminId = (String) session.getAttribute("adminId");
		ModelAndView modelAndView=new ModelAndView();
		List<AdminSellRates> adminSellRatesList = adminSellRateRepository.findAllByAdminId(adminId,"selling", "");
		//System.out.println("size::::" + adminSellRatesList.size());
		for (int i = 0; i < adminSellRatesList.size(); i++) {
			AdminSellRates adminSellRates = adminSellRatesList.get(i);
			getCurrencyRatesFromFixer(adminSellRates.getFromBranch().getFromCountry().getCurrencyCode(),
					adminSellRates.getToBranch().getFromCountry().getCurrencyCode(), adminSellRates.getCrId());
		}
		modelAndView.setViewName("redirect:add_rates");
		return modelAndView;
	}

	public void getCurrencyRatesFromFixer(String baseCurrency,String symbols,String  crid) throws ParseException {
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
       System.out.println("base"+baseCurrency+"-"+symbols+"rate::::::"+obj);
		
		  
		  adminSellRateRepository.UpdateMasterRateByCrid(obj,updatedDate,crid); 
		 
	   	
	}else {
		adminSellRateRepository.UpdateMasterRateByCrid(1.0,updatedDate,crid);
	}
	}
	
	@RequestMapping("/getfixerrate")
	public ResponseEntity<Double> getUnderRemitRate() throws ParseException {
	   double usdAmount=0.0;
		HttpHeaders httpHeaders=new HttpHeaders();
		httpHeaders.setContentType(MediaType.APPLICATION_JSON);
		HttpEntity<String> entity=new HttpEntity<String>(httpHeaders);
		finalUrl=finalUrl+baseUrl+"?access_key="+key+"&base=CAD&symbols=USD";
		
		ResponseEntity<String> response=restTemplate.exchange(finalUrl,HttpMethod.POST,entity,String.class);
		 JSONParser jSONParser=new JSONParser();
	       JSONObject json = (JSONObject)jSONParser.parse(response.getBody());
	       Map<String,Object> ress=(Map<String,Object>) json.get("rates");
	       System.out.println("json::::"+ress.get("USD"));
	       usdAmount=(Double) ress.get("USD");
	       System.out.println("usdAmount::::"+usdAmount);
	       return new ResponseEntity<Double>(usdAmount,HttpStatus.OK);
	}
}
