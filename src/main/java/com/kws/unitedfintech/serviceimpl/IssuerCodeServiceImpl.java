package com.kws.unitedfintech.serviceimpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kws.unitedfintech.entities.BankIssuerCode;
import com.kws.unitedfintech.entities.CashIssuerCode;
import com.kws.unitedfintech.entities.EWalletIssuerCode;
import com.kws.unitedfintech.repository.IssuerCodeRepository;
import com.kws.unitedfintech.service.IssuerCodeService;

@Service
public class IssuerCodeServiceImpl implements IssuerCodeService{

	@Autowired
	private IssuerCodeRepository issuerCodeRepository;
	 
	@Override
	public void insertBankIssuerCode(BankIssuerCode bankIssuerCode) {
		//issuerCodeDao.insertBankIssuerCode(bankIssuerCode);
	}

	@Override
	public void insertCashIssuerCode(CashIssuerCode cashIssuerCode) {
		//issuerCodeDao.insertCashIssuerCode(cashIssuerCode);
	}

	@Override
	public List<BankIssuerCode> getBankIssuerCodeList(String countryISO) {
		//return issuerCodeDao.getBankIssuerCodeList(countryISO);
		return issuerCodeRepository.findByCountryIso(countryISO);
	}

	@Override
	public List<CashIssuerCode> getCashIssuerCodeList(String countryISO) {
		//return issuerCodeDao.getCashIssuerCodeList(countryISO);
		return null;
	}

	@Override
	public List<EWalletIssuerCode> getEWalletIssuerCodeList(String countryISO) {
		//return issuerCodeDao.getEWalletIssuerCodeList(countryISO);
		return null;
	}

}
