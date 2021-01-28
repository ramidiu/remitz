package com.kws.unitedfintech.service;

import java.util.List;

import org.hibernate.Session;

import com.kws.unitedfintech.entities.Beneficiary;
import com.kws.unitedfintech.entities.TransactionInformation;

public interface TransactionInformationService {

	public String saveTransactionInformation(TransactionInformation transactionInformation);

	

	public TransactionInformation getTransactionDetails(String transactionId);

	public TransactionInformation checkTransactionIdExist(String txnid, double amount);

	public void updateTransactionStatus(String txnId, String status, String updatedBy, String comments);

	public List<TransactionInformation> getAllTransactionDetailsBasedOnAdminId(String adminid, String fromdate,
			String todate);

	public void updateTransactionPaymentStatus(TransactionInformation txninfo);

	public void updateTransactionStatus(String tstatus, String txnid);

	public List<TransactionInformation> getTransactionDetails(String fromDate, String toDate, String customerId);

	public TransactionInformation getTransactionFullDetails(String beneficiaryId);

	public TransactionInformation getTransactionFullDetailsBasedOnTxnId(String txnInd);

	public TransactionInformation getBasedOnTxnIdWithSession(String txnId, Session session);

	public List<TransactionInformation> getTransactionDetailsBasedOnCustomerId(String customerId);

	public List<TransactionInformation> getAll();

	public List<TransactionInformation> getTransactionDetailsBasedOnadminIdId(String adminId);

	public List<TransactionInformation> getAllTransactionDetailsBasedOnAdminAndBranchid(String branchid, String adminid,
			String date);

	public void updateTransactionInformation(TransactionInformation tx);

	public List<TransactionInformation> getAllReceivingBranchTransactions(String adminid, String branchid,
			String fromdate, String todate);

	public List<TransactionInformation> getAllTrnbasedOnStatus(String status, String fromdate, String todate,
			String adminid);

	public List<TransactionInformation> getAllTrnbasedOnPaymentStatus(String status, String fromdate, String todate,
			String adminid);

	public String insertTransaction(TransactionInformation transactionInformation, Beneficiary beneficiary);

	public List<TransactionInformation> getUnderBankRemiTransactions(String adminId, String paymentStatus,
			String kycStatus, String paymentType);

	public List<TransactionInformation> getAllSendingBranchTransactions(String adminid, String branchid,
			String fromdate, String todate);

	public void updateFlutterTransactionStatus(String status, String flutterReferenceId, String txnId);

	public List<TransactionInformation> getTransactionByStatus(String adminId, String status, String paymentType,
			String paymentStatus, String kycStatus);

	public List<TransactionInformation> getProfitLossTransactions(String adminId, String status, String fromDate,
			String toDate);

	public TransactionInformation findByTransactionId(String transactionId);

	TransactionInformation findByPayAtRefrence(final String payAtRefrenceNumber);

	public List<TransactionInformation> getByTime(String fdate, String tdate);
	public List<TransactionInformation> getTransactionDetailsgroupby(String fromDate, String toDate, String customerId);
	
	public List<TransactionInformation> getTransactionDetailsgroupbymop(String fromDate, String toDate, String customerId,String modeofPayment);

	
	public List<TransactionInformation> getByFromBranch(String id);
	
	public void confirmTxn(TransactionInformation tx);
	
	public Integer getbystatus(String status,String branchId);
	
	public double getsomebystatus(String status,String branchId);
}
