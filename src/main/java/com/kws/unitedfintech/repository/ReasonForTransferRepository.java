package com.kws.unitedfintech.repository;

import java.util.List;

import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestParam;

import com.kws.unitedfintech.entities.ReasonForTransfer;

@Repository
public interface ReasonForTransferRepository extends CrudRepository<ReasonForTransfer, String> {

	
	@Query("select r from ReasonForTransfer r where r.admin.adminId=:adminId")
	public List<ReasonForTransfer> findAllByAdmin(@RequestParam("adminId")String adminId);
	
	@Query("select r from ReasonForTransfer r where r.admin.adminId=:adminId and r.reasonFortransferId=:reasonFortransferId")
	public ReasonForTransfer findbyAdminAndReasonFortransferId(@RequestParam("adminId")String adminId,int reasonFortransferId);


	@Transactional
	@Modifying
	@Query("delete  from ReasonForTransfer where reasonFortransferId=:reasonFortransferId")
	public void deleteByReasonFortransferId(@Param("reasonFortransferId")int reasonFortransferId);






}
