package com.kws.unitedfintech.service;

import java.util.List;

import com.kws.unitedfintech.entities.BankIssuerCode;
import com.kws.unitedfintech.entities.CashIssuerCode;
import com.kws.unitedfintech.entities.EWalletIssuerCode;

public interface IssuerCodeService {

	public void insertBankIssuerCode(BankIssuerCode bankIssuerCode);

	public void insertCashIssuerCode(CashIssuerCode cashIssuerCode);
	public List<BankIssuerCode> getBankIssuerCodeList(String countryISO);
	public List<CashIssuerCode> getCashIssuerCodeList(String countryISO);
	public List<EWalletIssuerCode> getEWalletIssuerCodeList(String countryISO);
}
