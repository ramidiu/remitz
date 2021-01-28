package com.kws.unitedfintech.serviceimpl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kws.unitedfintech.entities.MajorHead;
import com.kws.unitedfintech.entities.NoGenerator;
import com.kws.unitedfintech.helpers.SenditoConvertNullsToEmpty;
import com.kws.unitedfintech.repository.MajorHeadRepository;
import com.kws.unitedfintech.service.MajorHeadService;
import com.kws.unitedfintech.service.NoGeneratorService;

@Service
public class MajorHeadServiceImpl implements MajorHeadService {
@Autowired
	MajorHeadRepository majorHeadRepository;
@Autowired
NoGeneratorService noGeneratorService;
SenditoConvertNullsToEmpty senditoConvertNullsToEmpty=new SenditoConvertNullsToEmpty();
@Override
public String checkMajorHead(String majorHeadId, String adminId,String majorHeadNature) {
	String result="";
		System.out.println("majorheadid checking from serviceimpl");
		  MajorHead majorHead=majorHeadRepository.checkMajorHead(majorHeadId,adminId,majorHeadNature);
		  System.out.println("MajorHead=========="+majorHead);
		  if(majorHead!=null) {
		  result="exist";
		  
		  System.out.println("result=========="+result); }
		 	return result;
}

@Override
public void insertMajorHead(MajorHead majorHead) {
	NoGenerator  noGenerator=noGeneratorService.getNoGenerator("majorhead");
	String id=noGenerator.getIdPrefix()+noGenerator.getTableId();
	majorHead.setMajorHeadId(id);
	majorHead=senditoConvertNullsToEmpty.convertNullFieldToEmpty(majorHead,MajorHead.class);
	majorHead.setLevel("2");
	noGeneratorService.updateNoGenerator(noGenerator);

	majorHeadRepository.save(majorHead);
	}

@Override
public List<MajorHead> getAllMajoHeads(String adminId) {
	System.out.println("major head get all majorheads");
	return majorHeadRepository.getAllMajoHeads(adminId);
}

@Override
public List<MajorHead> getListOfMajorHeads(String data, String hoa) {
	// TODO Auto-generated method stub
	return null;
}

@Override
public List<MajorHead> getMajorHeadListBasedOnNature(String nature, String adminId) {
System.out.println("nature========"+nature);
System.out.println("adminid======"+adminId);
	return majorHeadRepository.getMajorHeadListBasedOnNature(nature, adminId);
}

@Override
public MajorHead getMajorHeadBasedOnAccNo1(String accNo, String adminId,String nature) {
	// TODO Auto-generated method stub
	return majorHeadRepository.getMajorHeadBasedOnAccNo1(accNo, adminId,nature);
	}
public MajorHead getMajorHeadBasedOnAccNo(String accNo, String adminId) {
	// TODO Auto-generated method stub
	return majorHeadRepository.getMajorHeadBasedOnAccNo(accNo, adminId);
	}

@Override
public List<MajorHead> getMajorHeadBasedOnMajorHeadNAmeAndAdminId(String majorHeadNature, String adminId) {
	// TODO Auto-generated method stub
	return majorHeadRepository.getMajorHeadBasedOnMajorHeadNameAndAdminId(majorHeadNature, adminId);
}

@Override
public List<MajorHead> getMajorHeadListBasedOnNature(String MajorHeadNature) {
	// TODO Auto-generated method stub
	return majorHeadRepository.getMajorHeadListBasedOnMajorHeadNature(MajorHeadNature);
}

@Override
public List<MajorHead> getMajorHeadListCountByNature(String majorHeadNature,String adminId) {
	// TODO Auto-generated method stub
	return majorHeadRepository.getMajorHeadListCount(majorHeadNature,adminId);
}

@Override
public String checkmajorHeadId(String majorHeadId, String adminId) {
	// TODO Auto-generated method stub
System.out.println(majorHeadId+"========majorheadid==");
System.out.println(adminId+"===========adminid====");
	MajorHead majorHead=majorHeadRepository.checkExistedMajorHeadId(majorHeadId, adminId);

System.out.println("username==="+majorHead);
String result="";
if(majorHead !=null){
	result="exist";
}
else {
	result=" ";
}
return result;	
}

@Override
public MajorHead getMajorHeadBasedOnAccNo2(int accNo, String adminId, String nature) {
	// TODO Auto-generated method stub
	return majorHeadRepository.getMajorHeadBasedOnAccNo2(accNo, adminId,nature);
}

@Override
public List<MajorHead> getUniqueMajorHeads() {
	// TODO Auto-generated method stub
	return majorHeadRepository.findAll();
}

@Override
public Map<String, MajorHead> getMajorHeadNature() {
	System.out.println("maps are working");
	// TODO Auto-generated method stub
	return  null;
}

@Override
public List<MajorHead> getMajorHeadListBasedOnNature1(String majorhead) {
	// TODO Auto-generated method stub
	return majorHeadRepository.getMajorHeadList(majorhead);
}

@Override
public List<MajorHead> getlistbystatus(String status) {
	// TODO Auto-generated method stub
	return majorHeadRepository.getlistbystatus(status);
}

@Override
public List<MajorHead> getMajorList(String major,String adminId) {
	// TODO Auto-generated method stub
	return majorHeadRepository.getmajorList(major,adminId);
}



	}
