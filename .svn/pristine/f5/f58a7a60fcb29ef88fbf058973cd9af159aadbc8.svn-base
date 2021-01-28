package com.kws.unitedfintech.serviceimpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kws.unitedfintech.entities.EwalletPaymentType;
import com.kws.unitedfintech.entities.NoGenerator;
import com.kws.unitedfintech.helpers.SenditoConvertNullsToEmpty;
import com.kws.unitedfintech.repository.EwalletPaymentTypRepository;
import com.kws.unitedfintech.service.EwalletPaymentTypService;
import com.kws.unitedfintech.service.NoGeneratorService;

@Service
public class EwalletPaymentTypServiceImpl implements EwalletPaymentTypService {

	
	
	SenditoConvertNullsToEmpty convertNullsToEmpty= new SenditoConvertNullsToEmpty();
	@Autowired
	private NoGeneratorService noGeneratorService;

	@Autowired
	private EwalletPaymentTypRepository ewalletPaymentTypRepository;
	
	@Override
	public void save(EwalletPaymentType ewalletPaymentType) {
		NoGenerator noGenerator = noGeneratorService.getNoGenerator("ewallet_paymentType");
		String ewalletId=noGenerator.getIdPrefix()+noGenerator.getTableId();
			System.out.println("ewalletId......"+ewalletId);
			ewalletPaymentType.setEwalletId(ewalletId);
			
		ewalletPaymentTypRepository.save(ewalletPaymentType);
		noGeneratorService.updateNoGenerator(noGenerator);
	}

	@Override
	public List<EwalletPaymentType> findByAdmin(String adminId) {
		// TODO Auto-generated method stub
		return ewalletPaymentTypRepository.findByAdmin(adminId);
	}

	@Override
	public EwalletPaymentType findOneByAdmin(String adminId) {
		// TODO Auto-generated method stub
		return ewalletPaymentTypRepository.findOneByAdmin(adminId);
	}

	@Override
	public void update(EwalletPaymentType ewalletPaymentType) {
		// TODO Auto-generated method stub
		ewalletPaymentTypRepository.save(ewalletPaymentType);
	}

}
