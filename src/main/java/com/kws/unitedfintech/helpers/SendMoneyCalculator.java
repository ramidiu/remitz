package com.kws.unitedfintech.helpers;

import java.text.DecimalFormat;

import org.springframework.stereotype.Component;

import com.kws.unitedfintech.modelclasses.FrontEndTranscationInfoModelClass;


@Component
public class SendMoneyCalculator {
	private static DecimalFormat decimalFormat;
	static {
		SendMoneyCalculator.decimalFormat = new DecimalFormat("#.####");
	}

	
	public FrontEndTranscationInfoModelClass calculation(FrontEndTranscationInfoModelClass model) {
//	System.out.println("from calculator ctrl");
//		System.out.println("sending branch = "+model.getSendingBranch());
//	System.out.println("payment type  = "+model.getPaymentType());
//	System.out.println("Mode of payment = "+model.getModeOfPayment());
//	System.out.println("receivng branch = "+model.getReceivingBranch());
//	System.out.println("adminId = "+model.getAdminId()+model.getReceivingBranch().split("-")[1]);
//System.out.println("cr rate  = = ="+model.getCrRate());
		System.out.println("curr rate from send money calculator = = "+model.getCrRate());
	double r_amount=Double.parseDouble(model.getSendingAmount())*Double.parseDouble(model.getCrRate());
	//double total_fee=Double.parseDouble(model.getModeOfPaymentFee())+Double.parseDouble(model.getQuiqsendFee());
	double total_to_pay=Double.parseDouble(model.getSendingAmount())+0;
	double txnRate=r_amount/Double.parseDouble(model.getSendingAmount());

	model.setReceivingAmount(decimalFormat.format(r_amount)+"");
	//model.setTotalTransactionFee(total_fee+"");
	model.setTotalToPay(total_to_pay+"");
	model.setTxnRate(txnRate+"");
	model.setSendingCurrencyCodeCode(model.getSendingBranch().split("-")[2]);
	model.setReceivingCurrencyCode(model.getReceivingBranch().split("-")[2]);
	//System.out.println("d time  == = ="+model.getReceivingBranch().split("-")[7]);
	//model.setDeliveryTime(model.getReceivingBranch().split("-")[7].replaceAll("?"," ").trim());
	return model;
	}
	

}
