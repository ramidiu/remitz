package com.kws.unitedfintech.entities;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

import lombok.Data;

@Entity
@Table(name = "purpose_codes")
@Data
public class PurposeCodes implements Serializable {

	private static final long serialVersionUID = 1L;

	@Id
	@Column(name = "purpose_code", nullable = false)
	private int purposeCode;

	@Column(name = "purpose", nullable = false)
	private String purpose;

}
