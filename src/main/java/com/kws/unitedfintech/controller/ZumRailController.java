package com.kws.unitedfintech.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.client.RestTemplate;

import com.google.gson.Gson;
import com.kws.unitedfintech.service.BankAccountInformationService;
import com.kws.unitedfintech.service.CreditCardInformationService;
import com.kws.unitedfintech.service.ZumRailsTransactionService;
import com.kws.unitedfintech.service.ZumRailsUserService;
import com.kws.unitedfintech.underremitentities.BankAccountInformation;
import com.kws.unitedfintech.underremitentities.CreditCardInformation;
import com.kws.unitedfintech.underremitentities.TransactionHistory;
import com.kws.unitedfintech.underremitentities.TransactionResponse;
import com.kws.unitedfintech.underremitentities.ZumRailsTransaction;
import com.kws.unitedfintech.underremitentities.ZumRailsUser;
import com.kws.unitedfintech.underremitentities.ZumRailsUserResponse;
@RestController
public class ZumRailController {

	private RestTemplate restTemplate=new RestTemplate();
	@Autowired
	private BankAccountInformationService bankAccountInformationService;
	@Autowired
	private CreditCardInformationService creditCardInformationService;
	@Autowired
	private ZumRailsUserService zumRailsUserService;
	@Autowired
	private ZumRailsTransactionService zumRailsTransactionService;
	String baseurl="https://api-sandbox.zumrails.com/api";
	static String zumRailsToken="Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1bmlxdWVfbmFtZSI6IjQxYjdjZTFjLTdlOTYtNDZhNC05MzQyLTMwNGI1ODY1N2I2MSIsImh0dHA6Ly9zY2hlbWFzLm1pY3Jvc29mdC5jb20vd3MvMjAwOC8wNi9pZGVudGl0eS9jbGFpbXMvdXNlcmRhdGEiOiIwZWNiMDI4Ni01OTEyLTQxNWItODExOS1lYzlmNDcxOWY0YTUiLCJyb2xlIjoiQ3VzdG9tZXJBZG1pbiIsIm5hbWVpZCI6IkhvbmV5V2VhbHRoIiwiYWN0b3J0IjoiQ3VzdG9tZXIiLCJuYmYiOjE2MDU3NjgyOTIsImV4cCI6MTYwNTg1NDY5MiwiaWF0IjoxNjA1NzY4MjkyfQ.P5kR_fgVEoKIIH37I7dIm7jGjZgUpChEkpQnERtcJIs";

	@RequestMapping(value = "/createzumusers")
	public String createZumRailsUsers(@RequestBody ZumRailsUser zumRailsUser) {
System.out.println("create zum user");
		 zumRailsUserService.saveZumrailsUser(zumRailsUser);
		return "success";
	}	
	@RequestMapping(value = "/createzumuser", method = RequestMethod.POST)
	public String createZumRailsUser(@RequestBody ZumRailsUser zumRailsUser) {
		System.out.println("callb trigger"+zumRailsUser);
		CreditCardInformation creditCardInformation1=null;
		CreditCardInformation dbcreditCardInformation1=null;
		BankAccountInformation bankAccountInformation1=null;
		BankAccountInformation dbbankAccountInformation=null;
		String bankInformationId="";
		  HttpHeaders httpHeaders=new HttpHeaders();
		  httpHeaders.setContentType(MediaType.APPLICATION_JSON);
		  httpHeaders.add("Authorization",zumRailsToken);
		  String userId="";
		  Map userMap=new HashMap();
		  userMap.put("firstName",zumRailsUser.getFirstName());
		  userMap.put("lastName",zumRailsUser.getLastName());
		  userMap.put("email",zumRailsUser.getEmail());
		  if(!zumRailsUser.getTransactionMethod().equals("EFT")) {
		     userMap.put("companyName",zumRailsUser.getCompanyName()); 
		  }
		  if(zumRailsUser.getTransactionMethod().equals("Interac")) {
		  userMap.put("phoneNumber",zumRailsUser.getPhoneNumber());
	     }
		  
		 
		  if(zumRailsUser.getTransactionMethod().equals("EFT")) {
			
			  bankAccountInformation1=new BankAccountInformation();
			  
			  bankAccountInformation1.setAccountNumber(zumRailsUser.
			  getBankAccountInformation().getAccountNumber());
			  bankAccountInformation1.setInstitutionNumber(zumRailsUser.
			  getBankAccountInformation().getInstitutionNumber());
			  bankAccountInformation1.setTransitNumber(zumRailsUser.
			  getBankAccountInformation().getTransitNumber());
			  bankAccountInformation1.setFirstName(zumRailsUser.getFirstName());
			  bankAccountInformation1.setLastName(zumRailsUser.getLastName());
			 
			  Map bankAccountInformation=new HashMap();
			  bankAccountInformation.put("institutionNumber",zumRailsUser.getBankAccountInformation().getInstitutionNumber());
			  bankAccountInformation.put("transitNumber",zumRailsUser.getBankAccountInformation().getTransitNumber());
			  bankAccountInformation.put("accountNumber",zumRailsUser.getBankAccountInformation().getAccountNumber());
			  bankAccountInformation.put("firstName",zumRailsUser.getFirstName());
			  bankAccountInformation.put("lastName",zumRailsUser.getLastName());
			  userMap.put("BankAccountInformation",bankAccountInformation);
			  
			  
		  }
		
		  if(zumRailsUser.getTransactionMethod().equals("CreditCard")|| zumRailsUser.getTransactionMethod().equals("VisaDirect")) {
		  creditCardInformation1=new CreditCardInformation();
		  creditCardInformation1.setNumber(zumRailsUser.getCreditCardInformation().
		  getNumber());
		  creditCardInformation1.setExpireYear(zumRailsUser.getCreditCardInformation().
		  getExpireYear());
		  creditCardInformation1.setCVV(zumRailsUser.getCreditCardInformation().getCVV()
		  );
		  creditCardInformation1.setExpireMonth(zumRailsUser.getCreditCardInformation().
		  getExpireMonth());
		  creditCardInformation1.setAddressState(zumRailsUser.getCreditCardInformation()
		  .getAddressState());
		  creditCardInformation1.setAddressLine1(zumRailsUser.getCreditCardInformation()
		  .getAddressLine1());
		  creditCardInformation1.setAddressLine2(zumRailsUser.getCreditCardInformation()
		  .getAddressLine2());
		  creditCardInformation1.setAddressCountry(zumRailsUser.getCreditCardInformation
		  ().getAddressCountry());
		  creditCardInformation1.setAddressCity(zumRailsUser.getCreditCardInformation().
		  getAddressCity()); 
		  creditCardInformation1.setAddressPostalCode(zumRailsUser.
		  getCreditCardInformation().getAddressPostalCode());
		  
		  Map creditCardInformation=new HashMap();
		  creditCardInformation.put("Number","1234123412341234");
		  creditCardInformation.put("ExpireMonth","01");
		  creditCardInformation.put("ExpireYear","2020");
		  creditCardInformation.put("CVV","123");
		  creditCardInformation.put("AddressLine1","test");
		  creditCardInformation.put("AddressLine2","testing");
		  creditCardInformation.put("AddressPostalCode","A1123A1");
		  creditCardInformation.put("AddressCountry","CAD");
		  creditCardInformation.put("AddressCity","Toronto");
		  creditCardInformation.put("AddressState","ON");
		  userMap.put("CreditCardInformation",creditCardInformation); 
		  }
		 
		  
		  HttpEntity entity=new HttpEntity(userMap,httpHeaders);
		  
		  ResponseEntity<String> response=restTemplate.postForEntity(baseurl+"/user",
		  entity, String.class);
		  Gson gson=new Gson();
		 ZumRailsUserResponse zumRailsUserResponse=gson.fromJson(response.getBody(),ZumRailsUserResponse.class);
		 System.out.println("fffff"+zumRailsUserResponse);
		 System.out.println("useeeeeid"+zumRailsUserResponse.getResult().getId());
		 userId=zumRailsUserResponse.getResult().getId();
		  int statusCode=response.getStatusCodeValue();
		 
		  if(statusCode==200) {
			  System.out.println("Status is successs");
			  if(zumRailsUser.getTransactionMethod().equals("EFT")) {
				int sCode=createTransaction(zumRailsUser.getTransactionAmount(), userId,zumRailsUser.getTransactionMethod());
				 if(sCode==200) {
					 System.out.println("bankAccountInformation1:::"+bankAccountInformation1);
				      bankInformationId=bankAccountInformationService.saveBankAccountInformation(bankAccountInformation1);
				      System.out.println("after callllll");
				      dbbankAccountInformation=bankAccountInformationService.getBnkInfo(bankInformationId);
				      System.out.println("dbbankAccountInformation:::"+dbbankAccountInformation);
				      zumRailsUser.setBankAccountInformation(dbbankAccountInformation);
				      zumRailsUser.setUserId(userId);
				      creditCardInformation1=creditCardInformationService.findByCreditCardInformationId("dummy");
				      zumRailsUser.setCreditCardInformation(creditCardInformation1);
				      zumRailsUserService.saveZumrailsUser(zumRailsUser);
				 }
			  }
			  
		  }
		return  "";
		}

	public int  createTransaction(double transactionAmount,String userId,String transactionMethod) {
		  HttpHeaders httpHeaders=new HttpHeaders();
		  httpHeaders.setContentType(MediaType.APPLICATION_JSON);
		  httpHeaders.add("Authorization",zumRailsToken);
		  
		  Map transactionMap=new HashMap();
		  transactionMap.put("ZumRailsType","AccountsReceivable");
		  transactionMap.put("TransactionMethod",transactionMethod);
		  transactionMap.put("Amount",transactionAmount);
		  transactionMap.put("Memo","Memo");
		  transactionMap.put("Comment","This transaction is just a test from an user to wallet");
		  transactionMap.put("UserId",userId);
		  transactionMap.put("WalletId","09b22908-1dac-47b3-9be3-5e2254153f4d");
          HttpEntity entity=new HttpEntity(transactionMap,httpHeaders);
		  
		  ResponseEntity<String> response=restTemplate.postForEntity(baseurl+"/transaction",
		  entity, String.class);
		  int statusCode=response.getStatusCodeValue();
		  
		  System.out.println("response::::"+response.getBody());
		  Gson  gson=new Gson();
		  TransactionResponse transactionResponse=gson.fromJson(response.getBody(),TransactionResponse.class);
		  System.out.println("transactionResponse:::"+transactionResponse);
		  System.out.println("result:::"+transactionResponse.getResult());
		  System.out.println("user::::"+transactionResponse.getResult().getUser());
		 System.out.println("transactionhistory::"+transactionResponse.getResult().getTransactionHistory());
         System.out.println("customer:::"+transactionResponse.getResult().getCustomer());
         System.out.println("wallet::"+transactionResponse.getResult().getWallet());
         ZumRailsTransaction zumRailsTransaction=new ZumRailsTransaction();
         zumRailsTransaction.setTransactionId(transactionResponse.getResult().getId());
         zumRailsTransaction.setCreatedAt(transactionResponse.getResult().getCreatedAt());
         zumRailsTransaction.setMemo(transactionResponse.getResult().getMemo());
         zumRailsTransaction.setComment(transactionResponse.getResult().getComment());
         zumRailsTransaction.setAmount(transactionResponse.getResult().getAmount());
         zumRailsTransaction.setCustomerId(transactionResponse.getResult().getCustomer().getId());
         zumRailsTransaction.setCompanyName(transactionResponse.getResult().getCustomer().getCompanyName());
         zumRailsTransaction.setUserId(transactionResponse.getResult().getUser().getId());
         zumRailsTransaction.setUserFirstName(transactionResponse.getResult().getUser().getFirstName());
         zumRailsTransaction.setUserLastName(transactionResponse.getResult().getUser().getLastName());
         zumRailsTransaction.setWalletId(transactionResponse.getResult().getWallet().getId());
         zumRailsTransaction.setType(transactionResponse.getResult().getWallet().getType());
         zumRailsTransaction.setTargetWallet(transactionResponse.getResult().getTargetWallet());
         zumRailsTransaction.setFundingSource(transactionResponse.getResult().getFundingSource());
         zumRailsTransaction.setZumRailsType(transactionResponse.getResult().getZumRailsType());
         TransactionHistory transactionHistory=null;
         List<TransactionHistory> transactionHistoryList=transactionResponse.getResult().getTransactionHistory();
         System.out.println("transactionHistoryList::"+transactionHistoryList);
		
		  for(int i=0;i<transactionHistoryList.size();i++) {
		  transactionHistory=(TransactionHistory) transactionHistoryList.get(0); }
		  zumRailsTransaction.setTransctionHistoryId(transactionHistory.getId());
		  zumRailsTransaction.setCreatedAt(transactionHistory.getCreatedAt());
		  zumRailsTransaction.setEvent(transactionHistory.getEvent());
		  zumRailsTransaction.setEventDescription(transactionHistory.
		  getEventDescription());
		 
         zumRailsTransaction.setTransactionStatus(transactionResponse.getResult().getTransactionStatus());
         zumRailsTransaction.setFailedTransactionEvent(transactionResponse.getResult().getFailedTransactionEvent());;
         zumRailsTransaction.setTransactionFrom(transactionResponse.getResult().getFrom());
         zumRailsTransaction.setTransactionTo(transactionResponse.getResult().getTo());
         zumRailsTransaction.setRecurrentTransactionId(transactionResponse.getResult().getRecurrentTransactionId());
         zumRailsTransactionService.saveZumrailsTransaction(zumRailsTransaction);
         
		 return  statusCode;
	}

	@RequestMapping("/gettxnstatus")
	public void getTransactionStatus(@RequestParam(value = "transactionId") String transactionId) {
		  HttpHeaders httpHeaders=new HttpHeaders();
		  httpHeaders.setContentType(MediaType.APPLICATION_JSON);
		  httpHeaders.add("Authorization",zumRailsToken);
		  HttpEntity entity=new HttpEntity(httpHeaders);
		  ResponseEntity<String>  response=restTemplate.exchange(baseurl+"/transaction/"+transactionId,HttpMethod.GET, entity, String.class);
		  System.out.println("response::::"+response.getBody());
		  
		  Gson  gson=new Gson();
		  TransactionResponse transactionResponse=gson.fromJson(response.getBody(),TransactionResponse.class);
		  System.out.println("transactionResponse:::"+transactionResponse);
		  System.out.println("result:::"+transactionResponse.getResult());
		  System.out.println("user::::"+transactionResponse.getResult().getUser());
		 System.out.println("transactionhistory::"+transactionResponse.getResult().getTransactionHistory());
         System.out.println("customer:::"+transactionResponse.getResult().getCustomer());
         System.out.println("wallet::"+transactionResponse.getResult().getWallet());
         ZumRailsTransaction zumRailsTransaction=new ZumRailsTransaction();
         zumRailsTransaction.setTransactionId(transactionResponse.getResult().getId());
         zumRailsTransaction.setCreatedAt(transactionResponse.getResult().getCreatedAt());
         zumRailsTransaction.setMemo(transactionResponse.getResult().getMemo());
         zumRailsTransaction.setComment(transactionResponse.getResult().getComment());
         zumRailsTransaction.setAmount(transactionResponse.getResult().getAmount());
         zumRailsTransaction.setCustomerId(transactionResponse.getResult().getCustomer().getId());
         zumRailsTransaction.setCompanyName(transactionResponse.getResult().getCustomer().getCompanyName());
         zumRailsTransaction.setUserId(transactionResponse.getResult().getUser().getId());
         zumRailsTransaction.setUserFirstName(transactionResponse.getResult().getUser().getFirstName());
         zumRailsTransaction.setUserLastName(transactionResponse.getResult().getUser().getLastName());
         zumRailsTransaction.setWalletId(transactionResponse.getResult().getWallet().getId());
         zumRailsTransaction.setType(transactionResponse.getResult().getWallet().getType());
         zumRailsTransaction.setTargetWallet(transactionResponse.getResult().getTargetWallet());
         zumRailsTransaction.setFundingSource(transactionResponse.getResult().getFundingSource());
         zumRailsTransaction.setZumRailsType(transactionResponse.getResult().getZumRailsType());
         TransactionHistory transactionHistory=null;
         List<TransactionHistory> transactionHistoryList=transactionResponse.getResult().getTransactionHistory();
         System.out.println("transactionHistoryList::"+transactionHistoryList);
		
		  for(int i=0;i<transactionHistoryList.size();i++) {
		  transactionHistory=(TransactionHistory) transactionHistoryList.get(0); }
		  zumRailsTransaction.setTransctionHistoryId(transactionHistory.getId());
		  zumRailsTransaction.setCreatedAt(transactionHistory.getCreatedAt());
		  zumRailsTransaction.setEvent(transactionHistory.getEvent());
		  zumRailsTransaction.setEventDescription(transactionHistory.
		  getEventDescription());
		 
         zumRailsTransaction.setTransactionStatus(transactionResponse.getResult().getTransactionStatus());
         zumRailsTransaction.setFailedTransactionEvent(transactionResponse.getResult().getFailedTransactionEvent());;
         zumRailsTransaction.setTransactionFrom(transactionResponse.getResult().getFrom());
         zumRailsTransaction.setTransactionTo(transactionResponse.getResult().getTo());
         zumRailsTransaction.setRecurrentTransactionId(transactionResponse.getResult().getRecurrentTransactionId());
         zumRailsTransactionService.saveZumrailsTransaction(zumRailsTransaction);

	}

	
}
