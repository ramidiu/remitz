package com.kws.unitedfintech.controller;

import java.io.Serializable;
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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.google.gson.Gson;
import com.kws.unitedfintech.entities.Branch;
import com.kws.unitedfintech.entities.Communication;
import com.kws.unitedfintech.entities.Country;
import com.kws.unitedfintech.entities.CountrySpecific;
import com.kws.unitedfintech.entities.Customer;
import com.kws.unitedfintech.entities.DataFields;
import com.kws.unitedfintech.entities.DriverLicence;
import com.kws.unitedfintech.entities.EmailTemplate;
import com.kws.unitedfintech.entities.Location;
import com.kws.unitedfintech.entities.NationalIds;
import com.kws.unitedfintech.entities.Passport;
import com.kws.unitedfintech.entities.PersonInfo;
import com.kws.unitedfintech.entities.Record;
import com.kws.unitedfintech.entities.States;
import com.kws.unitedfintech.entities.TrulioCustomer;
import com.kws.unitedfintech.entities.TrulioResponse;
import com.kws.unitedfintech.helpers.EmailTemplateHeaderFooterUtil;
import com.kws.unitedfintech.helpers.SendMail;
import com.kws.unitedfintech.service.BranchService;
import com.kws.unitedfintech.service.CountryService;
import com.kws.unitedfintech.service.CustomerService;
import com.kws.unitedfintech.service.EmailTemplateService;
import com.kws.unitedfintech.service.StatesService;
import com.kws.unitedfintech.service.TrulioCustomerService;

@RestController
public class TruliooController {
	
	String hederContent = EmailTemplateHeaderFooterUtil.getStaticEmailHeaderContent();
	String bodyStartsContent = EmailTemplateHeaderFooterUtil.getStaticEmailBodyStartContent();
	String bodyEndContent = EmailTemplateHeaderFooterUtil.getStaticEmailBodyEndsContent();
	String footerContent = EmailTemplateHeaderFooterUtil.getStaticEmailFooterContent();

	RestTemplate restTemplate=new RestTemplate(); 
	
	@Autowired
private StatesService st;
	
	@Autowired
	private BranchService br;
	
	@Autowired
	private EmailTemplateService emailTemplateService;
	
	@Autowired
	private CountryService cr;
	@Autowired
	private TrulioCustomerService tr;
	@Autowired
	private CustomerService cs;
	
	
	@RequestMapping("/validateCustomer")
	public @ResponseBody String validateCutomerDetails(@RequestParam String countryISO, String firstName,String email,String lastName,String dd,String mm,String yyyy,String postalCode,String mobileNumber,String emailId,String address,String firstIdNumber,String houseNumber,String buildingName,String unitNumber,String streetName,String streetType,String telephone,String telephone2,String city,String idType,String nationalIdType,String state, String buildingNumber, String suburb,String firstIdExpireDate,String customerId,String customerfrom) {

		Country c=cr.getCountryBasedOnIso(countryISO);
		System.out.println("countryISO in trulio ===="+countryISO);
	States s=st.getStateById(state);
String spv=s.getStateCode();
		System.out.println("spv====="+spv);
		TrulioCustomer t=tr.findByCountryIso(countryISO);
		System.out.println("t====="+t);
		System.out.println("customer===="+firstName+","+lastName+","+dd+"-"+mm+"-"+yyyy+","+email+","+postalCode+","+unitNumber+","+streetName+","+streetType+","+buildingNumber+","+buildingName+","+mobileNumber+","+telephone+","+telephone2+","+city+","+idType+","+nationalIdType+","+address+","+firstIdNumber);
		
		String url="https://gateway.trulioo.com/trial/verifications/v1/verify";
		
		Map  customerDataMap=new HashMap();
		customerDataMap.put("AcceptTruliooTermsAndConditions",true);
		customerDataMap.put("CleansedAddress",false);
		customerDataMap.put("ConfigurationName","Identity Verification");
		customerDataMap.put("CountryCode",countryISO);
		
		
		Map personMap=new HashMap();
		personMap.put("FirstGivenName",firstName);
		personMap.put("FirstSurName",lastName);
		personMap.put("MiddleName",lastName);
		personMap.put("DayOfBirth",dd);
		personMap.put("MonthOfBirth",mm);
		personMap.put("YearOfBirth",yyyy);
		personMap.put("MinimumAge",0);
		
		Map locationMap=new HashMap();
		locationMap.put("PostalCode",postalCode);
		if(t.getHouseNumber().equals("yes")||t.getHouseNumber()=="yes") {
		locationMap.put("BuildingNumber",buildingNumber);
		}
		if(t.getStateProvinceCode().equals("yes")) {
		locationMap.put("StateProvinceCode",spv);
		}
		if(t.getStreetName().equals("yes")) {
		locationMap.put("StreetName",streetName);
		}
		if(t.getStreetType().equals("yes")) {
		locationMap.put("StreetType",streetType);
		}
		if(t.getSuburb().equals("yes")) {
		locationMap.put("Suburb",suburb);
		}
		if(t.getUnitNumber().equals("yes")) {
		locationMap.put("UnitNumber",unitNumber);
		}
		if(t.getCity().equals("yes")) {
			locationMap.put("City", city);	
		}
		if(t.getBuildingName().equals("yes")) {
			locationMap.put("BuildingName",buildingName);	
		}
		Map  communicationMap=new HashMap();
		
		communicationMap.put("EmailAddress",email);
		if(t.getTelephone().equals("yes")) {
		communicationMap.put("Telephone",telephone);
		}
		if(t.getTelephone2().equals("yes")) {
		communicationMap.put("Telephone2",telephone2);
		}
		if(t.getMobileNumber().equals("yes")) {
			communicationMap.put("mobileNumber",mobileNumber);	
		}
		
		Map  dataFieldsMap=new HashMap();
		dataFieldsMap.put("PersonInfo",personMap);
		dataFieldsMap.put("Location",locationMap);
		dataFieldsMap.put("Communication",communicationMap);
		
		if(t.getPassport().equals("yes")||t.getPassport()=="yes") {
		Map passportMap=new HashMap();
		passportMap.put("Number",firstIdNumber);
		dataFieldsMap.put("Passport",passportMap);
		}
		if(t.getDriverLicence().equals("yes")||t.getDriverLicence()=="yes") {
		Map DrivingLicence=new HashMap();
		DrivingLicence.put("Number", firstIdNumber);
		dataFieldsMap.put("DrivingLicence", DrivingLicence);
		}
		if(t.getNationalIds().contentEquals("yes")||t.getNationalIds()=="yes") {
		Map NationalIds=new HashMap();
		NationalIds.put("Number", firstIdNumber);
		NationalIds.put("Type", nationalIdType);
		dataFieldsMap.put("NationalIds",NationalIds);
		}

		
		customerDataMap.put("DataFields",dataFieldsMap);
	System.out.println("customerDataMap====="+customerDataMap);
		HttpHeaders httpHeaders=new HttpHeaders();
		httpHeaders.add("x-trulioo-api-key","80f89ac0f87944dc99ce4f6e2c3fbccb");
		httpHeaders.setContentType(MediaType.APPLICATION_JSON);

		HttpEntity<Map<String, Serializable>> entity=new HttpEntity<Map<String, Serializable>>(customerDataMap,httpHeaders);
		
		ResponseEntity<String> response= restTemplate.exchange(url,HttpMethod.POST, entity,String.class);
		System.out.println("body::"+response.getBody());
		Gson gson=new Gson();
		
		TrulioResponse tr=gson.fromJson(response.getBody(),TrulioResponse.class);
		System.out.println("tr====="+tr);
		Record Record=tr.getRecord();
		String RecordStatus=Record.getRecordStatus();
		String TransactionID=tr.getTransactionID();
		String TransactionRecordID=Record.getTransactionRecordID();
		System.out.println("Record===="+Record);
		System.out.println("RecordStatus====="+RecordStatus);
		Customer cus=cs.findByCustomerId(customerId);
		if(RecordStatus.equals("match")||RecordStatus=="match"||!RecordStatus.equals("nomatch")) {
		System.out.println("customerId==="+customerId);
		System.out.println("cs===="+cus);
		cus.setTrulioResponse("match");
		cus.setTransactionId(TransactionID);
		cus.setFirstName(firstName);
		cus.setLastName(lastName);
		cus.setCustomerDetailsFlag("full");
		cus.setPostalCode(postalCode);
		cus.setCity(city);
		//cus.setEmailId(emailId);
		cus.setBuildingName(buildingName);
		cus.setStreetName(streetName);
		cus.setStreetType(streetType);
		cus.setHouseNumber(buildingNumber);
		cus.setUnitNumber(unitNumber);
		cus.setMobileNumber(mobileNumber);
		cus.setTelephone(telephone);
		cus.setTelephone2(telephone2);
		cus.setSuburb(suburb);
		cus.setAddress1(address);
		cus.setFirstIdExpireDate(firstIdExpireDate);
		cus.setNationalIdType(nationalIdType);
		cus.setFirstIdNumber(firstIdNumber);
		cus.setFirstIdProofType(idType);
		cus.setCustomerKYCMode("Auto");
		cus.setCustomerKYCStatus("completed");
		cus.setStatus("pending");
		cus.setStateProvinceCode(spv);
		String dob=dd+"-"+mm+"-"+yyyy;
		cus.setDob(dob);
		cus.setFirstIdProofStatus("yes");
		cus.setSecondIdProofStatus("yes");
		cus.setCountry(c);
		cus.setIssuingCountry(c);
		cus.setCityOrState(s.getStateName());
		Customer csr=cs.updateCustomerDetails(cus);
		System.out.println("customer in trulio===="+csr);
		}else {
      String cid=cus.getCustomerId();
      String url2="";
      if(customerfrom.equals("uremitz")) {
		url2="demo3.remitz.co.uk/doc?customerId=" +cid;	
		}else {
       url2="demo.remitz.co.uk/emaildoc?customerId=" +cid;
		}	
       List<EmailTemplate> em=emailTemplateService.getEmailTemplatesBasedOnAdmin(cus.getAdmin().getAdminId()); 
			if(em.size() > 0) {		
				EmailTemplate emailTemplate = emailTemplateService.getEmailTemplateByTitleAndAdmin(cus.getAdmin().getAdminId(), "Email to customer about auto id verififcation fail");
							System.out.println("message======="+emailTemplate);
							String bodyContent = emailTemplate.getTemplate();
							String replacedBodyContent = bodyContent.replace("{FIRST_NAME}", cus.getFirstName());
							String replacedBodyContent1=replacedBodyContent.replace("{link}", url2);
							System.out.println("replacedBodyContent1===="+replacedBodyContent1);
							try { 
								SendMail.send("info@remitz.co.uk", cus.getEmailId() + 
										"", emailTemplate.getSubject(),
							  hederContent + bodyStartsContent + replacedBodyContent1 + bodyEndContent +
							  footerContent); 
								} catch (Exception exception) { 
									exception.printStackTrace();
									}

				}

		}
		
	return RecordStatus;	
		
	}
	
	
	
	
	@RequestMapping("/validateBackendCustomer")
	public @ResponseBody String validateBackendCutomerDetails(@RequestParam String countryISO, String firstName,String email,String lastName,String dd,String mm,String yyyy,String postalCode,String mobileNumber,String emailId,String address,String firstIdNumber,String houseNumber,String buildingName,String unitNumber,String streetName,String streetType,String telephone,String telephone2,String city,String idType,String nationalIdType,String state, String buildingNumber, String suburb,String firstIdExpireDate,String customerId,String customerfrom,String firstIdIssueDate,String password,String branchId, String occupation) {

		Country c=cr.getCountryBasedOnIso(countryISO);
		System.out.println("countryISO in trulio ===="+countryISO);
	States s=st.getStateById(state);
String spv=s.getStateCode();
		System.out.println("spv====="+spv);
		TrulioCustomer t=tr.findByCountryIso(countryISO);
		System.out.println("t====="+t);
		System.out.println("customer===="+firstName+","+lastName+","+dd+"-"+mm+"-"+yyyy+","+email+","+postalCode+","+unitNumber+","+streetName+","+streetType+","+buildingNumber+","+buildingName+","+mobileNumber+","+telephone+","+telephone2+","+city+","+idType+","+nationalIdType+","+address+","+firstIdNumber);
		
		String url="https://gateway.trulioo.com/trial/verifications/v1/verify";
		
		Map  customerDataMap=new HashMap();
		customerDataMap.put("AcceptTruliooTermsAndConditions",true);
		customerDataMap.put("CleansedAddress",false);
		customerDataMap.put("ConfigurationName","Identity Verification");
		customerDataMap.put("CountryCode",countryISO);
		
		
		Map personMap=new HashMap();
		personMap.put("FirstGivenName",firstName);
		personMap.put("FirstSurName",lastName);
		personMap.put("MiddleName",lastName);
		personMap.put("DayOfBirth",dd);
		personMap.put("MonthOfBirth",mm);
		personMap.put("YearOfBirth",yyyy);
		personMap.put("MinimumAge",0);
		
		Map locationMap=new HashMap();
		locationMap.put("PostalCode",postalCode);
		if(t.getHouseNumber().equals("yes")||t.getHouseNumber()=="yes") {
		locationMap.put("BuildingNumber",buildingNumber);
		}
		if(t.getStateProvinceCode().equals("yes")) {
		locationMap.put("StateProvinceCode",spv);
		}
		if(t.getStreetName().equals("yes")) {
		locationMap.put("StreetName",streetName);
		}
		if(t.getStreetType().equals("yes")) {
		locationMap.put("StreetType",streetType);
		}
		if(t.getSuburb().equals("yes")) {
		locationMap.put("Suburb",suburb);
		}
		if(t.getUnitNumber().equals("yes")) {
		locationMap.put("UnitNumber",unitNumber);
		}
		if(t.getCity().equals("yes")) {
			locationMap.put("City", city);	
		}
		if(t.getBuildingName().equals("yes")) {
			locationMap.put("BuildingName",buildingName);	
		}
		Map  communicationMap=new HashMap();
		
		communicationMap.put("EmailAddress",email);
		if(t.getTelephone().equals("yes")) {
		communicationMap.put("Telephone",telephone);
		}
		if(t.getTelephone2().equals("yes")) {
		communicationMap.put("Telephone2",telephone2);
		}
		if(t.getMobileNumber().equals("yes")) {
			communicationMap.put("mobileNumber",mobileNumber);	
		}
		
		Map  dataFieldsMap=new HashMap();
		dataFieldsMap.put("PersonInfo",personMap);
		dataFieldsMap.put("Location",locationMap);
		dataFieldsMap.put("Communication",communicationMap);
		
		if(t.getPassport().equals("yes")||t.getPassport()=="yes") {
		Map passportMap=new HashMap();
		passportMap.put("Number",firstIdNumber);
		dataFieldsMap.put("Passport",passportMap);
		}
		if(t.getDriverLicence().equals("yes")||t.getDriverLicence()=="yes") {
		Map DrivingLicence=new HashMap();
		DrivingLicence.put("Number", firstIdNumber);
		dataFieldsMap.put("DrivingLicence", DrivingLicence);
		}
		if(t.getNationalIds().contentEquals("yes")||t.getNationalIds()=="yes") {
		Map NationalIds=new HashMap();
		NationalIds.put("Number", firstIdNumber);
		NationalIds.put("Type", nationalIdType);
		dataFieldsMap.put("NationalIds",NationalIds);
		}

		
		customerDataMap.put("DataFields",dataFieldsMap);
	System.out.println("customerDataMap====="+customerDataMap);
		HttpHeaders httpHeaders=new HttpHeaders();
		httpHeaders.add("x-trulioo-api-key","80f89ac0f87944dc99ce4f6e2c3fbccb");
		httpHeaders.setContentType(MediaType.APPLICATION_JSON);

		HttpEntity<Map<String, Serializable>> entity=new HttpEntity<Map<String, Serializable>>(customerDataMap,httpHeaders);
		
		ResponseEntity<String> response= restTemplate.exchange(url,HttpMethod.POST, entity,String.class);
		System.out.println("body::"+response.getBody());
		Gson gson=new Gson();
		
		TrulioResponse tr=gson.fromJson(response.getBody(),TrulioResponse.class);
		System.out.println("tr====="+tr);
		Record Record=tr.getRecord();
		String RecordStatus=Record.getRecordStatus();
		String TransactionID=tr.getTransactionID();
		String TransactionRecordID=Record.getTransactionRecordID();
		System.out.println("Record===="+Record);
		System.out.println("RecordStatus====="+RecordStatus);
		String custID="";
		if(RecordStatus.equals("match")||RecordStatus=="match"||!RecordStatus.equals("nomatch")) {
			Customer cus=new Customer();
			Branch b=br.getBranchBasedOnBranchId(branchId);
			cus.setBranch(b);
			cus.setAdmin(b.getAdmin());
			cus.setCountry(b.getFromCountry());
			System.out.println("customerId==="+customerId);
		cus.setTrulioResponse("match");
		cus.setTransactionId(TransactionID);
		cus.setFirstName(firstName);
		cus.setLastName(lastName);
		cus.setPassword(password);
		cus.setCustomerDetailsFlag("full");
		cus.setPostalCode(postalCode);
		cus.setCity(city);
		cus.setEmailId(email);
		cus.setBuildingName(buildingName);
		cus.setStreetName(streetName);
		cus.setStreetType(streetType);
		cus.setHouseNumber(buildingNumber);
		cus.setUnitNumber(unitNumber);
		cus.setMobileNumber(mobileNumber);
		cus.setTelephone(telephone);
		cus.setTelephone2(telephone2);
		cus.setSuburb(suburb);
		cus.setAddress1(address);
		cus.setFirstIdExpireDate(firstIdExpireDate);
		cus.setNationalIdType(nationalIdType);
		cus.setFirstIdNumber(firstIdNumber);
		cus.setFirstIdProofType(idType);
		cus.setCustomerKYCMode("Auto");
		cus.setCustomerKYCStatus("completed");
		cus.setStatus("active");
		cus.setStateProvinceCode(spv);
		String dob=dd+"-"+mm+"-"+yyyy;
		cus.setDob(dob);
		cus.setFirstIdProofStatus("yes");
		cus.setSecondIdProofStatus("yes");
		cus.setCountry(c);
		cus.setFirstIdIssueDate(firstIdIssueDate);
		cus.setFirstIdProofStatus("yes");
		cus.setSecondIdProofStatus("yes");
		cus.setIssuingCountry(c);
		cus.setUserName(email);
		cus.setAddress1(address);
		cus.setOccupation(occupation);
		cus.setCityOrState(s.getStateName());
		MultipartHttpServletRequest request=null;
		custID=cs.registerCustomer(cus, request);
		System.out.println("customer in trulio===="+custID);
		}else {
			System.out.println("record status is no maqtch");
		}
		
	return RecordStatus;	
		
	}

	
}
