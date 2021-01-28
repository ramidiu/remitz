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
@Table(name = "transaction_information")
@Data
public class TransactionInformation implements Serializable {

	private static final long serialVersionUID = 1L;

	@Id
	@Column(name = "transaction_id", length = 45, nullable = false)
	private String transactionId;

	@Column(name = "sending_amount", nullable = false)
	private double sendingAmount;

	@Column(name = "sending_currency", nullable = false)
	private String sendingCurrency;

	@Column(name = "receiving_currency", nullable = false)
	private String receivingCurrency;

	@Column(name = "tax_fee", nullable = false)
	private double taxFee;

	@Column(name = "total_amount_collected", nullable = false)
	private double totalAmountCollected;

	@Column(name = "receipent_amount", nullable = false)
	private double receipentAmount;

	@Column(name = "amount_to_be_converted", nullable = false)
	private double amountToBeConverted;

	@Column(name = "receiving_currency_rate", nullable = false)
	private double receivingCurrencyRate;
	private String agent;

	@Column(name = "txn_confirmation", nullable = false)
	private String txnConfirmation;

	@Column(name = "sending_curr_rate", nullable = false)
	private String sendingCurrencyRate;

	@Column(name = "transaction_rate", nullable = false)
	private double transactionRate;

	@Column(name = "comments", nullable = false, columnDefinition = "TEXT")
	private String comments;

	@OneToOne(cascade = CascadeType.MERGE)
	@JoinColumn(name = "cusomer_id", nullable = false, columnDefinition = "varchar(45)")
	private Customer customer;

	@OneToOne(cascade = CascadeType.MERGE)
	@JoinColumn(name = "beneficiary_id", nullable = false, columnDefinition = "varchar(45)")
	private Beneficiary beneficiary;

	@Column(name = "total_fee", nullable = false)
	private double totalFee;

	@Column(name = "sell_rate", nullable = false)
	private double sellRate;

	@Column(name = "enter_amount")
	private String enterAmount;

	@Column(name = "converted_amount")
	private double convertedAmount;

	@Column(name = "created_date", length = 45, nullable = false)
	private String createdDate;
	@Column(name = "created_by", length = 45, nullable = false)
	private String createdBy;
	@Column(name = "updated_date", length = 45, nullable = false)
	private String updatedDate;
	@Column(name = "updated_by", length = 45, nullable = false)
	private String updatedBy;
	@Column(name = "sending_reason", length = 45, nullable = false)
	private String sendingReason;
	@OneToOne(cascade = CascadeType.MERGE)
	@JoinColumn(name = "adminId", nullable = false, columnDefinition = "varchar(45)")
	private Admin admin;

	@OneToOne(cascade = CascadeType.MERGE)
	@JoinColumn(name = "sending_country", nullable = false, columnDefinition = "varchar(45)")
	private Country sendingCountry;

	@OneToOne(cascade = CascadeType.MERGE)
	@JoinColumn(name = "receiving_country", nullable = false, columnDefinition = "varchar(45)")
	private Country receivingCountry;

	@OneToOne(cascade = CascadeType.MERGE)
	@JoinColumn(name = "n_id", columnDefinition = "varchar(45)")
	private NasanoResponse nasanoResponse;

	@OneToOne(cascade = CascadeType.MERGE)
	@JoinColumn(name = "from_branch", nullable = false, columnDefinition = "varchar(45)")
	private Branch fromBranch;

	@OneToOne(cascade = CascadeType.MERGE)
	@JoinColumn(name = "to_branch", nullable = false, columnDefinition = "varchar(45)")
	private Branch toBranch;

	@Column(name = "payment_type", nullable = false)
	private String paymentType;
	@Column(name = "mode_of_payment", nullable = false)
	private String modeOfPayment;

	@Column(name = "status", nullable = false)
	private String status;

	@Column(name = "approved_by_sending_branch", nullable = false)
	private String approvedBySendingBranch;

	@Column(name = "approved_by_receiving_branch", nullable = false)
	private String approvedByReceivingBranch;

	@Column(name = "approved_by_admin", nullable = false)
	private String approvedByAdmin;

	@Column(name = "admin_approval_dateTime", nullable = false)
	private String adminApprovalDateTime;

	@Column(name = "sending_branch_approval_dateTime", nullable = false)
	private String sendingBranchApprovalDateTime;

	@Column(name = "receiving_branch_approval_dateTime", nullable = false)
	private String receivingBranchApprovalDateTime;

	@Column(name = "cancel_reason", columnDefinition = "TEXT", nullable = false)
	private String cancelReason;

	@Column(name = "payment_status", nullable = false)
	private String paymentStatus;

	@Column(name = "transaction_mode", nullable = false)
	private String transactionMode;

	@Column(name = "profit_mode", nullable = false)
	private String profitMode;

	@Column(name = "ip_address", nullable = false)
	private String ipAddress;

	@Column(name = "mode_of_payment_fee", nullable = false)
	private double modeOfPaymentFee;

	@Column(name = "tranglo_send_status", nullable = false)
	private String trangloSendStatus;

	@Column(name = "tranglo_status", nullable = false)
	private String trangloStatus;

	@Column(name = "tranglo_status_code", nullable = false)
	private String trangloStatusCode;

	@Column(name = "issuer_code", nullable = false)
	private String issuerCode;

	@Column(name = "source_of_fund", nullable = false)
	private String sourceOfFund;
	@Column(name = "occupation", nullable = false)
	private String occupation;

	@Column(name = "ref_msg", nullable = false, columnDefinition = "TEXT")
	private String refMsg;

	@Column(name = "delivery_time", nullable = false)
	private String deliveryTime;
	@Column(name = "markup", nullable = false)
	private double markup;
	@Column(name = "fixer_rate", nullable = false)
	private double fixerRate;
	@Column(name = "flutter_rate", nullable = false)
	private double flutterRate;
	@Column(name = "flutter_fee", nullable = false)
	private double flutterFee;
	@Column(name = "flutter_refrence_id", nullable = false)
	private String flutterReferenceId;
	@Column(name = "payat_refrence_number")
	private String payAtRefrenceNumber;
	@Column(name = "payment_status_from_user", nullable = false)
	private String paymentStatusFromUser;
	@Transient
	private String customerId;
	@Transient
	private String adminId;
	@Transient
	private String fromBranchId;
	@Transient
	private String toBranchId;
	@Transient
	private String beneficiaryId;

	@Column(name = "transaction_time")
	private String transactionTime;
	@Column(name = "collection_point_name")
	private String collectionPointName;

	@Column(name = "profit_rate")
	private String profitRate;

	@Column(name = "buy_rate")
	private String buyRate;

	@Column(name = "api_flag")
	private String apiFlag;

	@Column(name = "admin_fee")
	private String adminFee;

	@Column(name = "agent_fee")
	private String agentFee;

	@Column(name = "rec_agent_fee")
	private String recagentFee;

}
