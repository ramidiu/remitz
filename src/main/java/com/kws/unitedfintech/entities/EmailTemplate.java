package com.kws.unitedfintech.entities;

import java.io.Serializable;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import lombok.Data;

@Entity
@Table(name = "email_template")
@Data
public class EmailTemplate implements Serializable {

	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name = "email_code", nullable = false)
	private int emailCode;

	@Column(name = "subject", nullable = false)
	private String subject;

	@Column(name = "demo", nullable = false)
	private String demo;

	@Column(name = "reply_email", nullable = false)
	private String replyEmail;

	@Column(name = "cc_email", nullable = false)
	private String ccEmail;
	@Column(name = "bcc_email", nullable = false)
	private String bccEmail;
	@Column(name = "template", nullable = false, columnDefinition = "TEXT")
	private String template;

	@Column(name = "title", nullable = false)
	private String title;
	@OneToOne(cascade = CascadeType.MERGE)
	@JoinColumn(name = "adminId", nullable = false, columnDefinition = "varchar(45)")
	private Admin admin;

}
