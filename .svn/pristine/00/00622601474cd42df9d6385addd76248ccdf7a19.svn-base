package com.kws.unitedfintech.entities;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

import lombok.Data;

@Entity
@Table(name = "states")
@Data
public class States implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@Column(name = "stateId", nullable = false)
	private String stateId;

	@Column(name = "state_code", nullable = false)
	private String stateCode;

	@Column(name = "state_name", nullable = false, columnDefinition = "varchar(500)")
	private String stateName;

	@Column(name = "country_iso", nullable = false)
	private String countryISO;

}
