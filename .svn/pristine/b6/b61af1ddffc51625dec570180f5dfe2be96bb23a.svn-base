package com.kws.unitedfintech.repository;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;

import com.kws.unitedfintech.underremitentities.BankAccountInformation;

public interface BankAccountInformationRepositry extends CrudRepository<BankAccountInformation, String> {
	@Query("select b from BankAccountInformation b where b.bankInformationId=:bankInformationId")
	public BankAccountInformation findBybankInformationId(@Param("bankInformationId") String bankInformationId);

}
