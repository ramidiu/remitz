package com.kws.unitedfintech.serviceimpl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kws.unitedfintech.entities.NasanoResponse;
import com.kws.unitedfintech.entities.NoGenerator;
import com.kws.unitedfintech.repository.NasanoResponseRepository;
import com.kws.unitedfintech.service.NasanoResponService;
import com.kws.unitedfintech.service.NoGeneratorService;

@Service
public class NasanoResponServiceImpl implements NasanoResponService{

	
	@Autowired
	private NasanoResponseRepository nr;
	@Autowired
	private NoGeneratorService noGeneratorService;

	@Override
	public NasanoResponse save(NasanoResponse ns) {
		NoGenerator noGenerator=noGeneratorService.getNoGenerator("nasano_response");
		System.out.println("noGenerator===="+noGenerator);
		String id=noGenerator.getIdPrefix()+noGenerator.getTableId();
		ns.setNId(id);
		nr.save(ns);
		System.out.println("ns===="+ns);
		noGeneratorService.updateNoGenerator(noGenerator);
		return ns;
	}

	
	@Override
	public NasanoResponse update(NasanoResponse ns) {
		// TODO Auto-generated method stub
		return nr.save(ns);
	}

	@Override
	public NasanoResponse findNById(String nId) {
		// TODO Auto-generated method stub
		return nr.findByNId(nId);
	}
}
