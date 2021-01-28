package com.kws.unitedfintech.service;

import org.hibernate.Session;

import com.kws.unitedfintech.entities.NoGenerator;



public interface NoGeneratorService {
	public void StoreMasterDataOfTables();
	public void updateNoGenerator(NoGenerator noGenerator);
	public void updateNoGeneratorWithSession(NoGenerator noGenerator,Session session);
	public String[] getFieldValues(String tableName, String... fieldNames);
	public NoGenerator getNoGenerator(String tableName);
	public NoGenerator getNoGenerator(String tableName,Session session);
}
