package com.kws.unitedfintech.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.kws.unitedfintech.entities.JournalVoucher;

@Repository
public interface JournalVoucherRepository extends JpaRepository<JournalVoucher, String> {

	 @Query("select t from JournalVoucher t where  t.finYr=:finYear and t.bankName=:subhead and t.date>=:fromdate and t.date<=:todate")
	 public List<JournalVoucher>getAllSpecificSendingBranchTransactions(String finYear,String subhead,String fromdate,String todate);

	/*
	 * @Query("select t from JournalVoucher t where  t.finYr=:finYear and t.bankName=:subhead and t.date between :fromdate and :todate"
	 * ) public List<JournalVoucher>getAllSpecificSendingBranchTransactions(String
	 * finYear,String subhead,String fromdate,String todate);

	 *
	 */

@Query("from JournalVoucher t where t.finYr=:finYear and t.date>=:fromDate and t.date<=:toDate")
public List<JournalVoucher> getlist(String finYear,String fromDate,String toDate);

@Query("from JournalVoucher j where j.admin.adminId=:adminId")
public List<JournalVoucher> getListByAdminId(String adminId);

}
