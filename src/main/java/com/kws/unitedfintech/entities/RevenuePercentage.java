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
@Table(name = "revenue_percentage")
@Data
public class RevenuePercentage implements Serializable {

	private static final long serialVersionUID = 1L;
	@Id
	@Column(name = "rp_id", nullable = false, length = 45)
	private String rpId;

	@OneToOne
	@JoinColumn(name = "admin_id", nullable = false, columnDefinition = "varchar(45)")
	private Admin admin;

	@OneToOne(cascade = CascadeType.MERGE)
	@JoinColumn(name = "from_branch_id", nullable = false, columnDefinition = "varchar(45)")
	private Branch fromBranch;

	@OneToOne(cascade = CascadeType.MERGE)
	@JoinColumn(name = "to_branch_id", nullable = false, columnDefinition = "varchar(45)")
	private Branch toBranch;

	@Column(name = "admin_percentage")
	private String adminPercentage;

	@Column(name = "source_percentage")
	private String sourcePercentage;

	@Column(name = "terminate_percentage")
	private String terminatePercentage;

}
