package com.kws.unitedfintech.repository;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;

import org.springframework.stereotype.Repository;

import com.kws.unitedfintech.entities.SubHead;

@Repository
public interface SubHeadRepositories extends JpaRepository<SubHead, String> {
    @Query("from SubHead sh where sh.admin.adminId=:adminId and sh.nature=:nature and sh.createdBy=:createdBy")
	public List<SubHead> getAllSubHeadBasedOnNature(String adminId,String nature,String createdBy);
    @Query("from SubHead sh where sh.admin.adminId=:adminId and sh.minorHead.minorHeadId=:minorHeadId")
    public List<SubHead> getSubHeadsBasedOnAdminIdAndMinorIdForAdmin(String adminId,String minorHeadId);
    @Query("from SubHead sh where sh.admin.adminId=:adminId and sh.createdBy=:createdBy")
	public List<SubHead> getAllSubHeadBasedOnNature1(String adminId,String createdBy);
    @Query("from SubHead sh where sh.admin.adminId=:adminId")
	public List<SubHead> getAllSubHeadBasedOnNature2(String adminId);
    @Query("from SubHead sh where sh.admin.adminId=:adminId")
   	public List<SubHead> getAllSubHeadBasedOnAdminId(String adminId);
    @Modifying
    @Transactional
    @Query("update SubHead s set s.accDesc=:accDesc,s.subHeadName=:accCode where s.accNo=:accNo")
    public void updateSubHead(String accNo,String accCode,String accDesc);
    @Query("from SubHead sh where sh.subHeadId like %:subhead%")
	public List<SubHead> getAllSubHeadSearch(String subhead);
    @Query("from SubHead sh where sh.subHeadId like %:subhead% and sh.headOfAccount=:adminId")
   	public List<SubHead> getAllSubHeadSearches(String subhead,String adminId);

    
}


