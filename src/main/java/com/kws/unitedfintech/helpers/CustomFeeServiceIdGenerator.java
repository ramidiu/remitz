package com.kws.unitedfintech.helpers;

import java.io.Serializable;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Date;

import org.hibernate.HibernateException;
import org.hibernate.engine.spi.SharedSessionContractImplementor;
import org.hibernate.id.IdentifierGenerator;



public class CustomFeeServiceIdGenerator implements IdentifierGenerator {

	@Override
	public Serializable generate(SharedSessionContractImplementor session, Object object) throws HibernateException {
		String sql="select count(servicefeeid) as id from service_fee";
		try {
		Connection con=session.connection();
	
		PreparedStatement pstmt=con.prepareStatement(sql);
		ResultSet rs=pstmt.executeQuery();
		rs.next();
		int count=rs.getInt(1);
		Date d=new Date();
		String id="Srf"+d.getYear()+new Integer(count).toString();
		return id;
		}catch(Exception e)
		{
			
			e.printStackTrace();
		}
		return null;
	}

}
