package com.kws.unitedfintech.service;

import java.util.List;

import com.kws.unitedfintech.entities.Cash;

public interface cashService {
	
	public void insertCash(Cash cash);
	
	
	public List<Cash> getListByAdmin(String adminId);
	
	public List<Cash> getBanksList(String countryISO);
	
	public List<Cash> getCashListBasedonAdminAndCountryIso(String adminId,String countryISO);

public List<Cash> getcashpickupbasedonstate(String adminId,String stateid);

public List<Cash> getcashpickupbypickupfrom(String adminId,String cashPickupFrom);
public Cash cashpickupById(String id);
}
