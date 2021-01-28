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
@Table(name = "mode_of_payment_fees")
@Data
public class ModeOfPaymentFees implements Serializable {

	private static final long serialVersionUID = 1L;
	@Id
	@Column(name = "mop_fee_id", nullable = false)
	private String modeOfPaymentFeeId;

	@OneToOne(cascade = CascadeType.MERGE)
	@JoinColumn(name = "modeOfPaymentId", nullable = false, columnDefinition = "varchar(45)")
	private ModeOfPayments modeOfPaymentId;

	@OneToOne(cascade = CascadeType.MERGE)
	@JoinColumn(name = "branch_Id", nullable = false, columnDefinition = "varchar(45)")
	private Branch branchId;

	@Column(name = "fee", nullable = false)
	private double fee;

	@JoinColumn(name = "adminId", columnDefinition = "varchar(45)", nullable = false)
	@OneToOne(cascade = CascadeType.MERGE)
	private Admin admin;
	@Column(name = "min_value", nullable = false)
	private double minValue;
	@Column(name = "max_value", nullable = false)
	private double maxValue;
	@Column(name = "status", nullable = false)
	private String status;
	@Column(name = "rateType")
	private String rateType;
	@Column(name = "display")
	private String display;
}
