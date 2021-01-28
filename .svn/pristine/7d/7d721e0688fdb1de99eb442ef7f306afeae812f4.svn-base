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
@Table(name = "demo_request")
@Data
public class DemoRequest implements Serializable {

	private static final long serialVersionUID = 1L;
	@Id
	@Column(name = "demo_id")
	public String demoId;
	@Column(name = "first_name")
	public String firstName;
	@Column(name = "email_id")
	public String emailId;
	@Column(name = "phone_number")
	public String phoneNumber;
	@Column(name = "country_name")
	public String countryName;
	@OneToOne(cascade = CascadeType.MERGE)
	@JoinColumn(name = "countryISO", nullable = false, columnDefinition = "varchar(45)")
	public Country country;

	@Column(name = "ISO")
	public String ISO;
	@Column(name = "dialing_Code")
	public String dialingCode;
	@Column(name = "my_Ip")
	public String myIp;

}
