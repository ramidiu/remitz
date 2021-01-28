package com.kws.unitedfintech.entities;

import java.io.Serializable;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import lombok.Data;

@Entity
@Data
public class AgentSellRates implements Serializable {

	private static final long serialVersionUID = 1L;
	@Id
	@Column
	private String agentCurrSellRateId;
	@Column
	private String addDate;
	@Column
	private String updateDate;

	@Column
	private String agentId;

	@Column
	private double branchAgentMasterRate;
	@Column
	private double agentMarkupRate;
	@Column
	private double agentCurrencySellRate;
	@OneToOne(cascade = CascadeType.ALL, fetch = FetchType.EAGER)
	@JoinColumn(name = "frombranch", nullable = false, columnDefinition = "varchar(45)")

	private Branch fromBranch;

	@Column
	private String crid;
	@OneToOne(cascade = CascadeType.ALL, fetch = FetchType.EAGER)
	@JoinColumn(name = "toBranch", nullable = false, columnDefinition = "varchar(45)")
	private Branch toBranch;
}
