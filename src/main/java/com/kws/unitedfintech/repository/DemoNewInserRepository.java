package com.kws.unitedfintech.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.kws.unitedfintech.entities.DemoNewInsert;

@Repository
public interface DemoNewInserRepository extends JpaRepository<DemoNewInsert, String> {

}
