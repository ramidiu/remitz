package com.kws.unitedfintech.repository;

import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.kws.unitedfintech.entities.InternetBankTransferMop;

@Repository
public interface InternetBankTransferMopRepository extends CrudRepository<InternetBankTransferMop, String> {

	
	
	@Query("SELECT ib FROM InternetBankTransferMop ib WHERE ib.admin.adminId=:adminId")
	public List<InternetBankTransferMop> findAllByAdmin(@Param("adminId")String adminId);

	
	@Query("SELECT ib FROM InternetBankTransferMop ib WHERE ib.admin.adminId=:adminId")
	public InternetBankTransferMop findByAdmin(@Param("adminId")String adminId);
	
}
