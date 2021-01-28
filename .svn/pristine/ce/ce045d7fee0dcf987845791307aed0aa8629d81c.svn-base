package com.kws.unitedfintech.entities;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.Table;

import lombok.Data;

@Entity
@Table(name = "securitydata")
@Data
public class SecurityData implements Serializable {

	private static final long serialVersionUID = 1L;
	@Id
	@Column
	private String sid;
	@JoinColumn(name = "login", nullable = true, columnDefinition = "varchar(45)")
	private Login login;

}
