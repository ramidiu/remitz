package com.kws.unitedfintech.serviceimpl;

import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kws.unitedfintech.entities.Admin;
import com.kws.unitedfintech.entities.Branch;
import com.kws.unitedfintech.entities.ModeOfPaymentFees;
import com.kws.unitedfintech.entities.NoGenerator;
import com.kws.unitedfintech.repository.ModeOfPaymentFeesRepository;
import com.kws.unitedfintech.service.AdminService;
import com.kws.unitedfintech.service.BranchService;
import com.kws.unitedfintech.service.ModeOfPaymentFeeService;
import com.kws.unitedfintech.service.NoGeneratorService;

@Service
public class ModeOfPaymentFeeServiceImpl implements ModeOfPaymentFeeService {
	
	@Autowired
	private NoGeneratorService noGeneratorService;
	
	
	
	@Autowired
	private ModeOfPaymentFeesRepository  rep;
	
	@Autowired
	private AdminService adminService;
	@Autowired
	private BranchService branchService;
	@Autowired
	private ModeOfPaymentFeeService modeOfPaymentFeeService;
	
	
	public ModeOfPaymentFeeServiceImpl(ModeOfPaymentFeesRepository rep) {
		super();
		this.rep = rep;
	}
	
	
	

	@Override
	public List<ModeOfPaymentFees> getAllModeOfPaymentFeesBasedOnAdminId(String adminId) {
		return rep.findByAdminId(adminId);
	}

	@Override
	public List<ModeOfPaymentFees> getAllList() {
		// TODO Auto-generated method stub
		return rep.findAll();
	}

	@Override
	public void saveModeOfPayments(ModeOfPaymentFees modeOfPaymentFees, Admin admin) {

		
		
		NoGenerator noGenerator =   noGeneratorService.getNoGenerator("mode_of_payment_fees");
		String modeOfPaymentFeeId=noGenerator.getIdPrefix()+noGenerator.getTableId();
		
		modeOfPaymentFees.setAdmin(admin);
		
		modeOfPaymentFees.setModeOfPaymentFeeId(modeOfPaymentFeeId);
		rep.save(modeOfPaymentFees);
		System.out.println("modeOfPaymentFeeId.........::::"+modeOfPaymentFeeId);
		 noGeneratorService.updateNoGenerator(noGenerator);
		 
	}




	@Override
	public List<ModeOfPaymentFees> getAllGroupByBranchId(String adminId,String status) {
		// TODO Auto-generated method stub
		return rep.findAllByOrderByBranchIdAndStatus(adminId, status);
	}




	@Override
	public boolean updateFee(String modeOfPaymentFeeId, Double fee, String adminId) {
		ModeOfPaymentFees mf=rep.findAllByModeOfPaymentFeeIdAndAdminId(modeOfPaymentFeeId, adminId);
		System.out.println("mf........"+mf);
		mf.setFee(fee);
	rep.save(mf);
	System.out.println("mfFinal......:"+mf);
		
		return true;
	}



//update status
	@Override
	public void updateStatusByBranchId(String branchId,String adminId,String modeofpayments) {
		
	Admin admin=adminService.getAdminDetailsBasedOnAdminId(adminId);
		String[] s1 =admin.getModeOfPayments().split(",");
		System.out.println("adminMop......"+Arrays.toString(s1));
		String[] mop=modeofpayments.split(",");
		System.out.println("branchMop......."+Arrays.toString(mop));
		Map<String,String> modeOfPaymentsMap=new HashMap<String, String>();
		Branch branch=branchService.getBranchBasedOnBranchId(branchId);
	System.out.println("branch......."+branch);
         for(String mops:mop) {
        	 modeOfPaymentsMap.put(mops,mops);
         }
         
         for(String s:s1) {
    		List<ModeOfPaymentFees> fee= rep.findByBranchId(branchId);
             System.out.println("fee......"+fee);
    		 ModeOfPaymentFees mopf=rep.findByModeOfPaymentIdAndBranchId(s.split("-")[0], branchId);

        	 if(modeOfPaymentsMap.containsKey(s)) {
        		 System.out.println("mopif......"+s);
        		System.out.println("mopf........"+mopf);
        		 mopf.setStatus("active");
        		 System.out.println("mopfif......"+mopf);
        	 }else {
        		 mopf.setStatus("inactive");
        		 System.out.println("mopelse......"+mopf);

        	 }

		rep.save(mopf);
		System.out.println("mf........."+fee);
         }	
	}




	@Override
	public List<ModeOfPaymentFees> getAllByBranchId(String branchId) {
		return rep.findByBranchId(branchId);
	}




	@Override
	public ModeOfPaymentFees getModeOfPaymentBasedOnName(String name) {
		// TODO Auto-generated method stub
		return rep.findByName(name);
	}




	@Override
	public List<ModeOfPaymentFees> getAllMopFeesBasedOnAdminidBranchidPaymentId(String adminid, String branchid,
			String mopid) {
		List<ModeOfPaymentFees> list=rep.getAllMopFeesBasedOnAdminBranchModeid(adminid,branchid,mopid);
		return list;
	}


	@Override
	public String saveModeOfPaymentLimitation(ModeOfPaymentFees mop) {
		
		NoGenerator noGenerator =   noGeneratorService.getNoGenerator("mode_of_payment_fees");
		String modeOfPaymentFeeId=noGenerator.getIdPrefix()+noGenerator.getTableId();
		mop.setModeOfPaymentFeeId(modeOfPaymentFeeId);	
		rep.save(mop);
		System.out.println("modeOfPaymentFeeId.........::::"+modeOfPaymentFeeId);
		 noGeneratorService.updateNoGenerator(noGenerator);
		
		return "success";
	}




	@Override
	public String updateModeOfPaymentFeeLimit(String mopfeeid, Double fee,String rateType) {
		
		ModeOfPaymentFees mo=rep.getOne(mopfeeid);
		mo.setFee(fee);
		mo.setRateType(rateType);
		rep.save(mo);
		return "success";
	}




	@Override
	public String deleteModeOfPaymentLimit(String mopfeeid) {
		rep.deleteById(mopfeeid);
		return "success";
	}




	@Override
	public ModeOfPaymentFees getModeofpaymentById(String id) {
		// TODO Auto-generated method stub
		return rep.getbymid(id);
	}

	
		
	}
	
	
	
	
	
	

