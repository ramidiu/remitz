package com.kws.unitedfintech.controller;

import java.util.Arrays;
import java.util.HashMap;

import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.http.converter.json.MappingJackson2HttpMessageConverter;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.client.RestTemplate;

import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;

import java.lang.reflect.Type;
import java.net.URLEncoder;
@RestController
public class NsanoController {

	RestTemplate restTemplate = new RestTemplate();

   @RequestMapping(path = "buyairtime")
	public ResponseEntity<String> buyAirTime() {
	 String url="https://fs1.nsano.com:5001/api/fusion/tp/aa479f301f8145b2829b497e2df249b2";
		 HashMap buyAirtime=new HashMap(); 
		buyAirtime.put("sid", "BAE0021539718847270");
		
		
		HashMap serviceDetails=new HashMap();
		serviceDetails.put("msisdn", "233246035305");
		serviceDetails.put("network", "MTN");
		serviceDetails.put("amount", "0.5");
		System.out.println(serviceDetails); 
		
		 Gson gson = new Gson();
		 Type gsonType = new TypeToken<HashMap>(){}.getType();
	      String gsonString = gson.toJson(serviceDetails, gsonType);
	      System.out.println("gsonString::::"+gsonString);
		String encodedString=URLEncoder.encode(gsonString);
		buyAirtime.put("serviceDetails", encodedString);
		buyAirtime.put("kuwaita","huduma_mkoba");
		
		
		MappingJackson2HttpMessageConverter mappingJackson2HttpMessageConverter = new MappingJackson2HttpMessageConverter();
		mappingJackson2HttpMessageConverter.setSupportedMediaTypes(Arrays.asList(MediaType.APPLICATION_FORM_URLENCODED,MediaType.APPLICATION_JSON));
		restTemplate.getMessageConverters().add(mappingJackson2HttpMessageConverter);
		
		
		  HttpHeaders httpHeaders=new HttpHeaders();
		  httpHeaders.setContentType(MediaType.APPLICATION_FORM_URLENCODED);

		 
		HttpEntity entity=new HttpEntity(buyAirtime,httpHeaders);
		
		System.out.println("ReqestDetails::::"+buyAirtime);
		ResponseEntity<String> response= restTemplate.exchange(url,HttpMethod.POST, entity,String.class);
		System.out.println("response======"+response.getBody());
		
		return  response;
	}
}
