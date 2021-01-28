package com.kws.unitedfintech.repository;

import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;

import com.kws.unitedfintech.entities.PaymentTypes;

public interface PaymentTypeRepository extends CrudRepository<PaymentTypes, String>{

	@Query(value="SELECT pt FROM PaymentTypes pt")
	public List<PaymentTypes> getAllPaymentTypes();
	
	
	
	//@Query("SELECT pt FROM PaymentTypes pt")
	//public List<PaymentTypes> findAllByBranchId();
}
