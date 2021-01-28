package com.kws.unitedfintech.service;

import com.kws.unitedfintech.entities.TrulioCustomer;

public interface TrulioCustomerService {

	
	public TrulioCustomer findByCountryIso(String countryISO);
}
