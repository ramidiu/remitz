package com.kws.unitedfintech.serviceimpl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kws.unitedfintech.entities.TrulioCustomer;
import com.kws.unitedfintech.repository.TrulioCustomerRepository;
import com.kws.unitedfintech.service.TrulioCustomerService;

@Service
public class TrulioCustomerServiceImpl implements TrulioCustomerService{

	
	@Autowired
	private TrulioCustomerRepository tr;
	
	@Override
	public TrulioCustomer findByCountryIso(String countryISO) {
		// TODO Auto-generated method stub
		return tr.findByCountryIso(countryISO);
	}

}
