package com.kws.unitedfintech.entities;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

import lombok.Data;

@Entity
@Table(name = "ewallet_issuer_code")
@Data
public class EWalletIssuerCode implements Serializable {

	private static final long serialVersionUID = 1L;

	@Id
	@Column(name = "issuer_code", nullable = false)
	private String issuerCode;

	@Column(name = "operator_name", nullable = false)
	private String bankName;

	@Column(name = "country_iso", nullable = false)
	private String countryISO;

}
