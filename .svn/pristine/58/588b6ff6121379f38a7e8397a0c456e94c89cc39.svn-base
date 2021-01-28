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
@Table(name = "add_new_user")
@Data
public class AddNewUser implements Serializable {

	private static final long serialVersionUID = 1L;

	@Id
	@Column(name = "new_UserId", nullable = false)
	private String newUserId;

	@Column(name = "first_name", nullable = false)
	private String firstname;

	@Column(name = "last_name", nullable = false)
	private String lastname;

	@Column(name = "email_id", nullable = false)
	private String emailId;

	@Column(name = "phone_number", nullable = false)
	private String phonenumber;

	@Column(name = "role", nullable = false)
	private String role;

	@OneToOne(cascade = CascadeType.MERGE)
	@JoinColumn(name = "adminId", nullable = false, columnDefinition = "varchar(45)")
	private Admin admin;

	@Column(name = "business_countries", nullable = false, columnDefinition = "TEXT")
	private String businessCountries;

	@Column(name = "profile_image", nullable = false)
	private String profileImage;

	@Column(name = "password", nullable = false)
	private String password;

}
