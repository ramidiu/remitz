package com.kws.unitedfintech.entities;

import java.io.Serializable;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import org.hibernate.annotations.GeneratorType;

import lombok.Data;

@Entity
@Table(name = "nasano")
@Data
public class Nasano implements Serializable {

	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name = "n_id")
	private int nasanoId;

	@Column(name = "api_key")
	private String apiKey;

	@OneToOne(cascade = CascadeType.MERGE)
	@JoinColumn(name = "adminId", nullable = false, columnDefinition = "varchar(45)")
	private Admin admin;

	@OneToOne(cascade = CascadeType.MERGE)
	@JoinColumn(name = "branch_id", nullable = false, columnDefinition = "varchar(45)")
	private Branch branch;

}
