package com.kws.unitedfintech.serviceimpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kws.unitedfintech.entities.NoGenerator;
import com.kws.unitedfintech.entities.Processbank;
import com.kws.unitedfintech.repository.ProcessRepository;
import com.kws.unitedfintech.service.NoGeneratorService;
import com.kws.unitedfintech.service.ProcessService;
@Service
public class ProcessServiceImpl implements ProcessService {
	@Autowired
	private ProcessRepository processrepository;
	@Autowired
	private NoGeneratorService noGeneratorService;

	@Override
	public void saveprocessbankdetails(Processbank processbank) {
		NoGenerator noGenerator=noGeneratorService.getNoGenerator("processbank");
		System.out.println("noGenerator===="+noGenerator);
		String id=noGenerator.getIdPrefix()+noGenerator.getTableId();
		processbank.setProcessId(id);
		processrepository.save(processbank);
		noGeneratorService.updateNoGenerator(noGenerator);

	}

	@Override
	public List<Processbank> getListbycountry(String country) {
		// TODO Auto-generated method stub
		return processrepository.getListByCountry(country);
	}

}
