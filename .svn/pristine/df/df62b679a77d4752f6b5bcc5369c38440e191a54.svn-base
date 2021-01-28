package com.kws.unitedfintech.serviceimpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kws.unitedfintech.entities.TransactionState;
import com.kws.unitedfintech.repository.TransactionStateRepository;
import com.kws.unitedfintech.service.TransactionStateService;
@Service
public class TransactionStateServiceImpl implements TransactionStateService{

	@Autowired
	private TransactionStateRepository transactionStateRepository;
	@Override
	public void saveTrasactionDetails(TransactionState transactionState) {
		transactionStateRepository.save(transactionState);
	}
	@Override
	public TransactionState getTxnState(String payAtAccNumber) {
		List<TransactionState> transactionStateList=transactionStateRepository.getTxnState(payAtAccNumber);
		return transactionStateList.get(0);
	}
	@Override
	public void updateState(TransactionState transactionState) {
		transactionStateRepository.save(transactionState);
	}
	
}
