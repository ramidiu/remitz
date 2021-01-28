package com.kws.unitedfintech.serviceimpl;

import java.io.File;
import java.io.FileOutputStream;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.Iterator;
import java.util.List;
import java.util.TimeZone;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.kws.unitedfintech.entities.Admin;
import com.kws.unitedfintech.entities.NoGenerator;
import com.kws.unitedfintech.entities.ServiceFees;
import com.kws.unitedfintech.entities.TransactionInformation;
import com.kws.unitedfintech.entities.User;
import com.kws.unitedfintech.helpers.FileURLs;
import com.kws.unitedfintech.helpers.PasswordEncryptor;
import com.kws.unitedfintech.helpers.SenditoConvertNullsToEmpty;
import com.kws.unitedfintech.helpers.SenditoDateUtil;
import com.kws.unitedfintech.repository.AdminRepository;
import com.kws.unitedfintech.repository.AdminSellRateRepository;
import com.kws.unitedfintech.repository.DemoSpringootAdminRepository;
import com.kws.unitedfintech.service.AdminService;
import com.kws.unitedfintech.service.NoGeneratorService;
import com.kws.unitedfintech.service.SessionDataService;
import com.kws.unitedfintech.service.TransactionInformationService;
import com.kws.unitedfintech.service.UserService;


@Service
public class AdminServiceImpl implements AdminService {

	@Autowired
private AdminSellRateRepository adminsellraterepo;
	@Autowired
	private NoGeneratorService noGeneratorService;
	@Autowired
	private UserService userService;
	@Autowired
	private AdminRepository adminRepository;
	@Autowired
	private TransactionInformationService transactionService;
	@Autowired
	private SessionDataService sessionDataService;
	@Autowired
	private DemoSpringootAdminRepository demoSpringootAdminRepository;
SenditoConvertNullsToEmpty senditoConvertNullsToEmpty=new SenditoConvertNullsToEmpty();
	public Admin validateAdmin(String username, String password) {
		Admin admin = adminRepository.getAdminByemailId(username);
		if (admin != null) {
			String pwd = admin.getPassword();
			if (password.trim().equals(pwd))

				return admin;
			else
				return null;
		} else {
			return null;
		}
	}

	@Override
	public String insertAdmin(Admin admin,MultipartHttpServletRequest request) {
		NoGenerator noGenerator = noGeneratorService.getNoGenerator("admin");
		String adminId=noGenerator.getIdPrefix() + noGenerator.getTableId();
		System.out.println("adminId = = "+adminId);
		admin.setAdminId(adminId);
		SenditoConvertNullsToEmpty convertNullsToEmpty= new SenditoConvertNullsToEmpty();
		SimpleDateFormat yyyyMMdd = new SimpleDateFormat("yyyy-MM-dd");
		TimeZone timeZone = TimeZone.getTimeZone("IST");
		String createdDate = SenditoDateUtil.timeNow(yyyyMMdd, timeZone);
		admin.setCreatedDate(createdDate);
		admin.setUpdatedDate(createdDate);
		admin.setAdminType("sendito");
		 Date date = new Date();
		    Calendar cal = Calendar.getInstance();
		    cal.setTime(date);
		    cal.add(Calendar.DATE, 7);

		            java.util.Date expirationDate = cal.getTime();
String expiredate=yyyyMMdd.format(expirationDate);
		    System.err.println(expirationDate);
		    
		    admin.setPackageExpireDate(expiredate);
		
		 int i = 0 ; String fileLocation="";
		 System.out.println("fileLocation==="+request);
		  System.out.println("FileURLs.getAdminLogo(adminId)==="+FileURLs.getAdminLogo(adminId));
	 
		 String url="";
		  if(request != null ){
		  
		  Iterator<String> itr = request.getFileNames(); 
		  if(itr!=null &&
		  !itr.equals("") ){ 
			  while(itr.hasNext()){ 
				  i = i + 1;
				  MultipartFile mpf= request.getFile(itr.next());
System.out.println("mpf===="+mpf);
				  String orgFileName = mpf.getOriginalFilename();
				  System.out.println("orgFileName====="+orgFileName);
		  String extension = orgFileName.substring(orgFileName.lastIndexOf(".") + 1);
		  String fileName = adminId+"_"+i+"."+extension;
		  System.out.println("fileName==="+fileName);
		  System.out.println("fileName::"+fileName); fileLocation =
		  FileURLs.getAdminLogo(adminId);
		  System.out.println("FileURLs.getAdminLogo(adminId)==="+FileURLs.getAdminLogo(adminId));
		  System.out.println("fileLocation="+fileLocation); File file= new
		  File(fileLocation); 
		  boolean b=file.mkdir(); 
		  System.out.println(":b::::::"+b);
		  if(mpf.getSize() > 0){
			  FileOutputStream fos; try { 
				  fos = new
		  FileOutputStream(fileLocation+"/"+fileName); //For local
		  System.out.println("fos::::::::: "+fos); fos.write(mpf.getBytes());
		  fos.flush(); fos.close(); admin.setLogo(fileName);
		 
		
		  } catch (Exception e) { e.printStackTrace(); } } } }
		 
			
		String encryptedAdminId=PasswordEncryptor.encrypt(PasswordEncryptor.key1, PasswordEncryptor.key2, adminId);
		admin.setAdminKey(encryptedAdminId);
		//admin.setUrl("http://localhost:2019/Worldremit/index1?adminKey="+encryptedAdminId);
		url="http://demo.remitz.co.uk/index?adminKey="+encryptedAdminId;
		admin.setUrl(url);
		admin = convertNullsToEmpty.convertNullFieldToEmpty(admin,Admin.class);
		System.out.println("admin = = = = = = "+admin);
		adminRepository.save(admin);
		noGeneratorService.updateNoGenerator(noGenerator);
		User user=new User();
		user.setPassword(admin.getPassword());
		user.setUserName(admin.getEmailId());
		user.setRoles("ROLE_ADMIN");
		user.setActive(true);
		user.setUserType(adminId);
		userService.saveUserDetails(user);
	}
		return url;
	}

	@Override
	public Admin getAdminDetailsBasedOnAdminId(String adminId) {
		return adminRepository.getAdminByadminId(adminId);
	}

	@Override
	public List<Admin> getAllAdmin() {
		return adminRepository.getAllAdmins();
	}

	@Override
	public String validateAdminBasedOnEmailId(String emailId) {
		String result = "";
		Admin admin = adminRepository.getAdminByemailId(emailId);
		if (admin == null) {
			result = "not exist";
		} else {
			result = "exist";
		}
		return result;
	}

	@Override
	public void updateAdmin(Admin admin, MultipartHttpServletRequest request) {
		String result = "Profile Not Updated ,Some problem occered please check once";
		// Admin admin1 = getAdminDetailsBasedOnAdminId(admin.getAdminId());
		Iterator<String> itr = request.getFileNames();
		// boolean res = true;
		/* String status = admin.getStatus(); */
		// SuperAdmin superAdmin =
		// superAdminService.getSuperAdminDetails(admin1.getSuperAdminId());
		String fileName = admin.getAdminId() + ".jpg";
		String fileLocation = FileURLs.getAdminLogo(admin.getAdminId());
		/*
		 * String[] toCountries = admin.getToCountryISOs().split(","); int
		 * toCountryCount = admin.getToCountryLimitPerAdmin()-toCountries.length;
		 */

		/* admin.setToCountryCount(toCountryCount); */
		/* if(status!=null && !status.equals("") && status.equals("pending")){ */
		File dir = new File(fileLocation);
		// attempt to create the directory here
		@SuppressWarnings("unused")
		boolean successful = dir.mkdir();
		/* } */

		if (itr != null && !itr.equals("") && itr.hasNext()) {
			MultipartFile mpf = request.getFile(itr.next());

			if (mpf.getSize() > 0) {
				FileOutputStream fos;
				try {
					fos = new FileOutputStream(fileLocation + "/" + fileName); // For local
					fos.write(mpf.getBytes());
					fos.flush();
					fos.close();
					admin.setLogo(fileName);
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		} /*
			 * else{ if(status!=null && !status.equals("") && status.equals("pending")){
			 * admin.setLogo(""); }else{ if(admin.getLogo()!=null &&
			 * admin.getLogo().equals("remove")){ admin.setLogo(""); } }
			 */

		SimpleDateFormat yyyyMMdd = new SimpleDateFormat("yyyy-MM-dd");
		TimeZone timeZone = TimeZone.getTimeZone("IST");
		System.out.println("timeXOne+"+timeZone);
		String updatedDate = SenditoDateUtil.timeNow(yyyyMMdd, timeZone);
		admin.setUpdatedDate(updatedDate);

		adminRepository.save(admin);

	}

	@Override
	public List<ServiceFees> getAllLimits() {

		return null;
	}

	@Override
	public Admin checkIdPrefix(String tnxIDPrefix) {
		Admin transactionid = adminRepository.getTransactionIdPrefix(tnxIDPrefix);

		return transactionid;
	}

	@Override
	public Admin findByAdminKey(String adminKey) {
		return adminRepository.findByAdminKey(adminKey);
	}

	@Override
	public List<TransactionInformation> getTransactionDetailsByAdmin(String admin, String fromdate, String todate) {

		if (fromdate.equals("") && todate.equals("")) {

			SimpleDateFormat yyyyMMdd = new SimpleDateFormat("yyyy-MM-dd");
			TimeZone timeZone = TimeZone.getTimeZone("IST");
			String createdDate = SenditoDateUtil.timeNow(yyyyMMdd, timeZone);
			fromdate = createdDate;
			todate = createdDate;

		}
		System.out.println("fromdate from service:" + fromdate + ",todate=" + todate);
		List<TransactionInformation> list = transactionService.getAllTransactionDetailsBasedOnAdminId(admin, fromdate,
				todate);

		return list;
	}

	@Override
	public boolean updateTransactionPaymentStatus(String txnid, String paymentstatus,String ckycstatus) {
		TransactionInformation txninfo = transactionService.getTransactionDetails(txnid);
		txninfo.setPaymentStatus(paymentstatus);
		if(paymentstatus.equals("paid") && ckycstatus.equals("completed"))
		{
			txninfo.setStatus("processing");
		}
		transactionService.updateTransactionPaymentStatus(txninfo);
		return true;

	}

	@Override
	public boolean updateTransactionStatus(String tstatus, String txnid) {
		transactionService.updateTransactionStatus(tstatus, txnid);
		return true;
	}

	@Override
	public Admin saveRemitAdmin(Admin admin) {
	
		NoGenerator noGenerator = noGeneratorService.getNoGenerator("admin");
		String adminId=noGenerator.getIdPrefix() + noGenerator.getTableId();
		System.out.println("adminId = = "+adminId);
		admin.setAdminId(adminId);
		SenditoConvertNullsToEmpty convertNullsToEmpty= new SenditoConvertNullsToEmpty();
		SimpleDateFormat yyyyMMdd = new SimpleDateFormat("yyyy-MM-dd");
		TimeZone timeZone = TimeZone.getTimeZone("IST");
		String createdDate = SenditoDateUtil.timeNow(yyyyMMdd, timeZone);
		 Date date = new Date();
		    Calendar cal = Calendar.getInstance();
		    cal.setTime(date);
		    cal.add(Calendar.DATE, 7);

		           java.util.Date expirationDate = cal.getTime();
         String expiredate=yyyyMMdd.format(expirationDate);
		    
		    admin.setPackageExpireDate(expiredate);
		admin.setCreatedDate(createdDate);
		admin.setUpdatedDate(createdDate);
		admin.setStatus("active");
		admin.setModeOfPayments("MPMT1002-Cash,MPMT1006-Internet Bank Transfer");
		 admin.setPaymentTypes("cash,bank");
		 admin.setCurrencyMarkup("Yes");
		 admin.setProfitMode("Flat fee");
		 admin.setTopUpTransaction("No");
		 admin.setWishRate("No");
	     admin.setSmsTemplate("No");
	     admin.setPromoCode("No");
	     admin.setApiCredential("No");
	     admin.setAdminType("remitz");
	     admin.setPackages("trail");
		 String url="";
		
		 
		String encryptedAdminId=PasswordEncryptor.encrypt(PasswordEncryptor.key1, PasswordEncryptor.key2, adminId);
		admin.setAdminKey(encryptedAdminId);
		admin.setUrl("http://localhost:2019/Worldremit/index1?adminKey="+encryptedAdminId);
		//url="http://demo.remitz.co.uk//index?adminKey="+encryptedAdminId;
		admin.setUrl(url);
		admin = convertNullsToEmpty.convertNullFieldToEmpty(admin,Admin.class);
		System.out.println("admin = = = = = = "+admin);
		adminRepository.save(admin);
		noGeneratorService.updateNoGenerator(noGenerator);
		User user=new User();
		user.setPassword(admin.getPassword());
		user.setUserName(admin.getEmailId());
		user.setRoles("ROLE_ADMIN");
		user.setActive(true);
		user.setUserType(adminId);
		userService.saveUserDetails(user);
		return admin;
	}

	@Override
	public void updateRemitAdmin(Admin admin, MultipartHttpServletRequest request) {
      String fileLocation="";
      String adminId=admin.getAdminId();
      System.out.println("adminId::::::"+adminId);
      admin.setAdminId(adminId);
      int  i=0;
		if(request != null ){
			  
			  Iterator<String> itr = request.getFileNames(); if(itr!=null &&
			  !itr.equals("") ){ while(itr.hasNext()){ i = i + 1; MultipartFile mpf =
			  request.getFile(itr.next()); String orgFileName = mpf.getOriginalFilename();
			  String extension = orgFileName.substring(orgFileName.lastIndexOf(".") + 1);
			  String fileName = adminId+"_"+i+"."+extension;
			  System.out.println("fileName::"+fileName); fileLocation =
			  FileURLs.getAdminLogo(adminId);
			  System.out.println("fileLocation="+fileLocation); File file= new
			  File(fileLocation); boolean b=file.mkdir(); System.out.println(":b::::::"+b);
			  if(mpf.getSize() > 0){ FileOutputStream fos; try { fos = new
			  FileOutputStream(fileLocation+"/"+fileName); //For local
			  System.out.println("fos::::::::: "+fos); fos.write(mpf.getBytes());
			  fos.flush(); fos.close(); admin.setLogo(fileName);
			 
			
			  } catch (Exception e) { e.printStackTrace(); } } } }}
		
		adminRepository.updateRemitAdminDetails(admin.getAddress(),admin.getCompanyName(),admin.getBaseCurrency(),admin.getBusinessCountries(),admin.getPaymentTypes(),admin.getAdminId());	 
		
	}

	@Override
	public void updateAdminNewKey(String adminId) {
		Date date= new Date(); 
	    long l = date.getTime();
	    String key=String.valueOf(l);
		String encryptedAdminId=PasswordEncryptor.encrypt(PasswordEncryptor.key1, PasswordEncryptor.key2, key);
		String url="http://demo.remitz.co.uk/index?adminKey="+encryptedAdminId;
		 adminRepository.updateAdminNewKey(adminId,encryptedAdminId,url);
	}

	@Override
	public double getAdminSellRateBasedOnFromToadminid(String adminid, String fromiso, String toiso) {
		System.out.println("admin service impl=adminid:"+adminid+"fromiso:"+fromiso+"toiso:"+toiso);
		return adminsellraterepo.getAdminSellRateBasedOnFromAndToIso(adminid, fromiso, toiso);
		
	}

	@Override
	public Admin gettrialDate(String trialdate, String adminId) {
		// TODO Auto-generated method stub
		return adminRepository.getbyidandtrialdate(adminId, trialdate);
	}

		
	
	
	
}