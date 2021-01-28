package com.kws.unitedfintech.service;

import java.util.List;
import java.util.Map;

import com.kws.unitedfintech.entities.SubHead;

public interface SubHeadService {
	public void insertSubHead(SubHead subHead);
	public List<SubHead> getAllSubHeadBasedOnNature(String adminId,String nature,String createdBy);
	public List<SubHead> getSubHeadsBasedOnAdminIdAndMinorIdForAdmin(String adminId,String minorHeadId);
	public List<SubHead> getAllSubHeadBasedOnNature1(String adminId,String createdBy);
	public List<SubHead> getAllSubHeadBasedOnNature2(String adminId);
	public List<SubHead> getAllSubHeadBasedOnAdminId(String adminId);
	public void updateSubHead(SubHead subHead);
	public void updateSubHeadChartOfAccounts(String accNo,String accCode,String accDesc);
	public List<SubHead> getTotalList();
	public Map<String , SubHead> getSubHeadWithoutDuplicateMap();
	public List<SubHead> getOnlyRevenueSubheads(String subhead);

	public List<SubHead> getOnlySubheadsBasedOnAdmin(String subhead,String adminId);
	public List<SubHead> getSubheadForLedgerReport();
	public List<SubHead> getAllSubHeadList();
	
}
