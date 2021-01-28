package com.kws.unitedfintech.serviceimpl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kws.unitedfintech.entities.DemoRequest;
import com.kws.unitedfintech.entities.NoGenerator;
import com.kws.unitedfintech.helpers.SenditoConvertNullsToEmpty;
import com.kws.unitedfintech.repository.DemoRequestRepo;
import com.kws.unitedfintech.service.DemoRequestService;
import com.kws.unitedfintech.service.NoGeneratorService;
@Service
public class DemoRequestServiceImpl implements DemoRequestService{
@Autowired
	NoGeneratorService noGeneratorService;
@Autowired
DemoRequestRepo demoRequestRepo;
SenditoConvertNullsToEmpty senditoConvertNullsToEmpty=new SenditoConvertNullsToEmpty();
	@Override
	public void demoSave(DemoRequest demoRequest) {
		NoGenerator noGenerator = noGeneratorService.getNoGenerator("demo_req");

		System.out.println("noGenerator in Service===" + noGenerator);
		String demoId = noGenerator.getIdPrefix() + noGenerator.getTableId();
		System.out.println("hii it is post blog service impl=====1" + demoId);
		demoRequest.setDemoId(demoId);
		demoRequest = senditoConvertNullsToEmpty.convertNullFieldToEmpty(demoRequest,
				DemoRequest.class);
		demoRequestRepo.save(demoRequest);
		noGeneratorService.updateNoGenerator(noGenerator);
	
	}
	@Override
	public String getUserListBasedOnEmailIds(String emailId) {
		DemoRequest demoRequest =demoRequestRepo.checkByUserName(emailId);
		System.out.println("demoRequest==="+demoRequest);
		String result="";
		if(demoRequest !=null){
			result="exist";
		}
		else {
			result=" ";
		}
		return result;

	}

}
