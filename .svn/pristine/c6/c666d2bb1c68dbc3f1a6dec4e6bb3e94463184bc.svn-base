package com.kws.unitedfintech.serviceimpl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kws.unitedfintech.entities.GetInTouch;
import com.kws.unitedfintech.entities.NoGenerator;
import com.kws.unitedfintech.helpers.SenditoConvertNullsToEmpty;
import com.kws.unitedfintech.repository.GetInTouchReo;
import com.kws.unitedfintech.service.GetInTouchService;
import com.kws.unitedfintech.service.NoGeneratorService;


@Service
public class GetInTouchServiceImpl implements GetInTouchService  {
SenditoConvertNullsToEmpty senditoConvertNullsToEmpty=new SenditoConvertNullsToEmpty();

	@Autowired	
	GetInTouchReo getInTouchReo;
	@Autowired
	NoGeneratorService noGeneratorService;
	@Override
	public void contactSave(GetInTouch getInTouch) {
		
		NoGenerator noGenerator = noGeneratorService.getNoGenerator("get_In_Touch");

		System.out.println("noGenerator in Service===" + noGenerator);
		String getId = noGenerator.getIdPrefix() + noGenerator.getTableId();
		System.out.println("hii it is post blog service impl=====1" + getId);
		getInTouch.setGetId(getId);
		getInTouch = senditoConvertNullsToEmpty.convertNullFieldToEmpty(getInTouch,GetInTouch.class);
		getInTouchReo.save(getInTouch);
		noGeneratorService.updateNoGenerator(noGenerator);

		
		
	}
	@Override
	public String getUserListBasedOnContactUs(String emailId) {
		GetInTouch getInTouch =getInTouchReo.checkByBasedOnContactUs(emailId);
		System.out.println("getInTouch==="+getInTouch);
		String result="";
		if(getInTouch !=null){
			result="exist";
		}
		else {
			result=" ";
		}
		return result;


	}

}
