package com.kws.unitedfintech.entities;

import java.io.Serializable;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.persistence.Transient;

import lombok.Data;

@Entity
@Table(name = "customer")
@Data
public class Customer implements Serializable {
	private static final long serialVersionUID = 1L;
	@Id
	@Column(name = "customer_id", nullable = false, length = 45)
	private String customerId;

	@Column(name = "customername_id", nullable = false, length = 45)
	private String customerNameId;

	@Column(name = "first_name", nullable = false, length = 45)
	private String firstName;

	@Column(name = "middle_name", nullable = false, length = 45)
	private String middleName;

	@Column(name = "last_name", nullable = false, length = 45)
	private String lastName;

	@Column(name = "gender", nullable = false, length = 45)
	private String gender;

	@Column(name = "dob", nullable = false, length = 45)
	private String dob;

	@Column(name = "email_id", nullable = false, length = 100)
	private String emailId;

	@Column(name = "house_number", nullable = false, length = 45)
	private String houseNumber;

	@Column(name = "building_name", nullable = false, length = 45)
	private String buildingName;

	@Column(name = "unit_number", nullable = false, length = 45)
	private String unitNumber;

	@Column(name = "street_name", nullable = false, length = 45)
	private String streetName;

	@Column(name = "street_type", nullable = false, length = 45)
	private String streetType;

	@Column(name = "city", nullable = false, length = 45)
	private String city;

	@Column(name = "suburb", nullable = false, length = 45)
	private String suburb;

	@Column(name = "state_province_code", nullable = false, columnDefinition = "varchar(45)")
	private String stateProvinceCode;

	@Column(name = "postal_code", nullable = false, length = 45)
	private String postalCode;

	@Column(name = "address1", nullable = false, length = 45)
	private String address1;

	@Column(name = "telephone", nullable = false, length = 45)
	private String telephone;

	@Column(name = "telephone2", nullable = false, length = 45)
	private String telephone2;

	@Column(name = "mobile_number", nullable = false, length = 45)
	private String mobileNumber;

	@Column(name = "ip_address", nullable = false, length = 45)
	private String ipAddress;

	@Column(name = "first_id_proof_type", nullable = false, length = 45)
	private String firstIdProofType;

	@Column(name = "first_id_number", nullable = false, length = 45)
	private String firstIdNumber;

	@Column(name = "first_id_proof_doc", nullable = false, length = 45)
	private String firstIdProofDoc;

	@Column(name = "first_id_issue_date", nullable = false, length = 45)
	private String firstIdIssueDate;

	@Column(name = "first_id_expire_date", nullable = false, length = 45)
	private String firstIdExpireDate;

	@Column(name = "first_id_proof_status", nullable = false, length = 45)
	private String firstIdProofStatus;

	@Column(name = "second_id_proof_type", nullable = false, length = 45)
	private String secondIdProofType;

	@Column(name = "second_id_number", nullable = false, length = 45)
	private String secondIdNumber;

	@Column(name = "second_id_proof_doc", nullable = false, length = 45)
	private String secondIdProofDoc;

	@Column(name = "second_id_issue_date", nullable = false, length = 45)
	private String secondIdIssueDate;

	@Column(name = "second_id_expire_date", nullable = false, length = 45)
	private String secondIdExpireDate;

	@Column(name = "second_id_proof_status", nullable = false, length = 45)
	private String secondIdProofStatus;

	@Column(name = "status", nullable = false, length = 45)
	private String status;

	@Column(name = "created_date", nullable = false, length = 45)
	private String createdDate;

	@Column(name = "updated_date", nullable = false, length = 45)
	private String updatedDate;

	@Column(name = "password", nullable = false, length = 45)
	private String password;

	@Column(name = "user_name", nullable = false, length = 45)
	private String userName;

	@OneToOne(cascade = CascadeType.MERGE)
	@JoinColumn(name = "adminId", nullable = false, columnDefinition = "varchar(45)")
	private Admin admin;

	@OneToOne(cascade = CascadeType.MERGE)
	@JoinColumn(name = "branch_id", nullable = false, columnDefinition = "varchar(45)")
	private Branch branch;

	@OneToOne(cascade = CascadeType.MERGE)
	@JoinColumn(name = "countryISO", nullable = false, columnDefinition = "varchar(45)")
	private Country country;

	@Column(name = "citizenship", nullable = false)
	private String citizenship;

	@Column(name = "customer_details_flag", nullable = false)
	private String customerDetailsFlag;

	@OneToOne(cascade = CascadeType.MERGE)
	@JoinColumn(name = "from_country_iso", nullable = false, columnDefinition = "varchar(45)")
	private Country issuingCountry;
	@Column(name = "cityOrState", nullable = false, length = 45)
	private String cityOrState;

	@Transient
	@Column(name = "countryIso", nullable = false, length = 45)
	private String countryIso;

	@Column(name = "customer_kyc_status", nullable = false)
	private String customerKYCStatus;

	@Column(name = "customer_kyc_mode", nullable = false)
	private String customerKYCMode;
	@Column(name = "sanction_search_flag")
	private String sanctionSearchFlag;
	@Transient
	@Column(name = "idIndexNo", nullable = false)
	private String idIndexNo;
	@Transient
	private String branchId;
	@Transient
	private String customerCountry;
	@Transient
	private String issuingCountryISO;

	@Column(name = "occupation", nullable = false)
	private String occupation;

	@Column(name = "national_idtype")
	private String nationalIdType;

	@Column(name = "trulio_response")
	private String trulioResponse;

	@Column(name = "transaction_id")
	private String transactionId;
}
