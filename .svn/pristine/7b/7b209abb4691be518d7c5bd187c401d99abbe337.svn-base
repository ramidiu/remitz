package com.kws.unitedfintech.entities;

import java.io.Serializable;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import lombok.Data;

@Entity
@Table(name = "audit_trial")
@Data
public class AuditTrail implements Serializable {

	private static final long serialVersionUID = 1L;

	@Id
	@Column(name = "adt_id")
	private String adtId;

	@Column(name = "date")
	private String date;

	@Column(name = "category")
	private String category;

	@Column(name = "user_name")
	private String userName;

	@Column(name = "user_id")
	private String userId;

	@Column(name = "admin_id")
	private String adminId;

	@Column(name = "user_type")
	private String userType;

	@Column(name = "ip_address")
	private String ipAddress;

	@Column(name = "source_country")
	private String sourceCountry;

	@Column(name = "agent")
	private String agent;

	@Column(name = "transaction")
	private String transaction;

	@Column(name = "message")
	private String message;

	@Column(name = "original_data")
	private String originalData;

	@Column(name = "changed_data")
	private String changedData;

}
