package com.kws.unitedfintech.serviceimpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kws.unitedfintech.entities.BankBalance;
import com.kws.unitedfintech.entities.NoGenerator;
import com.kws.unitedfintech.helpers.SenditoConvertNullsToEmpty;
import com.kws.unitedfintech.repository.BankBalanceRepository;
import com.kws.unitedfintech.service.BankBalanceService;
import com.kws.unitedfintech.service.NoGeneratorService;
@Service
public class BankalanceServiceImpl implements BankBalanceService {
@Autowired
	NoGeneratorService noGeneratorService;
SenditoConvertNullsToEmpty senditoConvertNullsToEmpty=new SenditoConvertNullsToEmpty();
@Autowired
BankBalanceRepository bankBalanceRepository;

@Override
public void insertBankBalance(BankBalance bankBalance) {
	NoGenerator  noGenerator=noGeneratorService.getNoGenerator("bankbalance");
	String id=noGenerator.getIdPrefix()+noGenerator.getTableId();
	bankBalance.setUniqId(id);
	bankBalance.setBankFlag("opening");
	bankBalance=senditoConvertNullsToEmpty.convertNullFieldToEmpty(bankBalance,BankBalance.class);
	noGeneratorService.updateNoGenerator(noGenerator);
	bankBalanceRepository.save(bankBalance);
}

@Override
public List<BankBalance> getList(String adminId, String fin, String bankname) {
	// TODO Auto-generated method stub
	return bankBalanceRepository.getListForDuplicateEntries(adminId, fin, bankname);
}

@Override
public String getUserListBasedOnEmailIds(String adminId, String fin, String bankname) {
	BankBalance bankbalance =bankBalanceRepository.checkByUserNames(adminId, fin, bankname);
	System.out.println("username==="+bankbalance);
	String result="";
	if(bankbalance !=null){
		result="exist";
	}
	else {
		result=" ";
	}
	return result;
}

@Override
public List<BankBalance> getAllSendingBranchTransactions(String finYear, String subhead) {
	// TODO Auto-generated method stub
	return bankBalanceRepository.getAllSpecificSendingBranchTransaction(finYear, subhead);
}

@Override
public List<BankBalance> getListBySubheads(String subhead) {
	// TODO Auto-generated method stub
	return bankBalanceRepository.getListySubhead(subhead);
}

@Override
public List<BankBalance> findAll() {
	// TODO Auto-generated method stub
	return bankBalanceRepository.findAll();
}

@Override
public List<BankBalance> getassetbankbalancelist(String finyear, String fromdate, String todate,String adminId,String assetbankcode) {
	// TODO Auto-generated method stub
	return bankBalanceRepository.getAssetBankBalanceList(finyear, fromdate, todate, adminId, assetbankcode);
}

@Override
public int getassetbankbalancelistbycount(String finyear, String fromdate, String todate, String adminId,
		String assetbankcode) {
	// TODO Auto-generated method stub
	return bankBalanceRepository.getAssetBankBalanceListbycount(finyear, fromdate, todate, adminId, assetbankcode);
}

@Override
public List<BankBalance> getliabilitybankbalancelist(String finyear, String fromdate, String todate, String adminId,
		String libabilitybankcode) {
	// TODO Auto-generated method stub
	return bankBalanceRepository.getLiabBankBalanceList(finyear, fromdate, todate, adminId, libabilitybankcode);
}
}

	


