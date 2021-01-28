package com.kws.unitedfintech.service;

import java.util.List;
import java.util.Map;

import com.kws.unitedfintech.entities.MajorHead;


public interface MajorHeadService {

	public String checkMajorHead(String majorHeadId,String adminId,String majorHeadNature);
	public void insertMajorHead(MajorHead majorHead);
	public List<MajorHead> getAllMajoHeads(String adminId);
	public List<MajorHead> getListOfMajorHeads(String data,String hoa);
	public List<MajorHead> getMajorHeadListBasedOnNature(String nature,String adminId);
	public MajorHead getMajorHeadBasedOnAccNo1(String accNo,String adminId,String nature);	
	public MajorHead getMajorHeadBasedOnAccNo2(int accNo,String adminId,String nature);
	public MajorHead getMajorHeadBasedOnAccNo(String accNo,String adminId);	
	public List<MajorHead> getMajorHeadBasedOnMajorHeadNAmeAndAdminId(String majorHeadNature,String adminId);
    public List<MajorHead> getMajorHeadListBasedOnNature(String MajorHeadNature);
    public List<MajorHead> getMajorHeadListCountByNature(String majorHeadNature,String adminId);
public String checkmajorHeadId(String majorHeadId,String adminId);
public List<MajorHead> getUniqueMajorHeads();
public Map<String, MajorHead> getMajorHeadNature();
public List<MajorHead> getMajorHeadListBasedOnNature1(String majorhead);

public List<MajorHead> getlistbystatus(String status);
public List<MajorHead> getMajorList(String major,String adminId);
}
