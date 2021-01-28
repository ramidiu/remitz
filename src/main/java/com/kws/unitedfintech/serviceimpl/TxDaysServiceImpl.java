package com.kws.unitedfintech.serviceimpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kws.unitedfintech.entities.NoGenerator;
import com.kws.unitedfintech.entities.TxDaysLimit;
import com.kws.unitedfintech.helpers.SenditoConvertNullsToEmpty;
import com.kws.unitedfintech.repository.TxDaysServiceRepository;
import com.kws.unitedfintech.service.NoGeneratorService;
import com.kws.unitedfintech.service.TxDaysService;

@Service
public class TxDaysServiceImpl  implements TxDaysService{

	@Autowired
	private TxDaysServiceRepository txr;
	@Autowired
	private NoGeneratorService noGeneratorService;

SenditoConvertNullsToEmpty senditoConvertNullsToEmpty=new SenditoConvertNullsToEmpty(); 
	
	@Override
	public void save(TxDaysLimit tx) {
		NoGenerator noGenerator=noGeneratorService.getNoGenerator("tx_limit_days");
		String id=noGenerator.getIdPrefix()+noGenerator.getTableId();
		System.out.println("id====="+noGenerator);
		tx.setTxId(id);
		 txr.save(tx);
		noGeneratorService.updateNoGenerator(noGenerator);
	}

	@Override
	public List<TxDaysLimit> txByAdmin(String adminId) {
		return txr.txByAdmin(adminId);
	}

	@Override
	public void updatebytxId(String txId, String limitDays) {
	TxDaysLimit tx=txr.txByTxId(txId);
	tx.setLimitDays(limitDays);
	txr.save(tx);
		
	}

	@Override
	public List<TxDaysLimit> getByBranch(String branchId,String limitDays) {
		// TODO Auto-generated method stub
		return txr.txBybranchId(branchId,limitDays);
	}

	@Override
	public List<TxDaysLimit> getByBranchId(String branchId) {
		// TODO Auto-generated method stub
		return txr.txBybranch(branchId);
	}

}
