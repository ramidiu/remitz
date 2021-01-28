package com.kws.unitedfintech.serviceimpl;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.TimeZone;

import org.hibernate.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kws.unitedfintech.entities.Beneficiary;
import com.kws.unitedfintech.entities.Customer;
import com.kws.unitedfintech.entities.NoGenerator;
import com.kws.unitedfintech.entities.TransactionInformation;
import com.kws.unitedfintech.helpers.SenditoConvertNullsToEmpty;
import com.kws.unitedfintech.helpers.SenditoDateUtil;
import com.kws.unitedfintech.repository.BeneficiaryRepository;
import com.kws.unitedfintech.service.BeneficiaryService;
import com.kws.unitedfintech.service.NoGeneratorService;
@Service
public class BeneficiaryServiceImpl implements BeneficiaryService{

	@Autowired
	private BeneficiaryRepository beneficiaryRepository;
	@Autowired
	private NoGeneratorService noGeneratorService;

	SenditoConvertNullsToEmpty convertNullsToEmpty= new SenditoConvertNullsToEmpty();
	

	SimpleDateFormat yyyyMMddHHmmss = new SimpleDateFormat("yyyy-MM-dd");//HH:mm:ss
	SimpleDateFormat yyyyMMdd = new SimpleDateFormat("dd MMM yyyy");
	TimeZone timeZone = TimeZone.getTimeZone("IST");

	Calendar cal = Calendar.getInstance();
	Date d = cal.getTime();

	
	
	@Override
	public void saveBeneficiaryDetails(Beneficiary beneficiary) {
		try {
			if (beneficiary.getBenificiaryStatus() != null
					&& beneficiary.getBenificiaryStatus().equals("New Receipent")) {
				NoGenerator noGenerator= noGeneratorService.getNoGenerator("beneficiary");
				String beneficiaryId = noGenerator.getIdPrefix() + noGenerator.getTableId();
				System.out.println("beneficiaryId in if condition===="+beneficiaryId);
				beneficiary.setBeneficiaryId(beneficiaryId);
				beneficiary.setCreatedDate(yyyyMMddHHmmss.format(d));
				beneficiary.setUpdatedDate(yyyyMMddHHmmss.format(d));
			    noGeneratorService.updateNoGenerator(noGenerator);
				beneficiary=convertNullsToEmpty.convertNullFieldToEmpty(beneficiary,Beneficiary.class);
				beneficiaryRepository.save(beneficiary);
				noGeneratorService.updateNoGenerator(noGenerator);

			}else {
				NoGenerator noGenerator = noGeneratorService.getNoGenerator("beneficiary");
				String beneficiaryId=noGenerator.getIdPrefix() + noGenerator.getTableId();
				System.out.println("beneficiaryId1====="+beneficiaryId);
				beneficiary.setBeneficiaryId(beneficiaryId);
				String createdDate=SenditoDateUtil.timeNow(yyyyMMddHHmmss,timeZone);
				beneficiary.setCreatedDate(createdDate);
				beneficiary.setUpdatedDate(createdDate);
				beneficiary=convertNullsToEmpty.convertNullFieldToEmpty(beneficiary,Beneficiary.class);
				beneficiaryRepository.save(beneficiary);
				noGeneratorService.updateNoGenerator(noGenerator);

			}
		} catch (Exception e) {
			e.printStackTrace();
		}

	}

	@Override
	public String saveBeneficiaryDetailsWhileTransaction(Beneficiary beneficiary) {
		String beneficiaryId="";
		if (beneficiary.getBenificiaryStatus() != null
				&& beneficiary.getBenificiaryStatus().equals("New Receipent")) {
		NoGenerator noGenerator = noGeneratorService.getNoGenerator("beneficiary");
	    beneficiaryId=noGenerator.getIdPrefix() + noGenerator.getTableId();
		beneficiary.setBeneficiaryId(beneficiaryId);
		String createdDate=SenditoDateUtil.timeNow(yyyyMMddHHmmss,timeZone);
		beneficiary.setCreatedDate(createdDate);
		beneficiary.setUpdatedDate(createdDate);
		beneficiary=convertNullsToEmpty.convertNullFieldToEmpty(beneficiary,Beneficiary.class);
		System.out.println("bbbbbb"+beneficiary);
			beneficiaryRepository.save(beneficiary);
			noGeneratorService.updateNoGenerator(noGenerator);
		}
		return beneficiaryId; 
	}

	@Override
	public List<Beneficiary> getAllBeneficiarys(String customerId) {
		// TODO Auto-generated method stub
		return beneficiaryRepository.getAll(customerId);
	}

	@Override
	public Beneficiary getBeneficiaryDetails(String beneficiaryId, Session session) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Beneficiary getBeneficiaryDetails(String beneficiaryId) {
		return beneficiaryRepository.findByBeneficiaryId(beneficiaryId);
	}

	@Override
	public List<Beneficiary> getAllBeneficiarys(String customerId, String toCountryName) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void updateBeneficiaryDetails(Beneficiary beneficiary) {
		// TODO Auto-generated method stub
		beneficiaryRepository.save(beneficiary);
	}

	@Override
	public List<Beneficiary> getBeneficiaryBasedOnCustomerCountryISOPaymentType(String customerId, String paymentType,
			String countryISO) {
		//return beneficiaryRepository.getBeneficiaryBasedOnCustomerCountryISOPaymentType(customerId, paymentType, countryISO);
		return beneficiaryRepository.getBeneficiaryBasedOnCustomerCountryISOPaymentType(customerId, paymentType, countryISO);
	}

	@Override
	public void deleteByBeneficiaryId(String beneficiaryId) {
		// TODO Auto-generated method stub
		 beneficiaryRepository.deleteByBeneficiaryId(beneficiaryId);
	}

	@Override
	public void editBeneficiaryDetails(Beneficiary beneficiary) {
		// TODO Auto-generated method stub
		beneficiary=convertNullsToEmpty.convertNullFieldToEmpty(beneficiary,Beneficiary.class);

		beneficiaryRepository.save(beneficiary);

	}

	@Override
	public List<Beneficiary> getBeneficiariesBasedOnCustomerId(String adminid, String custid, String ptype) {
		return beneficiaryRepository.getBeneficiariesBasedOnCustomerid(adminid, custid, ptype);
		 
	}

	@Override
	public Beneficiary saveReceipentDetails(Beneficiary beneficiary) {
		NoGenerator noGenerator = noGeneratorService.getNoGenerator("beneficiary");
	  
		String beneficiaryId=noGenerator.getIdPrefix() + noGenerator.getTableId();
		System.out.println("beneficiaryId.......in save receipent.."+beneficiaryId);
		beneficiary.setBeneficiaryId(beneficiaryId);
		String createdDate=SenditoDateUtil.timeNow(yyyyMMddHHmmss,timeZone);
		System.out.println("createdDate....in save receipt.."+createdDate);
		beneficiary.setCreatedDate(createdDate);
		beneficiary.setUpdatedDate(createdDate);
		beneficiary.setAccType("Bank Collection");
		beneficiary=convertNullsToEmpty.convertNullFieldToEmpty(beneficiary,Beneficiary.class);
		System.out.println("bbbbbb"+beneficiary);
			beneficiaryRepository.save(beneficiary);
			System.out.println("saved from savereciepent.............");
			noGeneratorService.updateNoGenerator(noGenerator);
			return beneficiary;
			}
	@Override
	public Beneficiary saveReceipentDetail(Beneficiary beneficiary) {
		NoGenerator noGenerator = noGeneratorService.getNoGenerator("beneficiary");
	  
		String beneficiaryId=noGenerator.getIdPrefix() + noGenerator.getTableId();
	beneficiary.setBeneficiaryId(beneficiaryId);
		beneficiary=convertNullsToEmpty.convertNullFieldToEmpty(beneficiary,Beneficiary.class);
			beneficiaryRepository.save(beneficiary);
			System.out.println("eneficiary service impl save method");
			noGeneratorService.updateNoGenerator(noGenerator);
			return beneficiary;
			}

	
	@Override
	public Beneficiary ConfirmBeneficiaryDetails(Beneficiary beneficiary) {
		// TODO Auto-generated method stub
		return beneficiaryRepository.save(beneficiary);
	}
	
@Override
public Beneficiary updatedBenef(Beneficiary beneficiary) {
	String createdDate=SenditoDateUtil.timeNow(yyyyMMddHHmmss,timeZone);
	beneficiary.setCreatedDate(createdDate);  
	
	beneficiary.setUpdatedDate(createdDate);
	
	beneficiary= convertNullsToEmpty.convertNullFieldToEmpty(beneficiary, Beneficiary.class);

	Beneficiary c= beneficiaryRepository.save(beneficiary);
	return c;

}
	@Override
	public List<Beneficiary> getbySearch(String firstName, String customerId) {
		// TODO Auto-generated method stub
		return beneficiaryRepository.getBysearch(firstName, customerId);
	}

	@Override
	public List<Beneficiary> getDuplicateBeneficiary(String firstName, String lastName, String mobileNumber,
			String addressLine1) {
		// TODO Auto-generated method stub
		return beneficiaryRepository.getDuplicateBeneficiary(firstName, lastName, mobileNumber, addressLine1);
	}

	@Override
	public String saveNewBenficiaryDetails(Beneficiary beneficiary) {

		NoGenerator noGenerator=noGeneratorService.getNoGenerator("beneficiary");
		String beneficiaryId = noGenerator.getIdPrefix() + noGenerator.getTableId();
		beneficiary.setBeneficiaryId(beneficiaryId);
		
		String createdDate=SenditoDateUtil.timeNow(yyyyMMddHHmmss,timeZone);
		beneficiary.setCreatedDate(createdDate);
		beneficiary.setUpdatedDate(createdDate);
		beneficiary =convertNullsToEmpty.convertNullFieldToEmpty(beneficiary,
				Beneficiary.class);
		beneficiaryRepository.save(beneficiary);
		noGeneratorService.updateNoGenerator(noGenerator);
		return beneficiaryId;
	}

	@Override
	public void editBeneficiaryDetailz(Beneficiary beneficiary) {
	String beneficiaryId=beneficiary.getBeneficiaryId();
	
	beneficiary =convertNullsToEmpty.convertNullFieldToEmpty(beneficiary,
			Beneficiary.class);

		/*
		 * Beneficiary ben=findBeneficiary(beneficiaryId);
		 * ben.setFirstName(beneficiary.getFirstName());
		 */
	beneficiaryRepository.updatedByBeneficiaryId(beneficiary.getFirstName(), beneficiary.getLastName(), beneficiary.getRelationShip(), beneficiary.getMobileNumber(), beneficiary.getSendingReason(), beneficiary.getIdProofNo(), beneficiary.getBankName(), beneficiary.getBeneficiaryId());;
	}

	@Override
	public Beneficiary findBeneficiary(String beneficiaryId) {
		// TODO Auto-generated method stub
		return beneficiaryRepository.findByBeneficiaryId(beneficiaryId);
	}
	

}
