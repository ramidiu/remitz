package com.kws.unitedfintech.entities;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

import lombok.Data;

@Entity
@Table(name = "no_generator")
@Data
public class NoGenerator implements Serializable {

	private static final long serialVersionUID = 1L;

	@Id
	@Column(name = "table_name", nullable = false, length = 45)
	private String tableName;

	@Column(name = "id_prefix", nullable = false, length = 45)
	private String idPrefix;

	@Column(name = "table_id", nullable = false)
	private Long tableId;

}
