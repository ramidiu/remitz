package com.kws.unitedfintech.serviceimpl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kws.unitedfintech.entities.Nasano;
import com.kws.unitedfintech.repository.NsanoRepository;
import com.kws.unitedfintech.service.NsanoService;

@Service
public class NsanoServiceImpl implements NsanoService{

	@Autowired
	private NsanoRepository nr;
	
	@Override
	public Nasano save(Nasano n) {
		return nr.save(n);
	}

}
