package com.kws.unitedfintech.serviceimpl;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kws.unitedfintech.entities.AuditTrail;
import com.kws.unitedfintech.entities.Customer;
import com.kws.unitedfintech.entities.NoGenerator;
import com.kws.unitedfintech.helpers.SenditoConvertNullsToEmpty;
import com.kws.unitedfintech.repository.AuditTrailRepository;
import com.kws.unitedfintech.service.AuditTrailService;
import com.kws.unitedfintech.service.NoGeneratorService;

@Service
public class AuditTrailServiceImpl implements AuditTrailService{

	
	@Autowired
	private AuditTrailRepository ar;
	SenditoConvertNullsToEmpty senditoConvertNullsToEmpty=new SenditoConvertNullsToEmpty();
	@Autowired
	private NoGeneratorService noGeneratorService;
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

	Calendar cal = Calendar.getInstance();

	Date d = cal.getTime();

	@Override
	public AuditTrail save(AuditTrail art) {
		NoGenerator noGenerator = noGeneratorService.getNoGenerator("audit_trail");
	String id=noGenerator.getIdPrefix() + noGenerator.getTableId();
	art.setAdtId(id);
	art.setDate(sdf.format(d));
	art = senditoConvertNullsToEmpty.convertNullFieldToEmpty(art, AuditTrail.class);
	AuditTrail a=ar.save(art);
	noGeneratorService.updateNoGenerator(noGenerator);
	return a;
	}

	@Override
	public List<AuditTrail> getAllList(String adminId) {
		// TODO Auto-generated method stub
		return ar.getalllist(adminId);
	}

	@Override
	public List<AuditTrail> getByDate(String date1,String date2,String adminId) {
		// TODO Auto-generated method stub
		return ar.getByDate(date1, date2,adminId);
	}

	@Override
	public List<AuditTrail> getByDateAndUsername(String date1,String date2, String username,String adminId) {
		// TODO Auto-generated method stub
		return ar.getByDateAndUserNmae(date1, date2, username,adminId);
	}

	@Override
	public List<AuditTrail> getByUsername(String username,String adminId) {
		// TODO Auto-generated method stub
		return ar.getbyusername(username,adminId);
	}

	@Override
	public List<AuditTrail> getByAgentCode(String agent,String adminId) {
		// TODO Auto-generated method stub
		return ar.getbyagent(agent,adminId);
	}

	@Override
	public List<AuditTrail> getByDateAndAgent(String date1, String date2, String agent,String adminId) {
		// TODO Auto-generated method stub
		return ar.getByDateAndAgent(date1, date2, agent,adminId);
	}

	@Override
	public List<AuditTrail> getByDateAndUsernameAndAgent(String date1, String date2, String username, String agent,String adminId) {
		// TODO Auto-generated method stub
		return ar.getByDateAndUserNmaeAndAgent(date1, date2, username, agent,adminId);
	}

		

}
