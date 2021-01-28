package com.kws.unitedfintech.serviceimpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kws.unitedfintech.entities.JournalVoucher;
import com.kws.unitedfintech.entities.NoGenerator;
import com.kws.unitedfintech.helpers.SenditoConvertNullsToEmpty;
import com.kws.unitedfintech.repository.JournalVoucherRepository;
import com.kws.unitedfintech.service.JournalVoucherService;
import com.kws.unitedfintech.service.NoGeneratorService;
@Service
public class JournalVoucherServiceImpl implements JournalVoucherService{
    @Autowired
	JournalVoucherRepository journalVoucherRepository;
    @Autowired
    NoGeneratorService noGeneratorService;
    SenditoConvertNullsToEmpty senditoConvertNullsToEmpty=new SenditoConvertNullsToEmpty();
	@Override
	public void insertJournalWithOutBank(JournalVoucher journalVoucher) {
		
		NoGenerator noGenerator=noGeneratorService.getNoGenerator("journalvoucher");
		String id=noGenerator.getIdPrefix()+noGenerator.getTableId();
		journalVoucher.setJournalId(id);
		journalVoucher=senditoConvertNullsToEmpty.convertNullFieldToEmpty(journalVoucher,JournalVoucher.class);
	
		noGeneratorService.updateNoGenerator(noGenerator);

        journalVoucherRepository.save(journalVoucher);

	}
	@Override
	public boolean insertJournalWithOutBank1(List<JournalVoucher> journalVoucher) {
		boolean isSuccess = false;
		//add list of records
		NoGenerator  noGen=noGeneratorService.getNoGenerator("jvoucher");
		String productId=noGen.getIdPrefix()+noGen.getTableId();
		if(journalVoucher!=null && journalVoucher.size()>0) {
			NoGenerator  noGenerator=noGeneratorService.getNoGenerator("journalvoucher");
				for(JournalVoucher j:journalVoucher) {
					JournalVoucher j2=new JournalVoucher();
					j2.setFinYr(j.getFinYr());
					j2.setDate(j.getDate());
					//j2.setEmpId(j.getAdmin());
					j2.setJournalvoucherType("WithOutBank");
					j2.setNarration(j.getNarration());
					//j2.setProductId(productId);
					//j2.setMajorHeadId(majorHeadId);
					//j2.setMinorHeadId(minorHeadId);
					j2.setQuantity(j.getQuantity());
					j2.setRate(j.getRate());
					j2.setTotalAmount(j.getTotalAmount());
					j2.setAdmin(j.getAdmin());
					j2.setProductId(productId);
					
		
				String journalid=noGenerator.getIdPrefix()+noGenerator.getTableId();
				j2.setJournalId(journalid);
				j2=senditoConvertNullsToEmpty.convertNullFieldToEmpty(j2, JournalVoucher.class);
				journalVoucherRepository.saveAndFlush(j2);
				noGeneratorService.updateNoGenerator(noGenerator);
				}
				
		}
		noGeneratorService.updateNoGenerator(noGen);
		return isSuccess;
	}
	@Override
	public List<JournalVoucher> getAllSendingBranchTransactions1(String finYear, String subhead,String fromdate,String todate) {
		// TODO Auto-generated method stub
		return journalVoucherRepository.getAllSpecificSendingBranchTransactions(finYear, subhead,fromdate,todate);
	}
	@Override
	public List<JournalVoucher> getlist(String finYear, String fromDate, String toDate) {
		// TODO Auto-generated method stub
		return journalVoucherRepository.getlist(finYear, fromDate, toDate);
	}
	@Override
	public List<JournalVoucher> getListByAdminId(String adminId) {
		// TODO Auto-generated method stub
		return journalVoucherRepository.getListByAdminId(adminId);
	}

}
