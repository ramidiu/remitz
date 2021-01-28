package com.kws.unitedfintech.service;

import java.util.List;

import com.kws.unitedfintech.entities.Banks;



public interface BankService {
	
	
	
	public String saveBanks(Banks banks);
	
	//public List<Banks> getAllByAdmin(String adminId);
	public List<Banks> getBanksList(String countryISO);
	public List<Banks> getAll();

}
