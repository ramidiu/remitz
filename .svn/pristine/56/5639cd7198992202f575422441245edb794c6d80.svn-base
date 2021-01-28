package com.kws.unitedfintech.repository;

import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;

import com.kws.unitedfintech.entities.Relationship;

public interface RelationshipRepository extends CrudRepository<Relationship,Integer>{

	
	@Query("select r from Relationship r")
	public List<Relationship> findAll();
}
