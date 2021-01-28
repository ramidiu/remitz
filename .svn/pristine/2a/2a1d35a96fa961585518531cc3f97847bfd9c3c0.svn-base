package com.kws.unitedfintech.serviceimpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kws.unitedfintech.entities.SourceOfFunds1;
import com.kws.unitedfintech.helpers.SenditoConvertNullsToEmpty;
import com.kws.unitedfintech.repository.SourceOfFundsRepository;
import com.kws.unitedfintech.service.SourceOfFundsService;

@Service
public class SourceOfFundsServiceImpl implements SourceOfFundsService {
	
	
	
	@Autowired
	private SourceOfFundsRepository sourceOfFundsRepository;
	SenditoConvertNullsToEmpty senditoConvertNullsToEmpty=new SenditoConvertNullsToEmpty();


	@Override
	public void insertSourceOfFunds(SourceOfFunds1 sourceOfFunds) {
		sourceOfFunds = senditoConvertNullsToEmpty.convertNullFieldToEmpty(sourceOfFunds, SourceOfFunds1.class);

		sourceOfFundsRepository.save(sourceOfFunds);		
	}

	@Override
	public List<SourceOfFunds1> SourceOfFundsListBasedOnAdmin(String adminId) {
		// TODO Auto-generated method stub
		return sourceOfFundsRepository.findAll(adminId);
	}

	@Override
	public void editsourceOfFund(String sourceOfFund, int sourceOffundId) {
		// TODO Auto-generated method stub
		//sourceOfFundsRepository.edit(sourceOfFund, sourceOffundId);
	}

	@Override
	public boolean updateFund(String sourceOfFund, int sourceOffundId, String adminId) {
		SourceOfFunds1 sf=sourceOfFundsRepository.findbyAdminAndId(adminId, sourceOffundId);
		sf.setSourceOfFund(sourceOfFund);
		sourceOfFundsRepository.save(sf);
		return true;
	}

	@Override
	public void deleteFund(int sourceOffundId) {
		// TODO Auto-generated method stub
		sourceOfFundsRepository.deleteBySourceOffundId(sourceOffundId);
	}

}
