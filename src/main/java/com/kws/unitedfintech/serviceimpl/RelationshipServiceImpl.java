package com.kws.unitedfintech.serviceimpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kws.unitedfintech.entities.Relationship;
import com.kws.unitedfintech.repository.RelationshipRepository;
import com.kws.unitedfintech.service.RelationshipService;

@Service
public class RelationshipServiceImpl implements RelationshipService{
	@Autowired
	private RelationshipRepository relationshipRepository;
	
	@Override
	public List<Relationship> getRelationship() {
		return relationshipRepository.findAll();
	}
	

}
