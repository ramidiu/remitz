package com.kws.unitedfintech.service;

import java.util.List;

import com.kws.unitedfintech.entities.JournalVoucher;


public interface JournalVoucherService {
	public void insertJournalWithOutBank(JournalVoucher journalVoucher);
	public boolean insertJournalWithOutBank1(List<JournalVoucher> journalVoucher); 
	public List<JournalVoucher> getAllSendingBranchTransactions1(String finYear,String subhead,String fromdate,String todate);
	public List<JournalVoucher> getlist(String finYear,String fromDate,String toDate);
	public List<JournalVoucher> getListByAdminId(String adminId);
	
}
