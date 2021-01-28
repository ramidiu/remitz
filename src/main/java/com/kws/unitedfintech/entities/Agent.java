package com.kws.unitedfintech.entities;

import java.io.Serializable;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import lombok.Data;

@Entity
@Table(name = "Branch_Agents")
@Data
public class Agent implements Serializable {
	@Id
	@Column
	private String agentId;

	@Column(name = "agentname")
	private String agentName;

	@Column
	private String agentPassword;
	@Column
	private String agentEmail;

	@Column
	private String agentProfitMode;

	@Column
	private String agentStatus;

	@Column
	private String agentAddress;
	@Column
	private String agentMobileNumber;
	@OneToOne(cascade = CascadeType.ALL, fetch = FetchType.EAGER)
	@JoinColumn(name = "adminid")
	private Admin admin;

	@OneToOne(cascade = CascadeType.ALL, fetch = FetchType.EAGER)
	@JoinColumn(name = "branchid")
	private Branch branch;

}
