package com.kws.unitedfintech.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.kws.unitedfintech.entities.Processbank;
@Repository
public interface ProcessRepository extends JpaRepository<Processbank, String> {

	
	@Query("select p from Processbank p where p.branch.branchId=:country")
	public List<Processbank> getListByCountry(@Param("country")String country);
}
