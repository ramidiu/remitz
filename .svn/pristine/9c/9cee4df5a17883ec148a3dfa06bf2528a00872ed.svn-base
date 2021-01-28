package com.kws.unitedfintech.serviceimpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kws.unitedfintech.entities.SanctionSearch;
import com.kws.unitedfintech.repository.SanctionSearchRepository;
import com.kws.unitedfintech.service.SanctionSearchService;
@Service
public class SanctionSearchServiceImpl implements SanctionSearchService {
	@Autowired
	private SanctionSearchRepository  sanctionSearchRepository;
	@Override
	public List<SanctionSearch> getSanctionSearchResult(String firstName,String lastName) {
		return sanctionSearchRepository.getSanctionSearchResult(firstName, lastName);
	}
	

}
