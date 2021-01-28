package com.kws.unitedfintech.repository;

import java.util.List;

import org.springframework.data.repository.CrudRepository;

import com.kws.unitedfintech.entities.States;

public interface StateRepository extends CrudRepository<States, String>{
public List<States> findBycountryISO(String countryISO);
	
}
