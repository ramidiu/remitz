package com.kws.unitedfintech.service;

import java.util.List;

import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.kws.unitedfintech.entities.SuperAdmin;

public interface SuperadminService {
	
	public SuperAdmin validate(String userName,String password);
}
