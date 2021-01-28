package com.kws.unitedfintech.underremitentities;

import java.io.Serializable;
import java.util.List;

public class BulkTransferData implements Serializable {

  	
	private static final long serialVersionUID = 1L;
	private String title;
	private List<bulk_data>  bulk_data;
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public List<bulk_data> getBulk_data() {
		return bulk_data;
	}
	public void setBulk_data(List<bulk_data> bulk_data) {
		this.bulk_data = bulk_data;
	}
	@Override
	public String toString() {
		return "BulkTransferData [title=" + title + ", bulk_data=" + bulk_data + "]";
	}
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((bulk_data == null) ? 0 : bulk_data.hashCode());
		result = prime * result + ((title == null) ? 0 : title.hashCode());
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
		BulkTransferData other = (BulkTransferData) obj;
		if (bulk_data == null) {
			if (other.bulk_data != null)
				return false;
		} else if (!bulk_data.equals(other.bulk_data))
			return false;
		if (title == null) {
			if (other.title != null)
				return false;
		} else if (!title.equals(other.title))
			return false;
		return true;
	}
	
}
