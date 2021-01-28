package com.kws.unitedfintech.service;

import java.util.List;

import com.kws.unitedfintech.entities.States;
import com.kws.unitedfintech.entities.Zone;


public interface CountryZonService {
	public List<Zone> getTimeZonesBasedOnCountry(String iso);
	public List<Zone> getAllTimeZones();
	public void insert(Zone zone);
	public Zone getZoneBasedOnZoneId(String zoneId);
	public String getZoneIdBasedOnZoneName(String zonename);
	public List<States> findAllBycountryISO(String countryISO);
}
