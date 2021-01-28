package com.kws.unitedfintech.entities;

import java.io.Serializable;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import lombok.Data;

@Entity
@Table(name = "sender_ids")
@Data
public class SenderIds implements Serializable {

	private static final long serialVersionUID = 1L;
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name = "sender_id", nullable = false)
	private int senderId;

	@Column(name = "sender_type", nullable = false)
	private String senderType;

	@Column(name = "id_value", nullable = false)
	private String idValue;

	@Column(name = "functionality", nullable = false)
	private String functionality;

	@Column(name = "issuing_authority", nullable = false)
	private String issuingAuthority;

	@OneToOne(cascade = CascadeType.MERGE)
	@JoinColumn(name = "adminId", nullable = false, columnDefinition = "varchar(45)")
	private Admin admin;
	@OneToOne(cascade = CascadeType.MERGE)
	@JoinColumn(name = "branchId", nullable = false, columnDefinition = "varchar(45)")
	private Branch branch;

}
