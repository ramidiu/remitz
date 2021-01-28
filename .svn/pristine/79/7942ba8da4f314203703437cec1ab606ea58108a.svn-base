package com.kws.unitedfintech.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.kws.unitedfintech.entities.CashIssuerCode;
@Repository
public interface CashIssuerCodeRepository extends JpaRepository<CashIssuerCode,String>{
	@Query("select c from CashIssuerCode c where c.countryISO=:countryISO")
	public List<CashIssuerCode> findByCountryIso(@Param("countryISO")String countryISO);
	
}
