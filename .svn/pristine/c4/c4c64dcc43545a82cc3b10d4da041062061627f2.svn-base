package com.kws.unitedfintech.service;

import java.util.List;

import com.kws.unitedfintech.entities.AuditTrail;

public interface AuditTrailService {

	
	public AuditTrail save(AuditTrail ar);
	
	public List<AuditTrail> getAllList(String adminId);
	
	
	public List<AuditTrail> getByDate(String date1,String date2,String adminId);
	
	public List<AuditTrail> getByDateAndUsername(String date1,String date2,String username,String adminId);
	public List<AuditTrail> getByUsername(String username,String adminId);
	
	public List<AuditTrail> getByAgentCode(String agent,String adminId);

	public List<AuditTrail> getByDateAndAgent(String date1,String date2,String agent,String adminId);

	public List<AuditTrail> getByDateAndUsernameAndAgent(String date1,String date2,String username,String agent,String adminId);
	
	
}
