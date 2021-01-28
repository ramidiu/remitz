
package com.kws.unitedfintech.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.json.simple.parser.ParseException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.client.HttpClientErrorException;
import org.springframework.web.client.HttpServerErrorException;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.kws.unitedfintech.entities.Banks;
import com.kws.unitedfintech.entities.Country;
import com.kws.unitedfintech.entities.TransactionInformation;
import com.kws.unitedfintech.service.BankService;
import com.kws.unitedfintech.service.CountryService;
import com.kws.unitedfintech.service.TransactionInformationService;
import com.kws.unitedfintech.underremitentities.AccountNumberResponse;
import com.kws.unitedfintech.underremitentities.BankResponse;
import com.kws.unitedfintech.underremitentities.BillCategoryResponse;
import com.kws.unitedfintech.underremitentities.BillPaymentCategorys;
import com.kws.unitedfintech.underremitentities.BranchResponse;
import com.kws.unitedfintech.underremitentities.BulkTransferData;
import com.kws.unitedfintech.underremitentities.BulkTransferResponse;
import com.kws.unitedfintech.underremitentities.BulkTransferResponseData;
import com.kws.unitedfintech.underremitentities.CommonResponse;
import com.kws.unitedfintech.underremitentities.FxRateResponse;
import com.kws.unitedfintech.underremitentities.TransferFeeResponse;
import com.kws.unitedfintech.underremitentities.TransferResponse;
import com.kws.unitedfintech.underremitentities.bulk_data;
import com.kws.unitedfintech.underremitentities.data;

@RestController
public class UnderRemitController{

	@Autowired
	private BankService bankService;

	
	@Autowired
	private TransactionInformationService transactionInformationService;

	
	@Autowired
	private CountryService countryService;

	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

	Calendar cal = Calendar.getInstance();

	Date d = cal.getTime();

	RestTemplate restTemplate = new RestTemplate();
	// Local
	// private final String secretkey = "Bearer
	// FLWSECK_TEST-7db183d5ae306e75989e65969d8f9860-X"; //
	// online
	private final String secretkey = "Bearer FLWSECK-f029e429427695668c794140f4f4bf2a-X";

	@RequestMapping("/getallbanks") public List<Banks> getAllBanks(@RequestParam
  String countryISO) throws ParseException {
  System.out.println("countryISOoooooooooooooo:::" + countryISO); List<Banks>
  banksList = new ArrayList<Banks>(); String url =
  "https://api.flutterwave.com/v3/banks/" + countryISO; HttpHeaders headers =
  new HttpHeaders(); headers.add("Authorization", secretkey);
  HttpEntity<String> entity = new HttpEntity<String>(headers);
  ResponseEntity<String> response = restTemplate.exchange(url, HttpMethod.GET,
  entity, String.class); String body = response.getBody();
  
  Gson gson = new Gson(); 
  BankResponse bankresponse = gson.fromJson(body,
  BankResponse.class); 
  List<data> bankDataList = bankresponse.getData();
  Country country = countryService.getCountryBasedOnIso(countryISO); for (int i
  = 0; i < bankDataList.size(); i++) {
  
  data data = bankDataList.get(i); Banks banks = new Banks();
  banks.setBankId(data.getId()); banks.setBankCode(data.getCode());
  banks.setBankName(data.getName()); banks.setCountry(country);
  banksList.add(banks); }
  
  System.out.println("banksListssssssssss:::" + banksList); return banksList;
   //bankService.saveUnderRemitBanks(bankDataList); 
   
  }

	@RequestMapping("getbranches")
	public List<data> getBranches(@RequestParam String bankCode) {
		List<data> branchDataList = null;
		try {
			String url = "https://api.flutterwave.com/v3/banks/" + bankCode + "/branches";
			System.out.println("url:::" + url);
			HttpHeaders headres = new HttpHeaders();
			headres.add("Authorization", secretkey);
			HttpEntity request = new HttpEntity(headres);
			ResponseEntity<String> response = restTemplate.exchange(url, HttpMethod.GET, request, String.class);
			Gson gson = new Gson();
			BranchResponse branchResponse = gson.fromJson(response.getBody(), BranchResponse.class);

			if (branchResponse.getStatus().equals("success")) {
				branchDataList = branchResponse.getData();
			} else {
				branchDataList = new ArrayList();
				data data = new data();
				data.setBranch_code("0");
				branchDataList.add(data);
			}

		} catch (HttpClientErrorException e) {
			System.out.println("catch block is executing");
			branchDataList = new ArrayList();
			data data = new data();
			data.setBranch_code("0");
			branchDataList.add(data);
		}
		return branchDataList;
	}

	@RequestMapping("validatbankaccountnumber")
	public String validateAccount(@RequestParam String account_number, @RequestParam String account_bank) {
		String result = "";
		try {

			String url = "https://api.flutterwave.com/v3/accounts/resolve";
			HttpHeaders headers = new HttpHeaders();
			headers.setContentType(MediaType.APPLICATION_JSON);
			headers.add("Authorization", secretkey);
			Map map = new HashMap();
			map.put("account_number", account_number);
			map.put("account_bank", account_bank);
			HttpEntity entity = new HttpEntity(map, headers);
			System.out.println("account_number::::" + account_number + "account_bank" + account_bank);
			System.out.println("hittinggggg");
			ResponseEntity<String> response = restTemplate.postForEntity(url, entity, String.class);

			System.out.println("reeeeee" + response);
			System.out.println("testaccountresponse" + response.getBody());
			Gson gson = new Gson();
			AccountNumberResponse accountNumberResponse = gson.fromJson(response.getBody(),
					AccountNumberResponse.class);
			System.out.println("accountNumberResponse::::" + accountNumberResponse);
			System.out.println("stttttttttttt" + accountNumberResponse.getStatus());

			if (accountNumberResponse.getStatus().equals("success")) {
				result = "success";

			} else {
				result = "error";
			}
		} catch (HttpClientErrorException e) {
			result = "error";
		} catch (HttpServerErrorException ee) {
			result = "error";
		} catch (NullPointerException ne) {
			result = "error";
		}

		return result;
	}

	@PostMapping("bulktransfer")
	public String transferBankAmounts(HttpServletRequest request) {
		List<bulk_data> bulkDataList = new ArrayList<bulk_data>();

		String transactionData = request.getParameter("transactionData");
		System.out.println("transactionData:::" + transactionData);
		String individulaTransactionData[] = transactionData.split("-");
		for (int i = 0; i < individulaTransactionData.length; i++) {
			String transaction[] = individulaTransactionData[i].split(",");
			bulk_data bulkData = new bulk_data();
			System.out.println("transactionid::::" + transaction[0]);
			bulkData.setBank_code(transaction[1]);
			System.out.println("bankid" + transaction[1]);
			System.out.println("accountnumber" + transaction[2]);
			bulkData.setAccount_number(transaction[2]);
			System.out.println("amount:::" + transaction[3]);
			bulkData.setAmount(transaction[3]); //
			System.out.println("currency" + transaction[4]);
			bulkData.setCurrency("NGN");
			bulkData.setNarration("testing");
			bulkData.setReference("testing"); //
			System.out.println("refrence:::" + transaction[6]);
			bulkDataList.add(bulkData);
		}
		System.out.println("bulkDataList::::" + bulkDataList.size());
		if (bulkDataList.size() > 0) {
			BulkTransferData bulkTransferData = new BulkTransferData();
			bulkTransferData.setTitle("Staff salary");
			bulkTransferData.setBulk_data(bulkDataList);
			String url = "https://api.flutterwave.com/v3/bulk-transfers";
			HttpHeaders httpHeaders = new HttpHeaders();
			httpHeaders.setContentType(MediaType.APPLICATION_JSON);
			httpHeaders.add("Authorization", secretkey);
			HttpEntity entity = new HttpEntity(bulkTransferData, httpHeaders);
			ResponseEntity<String> response = restTemplate.exchange(url, HttpMethod.POST, entity, String.class);
			System.out.println("body::::" + response.getBody());
			Gson gson = new Gson();
			BulkTransferResponseData bulkTransferResponseData = gson.fromJson(response.getBody(),
					BulkTransferResponseData.class);
			System.out.println("bulkTransferResponseData::::" + bulkTransferResponseData);
			BulkTransferResponse bulkTransferResponse = new BulkTransferResponse();
			data data = bulkTransferResponseData.getData();
			bulkTransferResponse.setTrnsferResponseId(data.getId());
			bulkTransferResponse.setStatus(bulkTransferResponseData.getStatus());
			bulkTransferResponse.setMessage(bulkTransferResponseData.getMessage());
			bulkTransferResponse.setCreatedDate(data.getCreated_at());
			bulkTransferResponse.setApprover(data.getApprover());
			//bulkTransferResponseService.saveBulkTransferResponse(bulkTransferResponse);
		}
		return "";
	}

	@RequestMapping("gettransferfee")
	public String getTransferFee(@RequestParam String amount, @RequestParam String currency) {
		String fee = "";
		String url = "https://api.flutterwave.com/v3/transfers/fee?amount=" + amount + "&currency=" + currency;
		HttpHeaders httpHeaders = new HttpHeaders();
		httpHeaders.add("Authorization", secretkey);
		HttpEntity entity = new HttpEntity(httpHeaders);
		ResponseEntity<String> response = restTemplate.exchange(url, HttpMethod.GET, entity, String.class);
		Gson gson = new Gson();
		TransferFeeResponse transferFeeResponse = gson.fromJson(response.getBody(), TransferFeeResponse.class);
		List<data> dataList = transferFeeResponse.getData();
		for (int i = 0; i < dataList.size(); i++) {
			data data = dataList.get(i);
			fee = data.getFee();
		}
		return fee;
	}

	@RequestMapping("/getflutterwaverate")
	public String getFlutterWaveRate(@RequestParam double amount, @RequestParam String toCurrency) {
		String result = "", fxRate = "", recvingAmount = "";
		String url = "https://api.flutterwave.com/v3/rates?from=USD&to=" + toCurrency + "&amount=" + amount;
		HttpHeaders httpHeaders = new HttpHeaders();
		httpHeaders.add("Authorization", secretkey);
		HttpEntity entity = new HttpEntity(httpHeaders);
		ResponseEntity<String> response = restTemplate.exchange(url, HttpMethod.GET, entity, String.class);
		System.out.println("response:::" + response.getBody());
		Gson gson = new Gson();
		FxRateResponse fxRateResponse = gson.fromJson(response.getBody(), FxRateResponse.class);
		data data = fxRateResponse.getData();
		fxRate = data.getRate();
		recvingAmount = fxRateResponse.getData().getTo().getAmount();
		result = result + recvingAmount + "," + fxRate + ",";
		return result;
	}

	@RequestMapping("createtransfer")
	public ModelAndView createTransfer(HttpServletRequest request) {
		ModelAndView modelAndView = new ModelAndView("redirect:underremitbanktransactions");
		String transactionId = request.getParameter("transactionId");
		System.out.println("transactionId::::" + transactionId);
		TransactionInformation transactionInformation = transactionInformationService
				.getTransactionDetails(transactionId);
		System.out.println("transactionInformation::" + transactionInformation);

		String url = "https://api.flutterwave.com/v3/transfers";
		HttpHeaders httpHeaders = new HttpHeaders();
		httpHeaders.add("Authorization", secretkey);
		httpHeaders.setContentType(MediaType.APPLICATION_JSON);
		Map createTransferDataMap = new HashMap();
		createTransferDataMap.put("account_bank", transactionInformation.getBeneficiary().getBankId());
		createTransferDataMap.put("account_number", transactionInformation.getBeneficiary().getBankAccountNumber());
		createTransferDataMap.put("amount", transactionInformation.getReceipentAmount());

		createTransferDataMap.put("narration", transactionInformation.getSendingReason());
		createTransferDataMap.put("currency", transactionInformation.getReceivingCurrency());
		createTransferDataMap.put("reference", transactionInformation.getTransactionId());
		createTransferDataMap.put("callback_url", "https://webhook.site/b3e505b0-fe02-430e-a538-22bbbce8ce0d");
		createTransferDataMap.put("debit_currency", transactionInformation.getReceivingCurrency());
		HttpEntity entity = new HttpEntity(createTransferDataMap, httpHeaders);

		ResponseEntity<String> response = restTemplate.postForEntity(url, entity, String.class);
		System.out.println("response:::::" + response.getBody());

		Gson gson = new Gson();

		CommonResponse commonResponse = gson.fromJson(response.getBody(), CommonResponse.class);
		System.out.println("commonResponse::::" + commonResponse.getData().getId());
		TransferResponse transferResponse = new TransferResponse();
		transferResponse.setTransferResponseId(commonResponse.getData().getId());
		transferResponse.setCommonStatus(commonResponse.getStatus());
		transferResponse.setMessage(commonResponse.getMessage());
		transferResponse.setAccountNumber(commonResponse.getData().getAccount_number());
		transferResponse.setBankCode(commonResponse.getData().getBank_code());
		transferResponse.setFullName(commonResponse.getData().getFull_name());
		transferResponse.setCreatedDate(commonResponse.getData().getCreated_at());
		transferResponse.setCurrency(commonResponse.getData().getCurrency());
		transferResponse.setDebitCurrency(commonResponse.getData().getDebit_currency());
		transferResponse.setAmount(commonResponse.getData().getAmount());
		transferResponse.setFee(commonResponse.getData().getFee());
		transferResponse.setDataStatus(commonResponse.getData().getStatus());
		transferResponse.setReference(commonResponse.getData().getReference());
		transferResponse.setNarration(commonResponse.getData().getNarration());
		transferResponse.setBankName(commonResponse.getData().getBank_name());

		//transferResponseService.savetransferResponsedetails(transferResponse);
		getTrnsferDetails(commonResponse.getData().getId());
		return modelAndView;

	}

	public void getTrnsferDetails(String transferId) {

		String transfers = "https://api.flutterwave.com/v3/transfers/" + transferId;

		HttpHeaders headers = new HttpHeaders();
		headers.add("Authorization", secretkey);
		HttpEntity request = new HttpEntity(headers);
		ResponseEntity<String> response = restTemplate.exchange(transfers, HttpMethod.GET, request, String.class);
		System.out.println("transferResponse::::" + response.getBody());
		Gson gson = new Gson();
		CommonResponse commonResponse = gson.fromJson(response.getBody(), CommonResponse.class);
		System.out.println("transferResponse::::" + commonResponse.getData().getReference() + ""
				+ commonResponse.getData().getStatus());
		transactionInformationService.updateFlutterTransactionStatus(commonResponse.getData().getStatus(), transferId,
				commonResponse.getData().getReference());
	}

	@RequestMapping("gettransferstatus")
	public ModelAndView getTrnsferDetailsStatus(HttpServletRequest request) {
		ModelAndView modelAndView = new ModelAndView("redirect:underremitbanktransactions");
		String transferId = request.getParameter("transferId");
		String transfers = "https://api.flutterwave.com/v3/transfers/" + transferId;

		HttpHeaders headers = new HttpHeaders();
		headers.add("Authorization", secretkey);
		HttpEntity entity = new HttpEntity(headers);
		ResponseEntity<String> response = restTemplate.exchange(transfers, HttpMethod.GET, entity, String.class);
		System.out.println("transferResponse::::" + response.getBody());
		Gson gson = new Gson();
		CommonResponse commonResponse = gson.fromJson(response.getBody(), CommonResponse.class);
		System.out.println("transferResponse::::" + commonResponse.getData().getReference() + ""
				+ commonResponse.getData().getStatus());
		transactionInformationService.updateFlutterTransactionStatus(commonResponse.getData().getStatus(), transferId,
				commonResponse.getData().getReference());
		return modelAndView;
	}

	@RequestMapping("/getbillcategorys")
	public List<data> getBillCategorys() {
		String url = "https://api.flutterwave.com/v3/bill-categories";
		HttpHeaders headers = new HttpHeaders();
		headers.add("Authorization", secretkey);
		HttpEntity entity = new HttpEntity(headers);
		ResponseEntity<String> response = restTemplate.exchange(url, HttpMethod.GET, entity, String.class);
		System.out.println("response:::" + response);
		Gson gson = new Gson();
		BillCategoryResponse billCategoryResponse = gson.fromJson(response.getBody(), BillCategoryResponse.class);
		System.out.println("billCategoryResponse:::" + billCategoryResponse);

		List<data> billCategoryList = billCategoryResponse.getData();
		System.out.println("billlll list:::" + billCategoryList.size());
		for (int i = 0; i < billCategoryList.size(); i++) {
			data data = (data) billCategoryList.get(i);
			BillPaymentCategorys billPaymentCategorys = new BillPaymentCategorys();
			billPaymentCategorys.setBillPaymentcategoryId(data.getId());
			billPaymentCategorys.setBillerCode(data.getBiller_code());
			billPaymentCategorys.setName(data.getName());
			billPaymentCategorys.setBillerCode(data.getBiller_code());
			billPaymentCategorys.setDefaultCommission(data.getDefault_commission());
			billPaymentCategorys.setDateAdded(data.getDate_added());
			billPaymentCategorys.setCountry(data.getCountry());
			billPaymentCategorys.setIsAirtime(data.getIs_airtime());
			billPaymentCategorys.setBillerName(data.getBiller_name());
			billPaymentCategorys.setItemCode(data.getItem_code());
			billPaymentCategorys.setShortName(data.getShort_name());
			billPaymentCategorys.setFee(Double.parseDouble(data.getFee()));
			billPaymentCategorys.setCommisionOnFee(data.getCommission_on_fee());
			billPaymentCategorys.setLabelName(data.getLabel_name());
			billPaymentCategorys.setAmount(Double.parseDouble(data.getAmount()));
			//billPaymentCategorysService.saveBillPaymentCategorys(billPaymentCategorys);
		}
		return billCategoryList;

	}

	@RequestMapping("/getoperatorbillcategorys")
	public List<BillPaymentCategorys> getoperatorBillCategorys(@RequestParam String billerCode) {
		String url = "https://api.flutterwave.com/v3/bill-categories";
		List<BillPaymentCategorys> billPaymentCategorysList = new ArrayList<BillPaymentCategorys>();
		HttpHeaders headers = new HttpHeaders();
		headers.add("Authorization", secretkey);
		HttpEntity entity = new HttpEntity(headers);
		ResponseEntity<String> response = restTemplate.exchange(url, HttpMethod.GET, entity, String.class);
		System.out.println("response:::" + response);
		Gson gson = new Gson();
		BillCategoryResponse billCategoryResponse = gson.fromJson(response.getBody(), BillCategoryResponse.class);
		System.out.println("billCategoryResponse:::" + billCategoryResponse);

		List<data> billCategoryList = billCategoryResponse.getData();
		System.out.println("billlll list:::" + billCategoryList.size());
		for (int i = 0; i < billCategoryList.size(); i++) {
			data data = (data) billCategoryList.get(i);

			if (data.getBiller_code().equals(billerCode)) {
				BillPaymentCategorys billPaymentCategorys = new BillPaymentCategorys();
				billPaymentCategorys.setBillPaymentcategoryId(data.getId());
				billPaymentCategorys.setBillerCode(data.getBiller_code());
				billPaymentCategorys.setName(data.getName());
				billPaymentCategorys.setBillerCode(data.getBiller_code());
				billPaymentCategorys.setDefaultCommission(data.getDefault_commission());
				billPaymentCategorys.setDateAdded(data.getDate_added());
				billPaymentCategorys.setCountry(data.getCountry());
				billPaymentCategorys.setIsAirtime(data.getIs_airtime());
				billPaymentCategorys.setBillerName(data.getBiller_name());
				billPaymentCategorys.setItemCode(data.getItem_code());
				billPaymentCategorys.setShortName(data.getShort_name());
				billPaymentCategorys.setFee(Double.parseDouble(data.getFee()));
				billPaymentCategorys.setCommisionOnFee(data.getCommission_on_fee());
				billPaymentCategorys.setLabelName(data.getLabel_name());
				billPaymentCategorys.setAmount(Double.parseDouble(data.getAmount()));
				billPaymentCategorysList.add(billPaymentCategorys);

			}

		}
		System.out.println("sssssss:::::" + billPaymentCategorysList.size());
		return billPaymentCategorysList;
	}

	@RequestMapping("/validatebillpayment")
	public void validateBillPayment(@RequestParam String itemCode, @RequestParam String billerCode,
			@RequestParam String customer, @RequestParam String amount) {
		String url = "https://api.flutterwave.com/v3/bill-items/" + itemCode + "/validate?code=" + billerCode
				+ "&customer=" + customer;
		HttpHeaders httpHeaders = new HttpHeaders();
		httpHeaders.add("Authorization", secretkey);
		HttpEntity entity = new HttpEntity(httpHeaders);
		ResponseEntity<String> response = restTemplate.exchange(url, HttpMethod.GET, entity, String.class);
		System.out.println("response:::" + response.getBody());
		createBillPayment(customer, amount);
	}

	@RequestMapping("/createbillpayment")
	public void createBillPayment(String customer, String amount) {

		String url = "https://api.flutterwave.com/v3/bills";
		HttpHeaders httpHeaders = new HttpHeaders();
		httpHeaders.add("Authorization", secretkey);

		Map billpaymetMap = new HashMap();
		billpaymetMap.put("country", "NG");
		billpaymetMap.put("customer", "+234" + customer);
		billpaymetMap.put("amount", amount);
		billpaymetMap.put("recurrence", "ONCE");
		billpaymetMap.put("type", "AIRTIME");
		billpaymetMap.put("reference", "9300049404444");

		HttpEntity entity = new HttpEntity(billpaymetMap, httpHeaders);
		ResponseEntity<String> response = restTemplate.exchange(url, HttpMethod.GET, entity, String.class);
		System.out.println("response:::" + response.getBody());
	}
}
