package com.kws.unitedfintech.service;

import com.kws.unitedfintech.underremitentities.BankAccountInformation;

public interface BankAccountInformationService {

	public String  saveBankAccountInformation(BankAccountInformation bankAccountInformation);
	public BankAccountInformation getBnkInfo(String bankInfoId);

}
