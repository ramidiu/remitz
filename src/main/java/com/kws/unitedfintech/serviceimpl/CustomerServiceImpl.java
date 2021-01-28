package com.kws.unitedfintech.serviceimpl;

import java.io.File;
import java.io.FileOutputStream;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.Iterator;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.kws.unitedfintech.entities.Customer;
import com.kws.unitedfintech.entities.NoGenerator;
import com.kws.unitedfintech.entities.User;
import com.kws.unitedfintech.helpers.FileURLs;
import com.kws.unitedfintech.helpers.SenditoConvertNullsToEmpty;
import com.kws.unitedfintech.repository.CustomerRepository;
import com.kws.unitedfintech.service.CustomerService;
import com.kws.unitedfintech.service.NoGeneratorService;
import com.kws.unitedfintech.service.UserService;

@Service
public class CustomerServiceImpl implements CustomerService {
	
	
	@Autowired
	private UserService userService;
	

	@Autowired
	private NoGeneratorService noGeneratorService;
	
	@Autowired
	private CustomerRepository customerRepository;
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	
	Calendar cal = Calendar.getInstance();
	
	Date d = cal.getTime();
	
	SenditoConvertNullsToEmpty senditoConvertNullsToEmpty=new SenditoConvertNullsToEmpty();
	@Override
	public String registerCustomer(Customer customer, MultipartHttpServletRequest request) {
		
		String fileLocation="";
		
		NoGenerator noGenerator=noGeneratorService.getNoGenerator("customer");
		
		String customerId=noGenerator.getIdPrefix()+noGenerator.getTableId();
		
		
		
		int res = 0;
		
		customer.setCreatedDate(sdf.format(d));  
		
		customer.setUpdatedDate(sdf.format(d));
		
		//customer.setCustomerKYCStatus("pending");
		
		
		
		//customer.setCustomerKYCMode("manual");
		
		customer.setCustomerNameId(" ");
		
		//customer.setStatus("pending");
		
		
		
	customer.setCustomerId(customerId);
	
	System.out.println("................."+customerId);
	
        int i = 0 ;
        
		if(request != null ){		
			
		Iterator<String> itr =  request.getFileNames();
		
		if(itr!=null && !itr.equals("") ){
			
			while(itr.hasNext()){
				
				i = i + 1;
				
			  MultipartFile mpf = request.getFile(itr.next());
			  
			     String orgFileName = mpf.getOriginalFilename();
			     
			     String extension = orgFileName.substring(orgFileName.lastIndexOf(".") + 1);
			     
			    String fileName = customerId+"_"+i+"."+extension;	
			    
			     System.out.println("fileName::"+fileName);
			     
			     System.out.println("................."+customerId);
			     
			    fileLocation = FileURLs.getCustomerIdProofUrl(customerId);
			    
			     System.out.println("fileLocation="+fileLocation);
			     
			     File file= new File(fileLocation);
			     
	             boolean b=file.mkdir();
	             
	             System.out.println(":b::::::"+b);
	             
			   if(mpf.getSize() > 0){
				   
					FileOutputStream fos;
					
					try {
						
						fos = new FileOutputStream(fileLocation+"/"+fileName); //For local
						
						System.out.println("fos::::::::: "+fos);
						
						fos.write(mpf.getBytes());
						
						fos.flush();
						
						fos.close();
						
					if(i == 1){
						
						customer.setFirstIdProofDoc(fileName);
						System.out.println("filname");
						customer.setFirstIdProofStatus("yes");
						
					}else{
						
						customer.setSecondIdProofDoc(fileName);
						System.out.println("filename");
						customer.setSecondIdProofStatus("yes");
						
					}
					
					} catch (Exception e) {
						
						e.printStackTrace();
					}
			   }
			}
		 }
		
		}	
		customer = senditoConvertNullsToEmpty.convertNullFieldToEmpty(customer, Customer.class);
		customerRepository.save(customer);
		User user=new User();
		user.setPassword(customer.getPassword());
		user.setUserName(customer.getEmailId());
		user.setRoles("ROLE_CUSTOMER");
		user.setActive(true);
		user.setUserType(customerId);
		userService.saveUserDetails(user);
		 noGeneratorService.updateNoGenerator(noGenerator);
		 
		return customerId;
	}


	@Override
	public List<Customer> getCustomersList(String branchId, String customerStatus) {
		
		return customerRepository.findAllByBranchIdAndCustomerStatus( branchId, customerStatus);
	}


	@Override
	public void updateCustomerStatus(String customerId, String customerStatus) {
		customerRepository.UpdateCustomerStatusByCustomerID(customerId, customerStatus);
		
	}




	@Override
	public List<Customer> getAllCustomerList(String adminId,String customerStatus) {
		return customerRepository.findAllByAdminIdAndCustomerStatus(adminId, customerStatus);
	}


	@Override
	public Customer findByCustomerId(String customerId) {
	return customerRepository.findBycustomerId(customerId);
	}


	@Override
	public void updateCustomer(Customer customer) {
		customer.setUpdatedDate(sdf.format(d));
	customerRepository.save(customer);
	}


	@Override
	public Customer updateCustomerProfile(Customer customer,MultipartHttpServletRequest multipartRequest) {
		
	Customer c=new Customer();	
		
		customer.setUpdatedDate(sdf.format(d));
		
		String fileLocation="";
		String customerId=customer.getCustomerId();
		if(multipartRequest != null ){
			int i=0;
			Iterator<String> itr =  multipartRequest.getFileNames();
			if(itr!=null && !itr.equals("") ){
				while(itr.hasNext()){
					i = i + 1;
				  MultipartFile mpf = multipartRequest.getFile(itr.next());
				     String orgFileName = mpf.getOriginalFilename();
				     String extension = orgFileName.substring(orgFileName.lastIndexOf(".") + 1);
				     
					    String fileName = customerId+"_"+i+"."+extension;	
					    
				     System.out.println("fileName::"+fileName);
				     fileLocation = FileURLs.getCustomerIdProofUrl(customerId);
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
							
							customer.setFirstIdProofDoc(fileName);
							customer.setFirstIdProofStatus("yes");
							
							System.out.println("filename1......"+fileName);
						}else {
							customer.setSecondIdProofDoc(fileName);
							customer.setSecondIdProofStatus("yes");
							System.out.println("fileNmae2......."+fileName);
						}
						} catch (Exception e) {
							e.printStackTrace();
						}
				   }
				   
				   
	customer = senditoConvertNullsToEmpty.convertNullFieldToEmpty(customer, Customer.class);
	   
				   c= customerRepository.save(customer);
					
				}
			 }
			
			}
		return c;
		
	}


	@Override
	public void updateViewProfile(Customer customer) {
		
		customer.setUpdatedDate(sdf.format(d));
		
		
		customer = senditoConvertNullsToEmpty.convertNullFieldToEmpty(customer, Customer.class);

	
		   customerRepository.save(customer);

	}


	@Override
	public Customer updateCustomerDetails(Customer customer) {
		customer.setCreatedDate(sdf.format(d));  
		
		customer.setUpdatedDate(sdf.format(d));
		
		customer = senditoConvertNullsToEmpty.convertNullFieldToEmpty(customer, Customer.class);

		Customer c= customerRepository.save(customer);
		return c;
	}



	@Override
	public void updateCustomer(String customerId,String occupation, String firstName, String lastName, String emailId, String dob,
			String mobileNumber, String postalCode) {
		// TODO Auto-generated method stub
		customerRepository.updateCustomer(customerId,occupation, firstName, lastName, emailId, dob, mobileNumber, postalCode);
	}


	@Override
	public Customer updateCustomerDetailsWithIDImage(Customer customer,
			MultipartHttpServletRequest request) {
		String customerId = customer.getCustomerId();
		
		customer.setUpdatedDate(sdf.format(d));
	
		String fileLocation = "";
		System.out.println("request is = " + request);
        int i = 0 ;
        
		if(request != null ){		
			
		Iterator<String> itr =  request.getFileNames();
		
		if(itr!=null && !itr.equals("") ){
			
			while(itr.hasNext()){
				
				i = i + 1;
				
			  MultipartFile mpf = request.getFile(itr.next());
			  
			     String orgFileName = mpf.getOriginalFilename();
			     
			     String extension = orgFileName.substring(orgFileName.lastIndexOf(".") + 1);
			     
			    String fileName = customerId+"_"+i+"."+extension;	
			    
			     System.out.println("fileName::"+fileName);
			     
			     System.out.println("................."+customerId);
			     
			    fileLocation = FileURLs.getCustomerIdProofUrl(customerId);
			    
			     System.out.println("fileLocation="+fileLocation);
			     
			     File file= new File(fileLocation);
			     
	             boolean b=file.mkdir();
	             
	             System.out.println(":b::::::"+b);
	             
			   if(mpf.getSize() > 0){
				   
					FileOutputStream fos;
					
					try {
						
						fos = new FileOutputStream(fileLocation+"/"+fileName); //For local
						
						System.out.println("fos::::::::: "+fos);
						
						fos.write(mpf.getBytes());
						
						fos.flush();
						
						fos.close();
						
					if(i == 1){
						
						customer.setFirstIdProofDoc(fileName);
						System.out.println("filname");
						customer.setFirstIdProofStatus("yes");
						
					}else{
						
						customer.setSecondIdProofDoc(fileName);
						System.out.println("filename");
						customer.setSecondIdProofStatus("yes");
						
					}
					
					} catch (Exception e) {
						
						e.printStackTrace();
					}
			   }
			}
		 }
		
		}customer.setStatus("pending");
		customer = senditoConvertNullsToEmpty.convertNullFieldToEmpty(customer, Customer.class);

		return customerRepository.save(customer);
		}
		

		


	@Override
	public void updateSecondId(Customer customer, MultipartHttpServletRequest request) {
		// TODO Auto-generated method stub
		String customerId = customer.getCustomerId();
		String fileLocation = "";
		int i = 2;
		/*
		 * if (customer.getIdIndexNo() != null && customer.getIdIndexNo().equals("2")) {
		 * i = 1; }
		 */
		System.out.println("request is = " + request);
		if (request != null) {

			Iterator<String> itr = request.getFileNames();
			if (itr != null && !itr.equals("")) {
				while (itr.hasNext()) {
					MultipartFile mpf = request.getFile(itr.next());
					String orgFileName = mpf.getOriginalFilename();
					System.out.println("orgFileName = ="+orgFileName);
					String extension = orgFileName.substring(orgFileName.lastIndexOf(".") + 1);
					String fileName = customerId + "_" + i + "." + extension;
					System.out.println("fileName = ="+fileName);
					fileLocation = FileURLs.getCustomerIdProofUrl(customerId);
					File file = new File(fileLocation);
					boolean b = file.mkdir();
					if (mpf.getSize() > 0) {
						System.out.println("i####################  "+i);
						FileOutputStream fos;
						try {
							fos = new FileOutputStream(fileLocation + "/" + fileName); // For local
							fos.write(mpf.getBytes());
							fos.flush();
							fos.close();
							/*if (customer.getIdIndexNo() != null && customer.getIdIndexNo().equals("2")) {*/
							//if(i>0) {
							
								customer.setSecondIdProofDoc(fileName);
								customer.setSecondIdProofStatus("yes");
								
/*							} else {
								customer.setFirstIdProofDoc(fileName);

							}
*/						} catch (Exception e) {
							e.printStackTrace();
						}
						i=i+1;
					}
				}
				
			}
		}
		customer.setStatus("pending");
		customer = senditoConvertNullsToEmpty.convertNullFieldToEmpty(customer, Customer.class);

		customerRepository.save(customer);
	
	}

	@Override
	public List<Customer> getAllCustomerByAdminId(String adminid) {
		return  customerRepository.getAllCustomerById(adminid);
		
	}


	@Override
	public void updatepassword(String pwd, String customerId) {
		// TODO Auto-generated method stub
	customerRepository.updatepwd(pwd, customerId);	
	}


	@Override
	public Customer validateCustomer(String userName, String password) {
		// TODO Auto-generated method stub
		return customerRepository.validateCustomer(userName, password);
	}


	@Override
	public Customer findByEmail(String emailId) {
		// TODO Auto-generated method stub
		return customerRepository.findByEmail(emailId);
	}


	@Override
	public String getCustomerListBasedOnEmailId(String emailId) {
		Customer customer=customerRepository.findByEmail(emailId);
		String result="";
		if(customer !=null){
			result="exist";
		}
		return result;
	}
	@Override
	public List<Customer> getAllCustomerByBranchId(Customer c ,String branchid) {
		
		return customerRepository.getAllCustomerBasedOnBranchId(branchid,c.getMobileNumber(), c.getFirstName(), c.getLastName(), c.getDob(), c.getEmailId(), c.getFirstIdNumber(), c.getAddress1(), c.getPostalCode(),c.getCityOrState());
	}


	@Override
	public String saveCustomerDetails(Customer customer) {
		
		NoGenerator noGenerator=noGeneratorService.getNoGenerator("customer");
		
		String customerId=noGenerator.getIdPrefix()+noGenerator.getTableId();
		
		
		
		
		customer.setCreatedDate(sdf.format(d));  
		
		customer.setUpdatedDate(sdf.format(d));
		
		customer.setCustomerKYCStatus("pending");
		
		
		
		customer.setCustomerKYCMode("manual");
		
		customer.setCustomerNameId("1");
		
		customer.setStatus("pending");
		
		
		
	customer.setCustomerId(customerId);
	
	    customer = senditoConvertNullsToEmpty.convertNullFieldToEmpty(customer, Customer.class);
		customerRepository.save(customer);
		User user=new User();
		user.setPassword(customer.getPassword());
		user.setUserName(customer.getEmailId());
		user.setRoles("ROLE_CUSTOMER");
		user.setActive(true);
		user.setUserType(customerId);
		userService.saveUserDetails(user);
		 noGeneratorService.updateNoGenerator(noGenerator);
		 
		return customerId;

	}

	@Override
	public Customer customerDetails(Customer customer) {
	    customer = senditoConvertNullsToEmpty.convertNullFieldToEmpty(customer, Customer.class);
      	customerRepository.save(customer);
      	return customer;
	}


	@Override
	public List<Customer> getSanctionCustomers(String adminId) {
		return customerRepository.getSanctionCustomers(adminId,"yes");
	}


	@Override
	public void updateSanctionSearchStatus(String customerId) {
		
		customerRepository.updateSanctionSearchStatus(customerId,"no");
	}


	@Override
	public List<Customer> getListBysanctionSearchFlag(String sanctionSearchFlag,String adminId) {
		// TODO Auto-generated method stub
		return customerRepository.getBysanctionSearchFlag(sanctionSearchFlag,adminId);
	}


	@Override
	public List<Customer> getAllCustomers() {
		// TODO Auto-generated method stub
		return customerRepository.findAll();
	}


	@Override
	public List<Customer> getbyexpiredDate(String firstIdExpireDate) {
		// TODO Auto-generated method stub
		return customerRepository.getByexpiredate(firstIdExpireDate);
	}


	@Override
	public List<Customer> SearchCustomer(String frstName, String branchId) {
		// TODO Auto-generated method stub
		return customerRepository.SearchCustomer(frstName, branchId);
	}


	@Override
	public List<Customer> getDuplicateCustomer(String firstName, String lastName, String dob, String emailId,
			String address1, String mobileNumber) {
		// TODO Auto-generated method stub
		return customerRepository.getDuplicateCustomer(firstName, lastName, emailId, dob, address1, mobileNumber);
	}


	@Override
	public String getUserListBasedOnEmailIds(String userName) {
		// TODO Auto-generated method stub
		Customer customer =customerRepository.checkByUserNames(userName);
		System.out.println("username==="+customer);
		String result="";
		if(customer !=null){
			result="exist";
		}
		else {
			result=" ";
		}
		return result;
	}

   	
	
	}


	/*
	 * @Override public String checkEmail(String emailId) { String result = "";
	 * Customer customer = customerDAO.validateEmailId(emailId); if (customer !=
	 * null) { if (customer.getEmailId().equals(emailId)) { result = "exist"; } else
	 * { result = "notexist"; } } return result; }
	 */

	
	
	

