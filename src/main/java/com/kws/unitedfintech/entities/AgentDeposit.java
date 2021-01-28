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
@Table(name = "agent_deposit")
@Data
public class AgentDeposit implements Serializable {

	private static final long serialVersionUID = 1L;

	@Id
	@Column(name = "ad_id", nullable = false, length = 45)
	private String adId;

	@Column(name = "deposit_date", nullable = false, length = 45)
	private String depositDate;

	@Column(name = "date", nullable = false, length = 45)
	private String Date;

	@Column(name = "deposit_amount", nullable = false, length = 45)
	private String depositAmount;

	@Column(name = "document", length = 45)
	private String document;

	@Column(name = "notes", nullable = false, length = 45)
	private String notes;

	@OneToOne(cascade = CascadeType.MERGE)
	@JoinColumn(name = "adminId", nullable = false, columnDefinition = "varchar(45)")
	private Admin admin;

	@OneToOne(cascade = CascadeType.MERGE)
	@JoinColumn(name = "branch_id", nullable = false, columnDefinition = "varchar(45)")
	private Branch branch;

	@Column
	private String status;

}
