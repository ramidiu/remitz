package com.kws.unitedfintech.serviceimpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kws.unitedfintech.helpers.SenditoConvertNullsToEmpty;
import com.kws.unitedfintech.repository.ZumRailsTransactionRepository;
import com.kws.unitedfintech.service.ZumRailsTransactionService;
import com.kws.unitedfintech.underremitentities.ZumRailsTransaction;
@Service
public class ZumRailsTransactionServiceImpl implements ZumRailsTransactionService{

	SenditoConvertNullsToEmpty worldremitConvertNullsToEmpty = new SenditoConvertNullsToEmpty();
	
	@Autowired
	private ZumRailsTransactionRepository zumRailsTransactionRepository;
	@Override
	public void saveZumrailsTransaction(ZumRailsTransaction zumRailsTransaction) {
		zumRailsTransaction=worldremitConvertNullsToEmpty.convertNullFieldToEmpty(zumRailsTransaction, ZumRailsTransaction.class);
		zumRailsTransactionRepository.save(zumRailsTransaction);
	}
	@Override
	public List<ZumRailsTransaction> getZumRailsTransactions(String fromDate, String toDate) {
		return null;
	}
	
}
