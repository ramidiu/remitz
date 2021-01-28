package com.kws.unitedfintech.entities;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

import lombok.Data;

@Entity
@Table(name = "country")
@Data
public class Country implements Serializable {

	private static final long serialVersionUID = 1L;

	@Id
	@Column(name = "countryISO", nullable = false, length = 4)
	private String countryISO;

	@Column(name = "countryName", nullable = false, length = 45)
	private String countryName;

	@Column(name = "currencyName", nullable = false, length = 45)
	private String currencyName;

	@Column(name = "currencyCode", nullable = false, length = 45)
	private String currencyCode;

	@Column(name = "currencySymbol", nullable = false, length = 45)
	private String currencySymbol;

	@Column(name = "currencySymbol2", nullable = false, length = 45)
	private String currencySymbol2;

	@Column(name = "dailing_code", nullable = false)
	private String dalingCode;

	@Column(name = "trulio", nullable = false)
	private String trulio;

}
