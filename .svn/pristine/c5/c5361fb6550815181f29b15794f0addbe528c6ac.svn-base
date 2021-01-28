package com.kws.unitedfintech.entities;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

import lombok.Data;

@Entity
@Table(name = "payment_types")
@Data
public class PaymentTypes implements Serializable {

	private static final long serialVersionUID = 1L;

	@Id
	@Column(name = "payment_type_id", nullable = false)
	private String paymentTypeId;

	@Column(name = "payment_type", nullable = false)
	private String paymentType;

	@Column(name = "value")
	private String value;
}
