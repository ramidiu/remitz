package com.kws.unitedfintech.serviceimpl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kws.unitedfintech.entities.NoGenerator;
import com.kws.unitedfintech.entities.SubHead;
import com.kws.unitedfintech.helpers.SenditoConvertNullsToEmpty;
import com.kws.unitedfintech.repository.SubHeadRepositories;
import com.kws.unitedfintech.repository.SubHeadsRepo;
import com.kws.unitedfintech.service.NoGeneratorService;
import com.kws.unitedfintech.service.SubHeadService;
@Service
public class SubHeadServiceImpl implements SubHeadService {
@Autowired
	SubHeadRepositories subHeadRepositories;
@Autowired
SubHeadsRepo subHeadsRepo;
@Autowired	
NoGeneratorService noGeneratorService;
SenditoConvertNullsToEmpty senditoConvertNullsToEmpty=new SenditoConvertNullsToEmpty();	
@Override
	public void insertSubHead(SubHead subHead) {
		NoGenerator noGenerator=noGeneratorService.getNoGenerator("subhead");
		String subHeadId=noGenerator.getIdPrefix()+noGenerator.getTableId();
		subHead.setSubHeadId(subHeadId);
		subHead=senditoConvertNullsToEmpty.convertNullFieldToEmpty(subHead, SubHead.class);
		subHeadRepositories.save(subHead);
		noGeneratorService.updateNoGenerator(noGenerator);
		
	}



	@Override
	public List<SubHead> getAllSubHeadBasedOnNature( String adminId,String nature, String createdBy) {
		System.out.println("nature========"+nature);
		System.out.println("adminid======"+adminId);

		return subHeadRepositories.getAllSubHeadBasedOnNature( adminId,nature, createdBy);
	}

	@Override
	public List<SubHead> getSubHeadsBasedOnAdminIdAndMinorIdForAdmin(String adminId, String minorHeadId) {
		System.out.println("gjhmn");
	return subHeadRepositories.getSubHeadsBasedOnAdminIdAndMinorIdForAdmin(adminId, minorHeadId);
	}

	@Override
	public List<SubHead> getAllSubHeadBasedOnNature1( String adminId, String createdBy) {
		System.out.println("nature========");
		System.out.println("adminid======"+adminId);

		return subHeadRepositories.getAllSubHeadBasedOnNature1( adminId, createdBy);
	}


	@Override
	public List<SubHead> getAllSubHeadBasedOnNature2( String adminId) {
		System.out.println("nature========");
		System.out.println("adminid======"+adminId);

		return subHeadRepositories.getAllSubHeadBasedOnNature2( adminId);
	}

	@Override
	public List<SubHead> getAllSubHeadBasedOnAdminId(String adminId) {
		System.out.println("sssssssssssssssssssuuuuuuubbbbbhhhhhhhhheeeeeeeeeaaaaaaaaaaadddddddddd");
		return subHeadRepositories.getAllSubHeadBasedOnAdminId(adminId);
	}



	@Override
	public void updateSubHead(SubHead subHead) {
		NoGenerator noGenerator=noGeneratorService.getNoGenerator("subhead");
		String subHeadId=noGenerator.getIdPrefix()+noGenerator.getTableId();
		subHead.setSubHeadId(subHeadId);
		subHead=senditoConvertNullsToEmpty.convertNullFieldToEmpty(subHead, SubHead.class);
		subHeadRepositories.save(subHead);
		noGeneratorService.updateNoGenerator(noGenerator);
		
		
		

	}



	@Override
	public void updateSubHeadChartOfAccounts(String accNo, String accCode, String accDesc) {
		// TODO Auto-generated method stub
		subHeadRepositories.updateSubHead(accNo, accCode, accDesc);
	}



	@Override
	public List<SubHead> getTotalList() {
		// TODO Auto-generated method stub
		System.out.println("SUBHEAD SEARCH IN SER IMPL");
		return subHeadRepositories.findAll();
	}



	@Override
	public Map<String, SubHead> getSubHeadWithoutDuplicateMap() {
		// TODO Auto-generated method stub
		Map<String, SubHead> map = null;
		System.out.println("subhead autocomplete");
		//map=subHeadRepositories.get
		return map;



	}



	@Override
	public List<SubHead> getOnlyRevenueSubheads(String subhead) {
		
		System.out.println("sdf");
		return subHeadRepositories.getAllSubHeadSearch(subhead);
	}



	@Override
	public List<SubHead> getSubheadForLedgerReport() {
		// TODO Auto-generated method stub
		return subHeadRepositories.findAll();
	}



	@Override
	public List<SubHead> getAllSubHeadList() {
		// TODO Auto-generated method stub
		System.out.println("suheadrepositories are here");
		return subHeadRepositories.findAll();
	}



	@Override
	public List<SubHead> getOnlySubheadsBasedOnAdmin(String subhead, String adminId) {
		// TODO Auto-generated method stub
		System.out.println("adminId======"+adminId);
		return subHeadRepositories.getAllSubHeadSearches(subhead, adminId);
	}






}
