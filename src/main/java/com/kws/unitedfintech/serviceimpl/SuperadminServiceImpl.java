package com.kws.unitedfintech.serviceimpl;

import java.util.List;

import org.springframework.stereotype.Service;

import com.kws.unitedfintech.entities.SuperAdmin;
import com.kws.unitedfintech.repository.SuperadminRepository;
import com.kws.unitedfintech.service.SuperadminService;

@Service
public class SuperadminServiceImpl implements SuperadminService{

	private final SuperadminRepository repository;
	

	public SuperadminServiceImpl(SuperadminRepository repository) {
		super();
		this.repository = repository;
	}

	@Override
	public SuperAdmin validate(String userName, String password) {
		System.out.println("userName from superadminServiceImpl = = "+userName);
		System.out.println("password from superadminServiceImpl = = "+password);
		return repository.findByuserNameAndpassword(userName, password);
	}

	
	
	
}
