package com.kws.unitedfintech.entities;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

import lombok.Data;

@Entity
@Table(name = "national_ids")
@Data
public class NationalIdTypes implements Serializable {

	private static final long serialVersionUID = 1L;

	@Id
	@Column(name = "national_id")
	private String nationalId;

	@Column(name = "national_idtype")
	private String nationalIdType;

	@Column(name = "country_iso")
	private String countryIso;

}
