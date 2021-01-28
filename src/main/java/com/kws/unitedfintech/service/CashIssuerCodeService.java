package com.kws.unitedfintech.service;

import java.util.List;

import com.kws.unitedfintech.entities.CashIssuerCode;

public interface CashIssuerCodeService {
	public List<CashIssuerCode> getCashIssuerCodeList(String countryISO);

}
