package com.kws.unitedfintech.serviceimpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kws.unitedfintech.entities.RealationShips1;
import com.kws.unitedfintech.helpers.SenditoConvertNullsToEmpty;
import com.kws.unitedfintech.repository.RealationShips1Repository;
import com.kws.unitedfintech.service.RealationShips1Service;

@Service
public class RealationShips1ServiceImpl implements RealationShips1Service{

	
	
	@Autowired 
	private RealationShips1Repository realationShips1Repository;
	SenditoConvertNullsToEmpty senditoConvertNullsToEmpty=new SenditoConvertNullsToEmpty();

	@Override
	public void insertRelationships(RealationShips1 realationShips1) {
		realationShips1 = senditoConvertNullsToEmpty.convertNullFieldToEmpty(realationShips1, RealationShips1.class);
		realationShips1Repository.save(realationShips1);	
	}

	@Override
	public List<RealationShips1> RelationshipsListBasedOnAdmin(String adminId) {
		// TODO Auto-generated method stub
		return realationShips1Repository.findAll(adminId);
	}
	@Override
	public void editsourceOfFund(String relationShip, int relationId) {
		// TODO Auto-generated method stub
		//realationShips1Repository
	}

	@Override
	public boolean updateRelationShip(String relationShip, int relationId, String adminId) {
		RealationShips1 rp=realationShips1Repository.findbyAdminAndId(adminId, relationId);
		rp.setRelationShip(relationShip);
		realationShips1Repository.save(rp);
		return true;
	}

	@Override
	public void deleteRelationShip(int relationId) {
		realationShips1Repository.deleteById(relationId);
	}

}
