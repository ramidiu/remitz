package com.kws.unitedfintech.serviceimpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kws.unitedfintech.entities.NoGenerator;
import com.kws.unitedfintech.entities.RevenuePercentage;
import com.kws.unitedfintech.repository.RevenuePercentageRepository;
import com.kws.unitedfintech.service.NoGeneratorService;
import com.kws.unitedfintech.service.RevenuePercentageService;


@Service
public class RevenuePercentageServiceImpl implements RevenuePercentageService{

	@Autowired
	private RevenuePercentageRepository rpr;
	@Autowired
	private NoGeneratorService nr;

	@Override
	public void save(RevenuePercentage rp) {
		RevenuePercentage r=rpr.findByAgents(rp.getFromBranch().getBranchId(), rp.getToBranch().getBranchId(), rp.getAdmin().getAdminId());
		if(r==null) {
		NoGenerator noGenerator =	nr.getNoGenerator("revenue_percentage");	
		String uniqid=noGenerator.getIdPrefix()+noGenerator.getTableId();		
    rp.setRpId(uniqid);
	rpr.save(rp);
	nr.updateNoGenerator(noGenerator);
		}
	}

	@Override
	public RevenuePercentage getByagents(String fagent, String tagent, String admin) {
		// TODO Auto-generated method stub
		return rpr.findByAgents(fagent, tagent, admin);
	}

	@Override
	public void updateRevenue(RevenuePercentage rp) {
		// TODO Auto-generated method stub
		rpr.save(rp);
	}

	@Override
	public RevenuePercentage getbyId(String id) {
		// TODO Auto-generated method stub
		return rpr.getById(id);
	}

	@Override
	public List<RevenuePercentage> getByAdminId(String adminId) {
		// TODO Auto-generated method stub
		return rpr.getByAdminId(adminId);
	}

}
