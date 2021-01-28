package com.kws.unitedfintech.underremitentities;

import java.io.Serializable;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.persistence.Transient;
@Entity
@Table(name="zumrails_user")
public class ZumRailsUser implements Serializable {

	private static final long serialVersionUID = 1L;
	@Id
	@Column(name="user_id")
	private String  userId;
	@Column(name="first_name",nullable = false)
	private String firstName;
	@Column(name="last_name",nullable = false)
	private String lastName;
	@Column(name="email_id",nullable = false)
	private String email;
	@Column(name="company_name",nullable = false)
	private String companyName;
	@Column(name="phone_number")
	private String phoneNumber;
	@Column(name="transaction_method",nullable = false)
	private String  TransactionMethod;
	@OneToOne(cascade = CascadeType.MERGE)
	@JoinColumn(name = "bankInformationId", nullable = false, columnDefinition = "varchar(45)")
	private BankAccountInformation bankAccountInformation;
	@OneToOne(cascade = CascadeType.MERGE)
	@JoinColumn(name = "creditCardInformationId", nullable = false, columnDefinition = "varchar(45)")
	private CreditCardInformation creditCardInformation;
	@Column(name="created_date",nullable = false)
	private String createdDate;
	@Transient
	private double transactionAmount;
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
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
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getCompanyName() {
		return companyName;
	}
	public void setCompanyName(String companyName) {
		this.companyName = companyName;
	}
	public String getPhoneNumber() {
		return phoneNumber;
	}
	public void setPhoneNumber(String phoneNumber) {
		this.phoneNumber = phoneNumber;
	}
	public String getTransactionMethod() {
		return TransactionMethod;
	}
	public void setTransactionMethod(String transactionMethod) {
		TransactionMethod = transactionMethod;
	}
	public BankAccountInformation getBankAccountInformation() {
		return bankAccountInformation;
	}
	public void setBankAccountInformation(BankAccountInformation bankAccountInformation) {
		this.bankAccountInformation = bankAccountInformation;
	}
	public CreditCardInformation getCreditCardInformation() {
		return creditCardInformation;
	}
	public void setCreditCardInformation(CreditCardInformation creditCardInformation) {
		this.creditCardInformation = creditCardInformation;
	}
	public String getCreatedDate() {
		return createdDate;
	}
	public void setCreatedDate(String createdDate) {
		this.createdDate = createdDate;
	}
	public double getTransactionAmount() {
		return transactionAmount;
	}
	public void setTransactionAmount(double transactionAmount) {
		this.transactionAmount = transactionAmount;
	}
	@Override
	public String toString() {
		return "ZumRailsUser [userId=" + userId + ", firstName=" + firstName + ", lastName=" + lastName + ", email="
				+ email + ", companyName=" + companyName + ", phoneNumber=" + phoneNumber + ", TransactionMethod="
				+ TransactionMethod + ", bankAccountInformation=" + bankAccountInformation + ", creditCardInformation="
				+ creditCardInformation + ", createdDate=" + createdDate + ", transactionAmount=" + transactionAmount
				+ "]";
	}
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((TransactionMethod == null) ? 0 : TransactionMethod.hashCode());
		result = prime * result + ((bankAccountInformation == null) ? 0 : bankAccountInformation.hashCode());
		result = prime * result + ((companyName == null) ? 0 : companyName.hashCode());
		result = prime * result + ((createdDate == null) ? 0 : createdDate.hashCode());
		result = prime * result + ((creditCardInformation == null) ? 0 : creditCardInformation.hashCode());
		result = prime * result + ((email == null) ? 0 : email.hashCode());
		result = prime * result + ((firstName == null) ? 0 : firstName.hashCode());
		result = prime * result + ((lastName == null) ? 0 : lastName.hashCode());
		result = prime * result + ((phoneNumber == null) ? 0 : phoneNumber.hashCode());
		long temp;
		temp = Double.doubleToLongBits(transactionAmount);
		result = prime * result + (int) (temp ^ (temp >>> 32));
		result = prime * result + ((userId == null) ? 0 : userId.hashCode());
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
		ZumRailsUser other = (ZumRailsUser) obj;
		if (TransactionMethod == null) {
			if (other.TransactionMethod != null)
				return false;
		} else if (!TransactionMethod.equals(other.TransactionMethod))
			return false;
		if (bankAccountInformation == null) {
			if (other.bankAccountInformation != null)
				return false;
		} else if (!bankAccountInformation.equals(other.bankAccountInformation))
			return false;
		if (companyName == null) {
			if (other.companyName != null)
				return false;
		} else if (!companyName.equals(other.companyName))
			return false;
		if (createdDate == null) {
			if (other.createdDate != null)
				return false;
		} else if (!createdDate.equals(other.createdDate))
			return false;
		if (creditCardInformation == null) {
			if (other.creditCardInformation != null)
				return false;
		} else if (!creditCardInformation.equals(other.creditCardInformation))
			return false;
		if (email == null) {
			if (other.email != null)
				return false;
		} else if (!email.equals(other.email))
			return false;
		if (firstName == null) {
			if (other.firstName != null)
				return false;
		} else if (!firstName.equals(other.firstName))
			return false;
		if (lastName == null) {
			if (other.lastName != null)
				return false;
		} else if (!lastName.equals(other.lastName))
			return false;
		if (phoneNumber == null) {
			if (other.phoneNumber != null)
				return false;
		} else if (!phoneNumber.equals(other.phoneNumber))
			return false;
		if (Double.doubleToLongBits(transactionAmount) != Double.doubleToLongBits(other.transactionAmount))
			return false;
		if (userId == null) {
			if (other.userId != null)
				return false;
		} else if (!userId.equals(other.userId))
			return false;
		return true;
	}
	
	
	}
