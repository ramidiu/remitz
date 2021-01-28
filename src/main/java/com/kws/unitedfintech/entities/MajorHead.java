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
@Table(name="majorhead")
@Data
public class MajorHead implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@Column(name="majorhead_id",nullable=false,length=45)
	private String majorHeadId;
	
	@Column(name="accNo" , nullable=false)
	private String accNo;
	
	@Column(name="majorhead_name",nullable=false,length=45)
	private String majorHeadName;
	@Column(name="description",nullable=false,columnDefinition="LONGTEXT")
	private String description;
	@Column(name="majorhead_nature")
	private String majorHeadNature;
	@Column(name="headofaccount",nullable=false,length=45)
	private String headOfAccount;
	@Column(name="level",nullable=false,length=45)
	private String level;
	@OneToOne(cascade = CascadeType.MERGE)
	@JoinColumn(name = "admin_id", nullable = false, columnDefinition = "varchar(45)")
	private Admin admin;
	@Column(name="flag")
	private String flag;
}
