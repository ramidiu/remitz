package com.kws.unitedfintech.entities;

import java.io.Serializable;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import lombok.Data;

@Entity
@Table(name = "check_wallet")
@Data
public class CheckWallet implements Serializable {

	private static final long serialVersionUID = 1L;
	@Id
	@Column(name = "wallet_balanceid")
	private String walletBalanceId;
	@Column(name = "type", nullable = false)
	private String type;
	@Column(name = "login", nullable = false)
	private String login;
	@Column(name = "currency", nullable = false)
	private String currency;
	@Column(name = "balance", nullable = false)
	private double balance;
	@Column(name = "wallet", nullable = false)
	private double wallet;
	@Column(name = "authentication_key", nullable = false)
	private String authenticationKey;
	@Column(name = "error_code", nullable = false)
	private int errorCode;
	@Column(name = "error_txt", nullable = false)
	private String errorText;

}
