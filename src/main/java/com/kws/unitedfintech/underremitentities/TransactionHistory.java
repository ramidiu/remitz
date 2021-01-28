package com.kws.unitedfintech.underremitentities;

import java.io.Serializable;

public class TransactionHistory implements Serializable{
	private static final long serialVersionUID = 1L;
	private String Id;
	private String CreatedAt;
	private String Event;
	private String EventDescription;
	public String getId() {
		return Id;
	}
	public void setId(String id) {
		Id = id;
	}
	public String getCreatedAt() {
		return CreatedAt;
	}
	public void setCreatedAt(String createdAt) {
		CreatedAt = createdAt;
	}
	public String getEvent() {
		return Event;
	}
	public void setEvent(String event) {
		Event = event;
	}
	public String getEventDescription() {
		return EventDescription;
	}
	public void setEventDescription(String eventDescription) {
		EventDescription = eventDescription;
	}
	@Override
	public String toString() {
		return "TransactionHistory [Id=" + Id + ", CreatedAt=" + CreatedAt + ", Event=" + Event + ", EventDescription="
				+ EventDescription + "]";
	}
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((CreatedAt == null) ? 0 : CreatedAt.hashCode());
		result = prime * result + ((Event == null) ? 0 : Event.hashCode());
		result = prime * result + ((EventDescription == null) ? 0 : EventDescription.hashCode());
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
		TransactionHistory other = (TransactionHistory) obj;
		if (CreatedAt == null) {
			if (other.CreatedAt != null)
				return false;
		} else if (!CreatedAt.equals(other.CreatedAt))
			return false;
		if (Event == null) {
			if (other.Event != null)
				return false;
		} else if (!Event.equals(other.Event))
			return false;
		if (EventDescription == null) {
			if (other.EventDescription != null)
				return false;
		} else if (!EventDescription.equals(other.EventDescription))
			return false;
		if (Id == null) {
			if (other.Id != null)
				return false;
		} else if (!Id.equals(other.Id))
			return false;
		return true;
	}
	
	
	
}
