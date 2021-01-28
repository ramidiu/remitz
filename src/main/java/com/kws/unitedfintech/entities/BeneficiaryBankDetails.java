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
@Table(name = "beneficiary_bank_details")
@Data
public class BeneficiaryBankDetails implements Serializable {

	private static final long serialVersionUID = 1L;

	@Id
	@Column(name = "bankId", nullable = false)
	private String bankId;

	@Column(name = "bank_name", length = 45, nullable = false)
	private String bankName;

	@Column(name = "branch_name", length = 45, nullable = false)
	private String branchName;

	@Column(name = "bank_branch_state", length = 60, nullable = false)
	private String bankBranchState;

	@Column(name = "account_holder_name", length = 60, nullable = false)
	private String accountHolderName;

	@Column(name = "bank_account_number", length = 45, nullable = false)
	private String bankAccountNumber;

	@Column(name = "bank_branchcode", length = 45, nullable = false)
	private String bankBranchCode;

	@Column(name = "bank_issuer_code", length = 45, nullable = false)
	private String bankIssuerCode;

	@OneToOne(cascade = CascadeType.MERGE)
	@JoinColumn(name = "customer_id", columnDefinition = "varchar(45)", nullable = false)
	private Customer customer;

	@OneToOne(cascade = CascadeType.MERGE)
	@JoinColumn(name = "beneficiary_id", nullable = false, columnDefinition = "varchar(45)")
	private Beneficiary beneficiary;

	@OneToOne(cascade = CascadeType.MERGE)
	@JoinColumn(name = "transaction_id", nullable = false, columnDefinition = "varchar(45)")
	private TransactionInformation transactionInformation;
}
