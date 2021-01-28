package com.kws.unitedfintech.entities;

import java.io.Serializable;
import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import lombok.Data;

@Entity
@Table(name = "bootRemitzDemo")
@Data
public class BootRemitzDemo implements Serializable {
	private static final long serialVersionUID = 1L;
	@Id
	public String demoId;
	public String firstName;
	public String emailId;
	public String phoneNumber;

	public String ISO;
	@OneToOne(cascade = CascadeType.MERGE)
	@JoinColumn(name = "countryISO", nullable = false, columnDefinition = "varchar(45)")
	public Country country;
}
