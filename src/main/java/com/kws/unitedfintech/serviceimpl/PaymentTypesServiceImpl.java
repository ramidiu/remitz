package com.kws.unitedfintech.serviceimpl;

import java.util.List;

import org.springframework.stereotype.Service;

import com.kws.unitedfintech.entities.PaymentTypes;
import com.kws.unitedfintech.repository.PaymentTypeRepository;
import com.kws.unitedfintech.service.PaymentTypesService;

@Service
public class PaymentTypesServiceImpl implements PaymentTypesService{
	private final PaymentTypeRepository repository;
	public PaymentTypesServiceImpl(PaymentTypeRepository repository) {
		super();
		this.repository = repository;
	}

	@Override
	public List<PaymentTypes> getAllPaymentTypes() {
		return repository.getAllPaymentTypes();
	}

	@Override
	public List<PaymentTypes> getAllPaymentTypesBasedOnBranchId() {
		// TODO Auto-generated method stub
		return null;
	}

}
