package com.kws.unitedfintech.serviceimpl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kws.unitedfintech.entities.MinorHead;
import com.kws.unitedfintech.entities.NoGenerator;
import com.kws.unitedfintech.helpers.SenditoConvertNullsToEmpty;
import com.kws.unitedfintech.repository.MinorHeadRepositories;
import com.kws.unitedfintech.service.MinorHeadService;
import com.kws.unitedfintech.service.NoGeneratorService;

@Service
public class MinorHeadServiceImpl implements MinorHeadService {
    @Autowired
	NoGeneratorService noGeneratorService;
   SenditoConvertNullsToEmpty senditoConvertNullsToEmpty=new SenditoConvertNullsToEmpty();
	@Autowired
	    MinorHeadRepositories minorHeadRepositories;
	@Override
	public String checkMinorHead(String minorHeadId, String adminId) {
		String result="";
		MinorHead minorHead=null;
		minorHead=minorHeadRepositories.checkMinorHead(minorHeadId , adminId);
		if(minorHead!=null){
			result="exist";
		}
		return result;
	}
	@Override
	public List<MinorHead> getMinorHeadBasedOnMajorHeadAndAdminId(String majorHead, String adminId) {
		System.out.println("getMinorHeadBasedOnMajorHeadId=========");
		return minorHeadRepositories.getMinorHeadBasedOnMajorHeadAndAdminId(majorHead, adminId);
	}
	@Override
	public List<MinorHead> getAllMinorHeadBasedOnNature(String nature, String adminId) {
		System.out.println("nature========"+nature);
		System.out.println("adminid======"+adminId);

		return minorHeadRepositories.getAllMinorHeadBasedOnNature(nature, adminId);
	}
	@Override
	public MinorHead getMinorHeadBasedOnId(String minorHeadId) {
		// TODO Auto-generated method stub
		return minorHeadRepositories.getMinorHeadBasedOnId(minorHeadId);
	}
	@Override
	public void insertMinorHead(MinorHead minorHead) {
	NoGenerator noGenerator=noGeneratorService.getNoGenerator("minorhead");
	String id=noGenerator.getIdPrefix()+noGenerator.getTableId();
	minorHead.setMinorHeadId(id);
	minorHead=senditoConvertNullsToEmpty.convertNullFieldToEmpty(minorHead, MinorHead.class);

   minorHeadRepositories.save(minorHead);
	noGeneratorService.updateNoGenerator(noGenerator);
	
	
	}
	@Override
	public List<MinorHead> getMinorHeadList(String major, String adminId) {
		// TODO Auto-generated method stub
		return minorHeadRepositories.getminorList(major, adminId);
	}
	
	
	

}
