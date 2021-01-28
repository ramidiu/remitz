package com.kws.unitedfintech.repository;

import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;

import com.kws.unitedfintech.entities.TransactionState;

public interface TransactionStateRepository extends  CrudRepository<TransactionState,String>{

	@Query("select t from TransactionState t where  t.payAtAccNumber=:payAtAccNumber")
	public List<TransactionState> getTxnState(String payAtAccNumber);
	
}
