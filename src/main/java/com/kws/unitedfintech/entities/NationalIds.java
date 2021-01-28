package com.kws.unitedfintech.entities;

import java.io.Serializable;

import lombok.Data;

@Data
public class NationalIds implements Serializable {

	private static final long serialVersionUID = 1L;

	private String Number;
	private String Type;

}
