package com.kws.unitedfintech.entities;

import java.io.Serializable;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.persistence.Transient;
import lombok.Data;

@Entity
@Table(name = "bank_details")
@Data
public class Banks implements Serializable {

	private static final long serialVersionUID = 1L;

	@Id
	@Column(name = "bankId", nullable = false)
	private String bankId;
	@Column(name = "bankName", nullable = false, length = 500)
	private String bankName;
	@OneToOne(cascade = CascadeType.MERGE)
	@JoinColumn(name = "countryISO", nullable = false, columnDefinition = "varchar(45)")
	private Country country;
	@Column(name = "bank_code", nullable = false)
	private String bankCode;

	@Column(name = "created_date", nullable = false)
	private String createdDate;
	@Column(name = "updated_date", nullable = false)
	private String updateDate;

	@Transient
	private String countryISo;
}
