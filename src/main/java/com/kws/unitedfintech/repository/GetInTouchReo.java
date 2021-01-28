package com.kws.unitedfintech.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.RequestParam;

import com.kws.unitedfintech.entities.GetInTouch;


@Repository
public interface GetInTouchReo extends JpaRepository<GetInTouch, String> {
	 @Query("select d from GetInTouch d where d.emailId=:emailId")
	 public GetInTouch checkByBasedOnContactUs(@RequestParam("emailId")String emailId);

}
