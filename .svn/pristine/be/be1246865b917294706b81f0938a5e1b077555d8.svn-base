package com.kws.unitedfintech.entities;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

import lombok.Data;

@Entity
@Table(name = "nasano_response")
@Data
public class NasanoResponse implements Serializable {

	private static final long serialVersionUID = 1L;

	@Id
	@Column(name = "n_id")
	private String nId;

	@Column(name = "glo_transactionId")
	private String gloTransactionId;

	@Column(name = "glo_status")
	private String gloStatus;

	@Column(name = "glo_msg")
	private String gloMsg;

}
