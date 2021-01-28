package com.kws.unitedfintech.service;

import java.util.List;

import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.kws.unitedfintech.entities.Customer;
import com.kws.unitedfintech.entities.User;

public interface CustomerService {

	public String saveCustomerDetails(Customer customer);

	public String registerCustomer(Customer customer, MultipartHttpServletRequest request);

	public void updateSecondId(Customer customer, MultipartHttpServletRequest multipartHttpServletRequest);

	// public String checkEmail(String emailId);
	public Customer updateCustomerDetailsWithIDImage(Customer customer,
			MultipartHttpServletRequest multipartHttpServletRequest);

	public List<Customer> getAllCustomerList(String adminId, String customerStatus);

	public List<Customer> getAllCustomerByBranchId(Customer c, String branchid);

	public List<Customer> getCustomersList(String branchId, String customerStatus);

	public void updateCustomerStatus(String customerId, String customerStatus);

	public Customer findByCustomerId(String customerId);

	public void updateCustomer(Customer customer);

	public Customer updateCustomerDetails(Customer customer);

	public void updateCustomer(String customerId, String occupation, String firstName, String lastName, String emailId,
			String dob, String mobileNumber, String postalCode);

	public Customer updateCustomerProfile(Customer customer, MultipartHttpServletRequest multipartRequest);

	public void updateViewProfile(Customer customer);

	public List<Customer> getAllCustomerByAdminId(String adminid);

	public void updatepassword(String pwd, String customerId);

	public Customer validateCustomer(String userName, String password);

	public Customer findByEmail(String emailId);

	public String getCustomerListBasedOnEmailId(String emailId);

	public Customer customerDetails(Customer customer);
	public List<Customer> getSanctionCustomers(String adminId);
	public void updateSanctionSearchStatus(String customerId);



List<Customer> getListBysanctionSearchFlag(String sanctionSearchFlag,String adminId);


public List<Customer> getAllCustomers();

public List<Customer> getbyexpiredDate(String firstIdExpireDate);

public List<Customer> SearchCustomer(String frstName,String branchId);



public List<Customer> getDuplicateCustomer(String firstName,String lastName,String dob,String emailId,String address1,String mobileNumber);

public String getUserListBasedOnEmailIds(String userName);


}
