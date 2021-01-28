package com.kws.unitedfintech.serviceimpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kws.unitedfintech.entities.SenderIdType;
import com.kws.unitedfintech.repository.IDProofRepository;
import com.kws.unitedfintech.service.IDProofService;

@Service
public class IDProofServiceImpl implements IDProofService{

	@Autowired
	private IDProofRepository  iDProofRepository;
	
	@Override
	public List<SenderIdType> getIdProof() {
		return (List<SenderIdType>) iDProofRepository.findAll();
	}

	@Override
	public SenderIdType getbysIdType(String sIdType) {
		// TODO Auto-generated method stub
		return iDProofRepository.findbytype(sIdType);
	}
	
	
	
}
