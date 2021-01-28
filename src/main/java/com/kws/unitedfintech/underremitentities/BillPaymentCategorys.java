package com.kws.unitedfintech.underremitentities;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
@Entity
@Table(name="billpayment_categorys")
public class BillPaymentCategorys implements Serializable{

	private static final long serialVersionUID = 1L;

	@Id
	@Column(name="billpaymentcategory_id",nullable = false)
	private String billPaymentcategoryId;
	@Column(name="biller_code",nullable = false)
	private String billerCode;
	@Column(name="name",nullable = false)
	private String name;
	@Column(name="default_commission",nullable = false)
	private String defaultCommission;
	@Column(name="date_added",nullable = false)
	private String dateAdded;
	@Column(name="country",nullable = false)
	private String country;
	@Column(name="is_airtime",nullable = false,columnDefinition = "varchar(200)")
	private String  isAirtime;
	@Column(name="biller_name",nullable = false)
	private String billerName;
	@Column(name="item_code",nullable = false)
	private String itemCode;
	@Column(name="short_name",nullable = false)
	private String  shortName;
	@Column(name="fee",nullable = false)
	private double fee;
	@Column(name="commission_on_fee",nullable = false)
	private String commisionOnFee;
	@Column(name="label_name",nullable = false)
	private String labelName;
	@Column(name="amount",nullable = false)
	private double amount;
	public String getBillPaymentcategoryId() {
		return billPaymentcategoryId;
	}
	public void setBillPaymentcategoryId(String billPaymentcategoryId) {
		this.billPaymentcategoryId = billPaymentcategoryId;
	}
	public String getBillerCode() {
		return billerCode;
	}
	public void setBillerCode(String billerCode) {
		this.billerCode = billerCode;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getDefaultCommission() {
		return defaultCommission;
	}
	public void setDefaultCommission(String defaultCommission) {
		this.defaultCommission = defaultCommission;
	}
	public String getDateAdded() {
		return dateAdded;
	}
	public void setDateAdded(String dateAdded) {
		this.dateAdded = dateAdded;
	}
	public String getCountry() {
		return country;
	}
	public void setCountry(String country) {
		this.country = country;
	}
	public String getIsAirtime() {
		return isAirtime;
	}
	public void setIsAirtime(String isAirtime) {
		this.isAirtime = isAirtime;
	}
	public String getBillerName() {
		return billerName;
	}
	public void setBillerName(String billerName) {
		this.billerName = billerName;
	}
	public String getItemCode() {
		return itemCode;
	}
	public void setItemCode(String itemCode) {
		this.itemCode = itemCode;
	}
	public String getShortName() {
		return shortName;
	}
	public void setShortName(String shortName) {
		this.shortName = shortName;
	}
	public double getFee() {
		return fee;
	}
	public void setFee(double fee) {
		this.fee = fee;
	}
	public String getCommisionOnFee() {
		return commisionOnFee;
	}
	public void setCommisionOnFee(String commisionOnFee) {
		this.commisionOnFee = commisionOnFee;
	}
	public String getLabelName() {
		return labelName;
	}
	public void setLabelName(String labelName) {
		this.labelName = labelName;
	}
	public double getAmount() {
		return amount;
	}
	public void setAmount(double amount) {
		this.amount = amount;
	}
	@Override
	public String toString() {
		return "BillPaymentCategorys [billPaymentcategoryId=" + billPaymentcategoryId + ", billerCode=" + billerCode
				+ ", name=" + name + ", defaultCommission=" + defaultCommission + ", dateAdded=" + dateAdded
				+ ", country=" + country + ", isAirtime=" + isAirtime + ", billerName=" + billerName + ", itemCode="
				+ itemCode + ", shortName=" + shortName + ", fee=" + fee + ", commisionOnFee=" + commisionOnFee
				+ ", labelName=" + labelName + ", amount=" + amount + "]";
	}
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		long temp;
		temp = Double.doubleToLongBits(amount);
		result = prime * result + (int) (temp ^ (temp >>> 32));
		result = prime * result + ((billPaymentcategoryId == null) ? 0 : billPaymentcategoryId.hashCode());
		result = prime * result + ((billerCode == null) ? 0 : billerCode.hashCode());
		result = prime * result + ((billerName == null) ? 0 : billerName.hashCode());
		result = prime * result + ((commisionOnFee == null) ? 0 : commisionOnFee.hashCode());
		result = prime * result + ((country == null) ? 0 : country.hashCode());
		result = prime * result + ((dateAdded == null) ? 0 : dateAdded.hashCode());
		result = prime * result + ((defaultCommission == null) ? 0 : defaultCommission.hashCode());
		temp = Double.doubleToLongBits(fee);
		result = prime * result + (int) (temp ^ (temp >>> 32));
		result = prime * result + ((isAirtime == null) ? 0 : isAirtime.hashCode());
		result = prime * result + ((itemCode == null) ? 0 : itemCode.hashCode());
		result = prime * result + ((labelName == null) ? 0 : labelName.hashCode());
		result = prime * result + ((name == null) ? 0 : name.hashCode());
		result = prime * result + ((shortName == null) ? 0 : shortName.hashCode());
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
		BillPaymentCategorys other = (BillPaymentCategorys) obj;
		if (Double.doubleToLongBits(amount) != Double.doubleToLongBits(other.amount))
			return false;
		if (billPaymentcategoryId == null) {
			if (other.billPaymentcategoryId != null)
				return false;
		} else if (!billPaymentcategoryId.equals(other.billPaymentcategoryId))
			return false;
		if (billerCode == null) {
			if (other.billerCode != null)
				return false;
		} else if (!billerCode.equals(other.billerCode))
			return false;
		if (billerName == null) {
			if (other.billerName != null)
				return false;
		} else if (!billerName.equals(other.billerName))
			return false;
		if (commisionOnFee == null) {
			if (other.commisionOnFee != null)
				return false;
		} else if (!commisionOnFee.equals(other.commisionOnFee))
			return false;
		if (country == null) {
			if (other.country != null)
				return false;
		} else if (!country.equals(other.country))
			return false;
		if (dateAdded == null) {
			if (other.dateAdded != null)
				return false;
		} else if (!dateAdded.equals(other.dateAdded))
			return false;
		if (defaultCommission == null) {
			if (other.defaultCommission != null)
				return false;
		} else if (!defaultCommission.equals(other.defaultCommission))
			return false;
		if (Double.doubleToLongBits(fee) != Double.doubleToLongBits(other.fee))
			return false;
		if (isAirtime == null) {
			if (other.isAirtime != null)
				return false;
		} else if (!isAirtime.equals(other.isAirtime))
			return false;
		if (itemCode == null) {
			if (other.itemCode != null)
				return false;
		} else if (!itemCode.equals(other.itemCode))
			return false;
		if (labelName == null) {
			if (other.labelName != null)
				return false;
		} else if (!labelName.equals(other.labelName))
			return false;
		if (name == null) {
			if (other.name != null)
				return false;
		} else if (!name.equals(other.name))
			return false;
		if (shortName == null) {
			if (other.shortName != null)
				return false;
		} else if (!shortName.equals(other.shortName))
			return false;
		return true;
	}
	
}
