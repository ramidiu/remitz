package com.kws.unitedfintech.underremitentities;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
@Entity
@Table(name = "bulktransfer_response")
public class BulkTransferResponse  implements Serializable{

	private static final long serialVersionUID = 1L;
	@Id
	@Column(name = "trnsfer_response_id")
	private String trnsferResponseId;
	@Column(name="status",nullable = false)
	private String status;
	@Column(name="message",nullable = false)
	private String message;
	@Column(name="created_at",nullable = false)
	private String  createdDate;
	@Column(name="approver",nullable = false)
	private String approver;
	public String getTrnsferResponseId() {
		return trnsferResponseId;
	}
	public void setTrnsferResponseId(String trnsferResponseId) {
		this.trnsferResponseId = trnsferResponseId;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}
	public String getCreatedDate() {
		return createdDate;
	}
	public void setCreatedDate(String createdDate) {
		this.createdDate = createdDate;
	}
	public String getApprover() {
		return approver;
	}
	public void setApprover(String approver) {
		this.approver = approver;
	}
	@Override
	public String toString() {
		return "BulkTransferResponse [trnsferResponseId=" + trnsferResponseId + ", status=" + status + ", message="
				+ message + ", createdDate=" + createdDate + ", approver=" + approver + "]";
	}
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((approver == null) ? 0 : approver.hashCode());
		result = prime * result + ((createdDate == null) ? 0 : createdDate.hashCode());
		result = prime * result + ((message == null) ? 0 : message.hashCode());
		result = prime * result + ((status == null) ? 0 : status.hashCode());
		result = prime * result + ((trnsferResponseId == null) ? 0 : trnsferResponseId.hashCode());
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
		BulkTransferResponse other = (BulkTransferResponse) obj;
		if (approver == null) {
			if (other.approver != null)
				return false;
		} else if (!approver.equals(other.approver))
			return false;
		if (createdDate == null) {
			if (other.createdDate != null)
				return false;
		} else if (!createdDate.equals(other.createdDate))
			return false;
		if (message == null) {
			if (other.message != null)
				return false;
		} else if (!message.equals(other.message))
			return false;
		if (status == null) {
			if (other.status != null)
				return false;
		} else if (!status.equals(other.status))
			return false;
		if (trnsferResponseId == null) {
			if (other.trnsferResponseId != null)
				return false;
		} else if (!trnsferResponseId.equals(other.trnsferResponseId))
			return false;
		return true;
	}
    
}

