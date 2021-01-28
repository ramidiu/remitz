package com.kws.unitedfintech.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.kws.unitedfintech.entities.BankIssuerCode;
@Repository
public interface IssuerCodeRepository extends JpaRepository<BankIssuerCode,String> {

	
	@Query("select b from BankIssuerCode b where b.countryISO=:countryISO")
	public List<BankIssuerCode> findByCountryIso(@Param("countryISO")String countryISO);
	
}
