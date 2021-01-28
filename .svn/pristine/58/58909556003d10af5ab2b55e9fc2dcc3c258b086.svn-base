package com.kws.unitedfintech.entities;

import java.io.Serializable;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import lombok.Data;

@Entity
@Table(name = "trulio_customer")
@Data
public class TrulioCustomer implements Serializable {

	private static final long serialVersionUID = 1L;

	@Id
	@Column(name = "truliocustomer_id", nullable = false, length = 45)
	private String truelioCustomerId;

	@Column(name = "first_name", nullable = false, length = 45)
	private String firstName;

	@Column(name = "middle_name", nullable = false, length = 45)
	private String middleName;

	@Column(name = "last_name", nullable = false, length = 45)
	private String lastName;

	@Column(name = "gender", nullable = false, length = 45)
	private String gender;

	@Column(name = "dob", nullable = false, length = 45)
	private String dob;

	@Column(name = "house_number", nullable = false, length = 45)
	private String houseNumber;

	@Column(name = "building_name", nullable = false, length = 45)
	private String buildingName;

	@Column(name = "unit_number", nullable = false, length = 45)
	private String unitNumber;

	@Column(name = "street_name", nullable = false, length = 45)
	private String streetName;

	@Column(name = "street_type", nullable = false, length = 45)
	private String streetType;

	@Column(name = "city", nullable = false, length = 45)
	private String city;

	@Column(name = "suburb", nullable = false, length = 45)
	private String suburb;

	@Column(name = "state_province_code", nullable = false, columnDefinition = "varchar(45)")
	private String stateProvinceCode;

	@Column(name = "postal_code", nullable = false, length = 45)
	private String postalCode;

	@Column(name = "address1", nullable = false, length = 45)
	private String address1;

	@Column(name = "telephone", nullable = false, length = 45)
	private String telephone;

	@Column(name = "telephone2", nullable = false, length = 45)
	private String telephone2;

	@Column(name = "mobile_number", nullable = false, length = 45)
	private String mobileNumber;

	@Column(name = "email_id", nullable = false, length = 45)
	private String emailId;

	@Column(name = "ip_address", nullable = false, length = 45)
	private String ipAddress;

	@Column(name = "country_iso", nullable = false, columnDefinition = "varchar(45)")
	private String countryISO;

	@Column(name = "occupation", nullable = false)
	private String occupation;
	@Column(name = "citizenship", nullable = false)
	private String citizenship;
	@Column(name = "passport", nullable = false)
	private String Passport;

	@Column(name = "national_ids", nullable = false)
	private String NationalIds;
	@Column(name = "driver_licence", nullable = false)
	private String DriverLicence;
	@Column(name = "passport_serie", nullable = false)
	private String passportSerie;
	@Column(name = "day_of_issue", nullable = false)
	private String dayOfIssue;
	@Column(name = "month_of_issue", nullable = false)
	private String monthOfIssue;
	@Column(name = "year_of_issue", nullable = false)
	private String yearOfIssue;
	@Column(name = "internal_passport_number", nullable = false)
	private String internalPassportNumber;
	@Column(name = "watch_list_state", nullable = false)
	private String watchlistState;
	@Column(name = "middle_initial", nullable = false)
	private String middleInitial;

}
