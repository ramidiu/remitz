package com.kws.unitedfintech.service;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.Transaction;

import com.kws.unitedfintech.entities.Beneficiary;

public interface BeneficiaryService {
	public String saveNewBenficiaryDetails(Beneficiary beneficiary);
	public void saveBeneficiaryDetails(Beneficiary beneficiary);
	public void editBeneficiaryDetails(Beneficiary beneficiary);
	
	public Beneficiary saveReceipentDetails(Beneficiary beneficiary);
	public Beneficiary saveReceipentDetail(Beneficiary beneficiary);
	public String saveBeneficiaryDetailsWhileTransaction(Beneficiary beneficiary);
	public List<Beneficiary> getAllBeneficiarys(String customerId);
	public void deleteByBeneficiaryId(String beneficiaryId);
	public Beneficiary getBeneficiaryDetails(String beneficiaryId,Session session);
	public Beneficiary getBeneficiaryDetails(String beneficiaryId);
	public List<Beneficiary> getAllBeneficiarys(String customerId,String toCountryName);
	public void updateBeneficiaryDetails(Beneficiary beneficiary);
	public List<Beneficiary> getBeneficiaryBasedOnCustomerCountryISOPaymentType(String customerId,String paymentType,String countryISO);
public List<Beneficiary> getBeneficiariesBasedOnCustomerId(String adminid,String custid,String ptype);


public Beneficiary ConfirmBeneficiaryDetails(Beneficiary beneficiary);


public Beneficiary updatedBenef(Beneficiary beneficiary);

public List<Beneficiary> getbySearch(String firstName,String customerId);


public List<Beneficiary> getDuplicateBeneficiary(String firstName,String lastName,String mobileNumber,String addressLine1);
public void editBeneficiaryDetailz(Beneficiary beneficiary);
public Beneficiary findBeneficiary(String beneficiaryId);
}