package com.kws.unitedfintech.entities;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

import lombok.Data;

@Entity
@Table(name = "customer_id_type")
@Data
public class CustomerIdType implements Serializable {
	private static final long serialVersionUID = 1L;
	@Id
	@Column(name = "id_no", nullable = false)
	private String idNo;
	@Column(name = "id_type", nullable = false)
	private String idType;
}
