package com.kws.unitedfintech.repository;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.kws.unitedfintech.entities.TrulioCustomer;

@Repository
public interface TrulioCustomerRepository extends CrudRepository<TrulioCustomer, String> {

	
	@Query("select t from TrulioCustomer t where t.countryISO=:countryISO")
	public TrulioCustomer findByCountryIso(@Param("countryISO")String countryISO);
}
