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
@Table(name = "tx_days")
@Data
public class TxDaysLimit implements Serializable {

	private static final long serialVersionUID = 1L;
	@Id
	@Column(name = "tx_id")
	private String txId;

	@OneToOne(cascade = CascadeType.MERGE)
	@JoinColumn(name = "adminId", nullable = false, columnDefinition = "varchar(45)")
	private Admin admin;

	@OneToOne(cascade = CascadeType.MERGE)
	@JoinColumn(name = "branch_id", nullable = false, columnDefinition = "varchar(45)")
	private Branch branch;

	@Column(name = "limit_days")
	private String limitDays;

}
