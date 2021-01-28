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
@Table(name = "journalvoucher")
@Data
public class JournalVoucher implements Serializable {

	private static final long serialVersionUID = 1L;
	@Id
	@Column(name = "journal_Id")
	public String journalId;
	@Column(name = "product_Id")
	public String productId;
	@Column(name = "emp_Id")
	public String empId;
	@Column(name = "majorHead_Id")
	public String majorHeadId;
	@Column(name = "minorHead_Id")
	public String minorHeadId;
	@Column(name = "subHead_Id")
	public String subHeadId;

	@Column(name = "fin_Yr")
	public String finYr;
	@Column(name = "date")
	public String date;
	@Column(name = "hoa")
	public String hoa;
	@Column(name = "narration")
	public String narration;
	@Column(name = "journal_voucher_Type")
	public String journalvoucherType;
	@Column(name = "bank_Name")
	public String bankName;
	@Column(name = "type_Of_Operation")
	public String typeOfOperation;
	@Column(name = "quantity")
	public String quantity;
	@Column(name = "rate")
	public String rate;
	@Column(name = "total_Amount")
	public String totalAmount;
	@Column(name = "trtype")
	public String trtype;
	@OneToOne(cascade = CascadeType.MERGE)
	@JoinColumn(name = "admin_id", nullable = false, columnDefinition = "varchar(45)")
	private Admin admin;

}
