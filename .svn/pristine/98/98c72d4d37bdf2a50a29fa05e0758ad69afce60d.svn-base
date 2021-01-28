package com.kws.unitedfintech.serviceimpl;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.TimeZone;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kws.unitedfintech.entities.NoGenerator;
import com.kws.unitedfintech.helpers.SenditoConvertNullsToEmpty;
import com.kws.unitedfintech.repository.CreditCardInformationRepositry;
import com.kws.unitedfintech.service.CreditCardInformationService;
import com.kws.unitedfintech.service.NoGeneratorService;
import com.kws.unitedfintech.underremitentities.CreditCardInformation;
@Service
public class CreditCardInformationServiceImpl implements CreditCardInformationService {

	SenditoConvertNullsToEmpty worldremitConvertNullsToEmpty = new SenditoConvertNullsToEmpty();
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

	SimpleDateFormat yyyyMMddHHmmss = new SimpleDateFormat("yyyy-MM-dd");//HH:mm:ss
	SimpleDateFormat yyyyMMdd = new SimpleDateFormat("dd MMM yyyy");
	TimeZone timeZone = TimeZone.getTimeZone("IST");

	Calendar cal = Calendar.getInstance();
	Date d = cal.getTime();
	@Autowired
	private NoGeneratorService noGeneratorService;
	@Autowired
	private CreditCardInformationRepositry creditCardInformationRepositry;
	
	@Override
	public void saveCreditCardInformation(CreditCardInformation creditCardInformation) {
		NoGenerator noGenerator=noGeneratorService.getNoGenerator("creditcard_information");
		String creditCardInformationId = noGenerator.getIdPrefix() + noGenerator.getTableId();
		creditCardInformation.setCreditCardInformationId(creditCardInformationId);
		creditCardInformation.setCreatedDate(yyyyMMddHHmmss.format(d));
		creditCardInformation = worldremitConvertNullsToEmpty.convertNullFieldToEmpty(creditCardInformation,
				CreditCardInformation.class);
		creditCardInformationRepositry.save(creditCardInformation);
		noGeneratorService.updateNoGenerator(noGenerator);
	}

	@Override
	public CreditCardInformation findByCreditCardInformationId(String creditCardInformationId) {
		return creditCardInformationRepositry.findByCreditCardInformationId(creditCardInformationId);
	}
	
}
