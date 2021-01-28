package com.kws.unitedfintech.underremitentities;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
@Entity
@Table(name="creditcard_information")
public class CreditCardInformation implements Serializable {
	private static final long serialVersionUID = 1L;
	@Id
	@Column(name="creditcard_informationid")
    private String creditCardInformationId;
	@Column(name="creditcard_number",nullable = false)
	private String Number;
	@Column(name="expire_month",nullable = false)
	private String ExpireMonth;
	@Column(name="expire_year",nullable = false)
    private String ExpireYear;
	@Column(name="cvv",nullable = false)
    private String CVV;
	@Column(name="addressline1",nullable = false)
    private String AddressLine1;
	@Column(name="addressline2",nullable = false)
    private String AddressLine2;
	@Column(name="address_postalcode",nullable = false)
    private String AddressPostalCode;
	@Column(name="address_country",nullable = false)
    private String AddressCountry;
	@Column(name="address_city",nullable = false)
    private String AddressCity;
	@Column(name="address_state",nullable = false)
    private String AddressState;
	@Column(name="created_date",nullable = false)
	private String createdDate;
	public String getCreditCardInformationId() {
		return creditCardInformationId;
	}
	public void setCreditCardInformationId(String creditCardInformationId) {
		this.creditCardInformationId = creditCardInformationId;
	}
	public String getNumber() {
		return Number;
	}
	public void setNumber(String number) {
		Number = number;
	}
	public String getExpireMonth() {
		return ExpireMonth;
	}
	public void setExpireMonth(String expireMonth) {
		ExpireMonth = expireMonth;
	}
	public String getExpireYear() {
		return ExpireYear;
	}
	public void setExpireYear(String expireYear) {
		ExpireYear = expireYear;
	}
	public String getCVV() {
		return CVV;
	}
	public void setCVV(String cVV) {
		CVV = cVV;
	}
	public String getAddressLine1() {
		return AddressLine1;
	}
	public void setAddressLine1(String addressLine1) {
		AddressLine1 = addressLine1;
	}
	public String getAddressLine2() {
		return AddressLine2;
	}
	public void setAddressLine2(String addressLine2) {
		AddressLine2 = addressLine2;
	}
	public String getAddressPostalCode() {
		return AddressPostalCode;
	}
	public void setAddressPostalCode(String addressPostalCode) {
		AddressPostalCode = addressPostalCode;
	}
	public String getAddressCountry() {
		return AddressCountry;
	}
	public void setAddressCountry(String addressCountry) {
		AddressCountry = addressCountry;
	}
	public String getAddressCity() {
		return AddressCity;
	}
	public void setAddressCity(String addressCity) {
		AddressCity = addressCity;
	}
	public String getAddressState() {
		return AddressState;
	}
	public void setAddressState(String addressState) {
		AddressState = addressState;
	}
	public String getCreatedDate() {
		return createdDate;
	}
	public void setCreatedDate(String createdDate) {
		this.createdDate = createdDate;
	}
	@Override
	public String toString() {
		return "CreditCardInformation [creditCardInformationId=" + creditCardInformationId + ", Number=" + Number
				+ ", ExpireMonth=" + ExpireMonth + ", ExpireYear=" + ExpireYear + ", CVV=" + CVV + ", AddressLine1="
				+ AddressLine1 + ", AddressLine2=" + AddressLine2 + ", AddressPostalCode=" + AddressPostalCode
				+ ", AddressCountry=" + AddressCountry + ", AddressCity=" + AddressCity + ", AddressState="
				+ AddressState + ", createdDate=" + createdDate + "]";
	}
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((AddressCity == null) ? 0 : AddressCity.hashCode());
		result = prime * result + ((AddressCountry == null) ? 0 : AddressCountry.hashCode());
		result = prime * result + ((AddressLine1 == null) ? 0 : AddressLine1.hashCode());
		result = prime * result + ((AddressLine2 == null) ? 0 : AddressLine2.hashCode());
		result = prime * result + ((AddressPostalCode == null) ? 0 : AddressPostalCode.hashCode());
		result = prime * result + ((AddressState == null) ? 0 : AddressState.hashCode());
		result = prime * result + ((CVV == null) ? 0 : CVV.hashCode());
		result = prime * result + ((ExpireMonth == null) ? 0 : ExpireMonth.hashCode());
		result = prime * result + ((ExpireYear == null) ? 0 : ExpireYear.hashCode());
		result = prime * result + ((Number == null) ? 0 : Number.hashCode());
		result = prime * result + ((createdDate == null) ? 0 : createdDate.hashCode());
		result = prime * result + ((creditCardInformationId == null) ? 0 : creditCardInformationId.hashCode());
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
		CreditCardInformation other = (CreditCardInformation) obj;
		if (AddressCity == null) {
			if (other.AddressCity != null)
				return false;
		} else if (!AddressCity.equals(other.AddressCity))
			return false;
		if (AddressCountry == null) {
			if (other.AddressCountry != null)
				return false;
		} else if (!AddressCountry.equals(other.AddressCountry))
			return false;
		if (AddressLine1 == null) {
			if (other.AddressLine1 != null)
				return false;
		} else if (!AddressLine1.equals(other.AddressLine1))
			return false;
		if (AddressLine2 == null) {
			if (other.AddressLine2 != null)
				return false;
		} else if (!AddressLine2.equals(other.AddressLine2))
			return false;
		if (AddressPostalCode == null) {
			if (other.AddressPostalCode != null)
				return false;
		} else if (!AddressPostalCode.equals(other.AddressPostalCode))
			return false;
		if (AddressState == null) {
			if (other.AddressState != null)
				return false;
		} else if (!AddressState.equals(other.AddressState))
			return false;
		if (CVV == null) {
			if (other.CVV != null)
				return false;
		} else if (!CVV.equals(other.CVV))
			return false;
		if (ExpireMonth == null) {
			if (other.ExpireMonth != null)
				return false;
		} else if (!ExpireMonth.equals(other.ExpireMonth))
			return false;
		if (ExpireYear == null) {
			if (other.ExpireYear != null)
				return false;
		} else if (!ExpireYear.equals(other.ExpireYear))
			return false;
		if (Number == null) {
			if (other.Number != null)
				return false;
		} else if (!Number.equals(other.Number))
			return false;
		if (createdDate == null) {
			if (other.createdDate != null)
				return false;
		} else if (!createdDate.equals(other.createdDate))
			return false;
		if (creditCardInformationId == null) {
			if (other.creditCardInformationId != null)
				return false;
		} else if (!creditCardInformationId.equals(other.creditCardInformationId))
			return false;
		return true;
	}
	
}
