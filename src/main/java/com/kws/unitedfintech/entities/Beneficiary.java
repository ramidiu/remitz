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
@Table(name = "beneficiary")
@Data
public class Beneficiary implements Serializable {
	private static final long serialVersionUID = 1L;
	@Id
	@Column(name = "beneficiary_id", length = 45, nullable = false)
	private String beneficiaryId;

	@Column(name = "first_name", length = 45)
	private String firstName;
	@Column(name = "last_name", length = 45, nullable = false)
	private String lastName;
	@Column(name = "city_or_town", length = 45, nullable = false)
	private String cityOrTown;
	@Column(name = "gender", nullable = false)
	private String gender;
	@Column(name = "relationShip", nullable = false)
	private String relationShip;
	@OneToOne(cascade = CascadeType.MERGE)
	@JoinColumn(name = "beneficiary_country", columnDefinition = "varchar(90)", nullable = false)
	private Country beneficiaryCountry;
	@OneToOne(cascade = CascadeType.MERGE)
	@JoinColumn(name = "admin_id", nullable = false, columnDefinition = "varchar(45)")
	private Admin admin;

	@Column(name = "mobile_number", length = 15)
	private String mobileNumber;
	@Column(name = "emailid", length = 45, nullable = false)
	private String emailId;
	@Column(name = "sending_reason", length = 45)
	private String sendingReason;
	@Column(name = "address_line1", length = 300)
	private String addressLine1;
	@Column(name = "address_line2", length = 300)
	private String addressLine2;
	@Column(name = "address")
	private String address;

	@Column(name = "postcode", length = 45)
	private String postCode;
	@Column(name = "created_date", length = 45, nullable = false)
	private String createdDate;
	@Column(name = "created_by", length = 45, nullable = false)
	private String createdBy;
	@Column(name = "updated_date", length = 45, nullable = false)
	private String updatedDate;
	@Column(name = "updated_by", length = 45, nullable = false)
	private String updatedBy;
	@OneToOne(cascade = CascadeType.MERGE)
	@JoinColumn(name = "customer_id", columnDefinition = "varchar(45)", nullable = false)
	private Customer customer;
	@Column(name = "id_proof", nullable = false)
	private int idProof;
	@Column(name = "id_proof_no", nullable = false)
	private String idProofNo;

	@Column(name = "bank_d")
	private String bankId;

	@Column(name = "bank_name", length = 255)
	private String bankName;

	@Column(name = "branch_name", length = 45)
	private String branchName;

	@Column(name = "bank_branch_state", length = 60)
	private String bankBranchState;

	@Column(name = "account_holder_name", length = 60)
	private String accountHolderName;

	@Column(name = "bank_account_number", length = 45)
	private String bankAccountNumber;

	@Column(name = "bank_branchcode", length = 45)
	private String bankBranchCode;

	@Column(name = "issuer_code", length = 45)
	private String issuerCode;

	@Column(name = "acc_type", nullable = false)
	private String accType;

	@Column(name = "ewallet_no", nullable = false)
	private String eWalletNo;
	@Transient
	private String customerId;
	@Transient
        private String adminId;
	@Transient
	private String toBranchId;
	@Transient
	private String countryISO;

	@Column(name = "transaction_time")
	private String transactionTime;

	@Column(name = "collection_point_name")
	private String collectionPointName;

	@Column(name = "collection_point_code")
	private String collectionPointCode;

	@Column(name = "collection_point_bank")
	private String collectionPointBank;

	@Column(name = "collection_point_address")
	private String collectionPointAddress;

	@Column(name = "collection_point_city")
	private String collectionPointCity;

	@Column(name = "collection_point_state")
	private String collectionPointState;

	@Column(name = "collection_point_telephone")
	private String collectionPointTelephone;

	@Column(name = "collection_pin")
	private String collectionPin;

	@Column(name = "beneficiary_account_transfer")
	private String beneficiaryAccountTransfer;

	@Column(name = "bank_details")
	private String bankDetails;

	@Column(name = "bank")
	private String bank;

	@Column(name = "swift_code")
	private String swiftCode;

	@Column(name = "iban")
	private String iBAN;

	@Column(name = "branch")
	private String branch;

	@Column(name = "branch_city")
	private String branchCity;

	@Column(name = "branch_state")
	private String branchState;

	@Column(name = "telephone")
	private String telephone;

	@Column(name = "branch_manager")
	private String branchManager;

	@Column(name = "card_number")
	private String cardNumber;

	@Column(name = "beneficiary_address1")
	private String beneficiaryAddress1;

	@Column(name = "beneficiary_address2")
	private String beneficiaryAddress2;

	@Column(name = "beneficiary_address3")
	private String beneficiaryAddress3;

	@Column(name = "beneficiary_city")
	private String beneficiaryCity;

	@Column(name = "beneficiary_post_code")
	private String beneficiaryPostCode;

	@Column(name = "beneficiary_id_type")
	private String beneficiaryIdType;

	@Column(name = "beneficiary_id_details")
	private String beneficiaryIdDetails;

	@Column(name = "delivery_note")
	private String deliveryNote;

	@Column(name = "utility_company")
	private String utilityCompany;

	@Column(name = "customer_account_number")
	private String customerAccountNumber;

	@Column(name = "invoice_number")
	private String invoiceNumber;

	@Column(name = "bank_to_pay")
	private String bankToPay;

	@Column(name = "iban1")
	private String iBan;

	@Column(name = "bank_bic_code")
	private String bankBicCode;

	@Column(name = "address_line3")
	private String addressLine3;

	@Column(name = "city")
	private String city;

	@Column(name = "state")
	private String state;

	@Column(name = "benificiary_status")
	private String benificiaryStatus;

	@Column(name = "bill_description")
	private String billDescription;

	@Column(name = "mobile_trnsfer_number")
	private String mobileTrnsferNumber;

	@Column(name = "transfer_netWork")
	private String transferNetWork;

	@Column(name = "transfer_netWork_credit_type")
	private String transferNetWorkCreditType;

}
