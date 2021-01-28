package com.kws.unitedfintech.serviceimpl;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.repository.support.Repositories;
import org.springframework.stereotype.Service;

import com.kws.unitedfintech.entities.Country;
import com.kws.unitedfintech.entities.States;
import com.kws.unitedfintech.repository.CountryRepository;
import com.kws.unitedfintech.service.CountryService;
import com.kws.unitedfintech.service.NoGeneratorService;



@Service
public class CountryServiceImpl implements CountryService {

	@Autowired
	NoGeneratorService noGeneratorService;
	
	@Autowired
	private CountryRepository respository;
	
	
	
	public CountryServiceImpl(CountryRepository respository) {
		super();
		this.respository = respository;
	}

	@Override
	public List<Country> getAllCountries() {
		return respository.findAll();
	}

	@Override
	public Country getCountryBasedOnIso(String iso) {
		return respository.findBycountryISO(iso);
	}

	@Override
	public Country getCountryNameBasedOnBranchId(String branchId) {
		//return countryDao.getCountryNameBasedOnBranchId(branchId);
		return null;
	}

	@Override
	public Country getCountrynameBasedOnBranchId(String branchId) {
		//return countryDao.getCountrynameBasedOnBranchId(branchId);
		return null;
	}

	@Override
	public void insert(Country country) {
		//countryDao.insert(country);
		
		
	}

	@Override
	public List<Country> getCountryForTransaction(String countryISO,String adminId) {
		List<Country> country=new ArrayList<Country>();
		//country=countryDao.getCountryForTransaction(countryISO,adminId);
		
		return country;
	}

	@Override
	public String getCountryIsoBasedOnCountryName(String countryName) {
		//String countryISO=countryDao.getCountryIsoBasedOnCountryName(countryName);
		//return countryISO;
		return null;
	}

	@Override
	public Country getCountryDetails(String countryISO) {
		
		//return countryDao.getCountryDetails(countryISO);
		return null;
	}

	@Override
	public List<Country> getStateListBasedOnCountryISO(String countryISO) {
		return respository.findByIso(countryISO);
	}

	@Override
	public void insertStates(States states) {
		//NoGenerator noGenerator=noGeneratorService.getNoGenerator("states");
		//String id=noGenerator.getIdPrefix()+noGenerator.getTableId();
		//states.setStateId(id);
		//countryDao.insertStates(states);
	}

	
	  @Override public States getStateBasedOnStateId(String sId) { 
		  //return countryDao.getStateBasedOnStateId(sId);
		  return null;
			  
	  }

	@Override
	public List<Country> getAllCountriesBasedOnAdmin(String adminId) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Country findOutISO(String ISO) {
		// TODO Auto-generated method stub
		return respository.findOutDialingCOde(ISO);
	}

	}
	 
	


