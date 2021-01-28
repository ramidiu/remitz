package com.kws.unitedfintech.serviceimpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kws.unitedfintech.entities.SenderIds;
import com.kws.unitedfintech.helpers.SenditoConvertNullsToEmpty;
import com.kws.unitedfintech.repository.SenderIdTypeRepository;
import com.kws.unitedfintech.service.SenderIdTypeService;

@Service
public class SenderIdTypeServiceImpl implements SenderIdTypeService{

	@Autowired
	private SenderIdTypeRepository senderIdTypeRepository;
	
	SenditoConvertNullsToEmpty senditoConvertNullsToEmpty=new SenditoConvertNullsToEmpty();
	
	
	@Override
	public void Save(SenderIds senderIds) {
		senderIds = senditoConvertNullsToEmpty.convertNullFieldToEmpty(senderIds, SenderIds.class);
	
		senderIdTypeRepository.save(senderIds);		
	}

	@Override
	public List<SenderIds> findByAdmin(String adminId) {
		return senderIdTypeRepository.findbyAdmin(adminId);
	}

	@Override
	public void deletebyid(int senderId) {
		// TODO Auto-generated method stub
		 senderIdTypeRepository.deletebyid(senderId);
	}

	@Override
	public boolean updatebyId(int senderId, String senderType, String issuingAuthority, String adminId) {
		// TODO Auto-generated method stub
		SenderIds sd=senderIdTypeRepository.findById(senderId, adminId);
		sd.setIssuingAuthority(issuingAuthority);
		sd.setSenderType(senderType);
		senderIdTypeRepository.save(sd);
		return true;
	}

	@Override
	public List<SenderIds> findByBranch(String branchId) {
		// TODO Auto-generated method stub
		return senderIdTypeRepository.findbyBranchId(branchId);
	}

	@Override
	public List<SenderIds> findByBranchAndAdminAndFunctionality(String branchId, String adminId, String functionality) {
		// TODO Auto-generated method stub
		return senderIdTypeRepository.findbyBranchIdAdminIdFunctionality(branchId, adminId, functionality);
	}

	@Override
	public void save2(SenderIds senderIds) {
		// TODO Auto-generated method stub
		for(int i=0;i<3;i++) {
			if(i==0) {
			senderIds.setFunctionality(senderIds.getBranch().getFunctionality());	
			senderIds.setIdValue("2");
			senderIds.setIssuingAuthority("country");
			senderIds.setSenderType("International Passport");
		}
			if(i==1) {
			senderIds.setFunctionality(senderIds.getBranch().getFunctionality());	
			senderIds.setIdValue("01");
			senderIds.setIssuingAuthority("state");
			senderIds.setSenderType("Driving License");
		}
			if(i==2) {
			senderIds.setFunctionality(senderIds.getBranch().getFunctionality());	
			senderIds.setIdValue("5");
			senderIds.setIssuingAuthority("state");
			senderIds.setSenderType("Passport");
		}
			senderIdTypeRepository.save(senderIds);

		}
	}

}
