package com.kws.unitedfintech.entities;

import java.io.Serializable;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import lombok.Data;

@Entity
@Table(name = "getInTouch")
@Data
public class GetInTouch implements Serializable {

	private static final long serialVersionUID = 1L;
	@Id
	@Column(name = "get_Id")
	public String getId;
	@Column(name = "first_Name")
	public String firstName;
	@Column(name = "last_Name")
	public String lastName;
	@Column(name = "email_Id")
	public String emailId;
	@Column(name = "description")
	public String description;
	@Column(name = "my_Ip")
	public String myIp;

}
