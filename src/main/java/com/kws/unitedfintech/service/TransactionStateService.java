package com.kws.unitedfintech.service;

import com.kws.unitedfintech.entities.TransactionState;

public interface TransactionStateService {

	public void saveTrasactionDetails(TransactionState transactionState);
	
	public TransactionState getTxnState(String payAtAccNumber);
	
	public void updateState(TransactionState transactionState);

}
