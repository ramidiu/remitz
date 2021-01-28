package com.kws.unitedfintech.entities;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

import lombok.Data;

@Table(name = "relationship")
@Entity
@Data
public class Relationship implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@Column(name = "relationship_no", nullable = false)
	private int rNo;

	@Column(name = "relationship", nullable = false)
	private String relationship;

}
