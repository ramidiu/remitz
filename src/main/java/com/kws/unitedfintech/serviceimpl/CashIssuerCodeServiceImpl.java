package com.kws.unitedfintech.serviceimpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kws.unitedfintech.entities.CashIssuerCode;
import com.kws.unitedfintech.repository.CashIssuerCodeRepository;
import com.kws.unitedfintech.service.CashIssuerCodeService;

@Service
public class CashIssuerCodeServiceImpl implements CashIssuerCodeService{
	
	@Autowired
	private CashIssuerCodeRepository cashIssuerCodeRepository;

	@Override
	public List<CashIssuerCode> getCashIssuerCodeList(String countryISO) {
		// TODO Auto-generated method stub
		return cashIssuerCodeRepository.findByCountryIso(countryISO);
	}

}
