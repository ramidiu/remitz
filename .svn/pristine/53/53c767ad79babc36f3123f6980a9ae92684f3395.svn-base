package com.kws.unitedfintech.serviceimpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kws.unitedfintech.entities.InternetBankTransferMop;
import com.kws.unitedfintech.entities.NoGenerator;
import com.kws.unitedfintech.helpers.SenditoConvertNullsToEmpty;
import com.kws.unitedfintech.repository.InternetBankTransferMopRepository;
import com.kws.unitedfintech.service.InternetBankTransferMopService;
import com.kws.unitedfintech.service.NoGeneratorService;

@Service
public class InternetBankTransferServiceImpl implements InternetBankTransferMopService{

	@Autowired
	private InternetBankTransferMopRepository internetBankTransferMopRepository;
	SenditoConvertNullsToEmpty convertNullsToEmpty= new SenditoConvertNullsToEmpty();
	@Autowired
	private NoGeneratorService noGeneratorService;
	
	@Override
	public void save(InternetBankTransferMop internetBankTransferMop) {
		NoGenerator noGenerator = noGeneratorService.getNoGenerator("internet_bankTranser");
		String internetbanktransferId=noGenerator.getIdPrefix()+noGenerator.getTableId();
			System.out.println("internetbanktransferId......"+internetbanktransferId);
			internetBankTransferMop.setInternetbanktransferId(internetbanktransferId);

		internetBankTransferMopRepository.save(internetBankTransferMop);
		noGeneratorService.updateNoGenerator(noGenerator);
	}

	@Override
	public List<InternetBankTransferMop> findAllByAdmin(String adminId) {
		// TODO Auto-generated method stub
		return internetBankTransferMopRepository.findAllByAdmin(adminId);
	}

	@Override
	public InternetBankTransferMop findByAdmin(String adminId) {
		// TODO Auto-generated method stub
		return internetBankTransferMopRepository.findByAdmin(adminId);
	}

	@Override
	public void update(InternetBankTransferMop internetBankTransferMop) {
		// TODO Auto-generated method stub
		internetBankTransferMopRepository.save(internetBankTransferMop);
	}
	
}
