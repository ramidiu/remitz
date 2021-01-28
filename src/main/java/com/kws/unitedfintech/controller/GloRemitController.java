package com.kws.unitedfintech.controller;

import java.io.Serializable;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.kws.unitedfintech.entities.Branch;
import com.kws.unitedfintech.entities.Data;
import com.kws.unitedfintech.entities.GloResponse;
import com.kws.unitedfintech.entities.NasanoResponse;
import com.kws.unitedfintech.entities.TransactionInformation;
import com.kws.unitedfintech.service.BranchService;
import com.kws.unitedfintech.service.NasanoResponService;
import com.kws.unitedfintech.service.TransactionInformationService;

@RestController
public class GloRemitController {

	@Autowired
	private TransactionInformationService tx;
	@Autowired
	private NasanoResponService ns;
	@Autowired
	private BranchService bs;
	
	RestTemplate restTemplate=new RestTemplate(); 

	@RequestMapping("/doDeposit")
	public @ResponseBody String depositmoney(@RequestParam String txId) {
		
		TransactionInformation t=tx.findByTransactionId(txId);
		String url="";
		if(t.getPaymentType().equals("Mobile Money")||t.getPaymentType().equals("Mobile Airtime top up")) {
url="https://instantcredit.nsano.com/preprod/api/v1/remittance/deposit/wallet";	
}else {
url="https://instantcredit.nsano.com/preprod/api/v1/remittance/deposit/account";
			
		}
		System.out.println("url======="+url);
Map  dMap=new HashMap();
		dMap.put("sender", t.getCustomer().getMobileNumber());
		dMap.put("senderName", t.getCustomer().getFirstName());
		dMap.put("sourceCurrency", t.getFromBranch().getFromCountry().getCurrencyCode());
		System.out.println("payment type====="+t.getPaymentType());
		if(t.getPaymentType().equals("Cash Collection")) {
			dMap.put("recipient", t.getBeneficiary().getCollectionPointTelephone());
			dMap.put("destinationHouse", t.getBeneficiary().getCollectionPointBank());
		
		}
		if(t.getPaymentType().equals("Mobile Money")) {
			String phoneNumber= t.getBeneficiary().getMobileTrnsferNumber();
			dMap.put("recipient", phoneNumber);
			dMap.put("destinationHouse", t.getBeneficiary().getTransferNetWork());
		
		}
		if(t.getPaymentType().equals("Bill Payment")) {
			String AccountNumber=t.getBeneficiary().getCustomerAccountNumber();
			String bankName=t.getBeneficiary().getBankToPay();
			dMap.put("recipient",AccountNumber );
			dMap.put("destinationHouse",bankName );
		
		}
		if(t.getPaymentType().equals("Bank Deposit")||t.getPaymentType().equals("Account Transfer")) {
			String AccountNumber=t.getBeneficiary().getBeneficiaryAccountTransfer();
			String bankName=t.getBeneficiary().getBank();
			System.out.println("AccountNumber-==="+AccountNumber);
			System.out.println("bankName====="+bankName);
			dMap.put("recipient",AccountNumber);
			dMap.put("destinationHouse", bankName);
		
		}
		if(t.getPaymentType().equals("Home Delivery")) {
			dMap.put("recipient", t.getBeneficiary().getMobileNumber());
			dMap.put("destinationHouse", "MTN");
		
		}
		if(t.getPaymentType().equals("Card Transfer")) {
			System.out.println("it is cardhhjjhyujh");
			dMap.put("recipient", t.getBeneficiary().getMobileNumber());
			dMap.put("destinationHouse", "MTN");
		
		}
		
		dMap.put("recipientName",t.getBeneficiary().getFirstName());
		dMap.put("recipientCountry", t.getToBranch().getFromCountry().getCountryISO());
		dMap.put("reference",t.getTransactionId());
		dMap.put("amount", t.getSendingAmount());
		dMap.put("exchangeRate", t.getSendingCurrencyRate());
		System.out.println("Perform Deposit request========"+dMap);
		HttpHeaders httpHeaders=new HttpHeaders();
		httpHeaders.add("Authorization-Key","9c29df22d90b415793fa30a74bdfc91c");
		httpHeaders.setContentType(MediaType.APPLICATION_JSON);
		System.out.println("url====="+url);
		System.out.println("header====="+httpHeaders);
		HttpEntity<Map<String, Serializable>> entity=new HttpEntity<Map<String, Serializable>>(dMap,httpHeaders);
		ResponseEntity<String> response= restTemplate.exchange(url,HttpMethod.POST, entity,String.class);
		System.out.println("body::"+response.getBody());
		Gson gson=new Gson();
 GloResponse g=gson.fromJson(response.getBody(),GloResponse.class );
 System.out.println("Perform Deposit response=========="+g);
 Data d=g.getData();
 String msg=g.getMsg();
 String code=g.getCode();
 String tid=d.getTransactionId();
 String status=d.getStatus();
System.out.println("d======="+d);
System.out.println("g====="+g);	
NasanoResponse n=t.getNasanoResponse();
n.setGloMsg(msg);
n.setGloStatus(status);
n.setGloTransactionId(tid);
NasanoResponse n1=ns.update(n);
System.out.println("n1====="+n1);
t.setApiFlag("Nsano");
t.setNasanoResponse(n1);
tx.updateTransactionInformation(t);

		return msg;
	}
	
@RequestMapping("/bankNameCheck")
public @ResponseBody String bankNameCheck(@RequestParam String accountNumber,String destinationHouse, String branchId,String p) {
	Branch b=bs.getBranchBasedOnBranchId(branchId);
	String result="";
	String nsano=b.getNsano();
	if(nsano.equals("yes")) {
String url="https://instantcredit.nsano.com/preprod/api/v1/remittance/name-check/account";
	Map  dMap=new HashMap();
	dMap.put("accountNumber",accountNumber);
	dMap.put("destinationHouse", destinationHouse);
	System.out.println("url===="+url);
	System.out.println("Name check request===="+dMap);
	HttpHeaders httpHeaders=new HttpHeaders();
	httpHeaders.add("Authorization-Key","9c29df22d90b415793fa30a74bdfc91c");
	httpHeaders.setContentType(MediaType.APPLICATION_JSON);
	HttpEntity<Map<String, Serializable>> entity=new HttpEntity<Map<String, Serializable>>(dMap,httpHeaders);
	ResponseEntity<String> response= restTemplate.exchange(url,HttpMethod.POST, entity,String.class);
	System.out.println("body::"+response.getBody());
	Gson gson=new Gson();
	 GloResponse g=gson.fromJson(response.getBody(),GloResponse.class );
	 System.out.println("name check response===="+g);
	 Data d=g.getData();
	 String msg=g.getMsg();
	 String code=g.getCode();
	 String msg1=d.getMsg();
	 String code1=d.getCode();
	 String syscode=d.getSystem_code();
	 if(code1.equals("00")) {
	 String bnkname=d.getData().getBankAccountName();
System.out.println("bnkname==="+bnkname);
result=code1+"-"+"Your Bank Account Name:"+bnkname;
	 }else {
	 System.out.println("msg======"+msg);
	 System.out.println("msg1======"+msg1);
	 System.out.println("code======"+code);
	 System.out.println("code1======"+code1);
	 result=code1+"-"+msg1;
	 }}else {
		result="no";	
	}
	return result;
}

	/**/

@RequestMapping("Nsano")
public ModelAndView NsanoPage() {
	ModelAndView mav=new ModelAndView("Nsano");
	return mav;
}
	
}
