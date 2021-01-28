package com.kws.unitedfintech.serviceimpl;

import java.io.File;
import java.io.FileOutputStream;
import java.text.SimpleDateFormat;
import java.util.Iterator;
import java.util.List;
import java.util.TimeZone;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartRequest;

import com.kws.unitedfintech.entities.AddNewUser;
import com.kws.unitedfintech.entities.NoGenerator;
import com.kws.unitedfintech.entities.User;
import com.kws.unitedfintech.helpers.FileURLs;
import com.kws.unitedfintech.helpers.SenditoConvertNullsToEmpty;
import com.kws.unitedfintech.repository.NewUserRepository;
import com.kws.unitedfintech.service.NewUserService;
import com.kws.unitedfintech.service.NoGeneratorService;
import com.kws.unitedfintech.service.UserService;

@Service
public class NewUserServiceImpl  implements NewUserService {
	@Autowired
	private NoGeneratorService noGeneratorService;
	
	
	@Autowired
	private UserService userService;
	
	
	@Autowired
	private NewUserRepository newUserRepository;
	
	
	SenditoConvertNullsToEmpty convertNullsToEmpty= new SenditoConvertNullsToEmpty();

	
	
	

	@Override
	public void saveNewUser(AddNewUser addNewUser,MultipartRequest multiPartRequest) 
	{
		
		NoGenerator noGenerator = noGeneratorService.getNoGenerator("add_new_user");
String newUserId=noGenerator.getIdPrefix()+noGenerator.getTableId();
		System.out.println("newUserId......"+newUserId);
		addNewUser.setNewUserId(newUserId);
		
		
		String fileLocation="";
		if(multiPartRequest != null ){
			int i=0;
			Iterator<String> itr =  multiPartRequest.getFileNames();
			if(itr!=null && !itr.equals("") ){
				while(itr.hasNext()){
					i = i + 1;
				  MultipartFile mpf = multiPartRequest.getFile(itr.next());
				     String orgFileName = mpf.getOriginalFilename();
				     String extension = orgFileName.substring(orgFileName.lastIndexOf(".") + 1);
				     
					    String fileName = newUserId+"_"+i+"."+extension;	
					    
				     System.out.println("fileName::"+fileName);
				     fileLocation = FileURLs.getNewUserProofUrl(newUserId);
				     System.out.println("fileLocation="+fileLocation);
				     File file= new File(fileLocation);
		             boolean b=file.mkdir();
		             System.out.println(":b::::::"+b);
				   if(mpf.getSize() > 0){
						FileOutputStream fos;
						try {
							fos = new FileOutputStream(fileLocation+"/"+fileName);   
							System.out.println("fos::::::::: "+fos);
							fos.write(mpf.getBytes());
							fos.flush();
							fos.close();
						if(i == 1){
							
							addNewUser.setProfileImage(fileName);
							System.out.println("filename1......"+fileName);
						}
						}
				   catch (Exception e) {
							e.printStackTrace();
						}
				   }
				}
				addNewUser = convertNullsToEmpty.convertNullFieldToEmpty(addNewUser, AddNewUser.class);

				newUserRepository.save(addNewUser);
		
			
		noGeneratorService.updateNoGenerator(noGenerator);
		User user=new User();
		user.setPassword(addNewUser.getPassword());
		user.setUserName(addNewUser.getEmailId());
		user.setRoles("ROLE_NEWUSER");
		user.setActive(true);
		user.setUserType(newUserId);
		userService.saveUserDetails(user);
	}
		}
	}





	@Override
	public List<AddNewUser> getAllNewUsersList() {
		// TODO Auto-generated method stub
		return newUserRepository.findAll();
	}





	@Override
	public List<AddNewUser> getAllNewUsersListBasedOnAdminId(String adminId) {
		// TODO Auto-generated method stub
		return newUserRepository.findByAdminId(adminId);
	}





	@Override
	public AddNewUser getUserById(String newUserId) {
		// TODO Auto-generated method stub
		return newUserRepository.findBynewUserId(newUserId);
	}





	@Override
	public void updateNewUser(AddNewUser addNewUser, MultipartRequest multiPartRequest)
	{
		
	String newUserId=addNewUser.getNewUserId();
		//String fileLocation="";
		//if(multiPartRequest != null ){
			//int i=0;
			Iterator<String> itr =  multiPartRequest.getFileNames();
			if(itr!=null && !itr.equals("") ){
				while(itr.hasNext()){
					//i = i + 1;
				  MultipartFile mpf = multiPartRequest.getFile(itr.next());
				     String orgFileName = mpf.getOriginalFilename();
				     String extension = orgFileName.substring(orgFileName.lastIndexOf(".") + 1);
				     
					    String fileName = newUserId+"."+extension;	
					    
				     System.out.println("fileName::"+fileName);
				String    fileLocation = FileURLs.getNewUserProofUrl(newUserId);
				     System.out.println("fileLocation="+fileLocation);
				     File file= new File(fileLocation);
		             boolean b=file.mkdir();
		             System.out.println(":b::::::"+b);
				   if(mpf.getSize() > 0){
						FileOutputStream fos;
						try {
							fos = new FileOutputStream(fileLocation+"/"+fileName);   
							System.out.println("fos::::::::: "+fos);
							fos.write(mpf.getBytes());
							fos.flush();
							fos.close();
							addNewUser.setProfileImage(fileName);
						}
				   catch (Exception e) {
							e.printStackTrace();
						}
				     }
				

			
				addNewUser = convertNullsToEmpty.convertNullFieldToEmpty(addNewUser, AddNewUser.class);

				newUserRepository.save(addNewUser);
			System.out.println("addNewuser....."+addNewUser);
		}
	}
}





	@Override
	public String getUserListbasedonEmail(String emailId) {
		AddNewUser addNewUser=newUserRepository.findByEmail(emailId);
		String result="";
		if(addNewUser !=null){
			result="exist";
		}
		return result;
		}
		
		
	


}