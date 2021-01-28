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
@Table(name = "subhead")
@Data
public class SubHead implements Serializable {

	private static final long serialVersionUID = 1L;
	@Id
	@Column(name = "subhead_id", nullable = false, length = 45)
	private String subHeadId;
	@Column(name = "accNo", nullable = false)
	private String accNo;
	@Column(name = "subhead_name", nullable = false, length = 45)
	private String subHeadName;
	@Column(name = "headofaccount", nullable = false, length = 45)
	private String headOfAccount;
	@Column(name = "accDesc", nullable = false, columnDefinition = "LONGTEXT")
	private String accDesc;
	@OneToOne(cascade = CascadeType.MERGE)
	@JoinColumn(name = "majorHeadId", nullable = false, columnDefinition = "varchar(45)")
	private MajorHead majorHead;
	@OneToOne(cascade = CascadeType.MERGE)
	@JoinColumn(name = "minorHeadId", nullable = false, columnDefinition = "varchar(45)")
	private MinorHead minorHead;
	@Column(name = "level", nullable = false, length = 45)
	private String level;
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
	@Column(name = "approvalStatus", nullable = false)
	private String approvalStatus;
	@Column(name = "linkedTo", nullable = false)
	private String linkedTo;
	@Column(name = "createdBy", nullable = false)
	private String createdBy;
	@Column(name = "status", nullable = false)
	private String status;

	@Column(name = "nature", nullable = false)
	private String nature;
	@Column(name = "accType", nullable = false)
	private String accType;
	@Column(name = "adminApproval", nullable = false)
	private String adminApproval;

	@Column(name = "adminApprovalDateTime", nullable = false)
	private String adminApprovalDateTime;
	@Column(name = "branchApproval", nullable = false)
	private String branchApproval;

	@Column(name = "branchApprovalDateTime", nullable = false)
	private String branchApprovalDateTime;

	@Column(name = "agentApproval", nullable = false)
	private String agentApproval;

	@Column(name = "agentApprovalDateTime", nullable = false)
	private String agentApprovalDateTime;

}
