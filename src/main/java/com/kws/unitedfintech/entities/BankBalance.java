package com.kws.unitedfintech.entities;

import java.io.Serializable;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import lombok.Data;

@Entity
@Table(name = "bankbalance")
@Data
public class BankBalance implements Serializable {
	private static final long serialVersionUID = 1L;
	@Id
	@Column(name = "uniq_id")
	private String uniqId;
	@Column(name = "bank_id")
	private String bankId;
	@Column(name = "type")
	private String type;
	@Column(name = "bank_bal")
	private String bankBal;
	@Column(name = "bank_flag")
	private String bankFlag;
	@Column(name = "created_date")
	private String createdDate;
	@Column(name = "created_by")
	private String createdBy;
	@Column(name = "type_of_bank")
	private String typeOfBank;
	@Column(name = "major_head_id")
	private String majorHeadId;
	@Column(name = "minor_head_id")
	private String minorHeadId;
	@Column(name = "fin_yr")
	private String finYr;

}
