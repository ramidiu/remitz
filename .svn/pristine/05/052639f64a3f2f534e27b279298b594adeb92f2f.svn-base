package com.kws.unitedfintech.repository;

import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;

import com.kws.unitedfintech.entities.Country;

public interface CountryRepository extends CrudRepository<Country, String>{

	public List<Country> findAll();
	

	public Country findBycountryISO(String iso);

		
	
	@Query("FROM Country c WHERE c.countryISO=:countryISO")
	public  List<Country> findByIso(@Param("countryISO")String countryISO);
	
	//@Query("FROM Country c WHERE c.admin.adminId=:adminId")
	//public Country findByAdminId(@Param("adminId") String adminId);
	@Query("select dalingCode from Country c where c.countryISO=:ISO")
	public Country findOutDialingCOde(String ISO);
}
