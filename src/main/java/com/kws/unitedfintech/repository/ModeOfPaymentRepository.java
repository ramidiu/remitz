package com.kws.unitedfintech.repository;

import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;

import com.kws.unitedfintech.entities.ModeOfPayments;

public interface ModeOfPaymentRepository extends CrudRepository<ModeOfPayments, String>{

	@Query("SELECT m FROM ModeOfPayments m")
	public List<ModeOfPayments> FindAll();
	
	@Query("select m from ModeOfPayments m where m.modeOfPaymentId=:id")
	public ModeOfPayments findBymodeOfPaymentId(String id);
	
	@Query("select m from ModeOfPayments m where m.modeOfPayment=:modeOfPayment")
	public ModeOfPayments findByModeOfPayment(String modeOfPayment);
}
