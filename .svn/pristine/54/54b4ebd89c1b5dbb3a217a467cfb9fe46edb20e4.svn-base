package com.kws.unitedfintech.serviceimpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kws.unitedfintech.entities.SourceOfFund;
import com.kws.unitedfintech.repository.SourceOfFundRepository;
import com.kws.unitedfintech.service.SourceOfFundService;

@Service
public class SourceOfFundServiceImpl implements SourceOfFundService{

	@Autowired
	private SourceOfFundRepository sourceOfFundRepository;
	
	@Override
	public void insert(SourceOfFund fund) {
		sourceOfFundRepository.save(fund);
		//sourceOfFundDao.insert(fund);
	}

	@Override
	public List<SourceOfFund> getSourceOfFundList() {
		return (List<SourceOfFund>) sourceOfFundRepository.findAll();
	}
	

}
