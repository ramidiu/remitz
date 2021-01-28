package com.kws.unitedfintech.repository;

import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.RequestParam;

import com.kws.unitedfintech.entities.KeyGeneration;

@Repository
public interface adminKeyRepository extends CrudRepository<KeyGeneration, String> {

	
	@Query("select a from KeyGeneration a where a.admin.adminId=:adminId ")
	 List<KeyGeneration> findAll(@RequestParam("adminId") String adminId);
	
}
