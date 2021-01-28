package com.kws.unitedfintech.entities;

import java.io.Serializable;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import lombok.Data;

@Entity
@Table(name = "processbank")
@Data
public class Processbank implements Serializable {

	private static final long serialVersionUID = 1L;

	@Id
	@Column(name = "process_id", nullable = false, length = 45)
	private String processId;

	@Column(nullable = false)
	private String firstName;

	@Column(nullable = false)
	private String lastName;

	@Column(nullable = false)
	private String userName;

	@Column(nullable = false)
	private String password;

	@Column(nullable = false)
	private String language;

	@Column(nullable = false)
	private String createDeliveryBank;

	@Column(nullable = false)
	private String status;

	@Column(nullable = false)
	private String userAccountLocked;

	@Column(nullable = false)
	private String isThisAnActualBank;

	@Column(nullable = false)
	private String fullBankName;

	@Column(nullable = false)
	private String abbrevName;

	@Column(nullable = false)
	private String bankCode;

	@Column(nullable = false)
	private String address1;

	@Column(nullable = false)
	private String address2;

	@Column(nullable = false)
	private String address3;

	@Column(nullable = false)
	private String status1;

	@OneToOne(cascade = CascadeType.MERGE)
	@JoinColumn(name = "country_iso", nullable = false, columnDefinition = "varchar(45)")
	private Country country;

	@OneToOne(cascade = CascadeType.MERGE)
	@JoinColumn(name = "branch_id", nullable = false, columnDefinition = "varchar(45)")
	private Branch branch;

	@Column(nullable = false)
	private String emailAddress;

	@Column(nullable = false)
	private String telePhoneNumber;

	@Column(nullable = false)
	private String faxNumber;

	@Column(name = "enforce_limit")
	private String enforceLimit;

	@Column(nullable = false)
	private String parentSuperBank;

	@Column(nullable = false)
	private String creditLogCurrency;

	@Column(nullable = false)
	private String chargeSlabAmountType;

	@Column(nullable = false)
	private String requireBenefDobForPayoutAmountGreaterThen;

	@Column(nullable = false)
	private String maxNegativeCreditLimit;

	private String viewUnprocessedCashCollectionTransactions;

	@Column(nullable = false)
	private String canSetOwnBuyRate;

	@Column(nullable = false)
	private String synchroniseDestConversionRateToBuyRate;

	private String useBankBuyRatesAsSellRates;

	@Column(nullable = false)
	private String allowedIPAddresses;

	@Column(nullable = false)
	private String startTime;

	@Column(nullable = false)
	private String endTime;

	@OneToOne(fetch = FetchType.EAGER, cascade = CascadeType.MERGE)
	@JoinColumn(name = "admin_id", columnDefinition = "varchar(45)", nullable = false)
	private Admin admin;

}
