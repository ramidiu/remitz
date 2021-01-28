package com.kws.unitedfintech.serviceimpl;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.TimeZone;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kws.unitedfintech.entities.BootRemitzDemo;
import com.kws.unitedfintech.entities.DemoNewInsert;
import com.kws.unitedfintech.entities.DemoSpringootAdmin;
import com.kws.unitedfintech.entities.NoGenerator;
import com.kws.unitedfintech.helpers.SenditoConvertNullsToEmpty;
import com.kws.unitedfintech.repository.BootRemitzRepository;
import com.kws.unitedfintech.repository.DemoNewInserRepository;
import com.kws.unitedfintech.repository.DemoSpringootAdminRepository;
import com.kws.unitedfintech.service.DemoService;
import com.kws.unitedfintech.service.NoGeneratorService;



@Service
public class DemoServiceImpl implements DemoService {
	@Autowired
	private NoGeneratorService noGeneratorService;
	SenditoConvertNullsToEmpty senditoConvertNullsToEmpty = new SenditoConvertNullsToEmpty();
	@Autowired
	private DemoSpringootAdminRepository demoSpringootAdminRepository;
	@Autowired
	private DemoNewInserRepository demoNewInserRepository;
@Autowired
private BootRemitzRepository bootRemitzRepository;
	@Override
	public void demoSave(DemoSpringootAdmin demoSpringootAdmin) {

		NoGenerator noGenerator = noGeneratorService.getNoGenerator("demo_req");

		System.out.println("noGenerator in Service===" + noGenerator);
		String demoId = noGenerator.getIdPrefix() + noGenerator.getTableId();
		System.out.println("hii it is post blog service impl=====1" + demoId);
		demoSpringootAdmin.setDemoId(demoId);
		demoSpringootAdmin = senditoConvertNullsToEmpty.convertNullFieldToEmpty(demoSpringootAdmin,
				DemoSpringootAdmin.class);
		demoSpringootAdminRepository.save(demoSpringootAdmin);
		noGeneratorService.updateNoGenerator(noGenerator);

	}

	@Override
	public void demonewinsert(DemoNewInsert demoNewInsert) {

		demoNewInserRepository.save(demoNewInsert);
	}

	public void saveUser(DemoSpringootAdmin demoSpringootAdminn) {

		System.out.println("cl the saveuser metod");
		/*
		 * demoSpringootAdmin.setDemoId("admintab");
		 * demoSpringootAdmin.setFirstName("mission");
		 * demoSpringootAdmin.setEmailId("vamshik@gmail.com");
		 * demoSpringootAdmin.setISO("INDIA");
		 */// demoSpringootAdmin.setDemoId("test1");
		demoSpringootAdminRepository.save(demoSpringootAdminn);
		
		
	}
	/*
	 * @Override public void saveUser(BootSendItToDemoCopy demoSpringootAdmin) { //
	 * TODO Auto-generated method stub
	 * 
	 * 
	 * System.out.println("cl the saveuser metod");
	 * demoSpringootAdmin.setDemoId("admintab");
	 * demoSpringootAdmin.setFirstName("mission");
	 * demoSpringootAdmin.setEmailId("vamshik@gmail.com");
	 * demoSpringootAdmin.setISO("INDIA"); //demoSpringootAdmin.setDemoId("test1");
	 * demoSpringootAdminRepository.save(demoSpringootAdmin);
	 * 
	 * 
	 * }
	 */

	@Override
	public void savedemo(DemoSpringootAdmin demoSpringootAdmin) {
		NoGenerator noGenerator = noGeneratorService.getNoGenerator("demo_req");
		String demoId=noGenerator.getIdPrefix() + noGenerator.getTableId();
		System.out.println("adminId = = "+demoId);
		demoSpringootAdmin.setDemoId(demoId);
		SenditoConvertNullsToEmpty convertNullsToEmpty= new SenditoConvertNullsToEmpty();
		demoSpringootAdmin = convertNullsToEmpty.convertNullFieldToEmpty(demoSpringootAdmin,DemoSpringootAdmin.class);

		noGeneratorService.updateNoGenerator(noGenerator);
	}

	@Override
	public void savedemos(BootRemitzDemo bootRemitzDemo) {
		NoGenerator noGenerator = noGeneratorService.getNoGenerator("bdemo_req");
		String demoId=noGenerator.getIdPrefix() + noGenerator.getTableId();
		System.out.println("demoId = = "+demoId);
		bootRemitzDemo.setDemoId(demoId);
		SenditoConvertNullsToEmpty convertNullsToEmpty= new SenditoConvertNullsToEmpty();
		bootRemitzDemo = convertNullsToEmpty.convertNullFieldToEmpty(bootRemitzDemo,BootRemitzDemo.class);
		System.out.println("bootRemitzDemo = = = = = = "+bootRemitzDemo);
		bootRemitzRepository.save(bootRemitzDemo);
		noGeneratorService.updateNoGenerator(noGenerator);
		
		
	}
}
