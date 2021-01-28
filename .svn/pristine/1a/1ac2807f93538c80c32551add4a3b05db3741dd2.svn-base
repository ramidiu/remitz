package com.kws.unitedfintech.repository;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;

import com.kws.unitedfintech.underremitentities.CreditCardInformation;

public interface CreditCardInformationRepositry extends CrudRepository<CreditCardInformation, String> {

	@Query("select  c from CreditCardInformation c where c.creditCardInformationId=:creditCardInformationId")
	public CreditCardInformation findByCreditCardInformationId(String creditCardInformationId);

}
