package com.kws.unitedfintech.serviceimpl;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.TimeZone;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kws.unitedfintech.helpers.SenditoConvertNullsToEmpty;
import com.kws.unitedfintech.repository.ZumRailsRepository;
import com.kws.unitedfintech.service.NoGeneratorService;
import com.kws.unitedfintech.service.ZumRailsUserService;
import com.kws.unitedfintech.underremitentities.ZumRailsUser;
@Service
public class ZumRailsUserServiceImpl implements ZumRailsUserService{
SenditoConvertNullsToEmpty senditoConvertNullsToEmpty=new SenditoConvertNullsToEmpty();
SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");	


SimpleDateFormat yyyyMMddHHmmss = new SimpleDateFormat("yyyy-MM-dd");//HH:mm:ss
SimpleDateFormat yyyyMMdd = new SimpleDateFormat("dd MMM yyyy");
TimeZone timeZone = TimeZone.getTimeZone("IST");

Calendar cal = Calendar.getInstance();
Date d = cal.getTime();
@Autowired
private NoGeneratorService noGeneratorService;
@Autowired
private ZumRailsRepository zumRailsUserRepository;


@Override
	public void saveZumrailsUser(ZumRailsUser zumRailsUser) {
	zumRailsUser.setCreatedDate(yyyyMMddHHmmss.format(d));	
	zumRailsUser = senditoConvertNullsToEmpty.convertNullFieldToEmpty(zumRailsUser,
			ZumRailsUser.class);
	zumRailsUserRepository.save(zumRailsUser);

		
	}

}
