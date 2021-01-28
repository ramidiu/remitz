package com.kws.unitedfintech.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.kws.unitedfintech.entities.SubHeads;
@Repository
public interface SubHeadsRepo extends JpaRepository<SubHeads, String> {
	
}
