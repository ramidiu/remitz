package com.kws.unitedfintech.serviceimpl;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.TimeZone;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kws.unitedfintech.entities.NoGenerator;
import com.kws.unitedfintech.helpers.SenditoConvertNullsToEmpty;
import com.kws.unitedfintech.repository.BankAccountInformationRepositry;
import com.kws.unitedfintech.service.BankAccountInformationService;
import com.kws.unitedfintech.service.NoGeneratorService;
import com.kws.unitedfintech.underremitentities.BankAccountInformation;
@Service
public class BankAccountInformationServiceImpl implements BankAccountInformationService{
	
	@Autowired
	private NoGeneratorService noGeneratorService;


	SenditoConvertNullsToEmpty worldremitConvertNullsToEmpty = new SenditoConvertNullsToEmpty();
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

	SimpleDateFormat yyyyMMddHHmmss = new SimpleDateFormat("yyyy-MM-dd");//HH:mm:ss
	SimpleDateFormat yyyyMMdd = new SimpleDateFormat("dd MMM yyyy");
	TimeZone timeZone = TimeZone.getTimeZone("IST");

	Calendar cal = Calendar.getInstance();
	Date d = cal.getTime();

	
    @Autowired
	private BankAccountInformationRepositry bankAccountInformationRepositry;

	@Override
	public String saveBankAccountInformation(BankAccountInformation bankAccountInformation) {
		NoGenerator noGenerator=noGeneratorService.getNoGenerator("bankaccount_information");
		bankAccountInformation.setCreatedDate(yyyyMMddHHmmss.format(d));
		String bankInformationId = noGenerator.getIdPrefix() + noGenerator.getTableId();
		bankAccountInformation.setBankInformationId(bankInformationId);
		bankAccountInformation = worldremitConvertNullsToEmpty.convertNullFieldToEmpty(bankAccountInformation,
				BankAccountInformation.class);
		System.out.println("calllllllllll");
		bankAccountInformationRepositry.save(bankAccountInformation);
		noGeneratorService.updateNoGenerator(noGenerator);
		return  bankInformationId;
}

	@Override
	public BankAccountInformation getBnkInfo(String bankInformationId) {
		return bankAccountInformationRepositry.findBybankInformationId(bankInformationId);
	}

}
