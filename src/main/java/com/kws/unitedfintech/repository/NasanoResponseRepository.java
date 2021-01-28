package com.kws.unitedfintech.repository;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.kws.unitedfintech.entities.NasanoResponse;

@Repository
public interface NasanoResponseRepository extends CrudRepository<NasanoResponse, String> {

	
	
	@Query("select n from NasanoResponse n where n.nId=:nId")
	public NasanoResponse findByNId(@Param("nId") String nId);
}
