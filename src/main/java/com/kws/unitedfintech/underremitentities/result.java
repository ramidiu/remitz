package com.kws.unitedfintech.underremitentities;

import java.io.Serializable;
import java.util.List;

public class result implements Serializable{

	private static final long serialVersionUID = 1L;
	private String Role;
    private String Token;
    private String CustomerId;
    private  String CompanyName;
    private String CustomerType;
    private String Id;
    private String FirstName;
    private String LastName;
    private String CreatedAt;
    private String Memo;
    private String Comment;
    private double Amount;
    private Customer Customer;
    private Wallet Wallet;
    private User User;
    private List<TransactionHistory> TransactionHistory;
    private String TargetWallet;
    private String FundingSource;
    private String ZumRailsType;
    private String TransactionStatus;
    private String FailedTransactionEvent;
    private String From;
    private String To;
    private String RecurrentTransactionId;
    private String FailedDueInternalRiskAnalysis;
	public String getRole() {
		return Role;
	}
	public void setRole(String role) {
		Role = role;
	}
	public String getToken() {
		return Token;
	}
	public void setToken(String token) {
		Token = token;
	}
	public String getCustomerId() {
		return CustomerId;
	}
	public void setCustomerId(String customerId) {
		CustomerId = customerId;
	}
	public String getCompanyName() {
		return CompanyName;
	}
	public void setCompanyName(String companyName) {
		CompanyName = companyName;
	}
	public String getCustomerType() {
		return CustomerType;
	}
	public void setCustomerType(String customerType) {
		CustomerType = customerType;
	}
	public String getId() {
		return Id;
	}
	public void setId(String id) {
		Id = id;
	}
	public String getFirstName() {
		return FirstName;
	}
	public void setFirstName(String firstName) {
		FirstName = firstName;
	}
	public String getLastName() {
		return LastName;
	}
	public void setLastName(String lastName) {
		LastName = lastName;
	}
	public String getCreatedAt() {
		return CreatedAt;
	}
	public void setCreatedAt(String createdAt) {
		CreatedAt = createdAt;
	}
	public String getMemo() {
		return Memo;
	}
	public void setMemo(String memo) {
		Memo = memo;
	}
	public String getComment() {
		return Comment;
	}
	public void setComment(String comment) {
		Comment = comment;
	}
	public double getAmount() {
		return Amount;
	}
	public void setAmount(double amount) {
		Amount = amount;
	}
	public Customer getCustomer() {
		return Customer;
	}
	public void setCustomer(Customer customer) {
		Customer = customer;
	}
	public Wallet getWallet() {
		return Wallet;
	}
	public void setWallet(Wallet wallet) {
		Wallet = wallet;
	}
	public User getUser() {
		return User;
	}
	public void setUser(User user) {
		User = user;
	}
	public List<TransactionHistory> getTransactionHistory() {
		return TransactionHistory;
	}
	public void setTransactionHistory(List<TransactionHistory> transactionHistory) {
		TransactionHistory = transactionHistory;
	}
	public String getTargetWallet() {
		return TargetWallet;
	}
	public void setTargetWallet(String targetWallet) {
		TargetWallet = targetWallet;
	}
	public String getFundingSource() {
		return FundingSource;
	}
	public void setFundingSource(String fundingSource) {
		FundingSource = fundingSource;
	}
	public String getZumRailsType() {
		return ZumRailsType;
	}
	public void setZumRailsType(String zumRailsType) {
		ZumRailsType = zumRailsType;
	}
	public String getTransactionStatus() {
		return TransactionStatus;
	}
	public void setTransactionStatus(String transactionStatus) {
		TransactionStatus = transactionStatus;
	}
	public String getFailedTransactionEvent() {
		return FailedTransactionEvent;
	}
	public void setFailedTransactionEvent(String failedTransactionEvent) {
		FailedTransactionEvent = failedTransactionEvent;
	}
	public String getFrom() {
		return From;
	}
	public void setFrom(String from) {
		From = from;
	}
	public String getTo() {
		return To;
	}
	public void setTo(String to) {
		To = to;
	}
	public String getRecurrentTransactionId() {
		return RecurrentTransactionId;
	}
	public void setRecurrentTransactionId(String recurrentTransactionId) {
		RecurrentTransactionId = recurrentTransactionId;
	}
	public String getFailedDueInternalRiskAnalysis() {
		return FailedDueInternalRiskAnalysis;
	}
	public void setFailedDueInternalRiskAnalysis(String failedDueInternalRiskAnalysis) {
		FailedDueInternalRiskAnalysis = failedDueInternalRiskAnalysis;
	}
	@Override
	public String toString() {
		return "result [Role=" + Role + ", Token=" + Token + ", CustomerId=" + CustomerId + ", CompanyName="
				+ CompanyName + ", CustomerType=" + CustomerType + ", Id=" + Id + ", FirstName=" + FirstName
				+ ", LastName=" + LastName + ", CreatedAt=" + CreatedAt + ", Memo=" + Memo + ", Comment=" + Comment
				+ ", Amount=" + Amount + ", Customer=" + Customer + ", Wallet=" + Wallet + ", User=" + User
				+ ", TransactionHistory=" + TransactionHistory + ", TargetWallet=" + TargetWallet + ", FundingSource="
				+ FundingSource + ", ZumRailsType=" + ZumRailsType + ", TransactionStatus=" + TransactionStatus
				+ ", FailedTransactionEvent=" + FailedTransactionEvent + ", From=" + From + ", To=" + To
				+ ", RecurrentTransactionId=" + RecurrentTransactionId + ", FailedDueInternalRiskAnalysis="
				+ FailedDueInternalRiskAnalysis + "]";
	}
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		long temp;
		temp = Double.doubleToLongBits(Amount);
		result = prime * result + (int) (temp ^ (temp >>> 32));
		result = prime * result + ((Comment == null) ? 0 : Comment.hashCode());
		result = prime * result + ((CompanyName == null) ? 0 : CompanyName.hashCode());
		result = prime * result + ((CreatedAt == null) ? 0 : CreatedAt.hashCode());
		result = prime * result + ((Customer == null) ? 0 : Customer.hashCode());
		result = prime * result + ((CustomerId == null) ? 0 : CustomerId.hashCode());
		result = prime * result + ((CustomerType == null) ? 0 : CustomerType.hashCode());
		result = prime * result
				+ ((FailedDueInternalRiskAnalysis == null) ? 0 : FailedDueInternalRiskAnalysis.hashCode());
		result = prime * result + ((FailedTransactionEvent == null) ? 0 : FailedTransactionEvent.hashCode());
		result = prime * result + ((FirstName == null) ? 0 : FirstName.hashCode());
		result = prime * result + ((From == null) ? 0 : From.hashCode());
		result = prime * result + ((FundingSource == null) ? 0 : FundingSource.hashCode());
		result = prime * result + ((Id == null) ? 0 : Id.hashCode());
		result = prime * result + ((LastName == null) ? 0 : LastName.hashCode());
		result = prime * result + ((Memo == null) ? 0 : Memo.hashCode());
		result = prime * result + ((RecurrentTransactionId == null) ? 0 : RecurrentTransactionId.hashCode());
		result = prime * result + ((Role == null) ? 0 : Role.hashCode());
		result = prime * result + ((TargetWallet == null) ? 0 : TargetWallet.hashCode());
		result = prime * result + ((To == null) ? 0 : To.hashCode());
		result = prime * result + ((Token == null) ? 0 : Token.hashCode());
		result = prime * result + ((TransactionHistory == null) ? 0 : TransactionHistory.hashCode());
		result = prime * result + ((TransactionStatus == null) ? 0 : TransactionStatus.hashCode());
		result = prime * result + ((User == null) ? 0 : User.hashCode());
		result = prime * result + ((Wallet == null) ? 0 : Wallet.hashCode());
		result = prime * result + ((ZumRailsType == null) ? 0 : ZumRailsType.hashCode());
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
		result other = (result) obj;
		if (Double.doubleToLongBits(Amount) != Double.doubleToLongBits(other.Amount))
			return false;
		if (Comment == null) {
			if (other.Comment != null)
				return false;
		} else if (!Comment.equals(other.Comment))
			return false;
		if (CompanyName == null) {
			if (other.CompanyName != null)
				return false;
		} else if (!CompanyName.equals(other.CompanyName))
			return false;
		if (CreatedAt == null) {
			if (other.CreatedAt != null)
				return false;
		} else if (!CreatedAt.equals(other.CreatedAt))
			return false;
		if (Customer == null) {
			if (other.Customer != null)
				return false;
		} else if (!Customer.equals(other.Customer))
			return false;
		if (CustomerId == null) {
			if (other.CustomerId != null)
				return false;
		} else if (!CustomerId.equals(other.CustomerId))
			return false;
		if (CustomerType == null) {
			if (other.CustomerType != null)
				return false;
		} else if (!CustomerType.equals(other.CustomerType))
			return false;
		if (FailedDueInternalRiskAnalysis == null) {
			if (other.FailedDueInternalRiskAnalysis != null)
				return false;
		} else if (!FailedDueInternalRiskAnalysis.equals(other.FailedDueInternalRiskAnalysis))
			return false;
		if (FailedTransactionEvent == null) {
			if (other.FailedTransactionEvent != null)
				return false;
		} else if (!FailedTransactionEvent.equals(other.FailedTransactionEvent))
			return false;
		if (FirstName == null) {
			if (other.FirstName != null)
				return false;
		} else if (!FirstName.equals(other.FirstName))
			return false;
		if (From == null) {
			if (other.From != null)
				return false;
		} else if (!From.equals(other.From))
			return false;
		if (FundingSource == null) {
			if (other.FundingSource != null)
				return false;
		} else if (!FundingSource.equals(other.FundingSource))
			return false;
		if (Id == null) {
			if (other.Id != null)
				return false;
		} else if (!Id.equals(other.Id))
			return false;
		if (LastName == null) {
			if (other.LastName != null)
				return false;
		} else if (!LastName.equals(other.LastName))
			return false;
		if (Memo == null) {
			if (other.Memo != null)
				return false;
		} else if (!Memo.equals(other.Memo))
			return false;
		if (RecurrentTransactionId == null) {
			if (other.RecurrentTransactionId != null)
				return false;
		} else if (!RecurrentTransactionId.equals(other.RecurrentTransactionId))
			return false;
		if (Role == null) {
			if (other.Role != null)
				return false;
		} else if (!Role.equals(other.Role))
			return false;
		if (TargetWallet == null) {
			if (other.TargetWallet != null)
				return false;
		} else if (!TargetWallet.equals(other.TargetWallet))
			return false;
		if (To == null) {
			if (other.To != null)
				return false;
		} else if (!To.equals(other.To))
			return false;
		if (Token == null) {
			if (other.Token != null)
				return false;
		} else if (!Token.equals(other.Token))
			return false;
		if (TransactionHistory == null) {
			if (other.TransactionHistory != null)
				return false;
		} else if (!TransactionHistory.equals(other.TransactionHistory))
			return false;
		if (TransactionStatus == null) {
			if (other.TransactionStatus != null)
				return false;
		} else if (!TransactionStatus.equals(other.TransactionStatus))
			return false;
		if (User == null) {
			if (other.User != null)
				return false;
		} else if (!User.equals(other.User))
			return false;
		if (Wallet == null) {
			if (other.Wallet != null)
				return false;
		} else if (!Wallet.equals(other.Wallet))
			return false;
		if (ZumRailsType == null) {
			if (other.ZumRailsType != null)
				return false;
		} else if (!ZumRailsType.equals(other.ZumRailsType))
			return false;
		return true;
	}
    
}
