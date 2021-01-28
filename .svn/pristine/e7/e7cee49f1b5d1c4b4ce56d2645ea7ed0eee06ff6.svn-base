package com.kws.unitedfintech.serviceimpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kws.unitedfintech.entities.PurposeCodes;
import com.kws.unitedfintech.repository.PurposeCodeRepository;
import com.kws.unitedfintech.service.PurposeCodeService;

@Service
public class PurposeCodeServiceImpl implements PurposeCodeService{

	@Autowired
	private PurposeCodeRepository repo;
	@Override
	public void insert(PurposeCodes codes) {
		repo.save(codes);
	//	purposeCodeDao.insert(codes);
	}

	@Override
	public List<PurposeCodes> getPurposeCodesList() {
		return (List<PurposeCodes>)repo.findAll();
	}
}