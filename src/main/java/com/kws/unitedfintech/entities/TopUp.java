package com.kws.unitedfintech.entities;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

import lombok.Data;

@Entity
@Table(name = "topup")
@Data
public class TopUp implements Serializable {

	private static final long serialVersionUID = 1L;
	@Id
	@Column(name = "transaction_id", nullable = false)
	private String transactionId;
	@Column(name = "msisdn", nullable = false)
	private String msisdn;
	@Column(name = "destination_msisdn", nullable = false)
	private String destinationMsisdn;
	@Column(name = "country", nullable = false)
	private String country;
	@Column(name = "country_id", nullable = false)
	private int countryId;
	@Column(name = "operator", nullable = false)
	private String operator;
	@Column(name = "operatorid", nullable = false)
	private String operatorId;
	@Column(name = "reference_operator", nullable = false)
	private String referenceOperator;
	@Column(name = "originating_currency", nullable = false)
	private String originatingCurrency;
	@Column(name = "destination_currency", nullable = false)
	private String destinationCurrency;
	@Column(name = "product_requested", nullable = false)
	private double productRequested;
	@Column(name = "actual_product_sent", nullable = false)
	private double actualProductSent;
	@Column(name = "wholesale_price", nullable = false)
	private double wholesalePrice;
	@Column(name = "retail_price", nullable = false)
	private double retailPrice;
	@Column(name = "balance", nullable = false)
	private double balance;
	@Column(name = "sms_sent", nullable = false)
	private String smsSent;
	@Column(name = "sms", nullable = false, columnDefinition = "text")
	private String sms;
	@Column(name = "cid1", nullable = false)
	private String cid1;
	@Column(name = "cid2", nullable = false)
	private String cid2;
	@Column(name = "cid3", nullable = false)
	private String cid3;
	@Column(name = "info_txt", nullable = false, columnDefinition = "text")
	private String infoText;
	@Column(name = "authentication_key", nullable = false)
	private String authenticationKey;
	@Column(name = "error_code", nullable = false)
	private int errorCode;
	@Column(name = "error_txt", nullable = false)
	private String errorText;
	@Column(name = "promotion", nullable = false)
	private String promotion;
	@Column(name = "promo_start", nullable = false)
	private String promo_start;
	@Column(name = "promo_end", nullable = false)
	private String promoEnd;
	@Column(name = "pin_based", nullable = false)
	private String pin_based;
	@Column(name = "pin_option_1", nullable = false)
	private String pinOption1;
	@Column(name = "pin_option_2", nullable = false)
	private String pinOption2;
	@Column(name = "pin_option_3", nullable = false)
	private String pinOption3;
	@Column(name = "pin_value", nullable = false)
	private Long pinValue;
	@Column(name = "pin_code", nullable = false)
	private String pinCode;
	@Column(name = "pin_ivr", nullable = false)
	private String pinIvr;
	@Column(name = "pin_serial", nullable = false)
	private String pin_serial;
	@Column(name = "pin_validity", nullable = false)
	private String pinValidity;

}
