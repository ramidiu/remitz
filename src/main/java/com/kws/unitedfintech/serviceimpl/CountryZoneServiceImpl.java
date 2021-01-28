package com.kws.unitedfintech.serviceimpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kws.unitedfintech.entities.States;
import com.kws.unitedfintech.entities.Zone;
import com.kws.unitedfintech.repository.StateRepository;
import com.kws.unitedfintech.repository.ZoneRepository;
import com.kws.unitedfintech.service.CountryZonService;

@Service
public class CountryZoneServiceImpl implements CountryZonService {
	
	private final ZoneRepository repository;
	
	
	public CountryZoneServiceImpl(ZoneRepository repository) {
		super();
		this.repository = repository;
	}
	@Autowired
	private StateRepository stateRepository;

	@Override
	public List<Zone> getTimeZonesBasedOnCountry(String countryISO) {
		return repository.findAllBycountryISo(countryISO);
	}

	@Override
	public List<Zone> getAllTimeZones() {
		return null;
		//return zoneDao.getAllTimeZones();
	}

	@Override
	public void insert(Zone zone) {
		//zoneDao.insert(zone);	
	}

	@Override
	public Zone getZoneBasedOnZoneId(String zoneId) {
		return repository.findAllByzoneId(zoneId);
	}

	@Override
	public String getZoneIdBasedOnZoneName(String zonename) {
	
		return repository.findZoneIdBasedOnName(zonename);
	}

	@Override
	public List<States> findAllBycountryISO(String countryISO) {
		return stateRepository.findBycountryISO(countryISO);
	}

}
