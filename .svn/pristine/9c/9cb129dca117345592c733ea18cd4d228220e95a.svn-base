package com.kws.unitedfintech.entities;

import java.io.Serializable;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import lombok.Data;

@Entity
@Table(name = "admin")
@Data
public class Admin implements Serializable {

	private static final long serialVersionUID = 1L;

	@Id
	@Column(name = "admin_id", nullable = false, length = 45)
	private String adminId;

	@Column(name = "first_name", nullable = false, length = 45)
	private String firstName;

	@Column(name = "last_name", nullable = false, length = 45)
	private String lastName;

	@Column(name = "email_id", nullable = false, length = 45)
	private String emailId;

	@Column(name = "mobile_number", nullable = false, length = 45)
	private String mobileNumber;

	@Column(name = "address", nullable = false, columnDefinition = "TEXT")
	private String address;

	@Column(name = "landlineno")
	private String landLineNo;

	@Column(name = "countryname")
	private String countryName;
	@Column(name = "created_date", nullable = false, length = 45)
	private String createdDate;

	@Column(name = "updated_date", nullable = false, length = 45)
	private String updatedDate;

	@OneToOne(cascade = CascadeType.MERGE)
	@JoinColumn(name = "countryISO", nullable = false, columnDefinition = "varchar(45)")
	private Country country;

	@OneToOne(cascade = CascadeType.MERGE)
	@JoinColumn(name = "zoneId", nullable = false, columnDefinition = "varchar(45)")
	private Zone zone;

	@Column(name = "baseCurrency", nullable = false)
	private String baseCurrency;

	@Column(name = "username", nullable = false)
	private String userName;

	@Column(name = "password", nullable = false)
	private String password;

	@Column(name = "company_name", nullable = false)
	private String companyName;

	@Column(name = "logo", nullable = false)
	private String logo;

	@Column(name = "currency_markup", nullable = false)
	private String currencyMarkup;

	@Column(name = "no_of_branches", nullable = false)
	private int noOfBranches;

	@Column(name = "branch_count", nullable = false)
	private int branchCount;

	@Column(name = "admin_key", nullable = false)
	private String adminKey;

	@Column(name = "url", nullable = false)
	private String url;

	@Column(name = "profit_mode", nullable = false)
	private String profitMode;

	@Column(name = "payment_types", nullable = false)
	private String paymentTypes;

	@Column(name = "mode_of_payment", nullable = false)
	private String modeOfPayments;

	@Column(name = "status", nullable = false)
	private String status;
	private String ISO;
	private String zId;
	@Column(name = "topup_transaction", nullable = false)
	private String topUpTransaction;
	@Column(name = "wish_rate", nullable = false)
	private String wishRate;
	@Column(name = "promo_code", nullable = false)
	private String promoCode;
	@Column(name = "sms_template", nullable = false)
	private String smsTemplate;
	@Column(name = "api_credential", nullable = false)
	private String apiCredential;
	@Column(name = "flutter", nullable = false)
	private String flutter;
	@Column(name = "trulio", nullable = false)
	private String trulio;
	@Column(name = "manual", nullable = false)
	private String manual;

	@Column(name = "nsano")
	private String nsano;
	@Column(name = "mp_Ip")
	private String myIp;

	@Column
	private String packages;

	@Column
	private String adminStatus;
	@Column
	private String transactionPrefix;

	@Column(name = "business_countries", nullable = false, columnDefinition = "TEXT")
	private String businessCountries;

	@Column
	private String packageExpireDate;

	@Column(name = "flag")
	private String flag;
	@Column(name = "admin_type")
	private String adminType;

}
