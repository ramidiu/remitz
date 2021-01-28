package com.kws.unitedfintech.entities;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

import lombok.Data;

@Entity
@Table(name = "mode_of_payments")
@Data
public class ModeOfPayments implements Serializable {

	private static final long serialVersionUID = 1L;

	@Id
	@Column(name = "mode_of_payment_id", nullable = false)
	private String modeOfPaymentId;

	@Column(name = "mode_of_payment", nullable = false)
	private String modeOfPayment;

}
