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
@Table(name = "servicefee")
@Data
public class ServiceFees implements Serializable {

	private static final long serialVersionUID = 1L;
	@Id
	@Column(name = "servicefee_id", nullable = false)
	private String serviceFeeId;
	@OneToOne(cascade = CascadeType.MERGE)
	@JoinColumn(name = "from_branch_id")
	private Branch fromBranch;
	@OneToOne(cascade = CascadeType.MERGE)
	@JoinColumn(name = "to_branch_id")
	private Branch toBranch;
	@Column(name = "min_value")
	private double minValue;
	@Column(name = "max_value")
	private double maxValue;
	@Column(name = "service_fee")
	private double serviceFee;

	@Column(name = "percentage_fee")
	private double percentageFee;

	@OneToOne(cascade = CascadeType.MERGE)
	@JoinColumn(name = "admin_id", nullable = false)
	private Admin admin;

	@Column(name = "rate_type")
	private String rateType;

	@Column(name = "status")
	private String status;

	@Column(name = "payment_type")
	private String paymentType;

}
