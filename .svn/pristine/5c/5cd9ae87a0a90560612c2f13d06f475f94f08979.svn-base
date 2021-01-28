package com.kws.unitedfintech.repository;

import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.kws.unitedfintech.entities.TxDaysLimit;

@Repository
public interface TxDaysServiceRepository extends CrudRepository<TxDaysLimit,String>{
	
	
	@Query("select t from TxDaysLimit t where t.admin.adminId=:adminId")
	public List<TxDaysLimit> txByAdmin(@Param("adminId") String adminId);

	@Query("select t from TxDaysLimit t where t.txId=:txId")
	public TxDaysLimit txByTxId(@Param("txId") String txId);
	
	
	
	@Query("select t from TxDaysLimit t where t.branch.branchId=:branchId and t.limitDays=:limitDays")
	public List<TxDaysLimit> txBybranchId(@Param("branchId") String branchId,@Param("limitDays")String limitDays);

	@Query("select t from TxDaysLimit t where t.branch.branchId=:branchId")
	public List<TxDaysLimit> txBybranch(@Param("branchId") String branchId);

}
