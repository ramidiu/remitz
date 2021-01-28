package com.kws.unitedfintech.underremitentities;

import java.io.Serializable;

public class Customer  implements Serializable {

	private static final long serialVersionUID = 1L;
	private String Id;
	private String CompanyName;
	public String getId() {
		return Id;
	}
	public void setId(String id) {
		Id = id;
	}
	public String getCompanyName() {
		return CompanyName;
	}
	public void setCompanyName(String companyName) {
		CompanyName = companyName;
	}
	@Override
	public String toString() {
		return "Customer [Id=" + Id + ", CompanyName=" + CompanyName + "]";
	}
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((CompanyName == null) ? 0 : CompanyName.hashCode());
		result = prime * result + ((Id == null) ? 0 : Id.hashCode());
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
		Customer other = (Customer) obj;
		if (CompanyName == null) {
			if (other.CompanyName != null)
				return false;
		} else if (!CompanyName.equals(other.CompanyName))
			return false;
		if (Id == null) {
			if (other.Id != null)
				return false;
		} else if (!Id.equals(other.Id))
			return false;
		return true;
	}
	
	
}
