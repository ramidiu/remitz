package com.kws.unitedfintech.entities;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

import lombok.Data;

@Entity
@Table(name = "access_log")
@Data
public class AccessLog implements Serializable {

	private static final long serialVersionUID = 1L;

	@Id
	@Column(name = "access_id", nullable = false)
	private String acessId;

	@Column(name = "ip_address")
	private String ipAddress;

	@Column(name = "log_on_time")
	private String logOnTime;

	@Column(name = "log_off_time")
	private String logOffTime;

	@Column(name = "user_type")
	private String userType;

	@Column(name = "user_name")
	private String userName;

	@Column(name = "acess_result")
	private String acessResult;

	@Column(name = "user_id")
	private String userid;

	@Column(name = "admin_id")
	private String adminId;

}
