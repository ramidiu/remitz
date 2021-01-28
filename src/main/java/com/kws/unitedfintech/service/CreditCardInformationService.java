package com.kws.unitedfintech.service;

import com.kws.unitedfintech.underremitentities.CreditCardInformation;

public interface CreditCardInformationService {

	public void saveCreditCardInformation(CreditCardInformation creditCardInformation);
	public CreditCardInformation findByCreditCardInformationId(String creditCardInformationId);

}
