package com.kws.unitedfintech.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.kws.unitedfintech.entities.MajorHead;
@Repository
public interface MajorHeadRepository extends JpaRepository<MajorHead, String> {
	@Query("from MajorHead m where m.accNo=:majorHeadId and m.admin.adminId=:adminId and m.majorHeadNature=:majorHeadNature")
	public MajorHead checkMajorHead(String majorHeadId,String adminId,String majorHeadNature);
	
	@Query("SELECT mah FROM MajorHead mah WHERE mah.admin.adminId=:adminId")
  public List<MajorHead> getAllMajoHeads(@Param("adminId") String adminId);
	
	  @Query("from MajorHead mh where mh.majorHeadId=:majorHeadId and mh.majorHeadNature=:majorHeadNature")
	  public List<MajorHead> getListOfMajorHeads(String majorHeadId,String majorHeadNature);

	  @Query("from MajorHead m where m.majorHeadNature=:nature and m.admin.adminId=:adminId")
	  public List<MajorHead> getMajorHeadListBasedOnNature(String nature,String adminId);
	  
	  @Query("from MajorHead m where m.accNo=:accNo and m.admin.adminId=:adminId")
	  public MajorHead getMajorHeadBasedOnAccNo(String accNo, String adminId);


	  @Query("from MajorHead m where m.accNo=:accNo and m.admin.adminId=:adminId and m.majorHeadNature=:nature")
	  public MajorHead getMajorHeadBasedOnAccNo1(String accNo, String adminId,String nature);
	  @Query("from MajorHead m where m.accNo=:accNo and m.admin.adminId=:adminId and m.majorHeadNature=:nature")
	  public MajorHead getMajorHeadBasedOnAccNo2(int accNo, String adminId,String nature);
	  
	  @Query("from MajorHead mhs where mhs.majorHeadNature=:majorHeadNature and mhs.admin.adminId=:adminId")
		public List<MajorHead> getMajorHeadBasedOnMajorHeadNameAndAdminId(String majorHeadNature, String adminId);

	  @Query("from MajorHead mhs where mhs.majorHeadNature=:MajorHeadNature")
		public List<MajorHead> getMajorHeadListBasedOnMajorHeadNature(String MajorHeadNature);
	  @Query("from MajorHead mhs where mhs.majorHeadNature=:majorHeadNature and mhs.admin.adminId=:adminId")
			public List<MajorHead> getMajorHeadListCount(String majorHeadNature,String adminId);
	  
	  
	  
@Query("select mh from MajorHead mh where mh.accNo=:majorHeadId and mh.admin.adminId=:adminId")
public MajorHead checkExistedMajorHeadId(String majorHeadId,String adminId);
@Query("from MajorHead mhs where mhs.majorHeadNature=:majorhead")
public List<MajorHead> getMajorHeadList(String majorhead);

@Query("from MajorHead mhs where mhs.majorHeadNature=:status")
public List<MajorHead> getlistbystatus(String status);

@Query("from MajorHead mhs where mhs.majorHeadNature=:major and mhs.admin.adminId=:adminId")
public List<MajorHead> getmajorList(String major,String adminId);

}


