package com.kws.unitedfintech.repository;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;

import com.kws.unitedfintech.entities.TransactionInformation;
public interface TransactionInformationRepository extends CrudRepository<TransactionInformation, String> {
	@Query("select t from TransactionInformation t where t.transactionId=:txnId")
	public TransactionInformation findBytransactionId(@Param("txnId") String txnId);

	@Query("select t from TransactionInformation t where t.customer.customerId=:customerId")
	public List<TransactionInformation> findByCustomerId(@Param("customerId") String customerId);

	@Query("select t from TransactionInformation t where t.admin.adminId=:adminId")
	public List<TransactionInformation> findByAdminId(@Param("adminId") String adminId);

	@Query("select t from TransactionInformation t ")
	public List<TransactionInformation> findByAll();

	@Query("select t from TransactionInformation t where t.admin.adminId=:adminid and t.createdDate>=:fromdate and t.createdDate<=:todate and t.txnConfirmation=:txnConfirmation")
	public List<TransactionInformation> getAllTransactionDetailsOfAdmin(String adminid, String fromdate, String todate,String txnConfirmation);

	@Transactional
	@Modifying
	@Query("update TransactionInformation t set t.paymentStatus=:status,t.updatedBy=:updatedBy,t.comments=:comments where t.transactionId=:txnId")
	public void updateStatusByTxnId(@Param("txnId") String txnId, @Param("status") String status,
			@Param("updatedBy") String updatedBy, @Param("comments") String comments);

	@Query("select t from TransactionInformation t where t.admin.adminId=:adminid and t.fromBranch.branchId=:branchid and t.createdDate>=:date and t.createdDate<=:date and t.txnConfirmation=:txnConfirmation")
	public List<TransactionInformation> getAllSpecificBranchTransaction(String branchid, String adminid, String date,String txnConfirmation);

	@Query("select t from TransactionInformation t where t.createdDate>=:fromDate and t.createdDate<=:toDate and t.customer.customerId=:customerId and t.txnConfirmation=:txnConfirmation")
	public List<TransactionInformation> getAllSpecificCustomerTransaction(String fromDate, String toDate,
			String customerId,String txnConfirmation);

	@Query("select t from TransactionInformation t where t.admin.adminId=:adminid and t.toBranch.branchId=:branchid and t.createdDate>=:fromdate and t.createdDate<=:todate and t.txnConfirmation=:txnConfirmation")
	public List<TransactionInformation> getAllSpecificReceivingBranchTransaction(String branchid, String adminid,
			String fromdate, String todate,String txnConfirmation);

	@Query("select t from TransactionInformation t where t.admin.adminId=:adminid  and t.status=:status and t.createdDate>=:fromdate and t.createdDate<=:todate and t.txnConfirmation=:txnConfirmation")
	public List<TransactionInformation> getAllTransactionBasedOnStatus(String status, String fromdate, String todate,
			String adminid,@Param("txnConfirmation")String txnConfirmation);

	@Query("select t from TransactionInformation t where t.admin.adminId=:adminid  and t.paymentStatus=:status and t.createdDate>=:fromdate and t.createdDate<=:todate")
	public List<TransactionInformation> getAllTransactionBasedOnPaymentStatus(String status, String fromdate,
			String todate, String adminid);

	@Query("select t from TransactionInformation t where t.admin.adminId=:adminId and   t.paymentStatus=:paymentStatus and t.customer.customerKYCStatus=:customerKYCStatus and t.paymentType=:paymentType")
	public List<TransactionInformation> getUnderBankRemiTransactions(String adminId, String paymentStatus,
			String customerKYCStatus, String paymentType);

	@Query("select t from TransactionInformation t where t.admin.adminId=:adminid and t.fromBranch.branchId=:branchid and t.createdDate>=:fromdate and t.createdDate<=:todate and t.txnConfirmation=:txnConfirmation")
	public List<TransactionInformation> getAllSpecificSendingBranchTransaction(String branchid, String adminid,
			String fromdate, String todate,@Param("txnConfirmation")String txnConfirmation);

	@Transactional
	@Modifying
	@Query("update TransactionInformation t set t.status=:status,t.flutterReferenceId=:flutterReferenceId where t.transactionId=:transactionId")
	public void updateFlutterTransactionStatus(String status, String flutterReferenceId, String transactionId);

	@Query("select t from TransactionInformation t where t.admin.adminId=:adminId and t.status=:status and t.paymentType=:paymentType and t.paymentStatus=:paymentStatus and t.customer.customerKYCStatus=:customerKYCStatus")
	public List<TransactionInformation> getTransactionsByStatus(String adminId, String status, String paymentType,
			String paymentStatus, String customerKYCStatus);

	@Query("select t from TransactionInformation t where t.admin.adminId=:adminId and t.createdDate>=:fromdate and t.createdDate<=:todate and t.status=:status")
	public List<TransactionInformation> getProfitLossTransactions(String adminId, String fromdate, String todate,
			String status);

	@Query("select t from TransactionInformation t where  t.transactionId=:txnId and t.sendingAmount=:amount")
	public TransactionInformation getBasedOnTxnAndAmount(String txnId, double amount);

	@Query("select t from TransactionInformation t where t.transactionTime>=:fdate and t.transactionTime<=:tdate and t.status=:status")
	public List<TransactionInformation> getByTime(String fdate, String tdate, String status);

	@Query("select t from TransactionInformation t where  t.payAtRefrenceNumber=:payAtRefrenceNumber")
	TransactionInformation getTxnBasedOnPayAtReference(final String payAtRefrenceNumber);
	
	
	
	@Query("select  t from TransactionInformation t where t.createdDate>=:fromDate and t.createdDate<=:toDate and t.customer.customerId=:customerId ")

	public List<TransactionInformation> getAllSpecificCustomerTransactionBydate(String fromDate, String toDate,
			String customerId);

	@Query("select  t from TransactionInformation t where t.createdDate>=:fromDate and t.createdDate<=:toDate and t.customer.customerId=:customerId and t.modeOfPayment=:modeOfPayment")

	public List<TransactionInformation> getAllSpecificCustomerTransactionByMop(String fromDate, String toDate,
			String customerId,String modeOfPayment);



@Query("select t from TransactionInformation t where t.fromBranch.branchId=:id and t.txnConfirmation=:txnConfirmation")
public List<TransactionInformation> getByFromBranch(@Param("id")String id,@Param("txnConfirmation")String txnConfirmation);


@Query("SELECT COUNT(t) FROM TransactionInformation t WHERE t.status=:status and t.fromBranch.branchId=:branchId")
Integer getbystatus(@Param("status")String status,@Param("branchId")String branchId);


@Query("SELECT SUM(t.sendingAmount) FROM TransactionInformation t WHERE t.status=:status and t.fromBranch.branchId=:branchId")
double getsomebystatus(@Param("status")String status,@Param("branchId")String branchId);

}
