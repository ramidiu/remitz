package com.kws.unitedfintech.service;

import java.util.List;

import org.springframework.web.multipart.MultipartRequest;

import com.kws.unitedfintech.entities.AddNewUser;

public interface NewUserService {
	
	
	public void saveNewUser(AddNewUser addNewUser,MultipartRequest multiPartRequest);

	public List<AddNewUser> getAllNewUsersListBasedOnAdminId(String adminId);

	public AddNewUser getUserById(String newUserId);
	
	public List<AddNewUser> getAllNewUsersList();
	
	public void updateNewUser(AddNewUser addNewUser,MultipartRequest multiPartRequest);
	
	public String getUserListbasedonEmail(String emailId);
}
