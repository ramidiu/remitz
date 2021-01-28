package com.kws.unitedfintech.security;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.password.NoOpPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.firewall.DefaultHttpFirewall;
import org.springframework.security.web.firewall.HttpFirewall;
import org.springframework.web.bind.annotation.RequestMethod;

@EnableWebSecurity
public class SecurityConfiguration extends WebSecurityConfigurerAdapter {

	private static final String ADMIN = "ADMIN";
	private static final String CUSTOMER = "CUSTOMER";
	private static final String SUPERADMIN = "SUPERADMIN";
	private static final String BRANCH = "BRANCH";
	private static final String AGENT="AGENT";
	private static final String NEWUSER="NEWUSER";

	@Autowired
	private UserDetailsService userDetailsService;
	
	@Override
	protected void configure(AuthenticationManagerBuilder auth) throws Exception {
		auth.userDetailsService(userDetailsService);
	}
	@Autowired
	private SimpleAuthenticationSuccessHandler simpleAuthenticationSuccessHandler;

	@Override
	protected void configure(HttpSecurity http) throws Exception {
		http.authorizeRequests()
        .antMatchers("/login").permitAll()
        .antMatchers("/admin").hasRole(ADMIN)
    	.antMatchers("/customer").hasRole(CUSTOMER)
    	.antMatchers("/br").hasRole(BRANCH)
    	.antMatchers("/superadmin").hasRole(SUPERADMIN)
    	.antMatchers("/newUsers").hasRole(NEWUSER)
    	.antMatchers("/brAgent").hasRole(AGENT)
    	
				/* SUPERADMIN URLS STARTS */
    	.antMatchers("/adminRegistration").hasRole(SUPERADMIN)
    	.antMatchers("/insertEmailTemplate").hasRole(SUPERADMIN)
    	.antMatchers("/adminList").hasRole(SUPERADMIN)
    	.antMatchers("/updateAdmin").hasRole(SUPERADMIN)
    	.antMatchers("/updateAdminDetails").hasRole(SUPERADMIN)
    	.antMatchers("/frontendadminurls").hasRole(SUPERADMIN)
    	
    	.antMatchers("/branch_registration").hasRole(ADMIN)
    	
				/* SUPERADMIN ULS ENDS */
				/* ADMIN URLS STARTS*/
    	
    	.antMatchers("/branch_registration").hasRole(ADMIN)
    	.antMatchers("/insertbranch").hasRole(ADMIN)
    	.antMatchers("/mop").hasRole(ADMIN)
    	.antMatchers("/add_rates").hasRole(ADMIN)
    	.antMatchers("/getallsellratesbasedonadmin").hasRole(ADMIN)
    	.antMatchers("/update_rates_by_admin").hasRole(ADMIN)
    	.antMatchers("/add_new_rates_by_admin").hasRole(ADMIN)
    	.antMatchers("/srfee").hasRole(ADMIN)
    	.antMatchers("/addFeeLimitation").hasRole(ADMIN)
    	.antMatchers("/updateFeeLimitation").hasRole(ADMIN)
    	.antMatchers("/deleteFeeLimitation").hasRole(ADMIN)
    	.antMatchers("/updateFee").hasRole(ADMIN)
    	.antMatchers("/admincustomerlist").hasRole(ADMIN)
    	.antMatchers("/updatebranch").hasRole(ADMIN)
    	.antMatchers("updateModeOfPaymentFeeStatus").hasRole(ADMIN)
    	.antMatchers("/manageBranchPayments").hasRole(ADMIN)
        .antMatchers("/updatebranchpaymenttype").hasRole(ADMIN)
        .antMatchers("/admincustomereditprofile").hasRole(ADMIN)
        .antMatchers("/adminupdatecustomerprofile").hasRole(ADMIN)
        .antMatchers("/addNewUsers").hasRole(ADMIN)
        .antMatchers("/insertNewUser").hasRole(ADMIN)
        .antMatchers("/updateNewUser").hasRole(ADMIN)
        .antMatchers("/updateUser").hasRole(ADMIN)
        .antMatchers("/getTransactionListBasedOnFromToDate").hasRole(ADMIN)
        .antMatchers("/transactionList").hasRole(ADMIN)
        .antMatchers("/CustomerManualIdVerification").hasRole(ADMIN)
        .antMatchers("/manual_id_update").hasRole(ADMIN)
        .antMatchers("/changePaymentStatusInTransaction").hasRole(ADMIN)
        .antMatchers("/changeTransactionStatus").hasRole(ADMIN)
        .antMatchers("/banks").hasRole("ADMIN")
        .antMatchers("/insertbanks").hasRole(ADMIN)
        .antMatchers("/cashpickup").hasRole(ADMIN)
        .antMatchers("/insertcash").hasRole(ADMIN)
        .antMatchers("/add_email_templates").hasRole(ADMIN)
        .antMatchers("insertemailtemplate").hasRole(ADMIN)
        .antMatchers("/gettemplatebasedonid").hasRole(ADMIN)
		/* ADMIN ULS ENDS */
				/* BRANCH URLS STARTS */
        .antMatchers("/cust_reg").hasRole(BRANCH)
        .antMatchers("/new_txn").hasRole(BRANCH)
        .antMatchers("/insertcustomer").hasRole(BRANCH)
        .antMatchers("/customerListing").hasRole(BRANCH)
        .antMatchers("/customerlist").hasRole(BRANCH)
        .antMatchers("/updatecustomerstatus").hasRole(BRANCH)
        .antMatchers("/AgentRegistration").hasRole(BRANCH)
        .antMatchers("/submitAgent").hasRole(BRANCH)
        .antMatchers("/customerprofile").hasRole(BRANCH)
        .antMatchers("/customereditprofile").hasRole(BRANCH)
        .antMatchers("/updatecustomerprofile").hasRole(BRANCH)
        .antMatchers("/updatecustomerviewprofile").hasRole(BRANCH)
          
				/* BRANCH URLS ENDS */
				/*AGENT URLS STARTS */
        .antMatchers("/brAgent_add_rates").hasRole(AGENT)
        .antMatchers("/BranchAgentAddRates").hasRole(AGENT)
        .antMatchers("/getSpecificbranchDetailsbasedonBranchAndadmin").hasRole(AGENT)
        .antMatchers("/updateAgentSellRate").hasRole(AGENT)
        
				/* AGENT ULS ENDS */
        
		.and()
            .formLogin()
            .loginPage("/login")
            .successHandler(simpleAuthenticationSuccessHandler)
            .failureUrl("/login?error=true")
            .permitAll()
        .and()
            .logout()
            .logoutSuccessUrl("/login?logout=true")
            .invalidateHttpSession(true)
            .permitAll()
        .and()
            .csrf()
            .disable();

	}

	
	
	  @Bean public HttpFirewall allowUrlEncodedSlashHttpFirewall() {
	  DefaultHttpFirewall firewall = new DefaultHttpFirewall();
	  firewall.setAllowUrlEncodedSlash(true); return firewall; }
	 
	 

	  @Bean
		public PasswordEncoder getPasswordEncoder() {
			return NoOpPasswordEncoder.getInstance();
		}
}