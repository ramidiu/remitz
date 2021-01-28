package com.kws.unitedfintech.entities;

import java.io.Serializable;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import lombok.Data;

@Entity
@Table(name = "internet_bankTranser")
@Data
public class InternetBankTransferMop implements Serializable {

	private static final long serialVersionUID = 1L;
	@Id
	@Column(name = "internetbanktransfer_id", nullable = false)
	private String internetbanktransferId;

	@Column(name = "bank_name", nullable = false)
	private String bankName;

	@Column(name = "payee_name", nullable = false)
	private String payeeName;

	@Column(name = "bank_code", nullable = false)
	private String bankCode;

	@Column(name = "account_number", nullable = false)
	private String accountNumber;

	@OneToOne(cascade = CascadeType.MERGE)
	@JoinColumn(name = "adminId", nullable = false, columnDefinition = "varchar(45)")
	private Admin admin;
}
