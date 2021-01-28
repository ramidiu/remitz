package com.kws.unitedfintech.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.RequestParam;

import com.kws.unitedfintech.entities.DemoRequest;

@Repository
public interface DemoRequestRepo extends JpaRepository<DemoRequest, String> {
	 @Query("select d from DemoRequest d where d.emailId=:emailId")
	 public DemoRequest checkByUserName(@RequestParam("emailId")String emailId);
}
