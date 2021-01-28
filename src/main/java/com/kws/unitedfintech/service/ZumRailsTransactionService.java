package com.kws.unitedfintech.service;

import java.util.List;

import com.kws.unitedfintech.underremitentities.ZumRailsTransaction;

public interface ZumRailsTransactionService {
	public void saveZumrailsTransaction(ZumRailsTransaction zumRailsTransaction);
	public List<ZumRailsTransaction> getZumRailsTransactions(String fromDate,String toDate);

}
