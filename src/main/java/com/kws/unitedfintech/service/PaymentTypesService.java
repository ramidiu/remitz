package com.kws.unitedfintech.service;

import java.util.List;

import com.kws.unitedfintech.entities.PaymentTypes;


public interface PaymentTypesService {
	public List<PaymentTypes> getAllPaymentTypes();
	
	public List<PaymentTypes> getAllPaymentTypesBasedOnBranchId();
	
	
}
