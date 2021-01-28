package com.kws.unitedfintech.serviceimpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kws.unitedfintech.entities.NoGenerator;
import com.kws.unitedfintech.entities.OpeningBalance;
import com.kws.unitedfintech.helpers.SenditoConvertNullsToEmpty;
import com.kws.unitedfintech.repository.OpeningBalanceRepo;
import com.kws.unitedfintech.service.NoGeneratorService;
import com.kws.unitedfintech.service.OpeningBalanceService;
@Service
public class OpeningBalanceServiceImpl implements OpeningBalanceService {
    @Autowired
	OpeningBalanceRepo openingBalanceRepo;
    @Autowired
    NoGeneratorService noGeneratorService;
    SenditoConvertNullsToEmpty senditoConvertNullsToEmpty=new SenditoConvertNullsToEmpty();
	@Override
	public void insertBankBalance(OpeningBalance openingBalance) {
		NoGenerator  noGenerator=noGeneratorService.getNoGenerator("openingBalance");
		String id=noGenerator.getIdPrefix()+noGenerator.getTableId();
		openingBalance.setOpeningId(id);
		openingBalance=senditoConvertNullsToEmpty.convertNullFieldToEmpty(openingBalance,OpeningBalance.class);
		noGeneratorService.updateNoGenerator(noGenerator);
		openingBalanceRepo.save(openingBalance);
		
	}
	@Override
	public List<OpeningBalance> getList(String adminId, String fin, String subName) {
		// TODO Auto-generated method stub
		return openingBalanceRepo.getListForDuplicateEntrie(adminId, fin, subName);
	}

}
