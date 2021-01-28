package com.kws.unitedfintech.underremitentities;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="zumrails_transaction")
public class ZumRailsTransaction implements Serializable {
	private static final long serialVersionUID = 1L;
	@Id
	@Column(name="transaction_id",nullable = false)
	private String transactionId;
	@Column(name="created_at",nullable = false)
	private String createdAt;
	@Column(name="memo",nullable = false)
	private String Memo;
	@Column(name="comment",nullable = false)
	private String  comment;
	@Column(name="amount",nullable = false)
	private  double  amount;
	@Column(name="customer_id",nullable = false)
	private String customerId;
	@Column(name="company_name",nullable = false)
	private String companyName;
	@Column(name="user_id")
	private String userId;
	@Column(name="user_firstname",nullable = false)
	private String userFirstName;
	@Column(name="user_lastname",nullable = false)
	private String userLastName;
	@Column(name="wallet_id",nullable = false)
	private String walletId;
	@Column(name="type",nullable = false)
	private String type;
	@Column(name="target_wallet",nullable = false)
	private String TargetWallet;
	@Column(name="funding_source",nullable = false)
	private String fundingSource;
	@Column(name="zumrails_type",nullable = false)
	private String zumRailsType;
	@Column(name="transaction_historyid",nullable = false)
	private String transctionHistoryId;
	@Column(name="transactionhistory_createdat",nullable = false)
	private String transactionHistoryCreatedAt;
	@Column(name="event",nullable = false)
	private String event;
	@Column(name="event_description",nullable = false)
	private String eventDescription;
	@Column(name="transaction_status",nullable = false)
	private String transactionStatus;
	@Column(name="failed_transaction_event",nullable = false)
	private String failedTransactionEvent;
	@Column(name="transaction_from",nullable = false)
	private String transactionFrom;
	@Column(name="transaction_to",nullable = false)
	private String transactionTo;
	@Column(name="recurrent_transactionid",nullable = false)
	private String recurrentTransactionId;
	@Column(name="faileddue_internalriskanalysis",nullable = false)
	private String failedDueInternalRiskAnalysis;
	public String getTransactionId() {
		return transactionId;
	}
	public void setTransactionId(String transactionId) {
		this.transactionId = transactionId;
	}
	public String getCreatedAt() {
		return createdAt;
	}
	public void setCreatedAt(String createdAt) {
		this.createdAt = createdAt;
	}
	public String getMemo() {
		return Memo;
	}
	public void setMemo(String memo) {
		Memo = memo;
	}
	public String getComment() {
		return comment;
	}
	public void setComment(String comment) {
		this.comment = comment;
	}
	public double getAmount() {
		return amount;
	}
	public void setAmount(double amount) {
		this.amount = amount;
	}
	public String getCustomerId() {
		return customerId;
	}
	public void setCustomerId(String customerId) {
		this.customerId = customerId;
	}
	public String getCompanyName() {
		return companyName;
	}
	public void setCompanyName(String companyName) {
		this.companyName = companyName;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getUserFirstName() {
		return userFirstName;
	}
	public void setUserFirstName(String userFirstName) {
		this.userFirstName = userFirstName;
	}
	public String getUserLastName() {
		return userLastName;
	}
	public void setUserLastName(String userLastName) {
		this.userLastName = userLastName;
	}
	public String getWalletId() {
		return walletId;
	}
	public void setWalletId(String walletId) {
		this.walletId = walletId;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getTargetWallet() {
		return TargetWallet;
	}
	public void setTargetWallet(String targetWallet) {
		TargetWallet = targetWallet;
	}
	public String getFundingSource() {
		return fundingSource;
	}
	public void setFundingSource(String fundingSource) {
		this.fundingSource = fundingSource;
	}
	public String getZumRailsType() {
		return zumRailsType;
	}
	public void setZumRailsType(String zumRailsType) {
		this.zumRailsType = zumRailsType;
	}
	public String getTransctionHistoryId() {
		return transctionHistoryId;
	}
	public void setTransctionHistoryId(String transctionHistoryId) {
		this.transctionHistoryId = transctionHistoryId;
	}
	public String getTransactionHistoryCreatedAt() {
		return transactionHistoryCreatedAt;
	}
	public void setTransactionHistoryCreatedAt(String transactionHistoryCreatedAt) {
		this.transactionHistoryCreatedAt = transactionHistoryCreatedAt;
	}
	public String getEvent() {
		return event;
	}
	public void setEvent(String event) {
		this.event = event;
	}
	public String getEventDescription() {
		return eventDescription;
	}
	public void setEventDescription(String eventDescription) {
		this.eventDescription = eventDescription;
	}
	public String getTransactionStatus() {
		return transactionStatus;
	}
	public void setTransactionStatus(String transactionStatus) {
		this.transactionStatus = transactionStatus;
	}
	public String getFailedTransactionEvent() {
		return failedTransactionEvent;
	}
	public void setFailedTransactionEvent(String failedTransactionEvent) {
		this.failedTransactionEvent = failedTransactionEvent;
	}
	public String getTransactionFrom() {
		return transactionFrom;
	}
	public void setTransactionFrom(String transactionFrom) {
		this.transactionFrom = transactionFrom;
	}
	public String getTransactionTo() {
		return transactionTo;
	}
	public void setTransactionTo(String transactionTo) {
		this.transactionTo = transactionTo;
	}
	public String getRecurrentTransactionId() {
		return recurrentTransactionId;
	}
	public void setRecurrentTransactionId(String recurrentTransactionId) {
		this.recurrentTransactionId = recurrentTransactionId;
	}
	public String getFailedDueInternalRiskAnalysis() {
		return failedDueInternalRiskAnalysis;
	}
	public void setFailedDueInternalRiskAnalysis(String failedDueInternalRiskAnalysis) {
		this.failedDueInternalRiskAnalysis = failedDueInternalRiskAnalysis;
	}
	@Override
	public String toString() {
		return "ZumRailsTransaction [transactionId=" + transactionId + ", createdAt=" + createdAt + ", Memo=" + Memo
				+ ", comment=" + comment + ", amount=" + amount + ", customerId=" + customerId + ", companyName="
				+ companyName + ", userId=" + userId + ", userFirstName=" + userFirstName + ", userLastName="
				+ userLastName + ", walletId=" + walletId + ", type=" + type + ", TargetWallet=" + TargetWallet
				+ ", fundingSource=" + fundingSource + ", zumRailsType=" + zumRailsType + ", transctionHistoryId="
				+ transctionHistoryId + ", transactionHistoryCreatedAt=" + transactionHistoryCreatedAt + ", event="
				+ event + ", eventDescription=" + eventDescription + ", transactionStatus=" + transactionStatus
				+ ", failedTransactionEvent=" + failedTransactionEvent + ", transactionFrom=" + transactionFrom
				+ ", transactionTo=" + transactionTo + ", recurrentTransactionId=" + recurrentTransactionId
				+ ", failedDueInternalRiskAnalysis=" + failedDueInternalRiskAnalysis + "]";
	}
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((Memo == null) ? 0 : Memo.hashCode());
		result = prime * result + ((TargetWallet == null) ? 0 : TargetWallet.hashCode());
		long temp;
		temp = Double.doubleToLongBits(amount);
		result = prime * result + (int) (temp ^ (temp >>> 32));
		result = prime * result + ((comment == null) ? 0 : comment.hashCode());
		result = prime * result + ((companyName == null) ? 0 : companyName.hashCode());
		result = prime * result + ((createdAt == null) ? 0 : createdAt.hashCode());
		result = prime * result + ((customerId == null) ? 0 : customerId.hashCode());
		result = prime * result + ((event == null) ? 0 : event.hashCode());
		result = prime * result + ((eventDescription == null) ? 0 : eventDescription.hashCode());
		result = prime * result
				+ ((failedDueInternalRiskAnalysis == null) ? 0 : failedDueInternalRiskAnalysis.hashCode());
		result = prime * result + ((failedTransactionEvent == null) ? 0 : failedTransactionEvent.hashCode());
		result = prime * result + ((fundingSource == null) ? 0 : fundingSource.hashCode());
		result = prime * result + ((recurrentTransactionId == null) ? 0 : recurrentTransactionId.hashCode());
		result = prime * result + ((transactionFrom == null) ? 0 : transactionFrom.hashCode());
		result = prime * result + ((transactionHistoryCreatedAt == null) ? 0 : transactionHistoryCreatedAt.hashCode());
		result = prime * result + ((transactionId == null) ? 0 : transactionId.hashCode());
		result = prime * result + ((transactionStatus == null) ? 0 : transactionStatus.hashCode());
		result = prime * result + ((transactionTo == null) ? 0 : transactionTo.hashCode());
		result = prime * result + ((transctionHistoryId == null) ? 0 : transctionHistoryId.hashCode());
		result = prime * result + ((type == null) ? 0 : type.hashCode());
		result = prime * result + ((userFirstName == null) ? 0 : userFirstName.hashCode());
		result = prime * result + ((userId == null) ? 0 : userId.hashCode());
		result = prime * result + ((userLastName == null) ? 0 : userLastName.hashCode());
		result = prime * result + ((walletId == null) ? 0 : walletId.hashCode());
		result = prime * result + ((zumRailsType == null) ? 0 : zumRailsType.hashCode());
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
		ZumRailsTransaction other = (ZumRailsTransaction) obj;
		if (Memo == null) {
			if (other.Memo != null)
				return false;
		} else if (!Memo.equals(other.Memo))
			return false;
		if (TargetWallet == null) {
			if (other.TargetWallet != null)
				return false;
		} else if (!TargetWallet.equals(other.TargetWallet))
			return false;
		if (Double.doubleToLongBits(amount) != Double.doubleToLongBits(other.amount))
			return false;
		if (comment == null) {
			if (other.comment != null)
				return false;
		} else if (!comment.equals(other.comment))
			return false;
		if (companyName == null) {
			if (other.companyName != null)
				return false;
		} else if (!companyName.equals(other.companyName))
			return false;
		if (createdAt == null) {
			if (other.createdAt != null)
				return false;
		} else if (!createdAt.equals(other.createdAt))
			return false;
		if (customerId == null) {
			if (other.customerId != null)
				return false;
		} else if (!customerId.equals(other.customerId))
			return false;
		if (event == null) {
			if (other.event != null)
				return false;
		} else if (!event.equals(other.event))
			return false;
		if (eventDescription == null) {
			if (other.eventDescription != null)
				return false;
		} else if (!eventDescription.equals(other.eventDescription))
			return false;
		if (failedDueInternalRiskAnalysis == null) {
			if (other.failedDueInternalRiskAnalysis != null)
				return false;
		} else if (!failedDueInternalRiskAnalysis.equals(other.failedDueInternalRiskAnalysis))
			return false;
		if (failedTransactionEvent == null) {
			if (other.failedTransactionEvent != null)
				return false;
		} else if (!failedTransactionEvent.equals(other.failedTransactionEvent))
			return false;
		if (fundingSource == null) {
			if (other.fundingSource != null)
				return false;
		} else if (!fundingSource.equals(other.fundingSource))
			return false;
		if (recurrentTransactionId == null) {
			if (other.recurrentTransactionId != null)
				return false;
		} else if (!recurrentTransactionId.equals(other.recurrentTransactionId))
			return false;
		if (transactionFrom == null) {
			if (other.transactionFrom != null)
				return false;
		} else if (!transactionFrom.equals(other.transactionFrom))
			return false;
		if (transactionHistoryCreatedAt == null) {
			if (other.transactionHistoryCreatedAt != null)
				return false;
		} else if (!transactionHistoryCreatedAt.equals(other.transactionHistoryCreatedAt))
			return false;
		if (transactionId == null) {
			if (other.transactionId != null)
				return false;
		} else if (!transactionId.equals(other.transactionId))
			return false;
		if (transactionStatus == null) {
			if (other.transactionStatus != null)
				return false;
		} else if (!transactionStatus.equals(other.transactionStatus))
			return false;
		if (transactionTo == null) {
			if (other.transactionTo != null)
				return false;
		} else if (!transactionTo.equals(other.transactionTo))
			return false;
		if (transctionHistoryId == null) {
			if (other.transctionHistoryId != null)
				return false;
		} else if (!transctionHistoryId.equals(other.transctionHistoryId))
			return false;
		if (type == null) {
			if (other.type != null)
				return false;
		} else if (!type.equals(other.type))
			return false;
		if (userFirstName == null) {
			if (other.userFirstName != null)
				return false;
		} else if (!userFirstName.equals(other.userFirstName))
			return false;
		if (userId == null) {
			if (other.userId != null)
				return false;
		} else if (!userId.equals(other.userId))
			return false;
		if (userLastName == null) {
			if (other.userLastName != null)
				return false;
		} else if (!userLastName.equals(other.userLastName))
			return false;
		if (walletId == null) {
			if (other.walletId != null)
				return false;
		} else if (!walletId.equals(other.walletId))
			return false;
		if (zumRailsType == null) {
			if (other.zumRailsType != null)
				return false;
		} else if (!zumRailsType.equals(other.zumRailsType))
			return false;
		return true;
	}
	
}

