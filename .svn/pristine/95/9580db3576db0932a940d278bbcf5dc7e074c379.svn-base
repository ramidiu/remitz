package com.kws.unitedfintech.repository;

import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.kws.unitedfintech.entities.OnlineMop;

@Repository
public interface OnlineMopRepository extends CrudRepository<OnlineMop, String> {

	
	@Query("SELECT om FROM OnlineMop om WHERE om.admin.adminId=:adminId")
	public List<OnlineMop> findByAdmin(@Param("adminId")String adminId);
	
	@Query("SELECT om FROM OnlineMop om WHERE om.onlineId=:onlineId")
	public OnlineMop findByOnlineId(@Param("onlineId")String onlineId);
	
	
	@Query("SELECT om FROM OnlineMop om WHERE om.admin.adminId=:adminId")
	public OnlineMop findOneByAdmin(@Param("adminId")String adminId);
}
