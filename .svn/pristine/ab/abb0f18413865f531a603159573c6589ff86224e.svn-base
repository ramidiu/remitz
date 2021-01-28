package com.kws.unitedfintech.entities;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import lombok.Data;

@Entity
@Table(name = "sms_teplates")
@Data
public class SMSTemplate implements Serializable {

	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name = "sms_code", nullable = false)
	private int smsCode;

	@Column(name = "title", nullable = false)
	private String title;

	@Column(name = "template", columnDefinition = "TEXT")
	private String template;
}
