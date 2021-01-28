package com.kws.unitedfintech.serviceimpl;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kws.unitedfintech.entities.NoGenerator;
import com.kws.unitedfintech.repository.NoGeneratorRepository;
import com.kws.unitedfintech.service.NoGeneratorService;

@Service
public class NoGeneratorServiceImpl implements NoGeneratorService{
   @Autowired
	private NoGeneratorRepository repository;
	
	@Override
	public void StoreMasterDataOfTables() {
		
		//SuperAdmin Table
		NoGenerator noGenerator1=new NoGenerator();
		noGenerator1.setTableName("super_admin");
		noGenerator1.setIdPrefix("SUP");
		noGenerator1.setTableId(1000001L);
		
		// Admin Table 
		NoGenerator  noGenerator2=new NoGenerator();
		noGenerator2.setTableName("admin");
		noGenerator2.setIdPrefix("ADM");
		noGenerator2.setTableId(2000001L);
		
		//Branch Table
		NoGenerator noGenerator3=new NoGenerator();
		noGenerator3.setTableName("branch");
		noGenerator3.setIdPrefix("BRN");
		noGenerator3.setTableId(3000001L);
		
		//Agent Table 
		NoGenerator noGenerator4=new NoGenerator();
		noGenerator4.setTableName("agent");
		noGenerator4.setIdPrefix("AGE");
		noGenerator4.setTableId(4000001L);
		
		//Customer Table
		NoGenerator noGenerator5=new NoGenerator();
		noGenerator5.setTableName("customer");
		noGenerator5.setIdPrefix("CST");
		noGenerator5.setTableId(330000L);
		
		//custnogenerator Table
		NoGenerator noGenerator6=new NoGenerator();
		noGenerator6.setTableName("custnogenerator");
		noGenerator6.setIdPrefix("CUSN");
		noGenerator6.setTableId(9000001L);
		
		//Currency Rates
		NoGenerator noGenerator7=new NoGenerator();
		noGenerator7.setTableName("currency_rates");
		noGenerator7.setIdPrefix("CUR");
		noGenerator7.setTableId(6000000L);
		
		//Beneficiary details
				NoGenerator noGenerator8=new NoGenerator();
				noGenerator8.setTableName("beneficiary");
				noGenerator8.setIdPrefix("BNF");
				noGenerator8.setTableId(7000000L);
				
				//Transaction details
				NoGenerator noGenerator9=new NoGenerator();
				noGenerator9.setTableName("transaction_details");
				noGenerator9.setIdPrefix("TXN");
				noGenerator9.setTableId(8000000L);
				
				NoGenerator noGenerator10=new NoGenerator();
				noGenerator10.setTableName("alert");
				noGenerator10.setIdPrefix("ALRT");
				noGenerator10.setTableId(2100000L);
				

				NoGenerator noGenerator11=new NoGenerator();
				noGenerator11.setTableName("sub_admin");
				noGenerator11.setIdPrefix("SADM");
				noGenerator11.setTableId(340000L);
				
				NoGenerator noGenerator12=new NoGenerator();
				noGenerator12.setTableName("jv");
				noGenerator12.setIdPrefix("JV");
				noGenerator12.setTableId(3200001L);
				
				NoGenerator noGenerator13=new NoGenerator();
				noGenerator13.setTableName("bank_txn");
				noGenerator13.setIdPrefix("BTXN");
				noGenerator13.setTableId(55000001L);
				
				NoGenerator noGenerator14=new NoGenerator();
				noGenerator14.setTableName("subhead");
				noGenerator14.setIdPrefix("SUBH");
				noGenerator14.setTableId(11000001L);
				
				NoGenerator noGenerator15=new NoGenerator();
				noGenerator15.setTableName("minorhead");
				noGenerator15.setIdPrefix("MINH");
				noGenerator15.setTableId(12000001L);
				
				NoGenerator noGenerator16=new NoGenerator();
				noGenerator16.setTableName("majorhead");
				noGenerator16.setIdPrefix("MAJH");
				noGenerator16.setTableId(13000001L);
				
				//modeOfPaymentFees Table
				NoGenerator noGenerator17=new NoGenerator();
				noGenerator17.setTableName("mode_of_payment_fees");
				noGenerator17.setIdPrefix("MOP");
				noGenerator17.setTableId(1000000L);
				
				NoGenerator noGenerator18=new NoGenerator();
				noGenerator18.setTableName("branch_payment_type_details");
				noGenerator18.setIdPrefix("BPTD");
				noGenerator18.setTableId(5100000L);
				NoGenerator noGenerator19=new NoGenerator();
				noGenerator19.setTableName("agent_sell_rate");
				noGenerator19.setIdPrefix("AGCUR");
				noGenerator19.setTableId(3240000L);
				//Add New User
				NoGenerator noGenerator20=new NoGenerator();
				noGenerator20.setTableName("add_new_user");
				noGenerator20.setIdPrefix("ADD");
				noGenerator20.setTableId(100L);
				//banks
				NoGenerator noGenerator21=new NoGenerator();
				noGenerator21.setTableName("bank_details");
				noGenerator21.setIdPrefix("BNK");
				noGenerator21.setTableId(800L);
				
				//cash
				NoGenerator noGenerator25=new NoGenerator();
				noGenerator25.setTableName("cash_pickup");
				noGenerator25.setIdPrefix("CASH");
				noGenerator25.setTableId(8900L);
			
				//email
				NoGenerator noGenerator23=new NoGenerator();
				noGenerator23.setTableName("email_template");
				noGenerator23.setIdPrefix("EML");
				noGenerator23.setTableId(89000L);
				

				
				
				
				NoGenerator noGenerator22=new NoGenerator();
				noGenerator25.setTableName("Cash");
				noGenerator25.setIdPrefix("CASH");
				noGenerator25.setTableId(8900L);

				NoGenerator noGenerator26=new NoGenerator();
				noGenerator26.setTableName("online_mop");
				noGenerator26.setIdPrefix("OMP");
				noGenerator26.setTableId(99900L);

				NoGenerator noGenerator27=new NoGenerator();
				noGenerator27.setTableName("ewallet_paymentType");
				noGenerator27.setIdPrefix("EWT");
				noGenerator27.setTableId(999900L);

				NoGenerator noGenerator28=new NoGenerator();
				noGenerator28.setTableName("internet_bankTranser");
				noGenerator28.setIdPrefix("IBT");
				noGenerator28.setTableId(9999900L);

				NoGenerator noGenerator29=new NoGenerator();
				noGenerator28.setTableName("demo_req");
				noGenerator28.setIdPrefix("DERQ");
				noGenerator28.setTableId(20001L);

				
				NoGenerator noGenerator30=new NoGenerator();
				noGenerator1.setTableName("majorhead");
				noGenerator1.setIdPrefix("MHID");
				noGenerator1.setTableId(12000L);
                  
				NoGenerator noGenerator31=new NoGenerator();
				noGenerator1.setTableName("minorhead");
				noGenerator1.setIdPrefix("MNID");
				noGenerator1.setTableId(13000L);

				NoGenerator noGenerator32=new NoGenerator();
				noGenerator1.setTableName("subhead");
				noGenerator1.setIdPrefix("SBID");
				noGenerator1.setTableId(14000L);

				NoGenerator noGenerator33=new NoGenerator();
				noGenerator33.setTableName("bdemo_req");
				noGenerator33.setIdPrefix("DRQS");
				noGenerator33.setTableId(2000L);
				
				NoGenerator noGenerator34=new NoGenerator();
				noGenerator34.setTableName("journalvoucher");
				noGenerator34.setIdPrefix("JVN");
				noGenerator34.setTableId(1000L);
				NoGenerator noGenerator35=new NoGenerator();
				noGenerator35.setTableName("jvoucher");
				noGenerator35.setIdPrefix("JVEN");
				noGenerator35.setTableId(2000L);
 
				NoGenerator noGenerator36=new NoGenerator();
				noGenerator36.setTableName("bankbalance");
				noGenerator36.setIdPrefix("BBAL");
				noGenerator36.setTableId(3000L);
				NoGenerator noGenerator37=new NoGenerator();
				noGenerator37.setTableName("tx_days");
				noGenerator37.setIdPrefix("TXD");
				noGenerator37.setTableId(879000L);

				NoGenerator noGenerator38=new NoGenerator();
				noGenerator37.setTableName("openingBalance");
				noGenerator37.setIdPrefix("OPBAL");
				noGenerator37.setTableId(2300L);

				/*
		 * NoGenerator noGenerator26=new NoGenerator();
		 * noGenerator26.setTableName("cash"); noGenerator26.setIdPrefix("CSP");
		 * noGenerator26.setTableId(9000L);
		 * 
		 * 
		 */		
				
		/*
		 * //customer Table NoGenerator noGenerator18=new NoGenerator();
		 * noGenerator18.setTableName("customer"); noGenerator18.setIdPrefix("CUS");
		 * noGenerator18.setTableId(180000L);
		 */
		
		List<NoGenerator> noGeneratorsList = new ArrayList<NoGenerator>();
		noGeneratorsList.add(noGenerator29);
		noGeneratorsList.add(noGenerator1);
		noGeneratorsList.add(noGenerator2);
		noGeneratorsList.add(noGenerator3);
		noGeneratorsList.add(noGenerator4);
		noGeneratorsList.add(noGenerator5);
		noGeneratorsList.add(noGenerator6);
		noGeneratorsList.add(noGenerator7);
		noGeneratorsList.add(noGenerator8);
		noGeneratorsList.add(noGenerator9);
		noGeneratorsList.add(noGenerator10);
		noGeneratorsList.add(noGenerator11);
		noGeneratorsList.add(noGenerator12);
		noGeneratorsList.add(noGenerator13);
		noGeneratorsList.add(noGenerator14);
		noGeneratorsList.add(noGenerator15);
		noGeneratorsList.add(noGenerator16);
		noGeneratorsList.add(noGenerator17);
		noGeneratorsList.add(noGenerator18);
		noGeneratorsList.add(noGenerator19);
		noGeneratorsList.add(noGenerator20);
		noGeneratorsList.add(noGenerator21);
		noGeneratorsList.add(noGenerator25);
		noGeneratorsList.add(noGenerator22);
		noGeneratorsList.add(noGenerator23);
		noGeneratorsList.add(noGenerator26);
		noGeneratorsList.add(noGenerator27);
		noGeneratorsList.add(noGenerator28);
		noGeneratorsList.add(noGenerator30);
		noGeneratorsList.add(noGenerator31);
		noGeneratorsList.add(noGenerator32);
		noGeneratorsList.add(noGenerator33);
		noGeneratorsList.add(noGenerator34);
		noGeneratorsList.add(noGenerator35);
		noGeneratorsList.add(noGenerator36);
		noGeneratorsList.add(noGenerator37);
		noGeneratorsList.add(noGenerator38);

		//noGeneatorDao.StoreMasterDataOfTables(noGeneratorsList);
		
	}

	

	@Override
	public void updateNoGenerator(NoGenerator noGenerator) {
		System.out.println("tanble id====="+noGenerator.getTableId());
		noGenerator.setTableId(noGenerator.getTableId() + 1);
		System.out.println("noGenerator====="+noGenerator);
		repository.save(noGenerator);
}

	@Override
	public String[] getFieldValues(String tableName, String... fieldNames) {
		//String result[] = noGeneatorDao.getFieldValues(tableName, fieldNames);
		return null;
	}

	@Override
	public NoGenerator getNoGenerator(String tableName) {
		return repository.findBytableName(tableName);
	}



	@Override
	public NoGenerator getNoGenerator(String tableName, Session session) {
		//NoGenerator noGenerator = noGeneatorDao.getNoGenerator(tableName,session);
		//updateNoGeneratorWithSession(noGenerator, session);
		//return noGenerator;
		return null;
	}



	@Override
	public void updateNoGeneratorWithSession(NoGenerator noGenerator, Session session) {
		noGenerator.setTableId(noGenerator.getTableId() + 1);
		//noGeneatorDao.updateNoGenerator(noGenerator);
	}

}
