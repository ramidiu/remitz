package com.kws.unitedfintech.entities;

import java.io.Serializable;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import lombok.Data;

@Entity
@Table(name = "zone")
@Data
public class Zone implements Serializable {

	private static final long serialVersionUID = 1L;

	@Id
	@Column(name = "zone_id", nullable = false, length = 45)
	private String zoneId;

	@OneToOne(cascade = CascadeType.MERGE)
	@JoinColumn(name = "countryISO", nullable = false, columnDefinition = "varchar(45)")
	private Country country;

	@Column(name = "zone_name", nullable = false, length = 45)
	private String zoneName;

}
