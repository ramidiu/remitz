package com.kws.unitedfintech.serviceimpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kws.unitedfintech.entities.NationalIdTypes;
import com.kws.unitedfintech.repository.NationalIdRepository;
import com.kws.unitedfintech.service.NationalIdService;
@Service
public class NationalIdServiceImpl implements NationalIdService{

	@Autowired
	private NationalIdRepository ndr;
	
	@Override
	public List<NationalIdTypes> findByIso(String countryIso) {
		// TODO Auto-generated method stub
		return ndr.findbyIso(countryIso);
	}

}
