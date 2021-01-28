package com.kws.unitedfintech.serviceimpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kws.unitedfintech.entities.KeyGeneration;
import com.kws.unitedfintech.helpers.SenditoConvertNullsToEmpty;
import com.kws.unitedfintech.repository.adminKeyRepository;
import com.kws.unitedfintech.service.AdminKeyService;

@Service
public class adminKeyServiceImpl implements AdminKeyService{
	@Autowired
	private adminKeyRepository aKR;
	
	SenditoConvertNullsToEmpty senditoConvertNullsToEmpty=new SenditoConvertNullsToEmpty();

	@Override
	public void saveAdminKey(KeyGeneration keyGeneration) {
		keyGeneration = senditoConvertNullsToEmpty.convertNullFieldToEmpty(keyGeneration, KeyGeneration.class);

		aKR.save(keyGeneration);
	}

	@Override
	public List<KeyGeneration> findAllByAdmin(String adminId) {
		return aKR.findAll(adminId);
	}

}
