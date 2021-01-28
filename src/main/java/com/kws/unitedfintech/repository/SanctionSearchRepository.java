package com.kws.unitedfintech.repository;

import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;

import com.kws.unitedfintech.entities.SanctionSearch;

public interface SanctionSearchRepository extends CrudRepository<SanctionSearch,Integer>{
	@Query("SELECT s FROM SanctionSearch s WHERE s.name like %:firstName% or s.name like %:lastName%")
	public List<SanctionSearch> getSanctionSearchResult(String firstName,String lastName);

	

	
 }
