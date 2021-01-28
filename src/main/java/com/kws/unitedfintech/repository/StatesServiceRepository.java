package com.kws.unitedfintech.repository;

import java.util.List;
import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.kws.unitedfintech.entities.States;
@Repository
public interface StatesServiceRepository extends CrudRepository<States, String> {

	
	@Query("SELECT s FROM States s WHERE s.countryISO=:countryISO")
	public List<States> findBycounryIso(@Param("countryISO") String countryISO);

	
	@Query("SELECT s FROM States s WHERE s.stateId=:stateId")
public States findByStateId(@Param("stateId") String stateId);
}
