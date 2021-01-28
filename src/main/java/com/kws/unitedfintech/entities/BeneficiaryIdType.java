package com.kws.unitedfintech.entities;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

import lombok.Data;

@Table(name = "beneficiary_id_type")
@Entity
@Data
public class BeneficiaryIdType implements Serializable {

	private static final long serialVersionUID = 1L;
	@Id
	@Column(name = "b_id_no", nullable = false)
	private int bIdNo;

	@Column(name = "b_id_type", nullable = false)
	private String bIdType;

}
