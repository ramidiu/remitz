package com.kws.unitedfintech.serviceimpl;



import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kws.unitedfintech.entities.Admin;
import com.kws.unitedfintech.entities.Branch;
import com.kws.unitedfintech.entities.NoGenerator;
import com.kws.unitedfintech.entities.ServiceFees;
import com.kws.unitedfintech.repository.AdminRepository;
import com.kws.unitedfintech.repository.BranchRepository;
import com.kws.unitedfintech.repository.ServiceFeeRepo;
import com.kws.unitedfintech.service.CountryService;
import com.kws.unitedfintech.service.FeeService;
import com.kws.unitedfintech.service.NoGeneratorService;

@Service
public class FeeServiceImpl implements FeeService{

	@Autowired
	private ServiceFeeRepo servicefee;
	@Autowired
	private BranchRepository branchrepo;
	@Autowired
	private AdminRepository adminRepo;
	@Autowired
	private NoGeneratorService noGeneratorService;
	@Autowired
	private CountryService countryService;
	@Override
	public List<ServiceFees> getAllBranchesBasedOnAdminId(String adminid) {
		
		List<ServiceFees> list= null;
				list=servicefee.getAllByAdminId(adminid,"active");
				
		return list;
	}
	@Override
	public boolean addFeeLimitation(double minvalue,double maxvalue, double fee,String frombranch,String tobranch,String adminid,String rateType) {
		boolean flag=false;
		ServiceFees sf=new ServiceFees();
		Admin admin=adminRepo.getAdminByadminId(adminid);
		 Branch fbranch=branchrepo.findBybranchIds(frombranch);
		 System.out.println("fbranch values"+fbranch.toString());
		 Branch tbranch=branchrepo.findBybranchIds(tobranch);

		String[] pt=admin.getPaymentTypes().split(",");
		String[] pt1=tbranch.getPaymentMode().split(",");
		Map<String, String> map = new HashMap<String, String>();
		for (String payment : pt1) {
			map.put(payment, payment);
		}
		for (String s1 : pt) {

		List<ServiceFees> s=	servicefee.getduplicate(frombranch, tobranch, adminid, minvalue, maxvalue, fee, rateType,s1);
		if(s.size()>0) {
			System.out.println("already record is nthere in service fee");
		}else {
		/* Country country=countryService.getCountryBasedOnIso("du"); */	 
	 NoGenerator noGenerator = noGeneratorService.getNoGenerator("servicefee");
		String serviceFeeId=noGenerator.getIdPrefix() + noGenerator.getTableId();
		if (map.containsKey(s1)) {
			sf.setStatus("active");
		} else {
			sf.setStatus("inactive");
		}
		sf.setPaymentType(s1);
		sf.setServiceFeeId(serviceFeeId);
		sf.setFromBranch(fbranch);
		sf.setToBranch(tbranch);
		sf.setAdmin(admin);
		sf.setMinValue(minvalue);
		sf.setMaxValue(maxvalue);
		sf.setServiceFee(fee);
		sf.setRateType(rateType.toString());
		System.out.println("sf::::::"+sf);
		servicefee.save(sf);
		System.out.println("sf====="+sf);
		noGeneratorService.updateNoGenerator(noGenerator);
		flag=true;
		}}
		return flag;
	}
	@Override
	public boolean updateFeeLimitation(String servicefeeid, int fee ,String adminid,String rateType) {
		ServiceFees sf=servicefee.findDetailsByServicefeeId(servicefeeid,adminid);
		sf.setServiceFee(fee);
		sf.setRateType(rateType);
		servicefee.save(sf);
		return true;
	}
	@Override
	public boolean deleteFeeLimitation(String sid,String adminid) {
		ServiceFees sf=servicefee.findDetailsByServicefeeId(sid,adminid);
		
		servicefee.delete(sf);
		return true;
	}
	@Override
	public List<ServiceFees> getListOfServiceFeeBasedOnFromBranchAndToBranchId(String fromBranchId, String toBranchId,String p) {
		return servicefee.getServiceFeeBasedonFromBranchIdtoBranchId(fromBranchId, toBranchId,p);
	}
	@Override
	public List<ServiceFees> getListOfServiceFeeBasedOnFromBranchAndToBranchId(String fromBranchId, String toBranchId,String adminid,String p) {
		return servicefee.getServiceFeeBasedonFromBranchIdtoBranchId(fromBranchId, toBranchId,adminid,p);
	}
	@Override
	public double getServiceFeeBasedonMinMaxFromBranchIdtoBranchIdAndAdminId(String minvalue, String maxvalue,
			String fromBranchId, String toBranchId, String adminId) {
		// TODO Auto-generated method stub
		return 0;
	}
	@Override
	public ServiceFees getSpecificServiceFeeBasedOnFromBranchAndToBranchId(String fromBranchId, String toBranchId,
			String amount,String p) {
		double amt=Double.parseDouble(amount);
		System.out.println("getting from branchid perfect:"+fromBranchId);
		System.out.println("getting to branchid perfect:"+toBranchId);
		System.out.println("getting amount perfect:"+amt);
			ServiceFees sf=	servicefee.getSpecificServiceFee(fromBranchId, toBranchId,amt,p);
		/* System.out.println("getting amount reponse:"+sf.size()); */ 
				return sf;
	}
	@Override
	public boolean addFeeLimitation1(double minvalue, double maxvalue, double sfee,double pfee, String frombranch, String tobranch,
			String adminid, String rateType, String ptype) {
		boolean flag=false;
		ServiceFees sf=new ServiceFees();
		Admin admin=adminRepo.getAdminByadminId(adminid);
		 Branch fbranch=branchrepo.findBybranchIds(frombranch);
		 System.out.println("fbranch values"+fbranch.toString());
		 Branch tbranch=branchrepo.findBybranchIds(tobranch);

		NoGenerator noGenerator = noGeneratorService.getNoGenerator("servicefee");
			String serviceFeeId=noGenerator.getIdPrefix() + noGenerator.getTableId();
			sf.setPaymentType(ptype);
			sf.setStatus("active");
			sf.setServiceFeeId(serviceFeeId);
			sf.setFromBranch(fbranch);
			sf.setToBranch(tbranch);
			sf.setAdmin(admin);
			sf.setMinValue(minvalue);
			sf.setMaxValue(maxvalue);
			sf.setServiceFee(sfee);
			sf.setPercentageFee(pfee);
			sf.setRateType(rateType.toString());
			System.out.println("sf::::::"+sf);
			servicefee.save(sf);
			System.out.println("sf====="+sf);
			noGeneratorService.updateNoGenerator(noGenerator);
			flag=true;
			
			return flag;
		}
	@Override
	public List<ServiceFees> getByFromBranchToBranchAndPaymentType(String fromBranch, String toBranch, String ptype) {
		// TODO Auto-generated method stub
		return servicefee.getbyfrombranchAndtobranchAndpaymenttype(fromBranch, toBranch, ptype);
	}
	@Override
	public ServiceFees getByServiceFeeId(String sfid) {
		// TODO Auto-generated method stub
		return servicefee.getByServiceFeeId(sfid);
	}
	@Override
	public void updtefee(ServiceFees sf) {
		// TODO Auto-generated method stub
		servicefee.save(sf);
	}
	@Override
	public double getmaxvalue(String fromBranch,String toBranch,String paymentType) {
		// TODO Auto-generated method stub
		double value=servicefee.getMaxValue(fromBranch, toBranch, paymentType);
		System.out.println("value===="+value);
		return value;
	}
	@Override
	public ServiceFees getbymaxvalueptype(String fromBranch, String toBranch, String ptype, double maxValue) {
		// TODO Auto-generated method stub
		return servicefee.getByMaxValueAndPtype(fromBranch, toBranch, ptype, maxValue);
	}
	@Override
	public List<ServiceFees> getbyfromtobranchhes(String fromBranch, String toBranch) {
		// TODO Auto-generated method stub
		return servicefee.getbyfromtobranches(fromBranch, toBranch);
	}
	@Override
	public List<ServiceFees> getListOfServiceFeeBasedOnFromBranchAndToBranchIds(String fromBranchId,
			String toBranchId) {
		// TODO Auto-generated method stub
		return servicefee.getServiceFeeBasedonFromBranchIdtoBranchIds(fromBranchId, toBranchId);
	}
	@Override
	public List<ServiceFees> getAllServiceFeesBasedAdminId(String adminId,String Status) {
		return servicefee.getAllByAdminId(adminId, Status);
	}
	
}
