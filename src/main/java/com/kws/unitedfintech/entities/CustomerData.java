package com.kws.unitedfintech.entities;

import java.io.Serializable;
import lombok.Data;

@Data
public class CustomerData implements Serializable {

	private static final long serialVersionUID = 1L;
	private String firstName;
	private String lastName;
	private String idNumber;
	private String contactNumber;
}
