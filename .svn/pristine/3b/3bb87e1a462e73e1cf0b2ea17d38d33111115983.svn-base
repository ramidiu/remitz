package com.kws.unitedfintech.underremitentities;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
@Entity
@Table(name="bankaccount_information")
public class BankAccountInformation implements Serializable {

	private static final long serialVersionUID = 1L;
	@Id
	@Column(name="bank_informationid",nullable = false)
	private String bankInformationId;
	@Column(name="institution_number",nullable = false)
	private String institutionNumber;
	@Column(name="transit_number",nullable = false)
	private String transitNumber;
	@Column(name="account_number",nullable = false)
	private String accountNumber;
	@Column(name="first_name",nullable = false)
	private String firstName;
	@Column(name="last_name",nullable = false)
	private String lastName;
	@Column(name="created_date",nullable = false)
	private String createdDate;
	public String getBankInformationId() {
		return bankInformationId;
	}
	public void setBankInformationId(String bankInformationId) {
		this.bankInformationId = bankInformationId;
	}
	public String getInstitutionNumber() {
		return institutionNumber;
	}
	public void setInstitutionNumber(String institutionNumber) {
		this.institutionNumber = institutionNumber;
	}
	public String getTransitNumber() {
		return transitNumber;
	}
	public void setTransitNumber(String transitNumber) {
		this.transitNumber = transitNumber;
	}
	public String getAccountNumber() {
		return accountNumber;
	}
	public void setAccountNumber(String accountNumber) {
		this.accountNumber = accountNumber;
	}
	public String getFirstName() {
		return firstName;
	}
	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}
	public String getLastName() {
		return lastName;
	}
	public void setLastName(String lastName) {
		this.lastName = lastName;
	}
	public String getCreatedDate() {
		return createdDate;
	}
	public void setCreatedDate(String createdDate) {
		this.createdDate = createdDate;
	}
	@Override
	public String toString() {
		return "BankAccountInformation [bankInformationId=" + bankInformationId + ", institutionNumber="
				+ institutionNumber + ", transitNumber=" + transitNumber + ", accountNumber=" + accountNumber
				+ ", firstName=" + firstName + ", lastName=" + lastName + ", createdDate=" + createdDate + "]";
	}
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((accountNumber == null) ? 0 : accountNumber.hashCode());
		result = prime * result + ((bankInformationId == null) ? 0 : bankInformationId.hashCode());
		result = prime * result + ((createdDate == null) ? 0 : createdDate.hashCode());
		result = prime * result + ((firstName == null) ? 0 : firstName.hashCode());
		result = prime * result + ((institutionNumber == null) ? 0 : institutionNumber.hashCode());
		result = prime * result + ((lastName == null) ? 0 : lastName.hashCode());
		result = prime * result + ((transitNumber == null) ? 0 : transitNumber.hashCode());
		return result;
	}
	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		BankAccountInformation other = (BankAccountInformation) obj;
		if (accountNumber == null) {
			if (other.accountNumber != null)
				return false;
		} else if (!accountNumber.equals(other.accountNumber))
			return false;
		if (bankInformationId == null) {
			if (other.bankInformationId != null)
				return false;
		} else if (!bankInformationId.equals(other.bankInformationId))
			return false;
		if (createdDate == null) {
			if (other.createdDate != null)
				return false;
		} else if (!createdDate.equals(other.createdDate))
			return false;
		if (firstName == null) {
			if (other.firstName != null)
				return false;
		} else if (!firstName.equals(other.firstName))
			return false;
		if (institutionNumber == null) {
			if (other.institutionNumber != null)
				return false;
		} else if (!institutionNumber.equals(other.institutionNumber))
			return false;
		if (lastName == null) {
			if (other.lastName != null)
				return false;
		} else if (!lastName.equals(other.lastName))
			return false;
		if (transitNumber == null) {
			if (other.transitNumber != null)
				return false;
		} else if (!transitNumber.equals(other.transitNumber))
			return false;
		return true;
	}
	
}
