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
@Table(name = "minorhead")
@Data
public class MinorHead implements Serializable {

	private static final long serialVersionUID = 1L;
	@Id
	@Column(name = "minorhead_id", nullable = false, length = 45)
	private String minorHeadId;

	@Column(name = "accNo", nullable = false)
	private String accNo;

	@Column(name = "minorhead_name", nullable = false, length = 45)
	private String minorHeadName;
	@Column(name = "description", nullable = false, columnDefinition = "TEXT")
	private String description;
	@Column(name = "headofaccount", nullable = false, length = 45)
	private String headOfAccount;
	@OneToOne(cascade = CascadeType.MERGE)
	@JoinColumn(name = "majorhead_id", nullable = false, columnDefinition = "varchar(45)")
	private MajorHead majorHead;
	@OneToOne(cascade = CascadeType.MERGE)
	@JoinColumn(name = "admin_id", nullable = false, columnDefinition = "varchar(45)")
	private Admin admin;
	@Column(name = "type", nullable = false)
	private String type;
	@Column(name = "accCode", nullable = false)
	private String accCode;
	@Column(name = "createdDate", nullable = false)
	private String createdDate;
	@Column(name = "updatedDate", nullable = false)
	private String updatedDate;
	@Column(name = "extra1", nullable = false)
	private String extra1;
	@Column(name = "extra2", nullable = false)
	private String extra2;
	@Column(name = "extra3", nullable = false)
	private String extra3;
	@Column(name = "extra4", nullable = false)
	private String extra4;
	@Column(name = "nature", nullable = false)
	private String nature;
	@Column(name = "approvalStatus", nullable = false)
	private String approvalStatus;
	@Column(name = "linkedTo", nullable = false)
	private String linkedTo;
	@Column(name = "createdBy", nullable = false)
	private String createdBy;
	@Column(name = "level", nullable = false, length = 45)
	private String level;
	@Column(name = "flag")
	private String flag;
}
