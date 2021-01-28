package com.kws.unitedfintech.repository;

import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;

import com.kws.unitedfintech.entities.Zone;

public interface ZoneRepository extends CrudRepository<Zone, String>{

	@Query(value="SELECT z FROM Zone z WHERE z.country.countryISO=:iso")
	public List<Zone> findAllBycountryISo(@Param("iso") String iso);

	public Zone findAllByzoneId(String zoneId);
	
	
	@Query("select z.zoneId from Zone z where z.zoneName=:zonename")
	public String findZoneIdBasedOnName(String zonename);
}
