package com.kws.unitedfintech.serviceimpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kws.unitedfintech.entities.ModeOfPaymentFees;
import com.kws.unitedfintech.entities.ModeOfPayments;
import com.kws.unitedfintech.repository.ModeOfPaymentFeesRepository;
import com.kws.unitedfintech.repository.ModeOfPaymentRepository;
import com.kws.unitedfintech.service.ModeOfPaymentsService;
import com.kws.unitedfintech.service.NoGeneratorService;

@Service
public class ModeOfPaymentsServiceImpl implements ModeOfPaymentsService{
	@Autowired
	private final ModeOfPaymentRepository repository;
	
	@Autowired
	private NoGeneratorService noGeneratorService;
	
	@Autowired
	private ModeOfPaymentFeesRepository modeOfPaymentFeesRepository;
	
	public ModeOfPaymentsServiceImpl(ModeOfPaymentRepository repository) {
		super();
		this.repository = repository;
	}
	
	/*
	 * @Override public void saveModeOfPayments(ModeOfPaymentFees
	 * modeOfPaymentFees,Admin admin,String branchId) { NoGenerator noGenerator =
	 * noGeneratorService.getNoGenerator("mode_of_payment_fees"); String
	 * modeOfPaymentFeeId=noGenerator.getIdPrefix()+noGenerator.getTableId();
	 * 
	 * modeOfPaymentFees.setAdmin(admin);
	 * 
	 * modeOfPaymentFees.setModeOfPaymentFeeId(modeOfPaymentFeeId);
	 * modeOfPaymentFeesRepository.save(modeOfPaymentFees);
	 * System.out.println("modeOfPaymentFeeId.........::::"+modeOfPaymentFeeId);
	 * noGeneratorService.updateNoGenerator(noGenerator);
	 * 
	 * }
	 * 
	 */	
	
	@Override
	public List<ModeOfPayments> getAllModeOfPaymets() {
		return repository.FindAll();
	}
	@Override
	public void updateModeOfPaymentFees(ModeOfPaymentFees modeOfPaymentFees) {
		modeOfPaymentFeesRepository.save(modeOfPaymentFees);
	
	}
	
	@Override
	public ModeOfPayments getModeOfPaymentBasedOnId(String id) {
		return repository.findBymodeOfPaymentId(id);
	}
	@Override
	public ModeOfPayments getModeOfPaymentBasedOnName(String branchName) {
		return null;
	}

	@Override
	public List<ModeOfPaymentFees> getAllModeOfPaymentFees() {

		return modeOfPaymentFeesRepository.findAll();
	}

	@Override
	public ModeOfPaymentFees getModeOfPaymentFeeBasedOnBranchIdAndModeOfPayment(String branchId, String modeOfPayment) {
		return  modeOfPaymentFeesRepository.getModeOfPaymentFeeBasedOnBranchIdAndModeOfPayment(branchId, modeOfPayment);
	}

	@Override
	public ModeOfPayments getModeofPaymentIdBasedOnModeOfPayment(String modeOfPayment) {
		// TODO Auto-generated method stub
		return repository.findByModeOfPayment(modeOfPayment);
	}
	@Override
	public List<ModeOfPaymentFees> getModeOfPaymentFeeBasedOnBranchId(String branchId) {
		return modeOfPaymentFeesRepository.getModeOfPaymentBasedonBranchIdAndStatus("active",branchId);
	}

	@Override
	public List<ModeOfPaymentFees> getModeOfPaymentFeeBasedOnBranchIdAndDisplay(String branchId, String display) {
		// TODO Auto-generated method stub
		return modeOfPaymentFeesRepository.findByBranchIdAndDisplay(branchId, display,"active");
	}

	@Override
	public ModeOfPaymentFees getModeOfPaymentFeeBasedOnBranchIdAndModeOfPaymentAndAmount(String branchId,
			String modeOfPayment, String Amount) {
		// TODO Auto-generated method stub
		//long amt=Long.parseLong(Amount);
		ModeOfPaymentFees mf=modeOfPaymentFeesRepository.findbyAmount(branchId, modeOfPayment, Double.parseDouble(Amount));
		return mf;
	}

	@Override
	public ModeOfPaymentFees getdoubleAmount(String branchId, String modeOfPayment, Long Amount) {
		// TODO Auto-generated method stub
		return modeOfPaymentFeesRepository.findbyAmount(branchId, modeOfPayment, Amount);
	}

	@Override
	public List<ModeOfPaymentFees> getList(String branchId, String display, double Amount) {
		// TODO Auto-generated method stub
		return modeOfPaymentFeesRepository.findByBranchIdAndDisplayAndAmount(branchId, display, "active", Amount);
	}

	@Override
	public List<ModeOfPaymentFees> getModeOfPaymentFeeBasedOnBranchIdAndModeOfPayments(String branchId,
			String modeOfPayment) {
		// TODO Auto-generated method stub
		return modeOfPaymentFeesRepository.findByBranchAndMop(branchId, modeOfPayment);
	}

	

	/*
	 * @Override public List<ModeOfPaymentFees>
	 * getAllModeOfPaymentFeesBasedOnAdminId(String adminId) { // TODO
	 * Auto-generated method stub return
	 * modeOfPaymentFeesRepository.findByAdminId(adminId); }
	 * 
	 */
}
