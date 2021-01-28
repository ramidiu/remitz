package com.kws.unitedfintech.repository;

import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;

import com.kws.unitedfintech.underremitentities.ZumRailsTransaction;

public interface ZumRailsTransactionRepository extends CrudRepository<ZumRailsTransaction, String> {
	@Query("select z from ZumRailsTransaction z where z.createdAt>=:fromDate and z.createdAt<=:toDate")
	public List<ZumRailsTransaction> getZumRailstransaction(String fromDate,String toDate);

}
