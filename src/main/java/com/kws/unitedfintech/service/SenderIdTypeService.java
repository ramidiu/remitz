package com.kws.unitedfintech.service;

import java.util.List;

import com.kws.unitedfintech.entities.SenderIds;


public interface SenderIdTypeService {
	
	
	public void Save(SenderIds senderIds);
	public void save2(SenderIds senderIds);
	public List<SenderIds> findByAdmin(String adminId);
	public List<SenderIds> findByBranch(String branchId);
	public List<SenderIds> findByBranchAndAdminAndFunctionality(String branchId,String adminId,String functionality);

	public void deletebyid(int senderId);
	
	public boolean updatebyId(int senderId,String senderType,String issuingAuthority,String adminId);

}
