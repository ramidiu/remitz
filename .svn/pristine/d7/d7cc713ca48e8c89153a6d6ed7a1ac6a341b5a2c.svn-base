package com.kws.unitedfintech.service;

import java.util.List;

import com.kws.unitedfintech.entities.Admin;
import com.kws.unitedfintech.entities.AdminSellRates;
import com.kws.unitedfintech.entities.Branch;

public interface CurrencyRateService {

	public void saveAdminSellRate(AdminSellRates rate,Admin admin,Branch fromBranch,Branch toBranch);
	
	public void updateAdminSellRate(AdminSellRates rate);
	public List<AdminSellRates> getAllAdminSellRateBasedOnAdminId(String adminId,String rateFlag,String status);
	public AdminSellRates getAllAdminSellRateBasedOnFromBranchAndToBranch(String adminId,String fromBranchId,String toBranchId);
	public double getCurrencyRateBasedOnFromBranchAndToBranch(String fromBranchId,String toBranchId,String paymentType,String rateFlag);
	public List<AdminSellRates> getCurrencyRateForSendingCountry(String branchId,String paymentType);
	public void saveAdminBuyRate(AdminSellRates rate,Admin admin,Branch fromBranch,Branch toBranch);
	public List<AdminSellRates> getAllAdminSellRateBasedOnBranch(String toBranchId,String rateFlag);
	public AdminSellRates getByCrId(String crId);
	
	public List<AdminSellRates> findByToBranch(String branchId,String ptype);
	public List<AdminSellRates> getAllAdminSellRateBasedOnFromBranchAndToBranchRateType(String adminId,String fromBranchId,String toBranchId,String rateFlag);
	public AdminSellRates getCurrencyRateBasedOnFromBranchAndToBranchPtype(String fromBranchId,String toBranchId,String paymentType,String rateFlag);


}
