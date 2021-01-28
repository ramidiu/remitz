package com.kws.unitedfintech.entities;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

import lombok.Data;

@Table(name = "sender_id_type")
@Entity
@Data
public class SenderIdType implements Serializable {

	private static final long serialVersionUID = 1L;

	@Id
	@Column(name = "s_id_no", nullable = false)
	private int sIdNo;

	@Column(name = "s_id_type", nullable = false)
	private String sIdType;

	@Column(name = "issuing_authority", nullable = false)
	private String issuingAuthority;

	@Column(name = "id_value", nullable = false)
	private String idValue;

}
