package com.kws.unitedfintech.underremitentities;

import java.io.Serializable;

public class FxRateResponse  implements Serializable{

	private static final long serialVersionUID = 1L;
	private String status;
	private String message;
	private data data;
	private from from;
	private to to;
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
	public data getData() {
		return data;
	}
	public void setData(data data) {
		this.data = data;
	}
	public from getFrom() {
		return from;
	}
	public void setFrom(from from) {
		this.from = from;
	}
	public to getTo() {
		return to;
	}
	public void setTo(to to) {
		this.to = to;
	}
	@Override
	public String toString() {
		return "FxRateResamountonse [status=" + status + ", message=" + message + ", data=" + data + ", from=" + from
				+ ", to=" + to + "]";
	}
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((data == null) ? 0 : data.hashCode());
		result = prime * result + ((from == null) ? 0 : from.hashCode());
		result = prime * result + ((message == null) ? 0 : message.hashCode());
		result = prime * result + ((status == null) ? 0 : status.hashCode());
		result = prime * result + ((to == null) ? 0 : to.hashCode());
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
		FxRateResponse other = (FxRateResponse) obj;
		if (data == null) {
			if (other.data != null)
				return false;
		} else if (!data.equals(other.data))
			return false;
		if (from == null) {
			if (other.from != null)
				return false;
		} else if (!from.equals(other.from))
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
		if (to == null) {
			if (other.to != null)
				return false;
		} else if (!to.equals(other.to))
			return false;
		return true;
	}
	
}
