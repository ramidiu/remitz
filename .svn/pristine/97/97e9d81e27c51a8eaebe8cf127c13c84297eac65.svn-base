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
@Table(name = "branch_payment_type_details")
@Data
public class BranchPaymentTypeDetails implements Serializable {

	private static final long serialVersionUID = 1L;

	@Id
	@Column(name = "branch_payment_type_detail_id", nullable = false)
	private String branchPaymentTypeDetailId;

	@OneToOne(cascade = CascadeType.MERGE, fetch = FetchType.EAGER)
	@JoinColumn(name = "branch_id", nullable = false)
	private Branch branchId;

	@OneToOne(cascade = CascadeType.MERGE, fetch = FetchType.EAGER)
	@JoinColumn(name = "payment_type", nullable = false, columnDefinition = "varchar(45)")
	private PaymentTypes paymentTypes;
	@OneToOne(cascade = CascadeType.MERGE, fetch = FetchType.EAGER)
	@JoinColumn(name = "admin_id", nullable = false, columnDefinition = "varchar(45)")
	private Admin admin;

	@Column(name = "status", nullable = false)
	private String status;

	@Column(name = "delivery_time", nullable = false)
	private String deliveryTime;

}
