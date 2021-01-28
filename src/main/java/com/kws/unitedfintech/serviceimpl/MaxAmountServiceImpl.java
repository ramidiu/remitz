package com.kws.unitedfintech.serviceimpl;



import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kws.unitedfintech.entities.MaxAmount;
import com.kws.unitedfintech.entities.NoGenerator;
import com.kws.unitedfintech.repository.MaxAmountRepository;
import com.kws.unitedfintech.service.MaxAmountService;
import com.kws.unitedfintech.service.NoGeneratorService;

@Service
public class MaxAmountServiceImpl implements MaxAmountService{

	@Autowired
	private MaxAmountRepository mr;
	@Autowired
	private NoGeneratorService noGeneratorService;
	
	
	@Override
	public MaxAmount save(MaxAmount ma) {
		NoGenerator noGenerator=noGeneratorService.getNoGenerator("max_amount");
		String id=noGenerator.getIdPrefix()+noGenerator.getTableId();
		ma.setMaxAmountId(id);
		MaxAmount m= mr.save(ma);
		noGeneratorService.updateNoGenerator(noGenerator);
		return m;
		
	}


	@Override
	public MaxAmount getAmountByBranchId(String branchId) {
		// TODO Auto-generated method stub
		return mr.getAmtByBranchId(branchId);
	}


	@Override
	public List<MaxAmount> getbyadmin(String adminId) {
		// TODO Auto-generated method stub
		return mr.getbyAdmin(adminId);
	}


	@Override
	public MaxAmount updateAmount(String amount, String maxAmountId) {
MaxAmount ma=mr.getbymaxAmountId(maxAmountId);
ma.setAmount(amount);		
return mr.save(ma);
	}

}
