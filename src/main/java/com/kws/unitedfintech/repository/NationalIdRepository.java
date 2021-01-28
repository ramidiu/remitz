package com.kws.unitedfintech.repository;

import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.kws.unitedfintech.entities.NationalIdTypes;

@Repository
public interface NationalIdRepository extends CrudRepository<NationalIdTypes, String> {

@Query("select n from NationalIdTypes n where n.countryIso=:countryIso")
public List<NationalIdTypes> findbyIso(@Param("countryIso") String countryIso);
 

}
