package com.kws.unitedfintech.service;

import java.util.List;

import com.kws.unitedfintech.entities.KeyGeneration;

public interface AdminKeyService {
	
	public void saveAdminKey(KeyGeneration keyGeneration);
	public List<KeyGeneration> findAllByAdmin(String adminId);

}
