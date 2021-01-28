package com.kws.unitedfintech.serviceimpl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kws.unitedfintech.entities.User;
import com.kws.unitedfintech.repository.UserRepository;
import com.kws.unitedfintech.service.UserService;
@Service
public class UserServiceImpl implements UserService {

	@Autowired
	private UserRepository userRepository;  
	
	@Override
	public void saveUserDetails(User user) {
		
		userRepository.save(user);
	}

	@Override
	public void updateUserPassword(String password, String userType) {
		userRepository.updatePasswordByUserType(userType, password);		
	}

	@Override
	public void updateCustomerPwd(String pwd, String userType) {
		// TODO Auto-generated method stub
		userRepository.updateuserpwd(pwd, userType);
	}

	@Override
	public String getUserListBasedOnEmailId(String userName) {
		// TODO Auto-generated method stub
		User user =userRepository.checkByUserName(userName);
		System.out.println("username==="+user);
		String result="";
		if(user !=null){
			result="exist";
		}
		else {
			result=" ";
		}
		return result;
	}

}
