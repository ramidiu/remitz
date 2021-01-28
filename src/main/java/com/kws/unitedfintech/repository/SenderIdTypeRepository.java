package com.kws.unitedfintech.repository;

import java.util.List;

import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.kws.unitedfintech.entities.SenderIds;

@Repository
public interface SenderIdTypeRepository extends CrudRepository<SenderIds,String>{

	
	
	@Query("select s from SenderIds s where s.admin.adminId=:adminId")
	public List<SenderIds> findbyAdmin(@Param("adminId")String adminId);

	@Query("select s from SenderIds s where s.branch.branchId=:branchId")
	public List<SenderIds> findbyBranchId(@Param("branchId")String branchId);

	@Transactional
	@Modifying
	@Query("delete  from SenderIds  where senderId=:senderId")
	public void deletebyid(@Param("senderId")int senderId);
	
	@Query("select s from SenderIds s where s.admin.adminId=:adminId and s.senderId=:senderId")
	public SenderIds findById(@Param("senderId")int senderId,@Param("adminId")String adminId);


	@Query("select s from SenderIds s where s.branch.branchId=:branchId and s.admin.adminId=:adminId and s.functionality!=:functionality")
	public List<SenderIds> findbyBranchIdAdminIdFunctionality(@Param("branchId")String branchId,@Param("adminId")String adminId,@Param("functionality")String functionality);


}
