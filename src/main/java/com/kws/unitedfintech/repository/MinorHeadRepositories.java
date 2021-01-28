package com.kws.unitedfintech.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.kws.unitedfintech.entities.MinorHead;
@Repository
public interface MinorHeadRepositories extends JpaRepository<MinorHead, String> {
	@Query("from MinorHead m where m.nature=:nature and m.admin.adminId=:adminId")
	public List<MinorHead> getAllMinorHeadBasedOnNature(String nature, String adminId);
	@Query("from MinorHead mh where mh.majorHead.majorHeadId=:majorHead and mh.admin.adminId=:adminId")
	public List<MinorHead> getMinorHeadBasedOnMajorHeadAndAdminId(String majorHead, String adminId);
	@Query("from MinorHead mhs where mhs.minorHeadId=:minorHeadId and mhs.admin.adminId=:adminId")
	public MinorHead checkMinorHead(String minorHeadId,String adminId);
	
	
	@Query("from MinorHead ms where ms.minorHeadId=:minorHeadId")
	public MinorHead getMinorHeadBasedOnId(String minorHeadId);
	

@Query("from MinorHead mhs where mhs.nature=:major and mhs.admin.adminId=:adminId")
public List<MinorHead> getminorList(String major,String adminId);

	
}
