package com.kws.unitedfintech.serviceimpl;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kws.unitedfintech.entities.AccessLog;
import com.kws.unitedfintech.entities.NoGenerator;
import com.kws.unitedfintech.helpers.SenditoConvertNullsToEmpty;
import com.kws.unitedfintech.repository.AccessLogRepository;
import com.kws.unitedfintech.service.AccessLogService;
import com.kws.unitedfintech.service.NoGeneratorService;

@Service
public class AccessLogServiceImpl implements AccessLogService{

	
	SenditoConvertNullsToEmpty senditoConvertNullsToEmpty=new SenditoConvertNullsToEmpty();
	@Autowired
	private NoGeneratorService noGeneratorService;
@Autowired
private AccessLogRepository ar;
SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

Calendar cal = Calendar.getInstance();

Date d = cal.getTime();

	
@Override
	public AccessLog saveAccessLog(AccessLog accessLog) {
		NoGenerator noGenerator = noGeneratorService.getNoGenerator("acess_logs");
	String id=noGenerator.getIdPrefix() + noGenerator.getTableId();
	accessLog.setAcessId(id);
	accessLog.setLogOnTime(sdf.format(d));
	accessLog.setLogOffTime(" ");
	AccessLog a=ar.save(accessLog);
	noGeneratorService.updateNoGenerator(noGenerator);
	return a;
	}
	@Override
	public List<AccessLog> getAllByAdminId(String adminId) {
		// TODO Auto-generated method stub
		return ar.getList(adminId);
	}
	@Override
	public AccessLog AccessLogbyid(String aid,String userid,String adminId) {
		// TODO Auto-generated method stub
		return ar.AccessLogbyid(aid,userid,adminId);
	}
	@Override
	public AccessLog updateAccessLog(AccessLog a) {
		// TODO Auto-generated method stub
		return ar.save(a);
	}
	@Override
	public List<AccessLog> getlistbetweendates(String logondate, String logoffdate,String adminId) {
		// TODO Auto-generated method stub
		System.out.println("logondate===="+logondate);
		System.out.println("logoffdate==="+logoffdate);
		return ar.getlistbetweendates(logondate, logoffdate,adminId);
	}
	@Override
	public List<AccessLog> getlistbwdatesandusertype(String logondate, String logoffdate, String userType,String adminId) {
		// TODO Auto-generated method stub
		return ar.getlistbwdatesandusertype(logondate, logoffdate, userType,adminId);
	}
	@Override
	public List<AccessLog> getlistbwdatesandusertypeandusername(String logondate, String logoffdate, String userType,
			String username,String adminId) {
		// TODO Auto-generated method stub
		return ar.getlistbwdatesandusertypeandusername(logondate, logoffdate, userType, username,adminId);
	}
	@Override
	public List<AccessLog> getListByUserType(String userType,String adminId) {
		// TODO Auto-generated method stub
		return ar.getListByUserType(userType,adminId);
	}
	@Override
	public List<AccessLog> getListByUsername(String username,String adminId) {
		// TODO Auto-generated method stub
		return ar.getListByUsername(username,adminId);
	}
	@Override
	public List<AccessLog> getlistbwdatesandusername(String logondate, String logoffdate, String username,String adminId) {
		// TODO Auto-generated method stub
		return ar.getlistbwdatesandusername(logondate, logoffdate, username, adminId);
	}
	@Override
	public List<AccessLog> getListByUserTypeAnduserName(String userType, String username,String adminId) {
		// TODO Auto-generated method stub
		return ar.getListByUserTypeAnduserName(userType, username, adminId);
	}
	@Override
	public AccessLog getbyid(String aid) {
		// TODO Auto-generated method stub
		return ar.getbyaid(aid);
	}

}
