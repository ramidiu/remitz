package com.kws.unitedfintech.serviceimpl;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.TimeZone;

import org.hibernate.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kws.unitedfintech.entities.Beneficiary;
import com.kws.unitedfintech.entities.NoGenerator;
import com.kws.unitedfintech.entities.TransactionInformation;
import com.kws.unitedfintech.helpers.SenditoConvertNullsToEmpty;
import com.kws.unitedfintech.helpers.SenditoDateUtil;
import com.kws.unitedfintech.repository.TransactionInformationRepository;
import com.kws.unitedfintech.service.BeneficiaryService;
import com.kws.unitedfintech.service.NoGeneratorService;
import com.kws.unitedfintech.service.TransactionInformationService;
@Service
public class TransactionInformationServiceImpl implements TransactionInformationService {

	@Autowired
	private NoGeneratorService noGeneratorService;

	@Autowired
	private BeneficiaryService beneficiaryService;
	@Autowired
	private TransactionInformationRepository transactionInformationRepository;
	
	SenditoConvertNullsToEmpty worldremitConvertNullsToEmpty = new SenditoConvertNullsToEmpty();
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

	SimpleDateFormat yyyyMMddHHmmss = new SimpleDateFormat("yyyy-MM-dd");//HH:mm:ss
	SimpleDateFormat yyyyMMdd = new SimpleDateFormat("dd MMM yyyy");
	TimeZone timeZone = TimeZone.getTimeZone("IST");

	Calendar cal = Calendar.getInstance();
	Date d = cal.getTime();

	@Override
	public String saveTransactionInformation(TransactionInformation transactionInformation) {

		NoGenerator noGenerator=noGeneratorService.getNoGenerator("transaction_information");
		System.out.println("noGenerator in txn==="+noGenerator);
		String transactionId = noGenerator.getIdPrefix() + noGenerator.getTableId();
		System.out.println("trnsactionid::"+transactionId);
		transactionInformation.setTransactionId(transactionId);
		transactionInformation.setTransactionTime(sdf.format(d));
		String createdDate=SenditoDateUtil.timeNow(yyyyMMddHHmmss,timeZone);
		 transactionInformation.setCreatedDate(createdDate);
		 transactionInformation.setUpdatedDate(createdDate);
		transactionInformation = worldremitConvertNullsToEmpty.convertNullFieldToEmpty(transactionInformation,
				TransactionInformation.class);
		transactionInformationRepository.save(transactionInformation);
		noGeneratorService.updateNoGenerator(noGenerator);
		return transactionId;
	}
	

	@Override
	public TransactionInformation getTransactionDetails(String transactionId) {
		return transactionInformationRepository.findBytransactionId(transactionId);
	}


	/*
	 * @Override public List<TransactionInformation> getTransactionDetails(String
	 * fromDate, String toDate, String customerId) { return
	 * transactionInformationDAO.getTransactionDetails(fromDate, toDate,
	 * customerId); }
	 * 
	 * @Override public TransactionInformation getTransactionFullDetails(String
	 * beneficiaryId) {
	 * 
	 * return transactionInformationDAO.getTransactionFullDetails(beneficiaryId); }
	 * 
	 * @Override public TransactionInformation
	 * getTransactionFullDetailsBasedOnTxnId(String txnInd) { return
	 * transactionInformationDAO.getTransactionFullDetailsBasedOnTxnId(txnInd); }
	 */
	@Override
	public String insertTransaction(TransactionInformation transactionInformation, Beneficiary beneficiary) { // System.out.println("from transaction service imple"); String
		String transactionId = "";
		Beneficiary ben = new Beneficiary();
		System.out.println("beneficiary.getBenificiaryStatus()====="+beneficiary.getBenificiaryStatus());
		try {
			if (beneficiary.getBenificiaryStatus() != null
					&& beneficiary.getBenificiaryStatus().equals("New Receipent")) {
				NoGenerator noGenerator= noGeneratorService.getNoGenerator("beneficiary");
				System.out.println("noGenerator==="+noGenerator);
				String beneficiaryId = noGenerator.getIdPrefix() + noGenerator.getTableId();
				System.out.println("beneficiaryId in service==="+beneficiaryId);
				beneficiary.setBeneficiaryId(beneficiaryId);
				beneficiary.setCreatedDate(yyyyMMddHHmmss.format(d));
				beneficiary.setUpdatedDate(yyyyMMddHHmmss.format(d));
			    beneficiaryService.saveBeneficiaryDetails(beneficiary);//	transaction);
			    noGeneratorService.updateNoGenerator(noGenerator);
				System.out.println("beneficiary==========="+beneficiary);
			    ben = beneficiaryService.getBeneficiaryDetails(beneficiaryId);
				System.out.println("ben id in service===="+beneficiaryId);
				transactionInformation.setBeneficiary(ben);
			} else {
				System.err.println("else part from service impl");
				System.out.println("beneficiary = " + beneficiary);
				transactionInformation.setBeneficiary(beneficiary);
			}
			//transactionInformation.setTransactionDate(yyyyMMdd.format(d));
			transactionId = saveTransactionInformation(transactionInformation);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return transactionId;
	}


	@Override
	public List<TransactionInformation> getTransactionDetailsBasedOnCustomerId(String customerId) {
		// TODO Auto-generated method stub
		return transactionInformationRepository.findByCustomerId(customerId);
	}


	@Override
	public List<TransactionInformation> getAll() {
		// TODO Auto-generated method stub
		return transactionInformationRepository.findByAll();
	}


	@Override
	public List<TransactionInformation> getTransactionDetailsBasedOnadminIdId(String adminId) {
		// TODO Auto-generated method stub
		return transactionInformationRepository.findByAdminId(adminId);
	}


	@Override
	public void updateTransactionStatus(String txnId, String status, String updatedBy, String comments) {
		// TODO Auto-generated method stub
		transactionInformationRepository.updateStatusByTxnId(txnId, status, updatedBy, comments);
	}
	@Override
	public List<TransactionInformation> getAllTransactionDetailsBasedOnAdminId(String adminid,String fromdate,String todate) {
		return transactionInformationRepository.getAllTransactionDetailsOfAdmin(adminid,fromdate,todate,"confirmed");
		
	}
	
	@Override
	public void updateTransactionPaymentStatus(TransactionInformation tpstatus) {
		transactionInformationRepository.save(tpstatus);
		
	}


	@Override
	public void updateTransactionStatus(String tstatus, String txnid) {
		
		TransactionInformation txninfo=transactionInformationRepository.findBytransactionId(txnid);
		txninfo.setStatus(tstatus);
		transactionInformationRepository.save(txninfo);
		
	}
	/*
	 * @Override public List<TransactionInformation>
	 * getListOfTransactionBasedOnFromDateToDate(String adminId, String fromDate,
	 * String toDate) { return
	 * transactionInformationDAO.getListOfTransactionBasedOnFromDateToDate(adminId,
	 * fromDate, toDate); }
	 * 
	 * @Override public void updateTransactionStatusBySendingBranch(String
	 * transactionId, String branchId, String status, String msg) {
	 * transactionInformationDAO.updateTransactionStatusBySendingBranch(
	 * transactionId, branchId, status, msg); }
	 * 
	 * @Override public void updateTransactionStatusByAdmin(String transactionId,
	 * String adminId, String status, String msg) {
	 * transactionInformationDAO.updateTransactionStatusByAdmin(transactionId,
	 * adminId, status, msg); }
	 * 
	 * @Override public void updateTransactionStatusByReceivingBranch(String
	 * transactionId, String branchId, String status, String msg) {
	 * transactionInformationDAO.updateTransactionStatusByReceivingBranch(
	 * transactionId, branchId, status, msg); }
	 * 
	 * @Override public List<TransactionInformation>
	 * getFilteredListOfTransactionBasedOnFromDateToDate(String adminId, String
	 * fromDate, String toDate, String paymentModes, String paymentTypes, String
	 * receivingBranch) { String subQuery1=""; String subQuery2=""; String
	 * subQuery3=""; String[] pModes=null; String[] pTypes=null;
	 * if(paymentModes!=null && paymentModes!="" && !paymentModes.equals("")) {
	 * pModes=paymentModes.split(","); for(int i=0;i<pModes.length;i++) { if(i==0) {
	 * subQuery1="AND (t.modeOfPayment='"+pModes[i]+"'"; }else {
	 * subQuery1=subQuery1+" OR t.modeOfPayment='"+pModes[i]+"'"; } }
	 * subQuery1=subQuery1+")";
	 * 
	 * } //System.out.println("subQuery1======"+subQuery1); if(paymentTypes!=null &&
	 * paymentTypes!="" && !paymentTypes.equals("")) {
	 * pTypes=paymentTypes.split(","); for(int i=0;i<pTypes.length;i++) { if(i==0) {
	 * subQuery2="AND (t.paymentType='"+pTypes[i]+"'"; }else {
	 * subQuery2=subQuery2+" OR t.paymentType='"+pTypes[i]+"'"; } }
	 * subQuery2=subQuery2+")";
	 * 
	 * } //System.out.println("subQuery2======"+subQuery2+receivingBranch);
	 * if(receivingBranch!=null && receivingBranch!="" &&
	 * !receivingBranch.equals("")) {
	 * subQuery3="AND t.toBranch.branchId='"+receivingBranch+"'"; }
	 * 
	 * 
	 * return
	 * transactionInformationDAO.getFilteredListOfTransactionBasedOnFromDateToDate(
	 * adminId, fromDate, toDate, subQuery1, subQuery2, subQuery3); }
	 * 
	 * @Override public TransactionInformation getBasedOnTxnIdWithSession(String
	 * txnId, Session session) { return
	 * transactionInformationDAO.getBasedOnTxnIdWithSession(txnId, session); }
	 * 
	 * @Override public List<TransactionInformation>
	 * getTransactionDetailsBasedOnCustomerId(String customerId) { return
	 * transactionInformationDAO.getTransactionDetailsBasedOnCustomerId(customerId);
	 * }
	 * 
	 * @Override public void updateTransaction(TransactionInformation
	 * transactionInformation) {
	 * transactionInformationDAO.updateTransaction(transactionInformation); }
	 * 
	 * @Override public List<TransactionInformation>
	 * getTrangloUnSuccessFullTxn(String adminId) { return
	 * transactionInformationDAO.getTrangloUnSuccessFullTxn(adminId); }
	 * 
	 * @Override public void updateSendingBranchTransactionStatusByAdmin(String
	 * transactionId, String adminId, String status, String msg) {
	 * transactionInformationDAO.updateSendingBranchTransactionStatusByAdmin(
	 * transactionId, adminId, status, msg); }
	 * 
	 * @Override public void updateReceivingBranchTransactionStatusByAdmin(String
	 * transactionId, String adminId, String status, String msg) {
	 * transactionInformationDAO.updateReceivingBranchTransactionStatusByAdmin(
	 * transactionId, adminId, status, msg); }
	 * 
	 * @Override public void updatePayIdAndBankTransferPaymentStatus(String txnId,
	 * String status, String updatedBy) {
	 * transactionInformationDAO.updatePayIdAndBankTransferPaymentStatus(txnId,
	 * status, updatedBy); }
	 * 
	 * @Override public void updateTransactionStatus(String txnId, String status,
	 * String updatedBy, String comments) {
	 * transactionInformationDAO.updateTransactionStatus(txnId, status, updatedBy,
	 * comments); }
	 * 
	 * @Override public List<TransactionInformation>
	 * getAllTransactionsBasedOnFromDateToDateAndStatus(String fromDate, String
	 * toDate, String status, String adminId) { return
	 * transactionInformationDAO.getAllTransactionsBasedOnFromDateToDateAndStatus(
	 * fromDate, toDate, status, adminId); }
	 * 
	 * @Override public List<TransactionInformation>
	 * getPaymentPendingTransaction(String fromDate, String toDate) { return
	 * transactionInformationDAO.getPaymentPendingTransaction(fromDate, toDate); }
	 * 
	 * @Override public List<TransactionInformation>
	 * getAllTransactionBasedOnBeneficiaryId(String benefId) { return
	 * transactionInformationDAO.getAllTransactionBasedOnBeneficiaryId(benefId); }
	 */


	
	  
	 

	@Override
	public List<TransactionInformation> getTransactionDetails(String fromDate, String toDate, String customerId) {
		// TODO Auto-generated method stub
		return transactionInformationRepository.getAllSpecificCustomerTransaction(fromDate, toDate, customerId,"confirmed");
	}


	@Override
	public TransactionInformation getTransactionFullDetails(String beneficiaryId) {
		// TODO Auto-generated method stub
		return null;
	}


	@Override
	public TransactionInformation getTransactionFullDetailsBasedOnTxnId(String txnInd) {
		// TODO Auto-generated method stub
		return null;
	}


	@Override
	public TransactionInformation getBasedOnTxnIdWithSession(String txnId, Session session) {
		// TODO Auto-generated method stub
		return null;
	}
	@Override
	public void updateTransactionInformation(TransactionInformation tx) {
		
		transactionInformationRepository.save(tx);
	}


	@Override
	public List<TransactionInformation> getAllReceivingBranchTransactions(String adminid, String branchid,String fromdate,String todate) {
		
		return transactionInformationRepository.getAllSpecificReceivingBranchTransaction(branchid, adminid,fromdate,todate,"confirmed");
	}


	


	@Override
	public List<TransactionInformation> getAllTransactionDetailsBasedOnAdminAndBranchid(String branchid,String adminid,String date) {
		
		return transactionInformationRepository.getAllSpecificReceivingBranchTransaction(branchid, adminid, date, date,"confirmed");
	}


	@Override
	public List<TransactionInformation> getAllTrnbasedOnStatus(String status, String fromdate, String todate,
			String adminid) {
		// TODO Auto-generated method stub
		return transactionInformationRepository.getAllTransactionBasedOnStatus(status, fromdate, todate, adminid,"confirmed");
	}


	@Override
	public List<TransactionInformation> getAllTrnbasedOnPaymentStatus(String status, String fromdate, String todate,
			String adminid) {
		// TODO Auto-generated method stub
		System.out.println("before  calling method=:status:"+status);
		return transactionInformationRepository.getAllTransactionBasedOnPaymentStatus(status, fromdate, todate, adminid);
	}


	@Override
	public List<TransactionInformation> getUnderBankRemiTransactions(String adminId,String paymentStatus,String customerKYCStatus,String paymentType) {
		/*
		 * if (fromDate.equals("") && toDate.equals("")) {
		 * 
		 * SimpleDateFormat yyyyMMdd = new SimpleDateFormat("yyyy-MM-dd"); TimeZone
		 * timeZone = TimeZone.getTimeZone("IST"); String createdDate =
		 * SenditoDateUtil.timeNow(yyyyMMdd, timeZone); fromDate = createdDate; toDate =
		 * createdDate;
		 * 
		 * }
		 */
		return transactionInformationRepository.getUnderBankRemiTransactions(adminId,paymentStatus,customerKYCStatus,paymentType);
	}
	@Override
	public TransactionInformation checkTransactionIdExist(String txnid,double amount) {
		return transactionInformationRepository.getBasedOnTxnAndAmount(txnid,amount);
		 
	}

	
	@Override
	public List<TransactionInformation> getAllSendingBranchTransactions(String adminid, String branchid,
			String fromdate, String todate) {
		// TODO Auto-generated method stub
		return transactionInformationRepository.getAllSpecificSendingBranchTransaction(branchid, adminid, fromdate, todate,"confirmed");
	}


	@Override
	public void updateFlutterTransactionStatus(String status, String flutterReferenceId, String txnId) {
		transactionInformationRepository.updateFlutterTransactionStatus(status,flutterReferenceId,txnId);
	}

	@Override
	public List<TransactionInformation> getTransactionByStatus(String adminId, String status,String paymentType,String paymentStatus,String kycStatus) {
		return transactionInformationRepository.getTransactionsByStatus(adminId, status,paymentType,paymentStatus,kycStatus);
	}


	@Override
	public List<TransactionInformation> getProfitLossTransactions(String adminId,String status, String fromDate, String toDate) {
		return transactionInformationRepository.getProfitLossTransactions(adminId, fromDate, toDate,status);
	}


	@Override
	public TransactionInformation findByTransactionId(String txnId) {
		return transactionInformationRepository.findBytransactionId(txnId);
	}


	@Override
	public List<TransactionInformation> getByTime(String fdate,String tdate) {
		// TODO Auto-generated method stub
		System.out.println("fdate====="+fdate);
		System.out.println("tdate======"+tdate);
		List<TransactionInformation> list=transactionInformationRepository.getByTime(fdate,tdate,"cancelled");
	System.out.println("list====="+list);
		return list;
	}
	@Override
    public TransactionInformation findByPayAtRefrence(final String payAtRefrenceNumber) {
        return this.transactionInformationRepository.getTxnBasedOnPayAtReference(payAtRefrenceNumber);
    }


	@Override
	public List<TransactionInformation> getTransactionDetailsgroupby(String fromDate, String toDate,
			String customerId) {
		System.out.println("fdate====="+fromDate);
		System.out.println("tdate======"+toDate);
		// TODO Auto-generated method stub
		return transactionInformationRepository.getAllSpecificCustomerTransactionBydate(fromDate, toDate, customerId);
	}


	@Override
	public List<TransactionInformation> getTransactionDetailsgroupbymop(String fromDate, String toDate,
			String customerId, String modeofPayment) {
		// TODO Auto-generated method stub
		return transactionInformationRepository.getAllSpecificCustomerTransactionByMop(fromDate, toDate, customerId, modeofPayment);
	}


	@Override
	public List<TransactionInformation> getByFromBranch(String id) {
		// TODO Auto-generated method stub
		return transactionInformationRepository.getByFromBranch(id,"confirmed");
	}


	@Override
	public void confirmTxn(TransactionInformation tx) {
		// TODO Auto-generated method stub
		transactionInformationRepository.save(tx);	
	}


	@Override
	public Integer getbystatus(String status,String branchId) {
		// TODO Auto-generated method stub
		return transactionInformationRepository.getbystatus(status,branchId);
	}


	@Override
	public double getsomebystatus(String status, String branchId) {
		// TODO Auto-generated method stub
		return transactionInformationRepository.getsomebystatus(status, branchId);
	}


	
}
