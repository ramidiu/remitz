package com.kws.unitedfintech.serviceimpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kws.unitedfintech.entities.ReasonForTransfer;
import com.kws.unitedfintech.helpers.SenditoConvertNullsToEmpty;
import com.kws.unitedfintech.repository.ReasonForTransferRepository;
import com.kws.unitedfintech.service.ReasonForTransferService;

@Service
public class ReasonForTransferServiceImpl implements ReasonForTransferService{
	
	@Autowired
	private ReasonForTransferRepository reasonForTransferRepository;
	SenditoConvertNullsToEmpty senditoConvertNullsToEmpty=new SenditoConvertNullsToEmpty();

	@Override
	public void insertReasonForTransfer(ReasonForTransfer reasonForTransfer) {
		reasonForTransfer = senditoConvertNullsToEmpty.convertNullFieldToEmpty(reasonForTransfer, ReasonForTransfer.class);
		reasonForTransferRepository.save(reasonForTransfer);
	}

	@Override
	public List<ReasonForTransfer> findByAdmin(String adminId) {
		// TODO Auto-generated method stub
		return reasonForTransferRepository.findAllByAdmin(adminId);
	}

	@Override
	public boolean updateReasonForTranser(String reasonForTransfer, int reasonFortransferId, String adminId) {
		// TODO Auto-generated method stub
		ReasonForTransfer rt=reasonForTransferRepository.findbyAdminAndReasonFortransferId(adminId, reasonFortransferId);
		rt.setReasonForTransfer(reasonForTransfer);
		reasonForTransferRepository.save(rt);
		return true;
	}

	@Override
	public void deleteResonorTranser(int reasonFortransferId) {
		// TODO Auto-generated method stub
		reasonForTransferRepository.deleteByReasonFortransferId(reasonFortransferId);
	}

}
