package com.kws.unitedfintech.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.kws.unitedfintech.entities.BankBalance;

@Repository
public interface BankBalanceRepository extends JpaRepository<BankBalance, String> {

	@Query("from BankBalance b where b.createdBy=:adminId and b.finYr=:fin and b.typeOfBank=:bankname")
	public List<BankBalance> getListForDuplicateEntries(String adminId,String fin,String bankname);
	
	 @Query("select b from BankBalance b where b.createdBy=:adminId and b.finYr=:fin and b.typeOfBank=:bankname ")
	 public BankBalance checkByUserNames(String adminId,String fin,String bankname);
	 @Query("from BankBalance b where b.finYr=:finYear and  b.typeOfBank=:subhead")
	 public List<BankBalance> getBankBalancesList(String finYear, String subhead);

	 @Query("select t from BankBalance t where  t.finYr=:finYear and t.typeOfBank=:subhead")
	 public List<BankBalance>getAllSpecificSendingBranchTransaction(String finYear,String subhead);
  
	 
	 @Query("select t from BankBalance t where t.typeOfBank like %:subhead%")
	 public List<BankBalance>getListySubhead(String subhead);
     @Query("select b from BankBalance b where b.finYr=:finyear and b.createdDate>=:fromdate and b.createdDate<=:todate and b.createdBy=:adminId and b.minorHeadId=:assetbankcode")
	 public List<BankBalance> getAssetBankBalanceList(String finyear,String fromdate,String todate,String adminId,String assetbankcode);
     
     @Query("select sum(bankBal) from BankBalance b where b.finYr=:finyear and b.createdDate>=:fromdate and b.createdDate<=:todate and b.createdBy=:adminId and b.minorHeadId=:assetbankcode")
	 public int getAssetBankBalanceListbycount(String finyear,String fromdate,String todate,String adminId,String assetbankcode);
     @Query("select b from BankBalance b where b.finYr=:finyear and b.createdDate>=:fromdate and b.createdDate<=:todate and b.createdBy=:adminId and b.minorHeadId=:liabilitybankcode")
	 public List<BankBalance> getLiabBankBalanceList(String finyear,String fromdate,String todate,String adminId,String liabilitybankcode);
    
}
