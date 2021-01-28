package com.kws.unitedfintech.helpers;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.kws.unitedfintech.entities.BankBalance;
import com.kws.unitedfintech.service.BankBalanceService;


public class LedgerHelper {
	@Autowired
	BankBalanceService bankBalanceService;
	public double[] getLedgerOpeningBalance(String fromdate,String todate,String finyear,String subhead)	{
	System.out.println("ledger helper working");
		Calendar cal = Calendar.getInstance();
		DateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		try	{
			Date date = format.parse(fromdate);
			cal.setTime(date);
			cal.add(Calendar.DATE, -1);
			fromdate = format.format(cal.getTime());
		}
		catch(ParseException pe)	{
			pe.printStackTrace();
		}
		//List<BankBalance> balList = bankBalanceService.getBankBalancesList(finyear,subhead);
		double creditOpeningBal = 0.0,debitOpeningBal = 0.0,creditTxnAmt = 0.0,debitTxnAmt = 0.0,withOutbnkJvAmtCp = 0.0,withOutBnkJvAmtPe = 0.0,withBnkJvAmtCp = 0.0,withBnkJvAmtPe = 0.0,mseAmt = 0.0,paymentAmt = 0.0;
		double debitTotal = 0.0,creditTotal = 0.0;
		/*if (balList != null && balList.size() > 0)	{
			for (int i = 0 ; i < balList.size() ; i++)	{
				if (balList.get(i).getType().equals("credit"))	{
					creditOpeningBal += Double.parseDouble(balList.get(i).getBankBal());
					System.out.println("creditOpeningBal======"+creditOpeningBal);
				}
				else	{
					debitOpeningBal += Double.parseDouble(balList.get(i).getBankBal());
           System.out.println("debitOpeningBal========"+debitOpeningBal);
				}
			}}
		*/
		
		debitTotal = debitOpeningBal;
		
		creditTotal = creditOpeningBal;
	
	
		return new double[]{creditTotal,debitTotal};
	}
}
