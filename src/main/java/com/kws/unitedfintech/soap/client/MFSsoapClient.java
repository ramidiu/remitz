
package com.kws.unitedfintech.soap.client;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.oxm.jaxb.Jaxb2Marshaller;
import org.springframework.stereotype.Service;
import org.springframework.ws.client.core.WebServiceTemplate;

import com.kws.unitedfintech.soap.bindings.Credential;
import com.kws.unitedfintech.soap.bindings.GetRate;
import com.kws.unitedfintech.soap.bindings.GetRateResponse;




@Service
public class MFSsoapClient {

	@Autowired
	private Jaxb2Marshaller jaxb2Marshaller;

	private WebServiceTemplate webServiceTemplate;

	public String getCurrencyRate() { 
		Credential credential=new Credential();
  credential.setCorporateCode("4UNDREMIT");
  credential.setPassword("hw:gQT5ChnCr#)4U0");
  
  
  GetRate getRate=new GetRate(); 
  getRate.setLogin(credential);
  getRate.setFromCurrency("USD");
  getRate.setToCurrency("NGN");
  getRate.setToCountry("NG");
  
  
  webServiceTemplate=new
  WebServiceTemplate(jaxb2Marshaller); 
  GetRateResponse  getRateResponse=(GetRateResponse)webServiceTemplate.marshalSendAndReceive(
  "https://bwzfezj8b6.execute-api.us-east-1.amazonaws.com/MFStestAPI1-5/mfs-1-5"
  ,getRate);
  System.out.println("getRateResponse:::"+getRateResponse);
  return  getRateResponse.toString();
  }
}
