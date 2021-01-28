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
@Table(name = "cash_pickup")
@Data
public class Cash implements Serializable {

	private static final long serialVersionUID = 1L;

	@Id
	@Column(name = "cash_id", nullable = false, length = 45)
	private String cashId;

	@Column(name = "cash_pickup", nullable = false, length = 45)
	private String cashPickupFrom;

	@Column(name = "contact_Number", nullable = false, length = 45)
	private String contactNumber;

	@Column(name = "cash_bank")
	private String cashBank;

	@Column(name = "collection_point_bank")
	private String collectionPointBank;

	@Column(name = "collection_point_address")
	private String collectionPointAddress;

	@Column(name = "collection_point_city")
	private String collectionPointCity;

	@OneToOne(cascade = CascadeType.MERGE)
	@JoinColumn(name = "collection_point_state")
	private States collectionPointState;

	@Column(name = "collection_pin")
	private String collectionPin;

	@Column(name = "collection_point_code")
	private String collectionPointCode;

	@OneToOne(cascade = CascadeType.MERGE)
	@JoinColumn(name = "countryISO", nullable = false, columnDefinition = "varchar(45)")
	private Country country;

	@OneToOne(cascade = CascadeType.MERGE)
	@JoinColumn(name = "adminId", nullable = false, columnDefinition = "varchar(45)")
	private Admin admin;

	@Column(name = "created_date", nullable = false)
	private String createdDate;

	@Column(name = "updated_date", nullable = false)
	private String updateDate;
}
