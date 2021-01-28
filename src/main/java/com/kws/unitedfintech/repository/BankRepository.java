package com.kws.unitedfintech.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.kws.unitedfintech.entities.Banks;

@Repository
public interface BankRepository extends JpaRepository<Banks, String> {
	
	
	@Query("select b from Banks b where b.country.countryISO=:countryISO")
	public List<Banks> findAllByCountryIso(@Param("countryISO")String countryISO);
	/*
	 * @Query("from Banks b where b.country.countryISO=:countryiso and b.adminid=:adminid"
	 * ) public List<Banks> findAllByCountryIsoAndAdminid(String countryiso,String
	 * adminid);
	 */
}
