package com.kws.unitedfintech.repository;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;

import com.kws.unitedfintech.entities.SenderIdType;


public interface IDProofRepository extends CrudRepository<SenderIdType,Integer>{

	
	@Query("SELECT s FROM SenderIdType s WHERE s.sIdType=:sIdType")
	public SenderIdType findbytype(@Param("sIdType") String sIdType);
}
