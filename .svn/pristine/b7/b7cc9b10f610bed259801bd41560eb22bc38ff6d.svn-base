package com.kws.unitedfintech.entities;

import java.io.Serializable;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

import lombok.Data;
@Entity
@Table(name="transaction_state")
@Data
public class TransactionState  implements Serializable{
	private static final long serialVersionUID = 1L;
	@Id
	@Column(name="transactionstate_id",nullable = false)
	private String TransactionStateId;
	@Column(name="payat_acc_number",nullable = false)
	private String payAtAccNumber;
	@Column(name="transactionId",nullable = false)
	private String transactionId;
	@Column(name="state",nullable = false)
	private String state;
	@Column(name="updated_date",nullable = false)
	private String updatedDate;
	@Column(name="issuertxn_id",nullable = false)
	private String issuerTxnId ;
	
}
