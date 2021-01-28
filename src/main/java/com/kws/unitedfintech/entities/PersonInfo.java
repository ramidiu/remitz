package com.kws.unitedfintech.entities;

import java.io.Serializable;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

import lombok.Data;

@Data
@JsonIgnoreProperties(ignoreUnknown = true)
public class PersonInfo implements Serializable {

	private static final long serialVersionUID = 1L;
	private String FirstGivenName;
	private String FirstSurName;
	private String MiddleName;
	private int DayOfBirth;
	private int MonthOfBirth;
	private int YearOfBirth;
	private int MinimumAge;

}
