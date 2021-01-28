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
@Table(name = "online_mop")
@Data
public class OnlineMop implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@Column(name = "online_id", nullable = false)
	private String onlineId;

	@Column(name = "payment_gatewayname", nullable = false)
	private String paymentGatewayName;

	@Column(name = "logo", nullable = false)
	private String logo;

	@Column(name = "user_name", nullable = false)
	private String userName;

	@Column(name = "password", nullable = false)
	private String password;

	@Column(name = "api_key", nullable = false)
	private String apiKey;

	@Column(name = "link", nullable = false)
	private String link;

	@OneToOne(cascade = CascadeType.MERGE)
	@JoinColumn(name = "adminId", nullable = false, columnDefinition = "varchar(45)")
	private Admin admin;

	@Column(name = "payment_page", nullable = false)
	private String paymentPage;

}
