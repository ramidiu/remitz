package com.kws.unitedfintech.service;

import java.util.List;

import com.kws.unitedfintech.entities.AccessLog;

public interface AccessLogService {

	public AccessLog saveAccessLog(AccessLog accessLog);
	
	public List<AccessLog> getAllByAdminId(String adminId);
	public AccessLog AccessLogbyid(String aid,String userid,String adminId);
	
	public AccessLog getbyid(String aid);
	public AccessLog updateAccessLog(AccessLog a);
	
	
	public List<AccessLog> getlistbetweendates(String logondate,String logoffdate,String adminId);
	
	public List<AccessLog> getlistbwdatesandusertype(String logondate,String logoffdate,String userType,String adminId);	

	public List<AccessLog> getlistbwdatesandusertypeandusername(String logondate,String logoffdate,String userType,String username,String adminId);	
	public List<AccessLog> getListByUserType(String userType,String adminId);	
	public List<AccessLog> getListByUsername(String username,String adminId);	
	public List<AccessLog> getlistbwdatesandusername(String logondate,String logoffdate,String username,String adminId);
	
	public List<AccessLog> getListByUserTypeAnduserName(String userType,String username,String adminId);	
	

}
