package com.kws.unitedfintech.serviceimpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kws.unitedfintech.entities.States;
import com.kws.unitedfintech.repository.StatesServiceRepository;
import com.kws.unitedfintech.service.StatesService;
@Service
public class StatesServiceImpl  implements StatesService{
	
	
	
	@Autowired
	private StatesServiceRepository statesServiceRepository;

	@Override
	public List<States> getAllStatesByCountryIso(String countryISO) {
		// TODO Auto-generated method stub
		return statesServiceRepository.findBycounryIso(countryISO);
	}

	@Override
	public States getStateById(String stateId) {
		// TODO Auto-generated method stub
		return statesServiceRepository.findByStateId(stateId);
	}

}
