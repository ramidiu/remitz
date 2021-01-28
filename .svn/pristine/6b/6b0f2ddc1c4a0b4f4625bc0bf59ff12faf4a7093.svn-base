package com.kws.unitedfintech.repository;

import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.kws.unitedfintech.entities.EwalletPaymentType;

@Repository
public interface EwalletPaymentTypRepository extends CrudRepository<EwalletPaymentType, String>  {

	@Query("SELECT ep FROM EwalletPaymentType ep WHERE ep.admin.adminId=:adminId")
	public List<EwalletPaymentType> findByAdmin(@Param("adminId")String adminId);
	
	@Query("SELECT ep FROM EwalletPaymentType ep WHERE ep.admin.adminId=:adminId")
	public EwalletPaymentType findOneByAdmin(@Param("adminId")String adminId);
}
