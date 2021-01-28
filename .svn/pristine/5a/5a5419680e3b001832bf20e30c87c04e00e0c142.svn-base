package com.kws.unitedfintech.service;

import java.util.List;
import java.util.Optional;

import com.kws.unitedfintech.entities.Country;
import com.kws.unitedfintech.entities.States;



public interface CountryService {

	public List<Country> getAllCountries();
	public List<Country> getAllCountriesBasedOnAdmin(String adminId);

	public Country getCountryBasedOnIso(String iso);
	public Country getCountryDetails(String countryName);
	public Country findOutISO(String ISO);
		
	public Country getCountryNameBasedOnBranchId(String branchId);
	public Country getCountrynameBasedOnBranchId(String branchId);
	public void insert(Country country);
	public List<Country> getCountryForTransaction(String countryISO,String adminId);
	public String getCountryIsoBasedOnCountryName(String countryName);
	public List<Country> getStateListBasedOnCountryISO(String countryISO);
	public void insertStates(States states);
	public States getStateBasedOnStateId(String sId);
}
