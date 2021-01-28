package com.kws.unitedfintech.service;

import java.util.List;

import com.kws.unitedfintech.entities.BankBalance;

public interface BankBalanceService {
public void insertBankBalance(BankBalance bankBalance);
public List<BankBalance> getList(String adminId,String fin,String bankname);
public String getUserListBasedOnEmailIds(String adminId,String fin,String bankname);

public List<BankBalance> getAllSendingBranchTransactions(String finYear,String subhead);
public List<BankBalance> getListBySubheads(String subhead);
public List<BankBalance> findAll(); 
public List<BankBalance> getassetbankbalancelist(String finyear,String fromdate,String todate,String adminId,String assetbankcode);
public List<BankBalance> getliabilitybankbalancelist(String finyear,String fromdate,String todate,String adminId,String libabilitybankcode);
public int getassetbankbalancelistbycount(String finyear,String fromdate,String todate,String adminId,String assetbankcode);

}
