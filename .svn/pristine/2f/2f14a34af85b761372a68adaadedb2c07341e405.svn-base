package com.kws.unitedfintech.entities;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

import lombok.Data;

@Entity
@Table(name = "reserve_id")
@Data
public class ReserveId implements Serializable {

	private static final long serialVersionUID = 1L;
	@Id
	@Column(name = "reserved_id", nullable = false)
	private String reserved_id;
	@Column(name = "authentication_key", nullable = false)
	private String authentication_key;
	@Column(name = "error_code", nullable = false)
	private int error_code;
	@Column(name = "error_txt", nullable = false)
	private String error_txt;
	@Column(name = "created_date", nullable = false)
	private String createdDate;
	@Column(name = "updated_date", nullable = false)
	private String updatedDate;

}
