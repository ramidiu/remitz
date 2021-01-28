package com.kws.unitedfintech.entities;

import java.io.Serializable;

import lombok.Data;

@Data
public class Record implements Serializable {

	private static final long serialVersionUID = 1L;
	private String TransactionRecordID;
	private String RecordStatus;
}
