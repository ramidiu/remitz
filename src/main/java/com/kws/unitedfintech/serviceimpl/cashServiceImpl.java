package com.kws.unitedfintech.serviceimpl;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kws.unitedfintech.entities.Cash;
import com.kws.unitedfintech.entities.NoGenerator;
import com.kws.unitedfintech.helpers.SenditoConvertNullsToEmpty;
import com.kws.unitedfintech.repository.cashRepository;
import com.kws.unitedfintech.service.NoGeneratorService;
import com.kws.unitedfintech.service.cashService;
@Service
public class cashServiceImpl  implements cashService{
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	
	Calendar cal = Calendar.getInstance();
	
	Date d = cal.getTime();
	
	SenditoConvertNullsToEmpty senditoConvertNullsToEmpty=new SenditoConvertNullsToEmpty();

	
@Autowired
private cashRepository cashrepo;
@Autowired
private NoGeneratorService noGeneratorService;

	@Override
	public void insertCash(Cash cash) {
		NoGenerator noGenerator=noGeneratorService.getNoGenerator("cash_pickup");
		String bankId=noGenerator.getIdPrefix()+noGenerator.getTableId();
		
		//String cashId=noGenerator.getIdPrefix()+noGenerator.getTableId();
		//System.out.println("cashId...."+cashId);
		cash.setCashId(bankId);
		cash.setCreatedDate(sdf.format(d));  
		cash.setUpdateDate(sdf.format(d));
		 cash = senditoConvertNullsToEmpty.convertNullFieldToEmpty(cash, Cash.class);

		cashrepo.save(cash);
		 noGeneratorService.updateNoGenerator(noGenerator);


		// TODO Auto-generated method stub
		
	}

	@Override
	public List<Cash> getListByAdmin(String adminId) {
		// TODO Auto-generated method stub
		return cashrepo.findAllByAdmin(adminId);
	}

	@Override
	public List<Cash> getBanksList(String countryISO) {
		// TODO Auto-generated method stub
		return cashrepo.findAllByCountryIso(countryISO);
	}

	@Override
	public List<Cash> getCashListBasedonAdminAndCountryIso(String adminId, String countryISO) {
		// TODO Auto-generated method stub
		return cashrepo.findAllByAdminAndISO(adminId, countryISO);
	}

	@Override
	public List<Cash> getcashpickupbasedonstate(String adminId,String stateid) {
		// TODO Auto-generated method stub
		return cashrepo.getbystateid(adminId, stateid);
	}

	@Override
	public List<Cash> getcashpickupbypickupfrom(String adminId,String cashPickupFrom) {
		// TODO Auto-generated method stub
		return cashrepo.getbyname(adminId, cashPickupFrom);
	}

	@Override
	public Cash cashpickupById(String id) {
		// TODO Auto-generated method stub
		return cashrepo.cashpickupbyid(id);
	}

}
