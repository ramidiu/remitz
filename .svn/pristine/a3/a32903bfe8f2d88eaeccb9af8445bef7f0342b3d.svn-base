package com.kws.unitedfintech.serviceimpl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kws.unitedfintech.entities.Login;
import com.kws.unitedfintech.repository.ClientServiceRepo;
import com.kws.unitedfintech.service.ClientService;

@Service
public class ClientServiceImpl implements ClientService {
@Autowired
private ClientServiceRepo clientServiceRepo;
	@Override
	public boolean checkClientCredintials(String username, String password) {
		Login s=clientServiceRepo.checkCredintials(username, password);
		
		if(s!=null)
		{
			return true;
		}else {
		return false;
	}}

}
