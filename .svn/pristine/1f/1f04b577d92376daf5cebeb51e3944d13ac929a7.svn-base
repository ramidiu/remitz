package com.kws.unitedfintech.entities;

import java.io.Serializable;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import lombok.Data;

@Table(name = "bank_issuer_code")
@Entity
@Data
public class BankIssuerCode implements Serializable {
	private static final long serialVersionUID = 1L;
	@Id
	@Column(name = "issuer_code", nullable = false)
	private String issuerCode;

	@Column(name = "country_iso", nullable = false)
	private String countryISO;

	@Column(name = "bank_name", nullable = false)
	private String bankName;

}
