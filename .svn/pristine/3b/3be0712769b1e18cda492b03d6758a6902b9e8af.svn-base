
package com.kws.unitedfintech.security;

import java.io.IOException;
import java.net.InetAddress;
import java.util.Collection;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.web.DefaultRedirectStrategy;
import org.springframework.security.web.RedirectStrategy;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.stereotype.Component;

import com.kws.unitedfintech.entities.AccessLog;
import com.kws.unitedfintech.entities.Admin;
import com.kws.unitedfintech.entities.Branch;
import com.kws.unitedfintech.entities.Customer;
import com.kws.unitedfintech.entities.KeyGeneration;
import com.kws.unitedfintech.entities.ReasonForTransfer;
import com.kws.unitedfintech.entities.User;
import com.kws.unitedfintech.helpers.EmailTemplateHeaderFooterUtil;
import com.kws.unitedfintech.helpers.SendMail;
import com.kws.unitedfintech.repository.UserRepository;
import com.kws.unitedfintech.service.AccessLogService;
import com.kws.unitedfintech.service.AdminKeyService;
import com.kws.unitedfintech.service.AdminService;
import com.kws.unitedfintech.service.BranchService;
import com.kws.unitedfintech.service.CustomerService;
import com.kws.unitedfintech.service.ReasonForTransferService;
import com.kws.unitedfintech.service.SessionDataService;

@Component
public class SimpleAuthenticationSuccessHandler implements AuthenticationSuccessHandler {

	private RedirectStrategy redirectStrategy = new DefaultRedirectStrategy();
	@Autowired
	private UserRepository userRepository;
    @Autowired
	private SessionDataService  sessionDataService;
    @Autowired
    private AdminKeyService adminKeyService;
    @Autowired
    private BranchService branchService;
    @Autowired
	private AccessLogService accessLogService;
    @Autowired
    private CustomerService cs;
    
    @Autowired
    private ReasonForTransferService reasonForTransferService;
    
    @Autowired
    private AdminService adminService;
	String hederContent = EmailTemplateHeaderFooterUtil.getStaticEmailHeaderContent();
	String bodyStartsContent = EmailTemplateHeaderFooterUtil.getStaticEmailBodyStartContent();
	String bodyEndContent = EmailTemplateHeaderFooterUtil.getStaticEmailBodyEndsContent();
	String footerContent = EmailTemplateHeaderFooterUtil.getStaticEmailFooterContent();

	
	@Override
	public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
			Authentication authentication) throws IOException, ServletException {
		
		UserDetails user = (UserDetails) authentication.getPrincipal();

		//System.out.println("user::::::" + user);
		String branchId=null;
		
		if (user != null) {
			request.getRemoteAddr();
			User userDetails = userRepository.findByUserNameAndPassword(user.getUsername(), user.getPassword());
			
			HttpSession session = request.getSession();
		session.setAttribute("adminId", userDetails.getUserType());
			
			session.setAttribute("role", userDetails.getRoles());
			//System.out.println("emailID====="+userDetails.getUserName());
				session.setAttribute("userid", userDetails.getUserType());	  


			//System.out.println("brrrrrrrrrrrrrrrrrrrrrr"+userDetails.getUserType());
			
			sessionDataService.storeBranchId(session,userDetails.getUserType());// here we are storing branch id in session
			
			sessionDataService.storeAdminId(session,userDetails.getUserType());
			
			
			
			if(userDetails.getRoles().equals("ROLE_ADMIN")) {
				Admin admin=adminService.getAdminDetailsBasedOnAdminId(userDetails.getUserType());
				//String message = "UserId:" + userDetails.getUserType() + "<br>Email: " + userDetails.getUserName() + "<br>Role:" + userDetails.getRoles()+"<br>companyName:"+admin.getCompanyName();
				String adminId=userDetails.getUserType();
				List<Customer> c=cs.getListBysanctionSearchFlag("yes", adminId);
				if(c.size()>0) {
	            	session.setAttribute("adm",adminId);	
			
				}
				String[] payments=admin.getPaymentTypes().split(",");
				//System.out.println("payments==="+payments);
				Map<String,String> ptMap=new HashMap<String, String>();
	            for(String pt:payments) {
	            	ptMap.put(pt,pt);
	            	//System.out.println("paymentType==="+pt);
	            }
	            if(ptMap.containsKey("eWallet")) {
	            	session.setAttribute("paymentType",ptMap.values());	
	            	//System.out.println("values====="+ptMap.values());
	            }
	         String[] mop=admin.getModeOfPayments().split(",");
				Map<String,String> mopMap=new HashMap<String, String>();
	         
	         for(String mp:mop) {
	        	 String[] mops=mp.split("-");
	        	 for(String mp1:mops) {
	        		 mopMap.putIfAbsent(mp1, mp1);	 
	        	 }
	         }
	         System.out.println("mopMap======"+mopMap.values());
	         if(mopMap.containsKey("Online")) {
	        	// System.out.println("mop is online");
	         	session.setAttribute("modeOfPayment",mopMap.values());	
	       	 
	         }
	         
	         if(mopMap.containsKey("Internet Bank Transfer")) {
	        	 //System.out.println("mop is Internet Bank Transfer");
	          	session.setAttribute("ibt",mopMap.values());	
	        	 
	          }
	         
			 String message = "UserId:" + userDetails.getUserType() + "<br>Email: " +
			  userDetails.getUserName() + "<br>Role:" +
			 userDetails.getRoles()+"<br>companyName:"+admin.getCompanyName(); String
			  subject=userDetails.getUserType() + "," + userDetails.getUserName() + "," +
			  userDetails.getRoles()+","+admin.getCompanyName();
			 try {
			  SendMail.send("info@remitz.co.uk", "ramidiu@kreativwebsolutions.com",
			  subject, hederContent + bodyStartsContent + message + bodyEndContent +
			  footerContent);
			  }catch (Exception e) {
				  e.printStackTrace();
			  }
				List<KeyGeneration> list =adminKeyService.findAllByAdmin(userDetails.getUserType());
				KeyGeneration adminKey = new KeyGeneration();
				if (list.size() > 0) {
					adminKey = list.get(0);
				}else {
					KeyGeneration ak = new KeyGeneration();
					ak.setAdmin(admin);
					ak.setFromEmail(admin.getEmailId());
					ak.setMailKey("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");
					adminKeyService.saveAdminKey(ak);

				}
			}
			
			if(userDetails.getRoles().equals("ROLE_BRANCH")) {
				System.out.println("user detials:"+userDetails.getUserType());
				Branch branch=branchService.getBranchBasedOnBranchId(userDetails.getUserType());
				
				System.out.println("branch:"+branch);
				System.out.println("branch detals:"+branch.getFunctionality());
				session.setAttribute("branchFunctionality", branch.getFunctionality());
				session.setAttribute("branch", branch);
				session.setAttribute("switchAgent", null);
				session.setAttribute("branchid", userDetails.getUserType());
/*				String message = "UserId:" + userDetails.getUserType() + "<br>Email: " + userDetails.getUserName() + "<br>Role:" + userDetails.getRoles()+"<br>Password:"+userDetails.getPassword();
				
				try {
					SendMail.send("info@remitz.co.uk", "ramidiu@kreativwebsolutions.com", "Remitz Login Mail",
						 hederContent + bodyStartsContent + message + bodyEndContent +
					 footerContent); 
					}catch (Exception e) {
				e.printStackTrace();
					}

*/				//session.setAttribute("adminId", branch.getAdmin().getAdminId());
			}if(userDetails.getRoles().equals("ROLE_AGENT")) {
				session.setAttribute("agentid", userDetails.getUserType());
				String message1 = "UserId:" + userDetails.getUserType() + "<br>Email: " + userDetails.getUserName() + "<br>Role:" + userDetails.getRoles()+"<br>Password:"+userDetails.getPassword();
				
				try {
					SendMail.send("info@remitz.co.uk", "ramidiu@kreativwebsolutions.com", "Remitz Login Mail",
						 hederContent + bodyStartsContent + message1 + bodyEndContent +
					 footerContent); 
					}catch (Exception e) {
				e.printStackTrace();
					}

			}
			if(userDetails.getRoles().equals("ROLE_CUSTOMER")) {
				sessionDataService.storeCustomerIdInSession(request.getSession(), userDetails.getUserType());
				String message1 = "UserId:" + userDetails.getUserType() + "<br>Email: " + userDetails.getUserName() + "<br>Role:" + userDetails.getRoles()+"<br>Password:"+userDetails.getPassword();
				
				try {
					SendMail.send("info@remitz.co.uk", "ramidiu@kreativwebsolutions.com", "Remitz Login Mail",
						 hederContent + bodyStartsContent + message1 + bodyEndContent +
					 footerContent); 
					}catch (Exception e) {
				e.printStackTrace();
					}

			}
			if(userDetails.getRoles().equals("ROLE_SUPERADMIN")) {
				
				session.setAttribute("superadminid", userDetails.getUserType()); 
			}
			
		}

		Collection<? extends GrantedAuthority> authorities = authentication.getAuthorities();
		authorities.forEach(authority -> {
			if (authority.getAuthority().equals("ROLE_CUSTOMER")) {
				try {
					System.out.println("request==="+request);
					System.out.println("this conditin is executing customer logged in:::::");
					redirectStrategy.sendRedirect(request, response, "/my_account_calculator?ds=empty");

				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			} else if (authority.getAuthority().equals("ROLE_ADMIN")) {
				try {
					System.out.println("Admin Role Condition is executing");
					
					redirectStrategy.sendRedirect(request, response, "/admin");
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}

			else if (authority.getAuthority().equals("ROLE_SUPERADMIN")) {
				try {
					 redirectStrategy.sendRedirect(request, response, "/superadmin");
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
				
				else if (authority.getAuthority().equals("ROLE_NEWUSER")) {
					try {
						 redirectStrategy.sendRedirect(request, response, "/index");
					} catch (Exception e) {
						e.printStackTrace();
					}

				
				
				
				
			}else if(authority.getAuthority().equals("ROLE_BRANCH"))


				try {

					 redirectStrategy.sendRedirect(request, response, "/doTransaction");
					 
				} catch (Exception e) {
					e.printStackTrace();
				}
			else if(authority.getAuthority().equals("ROLE_AGENT"))


				try {

					 redirectStrategy.sendRedirect(request, response, "/brAgent");
					 
				} catch (Exception e) {
					e.printStackTrace();
				}
			else{
				throw new IllegalStateException();
		}
		});

	}

	}

