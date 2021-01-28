package com.kws.unitedfintech.entities;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

import lombok.Data;

@Entity
@Table(name = "sanctionsearch1")
@Data
public class SanctionSearch implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@Column(name = "id", nullable = false)
	private int id;

	@Column(name = "name", nullable = false, columnDefinition = "TEXT")
	private String name;

	@Column(name = "type", nullable = false, columnDefinition = "TEXT")
	private String type;

	@Column(name = "program", nullable = false, columnDefinition = "TEXT")
	private String program;

	@Column(name = "title", nullable = false, columnDefinition = "TEXT")
	private String title;

	@Column(name = "extra1", nullable = false, length = 45)
	private String extra1;

	@Column(name = "extra2", nullable = false, length = 45)
	private String extra2;

	@Column(name = "extra3", nullable = false, length = 45)
	private String extra3;

	@Column(name = "extra4", nullable = false, length = 45)
	private String extra4;

	@Column(name = "extra5", nullable = false, length = 45)
	private String extra5;

	@Column(name = "extra6", nullable = false, length = 45)
	private String extra6;

	@Column(name = "extra7", nullable = false, columnDefinition = "MEDIUMTEXT")
	private String extra7;

}
