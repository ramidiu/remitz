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
@Table(name = "branch")
@Data
public class Branch implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@Column(name = "branch_id", nullable = false, length = 45)
	private String branchId;

	@Column(name = "branch_name", nullable = false, length = 45)
	private String branchName;

	@Column(name = "mobile_number", nullable = false, length = 45)
	private String mobileNumber;

	@Column(name = "email_id", nullable = false, length = 45)
	private String emailId;

	@Column(name = "password", nullable = false, length = 45)
	private String password;

	@Column(name = "address", nullable = false, columnDefinition = "TEXT")
	private String address;

	@OneToOne(cascade = CascadeType.MERGE)
	@JoinColumn(name = "countryISO", nullable = false, columnDefinition = "varchar(45)")
	private Country fromCountry;

	@OneToOne(cascade = CascadeType.MERGE)
	@JoinColumn(name = "zone_id", nullable = false, columnDefinition = "varchar(45)")
	private Zone zone;

	@Column(name = "status", nullable = false, length = 45)
	private String status;

	@Column(name = "payment_mode", nullable = false)
	private String paymentMode;

	@Column(name = "details", nullable = false, columnDefinition = "LONGTEXT")
	private String details;

	@Column(name = "functionality", nullable = false)
	private String functionality;

	@Column(name = "mode_of_payment", nullable = false)
	private String modeOfPayment;

	@Column(name = "profit_mode", nullable = false)
	private String profitMode;

	@Column
	private String minimumTransaction;
	@Column
	private String maximumTransaction;

	@Column(name = "default_flag")
	private String defaultFlag;

	@Column
	private String isThisAnActualBank;

	@Column
	private String fullBankName;

	@Column
	private String abbrevName;

	@Column
	private String bankCode;

	@Column
	private String address1;

	@Column
	private String address2;

	@Column
	private String address3;

	@Column
	private String emailAddress;

	@Column
	private String telePhoneNumber;

	@Column
	private String faxNumber;

	@Column
	private String allowedIPAddresses;

	@Column
	private String startTime;

	@Column
	private String endTime;

	@Column(name = "nsano")
	private String nsano;

	@Column(name = "proces_bank")
	private String procesBank;

	@Column(name = "created_date", nullable = false, columnDefinition = "varchar(45)")
	private String createdDate;

	@Column(name = "updated_date", nullable = false, columnDefinition = "varchar(45)")
	private String updatedDate;

	@OneToOne(cascade = CascadeType.MERGE)
	@JoinColumn(name = "admin_id", nullable = false, columnDefinition = "varchar(45)")
	private Admin admin;

}
