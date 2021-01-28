package com.kws.unitedfintech.entities;

import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

import lombok.Data;

@Entity
@Table(name = "subheads")
@Data
public class SubHeads implements Serializable {

	private static final long serialVersionUID = 1L;
	@Id
	private String sub_head_id;
	private String name;
	private String description;
	private String major_head_id;
	private String head_account_id;
	private String extra1;
	private String extra2;
	private String extra3;
	private String seva_description;
	private String extra4;
	private String extra5;
	private String createdBy;
	private String createdTime;
	private String vendorId;
	private String extra6;
	private String extra7;
	private String extra8;
	private String extra9;
	private String extra10;

}
