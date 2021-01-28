package com.kws.unitedfintech.underremitentities;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;
@Entity
@Table(name="transfer_response")
public class TransferResponse implements Serializable{

	@Id
	@Column(name="transferresponse_id")
	private String transferResponseId;
	@Column(name="common_status")
	private String commonStatus;
	private String message;
	@Column(name="account_number")
	private String accountNumber;
	@Column(name="bank_code")
	private String bankCode;
	@Column(name="full_name")
	private String fullName;
	@Column(name="created_at")
	private String createdDate;
	private String currency;
	@Column(name="debit_currency")
	private String debitCurrency;
	private String amount;
	private String fee;
	private String reference;
	private String narration;
	@Column(name="complete_message")
	private String completedMessage;
	@Column(name="requires_approval")
	private String requiredApproval;
	@Column(name="is_approved")
	private String isApproved;
	@Column(name="bank_name")
	private String bankName;
	@Column(name="data_status")
	private String dataStatus;
	@Transient
	private String status;
	public String getTransferResponseId() {
		return transferResponseId;
	}
	public void setTransferResponseId(String transferResponseId) {
		this.transferResponseId = transferResponseId;
	}
	public String getCommonStatus() {
		return commonStatus;
	}
	public void setCommonStatus(String commonStatus) {
		this.commonStatus = commonStatus;
	}
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}
	public String getAccountNumber() {
		return accountNumber;
	}
	public void setAccountNumber(String accountNumber) {
		this.accountNumber = accountNumber;
	}
	public String getBankCode() {
		return bankCode;
	}
	public void setBankCode(String bankCode) {
		this.bankCode = bankCode;
	}
	public String getFullName() {
		return fullName;
	}
	public void setFullName(String fullName) {
		this.fullName = fullName;
	}
	public String getCreatedDate() {
		return createdDate;
	}
	public void setCreatedDate(String createdDate) {
		this.createdDate = createdDate;
	}
	public String getCurrency() {
		return currency;
	}
	public void setCurrency(String currency) {
		this.currency = currency;
	}
	public String getDebitCurrency() {
		return debitCurrency;
	}
	public void setDebitCurrency(String debitCurrency) {
		this.debitCurrency = debitCurrency;
	}
	public String getAmount() {
		return amount;
	}
	public void setAmount(String amount) {
		this.amount = amount;
	}
	public String getFee() {
		return fee;
	}
	public void setFee(String fee) {
		this.fee = fee;
	}
	public String getReference() {
		return reference;
	}
	public void setReference(String reference) {
		this.reference = reference;
	}
	public String getNarration() {
		return narration;
	}
	public void setNarration(String narration) {
		this.narration = narration;
	}
	public String getCompletedMessage() {
		return completedMessage;
	}
	public void setCompletedMessage(String completedMessage) {
		this.completedMessage = completedMessage;
	}
	public String getRequiredApproval() {
		return requiredApproval;
	}
	public void setRequiredApproval(String requiredApproval) {
		this.requiredApproval = requiredApproval;
	}
	public String getIsApproved() {
		return isApproved;
	}
	public void setIsApproved(String isApproved) {
		this.isApproved = isApproved;
	}
	public String getBankName() {
		return bankName;
	}
	public void setBankName(String bankName) {
		this.bankName = bankName;
	}
	public String getDataStatus() {
		return dataStatus;
	}
	public void setDataStatus(String dataStatus) {
		this.dataStatus = dataStatus;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	@Override
	public String toString() {
		return "TransferResponse [transferResponseId=" + transferResponseId + ", commonStatus=" + commonStatus
				+ ", message=" + message + ", accountNumber=" + accountNumber + ", bankCode=" + bankCode + ", fullName="
				+ fullName + ", createdDate=" + createdDate + ", currency=" + currency + ", debitCurrency="
				+ debitCurrency + ", amount=" + amount + ", fee=" + fee + ", reference=" + reference + ", narration="
				+ narration + ", completedMessage=" + completedMessage + ", requiredApproval=" + requiredApproval
				+ ", isApproved=" + isApproved + ", bankName=" + bankName + ", dataStatus=" + dataStatus + ", status="
				+ status + "]";
	}
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((accountNumber == null) ? 0 : accountNumber.hashCode());
		result = prime * result + ((amount == null) ? 0 : amount.hashCode());
		result = prime * result + ((bankCode == null) ? 0 : bankCode.hashCode());
		result = prime * result + ((bankName == null) ? 0 : bankName.hashCode());
		result = prime * result + ((commonStatus == null) ? 0 : commonStatus.hashCode());
		result = prime * result + ((completedMessage == null) ? 0 : completedMessage.hashCode());
		result = prime * result + ((createdDate == null) ? 0 : createdDate.hashCode());
		result = prime * result + ((currency == null) ? 0 : currency.hashCode());
		result = prime * result + ((dataStatus == null) ? 0 : dataStatus.hashCode());
		result = prime * result + ((debitCurrency == null) ? 0 : debitCurrency.hashCode());
		result = prime * result + ((fee == null) ? 0 : fee.hashCode());
		result = prime * result + ((fullName == null) ? 0 : fullName.hashCode());
		result = prime * result + ((isApproved == null) ? 0 : isApproved.hashCode());
		result = prime * result + ((message == null) ? 0 : message.hashCode());
		result = prime * result + ((narration == null) ? 0 : narration.hashCode());
		result = prime * result + ((reference == null) ? 0 : reference.hashCode());
		result = prime * result + ((requiredApproval == null) ? 0 : requiredApproval.hashCode());
		result = prime * result + ((status == null) ? 0 : status.hashCode());
		result = prime * result + ((transferResponseId == null) ? 0 : transferResponseId.hashCode());
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
		TransferResponse other = (TransferResponse) obj;
		if (accountNumber == null) {
			if (other.accountNumber != null)
				return false;
		} else if (!accountNumber.equals(other.accountNumber))
			return false;
		if (amount == null) {
			if (other.amount != null)
				return false;
		} else if (!amount.equals(other.amount))
			return false;
		if (bankCode == null) {
			if (other.bankCode != null)
				return false;
		} else if (!bankCode.equals(other.bankCode))
			return false;
		if (bankName == null) {
			if (other.bankName != null)
				return false;
		} else if (!bankName.equals(other.bankName))
			return false;
		if (commonStatus == null) {
			if (other.commonStatus != null)
				return false;
		} else if (!commonStatus.equals(other.commonStatus))
			return false;
		if (completedMessage == null) {
			if (other.completedMessage != null)
				return false;
		} else if (!completedMessage.equals(other.completedMessage))
			return false;
		if (createdDate == null) {
			if (other.createdDate != null)
				return false;
		} else if (!createdDate.equals(other.createdDate))
			return false;
		if (currency == null) {
			if (other.currency != null)
				return false;
		} else if (!currency.equals(other.currency))
			return false;
		if (dataStatus == null) {
			if (other.dataStatus != null)
				return false;
		} else if (!dataStatus.equals(other.dataStatus))
			return false;
		if (debitCurrency == null) {
			if (other.debitCurrency != null)
				return false;
		} else if (!debitCurrency.equals(other.debitCurrency))
			return false;
		if (fee == null) {
			if (other.fee != null)
				return false;
		} else if (!fee.equals(other.fee))
			return false;
		if (fullName == null) {
			if (other.fullName != null)
				return false;
		} else if (!fullName.equals(other.fullName))
			return false;
		if (isApproved == null) {
			if (other.isApproved != null)
				return false;
		} else if (!isApproved.equals(other.isApproved))
			return false;
		if (message == null) {
			if (other.message != null)
				return false;
		} else if (!message.equals(other.message))
			return false;
		if (narration == null) {
			if (other.narration != null)
				return false;
		} else if (!narration.equals(other.narration))
			return false;
		if (reference == null) {
			if (other.reference != null)
				return false;
		} else if (!reference.equals(other.reference))
			return false;
		if (requiredApproval == null) {
			if (other.requiredApproval != null)
				return false;
		} else if (!requiredApproval.equals(other.requiredApproval))
			return false;
		if (status == null) {
			if (other.status != null)
				return false;
		} else if (!status.equals(other.status))
			return false;
		if (transferResponseId == null) {
			if (other.transferResponseId != null)
				return false;
		} else if (!transferResponseId.equals(other.transferResponseId))
			return false;
		return true;
	}
	
}
