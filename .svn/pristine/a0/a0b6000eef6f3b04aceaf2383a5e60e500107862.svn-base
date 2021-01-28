package com.kws.unitedfintech.serviceimpl;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.TimeZone;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kws.unitedfintech.entities.Banks;
import com.kws.unitedfintech.entities.NoGenerator;
import com.kws.unitedfintech.helpers.SenditoConvertNullsToEmpty;
import com.kws.unitedfintech.repository.BankRepository;
import com.kws.unitedfintech.service.BankService;
import com.kws.unitedfintech.service.CountryService;
import com.kws.unitedfintech.service.NoGeneratorService;

@Service
public class BankServiceImpl implements BankService {
	
	@Autowired
	private BankRepository bankServiceRepository;
	@Autowired
	private NoGeneratorService noGeneratorService;
	@Autowired
	private CountryService countryService;

	
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	
	Calendar cal = Calendar.getInstance();
	
	Date d = cal.getTime();
	
	SenditoConvertNullsToEmpty senditoConvertNullsToEmpty=new SenditoConvertNullsToEmpty();


	@Override
	public String saveBanks(Banks banks) {
		NoGenerator noGenerator=noGeneratorService.getNoGenerator("bank_details");
		String bankId=noGenerator.getIdPrefix()+noGenerator.getTableId();
        banks.setBankId(bankId);
		banks.setCreatedDate(sdf.format(d));  
		banks.setUpdateDate(sdf.format(d));
		 banks = senditoConvertNullsToEmpty.convertNullFieldToEmpty(banks, Banks.class);

		bankServiceRepository.save(banks);
		 noGeneratorService.updateNoGenerator(noGenerator);

		return bankId;

	}


	/*
	 * @Override public List<Banks> getAllByAdmin(String adminId) { // TODO
	 * Auto-generated method stub return
	 * bankServiceRepository.findAllByAdmin(adminId); }
	 */

	@Override
	public List<Banks> getBanksList(String countryISO) {
		// TODO Auto-generated method stub
		return bankServiceRepository.findAllByCountryIso(countryISO);
	}


	@Override
	public List<Banks> getAll() {
		// TODO Auto-generated method stub
		return bankServiceRepository.findAll();
	}



	
}
