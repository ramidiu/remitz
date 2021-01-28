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
@Table(name = "admin_sell_rates")
@Data
public class AdminSellRates implements Serializable {

	private static final long serialVersionUID = 1L;

	@Id
	@Column(name = "cr_id", nullable = false, length = 45)
	private String crId;

	@OneToOne
	@JoinColumn(name = "admin_id", nullable = false, columnDefinition = "varchar(45)")
	private Admin admin;

	@OneToOne(cascade = CascadeType.MERGE)
	@JoinColumn(name = "from_branch_id", nullable = false, columnDefinition = "varchar(45)")
	private Branch fromBranch;

	@OneToOne(cascade = CascadeType.MERGE)
	@JoinColumn(name = "to_branch_id", nullable = false, columnDefinition = "varchar(45)")
	private Branch toBranch;

	private String rateType;

	private String createdDate;

	private String updatedDate;

	private double masterRate;
	private double markup;
	private double sellRate;
	@Column(name = "rate_updatedate")
	private String rateUpdatedDate;
	@Column(name = "payment_type")
	private String paymentType;

	@Column(name = "rate_flag")
	private String rateFlag;

	@Column(name = "status")
	private String status;

}
