package com.kws.unitedfintech.serviceimpl;

import java.io.File;
import java.io.FileOutputStream;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.Iterator;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartRequest;

import com.kws.unitedfintech.entities.AgentDeposit;
import com.kws.unitedfintech.entities.NoGenerator;
import com.kws.unitedfintech.helpers.FileURLs;
import com.kws.unitedfintech.helpers.SenditoConvertNullsToEmpty;
import com.kws.unitedfintech.repository.AgentDepositRepository;
import com.kws.unitedfintech.service.AgentDepositService;
import com.kws.unitedfintech.service.NoGeneratorService;

@Service
public class AgentDepositServiceImpl implements AgentDepositService{

	
	@Autowired
	private AgentDepositRepository adr;
	
	@Autowired
	private NoGeneratorService noGeneratorService;
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	
	Calendar cal = Calendar.getInstance();
	
	Date d = cal.getTime();
	SimpleDateFormat sdf1 = new SimpleDateFormat("yyyy-MM-dd");

	Date d1=cal.getTime();
	SenditoConvertNullsToEmpty senditoConvertNullsToEmpty=new SenditoConvertNullsToEmpty();

	@Override
	public AgentDeposit save(AgentDeposit ad, MultipartRequest multiPartRequest) {
		// TODO Auto-generated method stub
		NoGenerator noGenerator=noGeneratorService.getNoGenerator("agent_deposit");
		String id=noGenerator.getIdPrefix()+noGenerator.getTableId();
		ad.setAdId(id);
		ad.setDepositDate(sdf.format(d));
		ad.setDate(sdf1.format(d1));
		String fileLocation="";
		if(multiPartRequest != null ){
			int i=0;
			Iterator<String> itr =  multiPartRequest.getFileNames();
			if(itr!=null && !itr.equals("") ){
				while(itr.hasNext()){
					i = i + 1;
				  MultipartFile mpf = multiPartRequest.getFile(itr.next());
				     String orgFileName = mpf.getOriginalFilename();
				     String extension = orgFileName.substring(orgFileName.lastIndexOf(".") + 1);
				     
					    String fileName = id+"_"+i+"."+extension;	
					    
				     System.out.println("fileName::"+fileName);
				     fileLocation = FileURLs.getDepositDocument(id);
				     System.out.println("fileLocation="+fileLocation);
				     File file= new File(fileLocation);
		             boolean b=file.mkdir();
		             System.out.println(":b::::::"+b);
				   if(mpf.getSize() > 0){
						FileOutputStream fos;
						try {
							fos = new FileOutputStream(fileLocation+"/"+fileName);   
							System.out.println("fos::::::::: "+fos);
							fos.write(mpf.getBytes());
							fos.flush();
							fos.close();
						if(i == 1){
							
							ad.setDocument(fileName);
							System.out.println("filename1......"+fileName);
						}
						}
				   catch (Exception e) {
							e.printStackTrace();
						}
				   }
				}

	}}
		ad=adr.save(ad);
		noGeneratorService.updateNoGenerator(noGenerator);

		return ad;
		}

	@Override
	public List<AgentDeposit> getAllByAgent(String id) {
		// TODO Auto-generated method stub
		return adr.getbyagent(id);
	}

	@Override
	public List<AgentDeposit> getByBranchAndDates(String id, String fromDate, String toDate,String status) {
		// TODO Auto-generated method stub
		System.out.println("id===="+id);
		System.out.println("fromDate===="+fromDate);
		System.out.println("toDate===="+toDate);
		return adr.getAllDepositsByBranch(id, fromDate, toDate,status);
	}

	@Override
	public List<AgentDeposit> getAll() {
		// TODO Auto-generated method stub
		return (List<AgentDeposit>) adr.findAll();
	}

	@Override
	public List<AgentDeposit> getByBranch(String id,String status) {
		// TODO Auto-generated method stub
		return adr.getByBranch(id,status);
	}

	@Override
	public AgentDeposit save2(AgentDeposit a) {
		NoGenerator noGenerator=noGeneratorService.getNoGenerator("agent_deposit");
		String id=noGenerator.getIdPrefix()+noGenerator.getTableId();
		a.setAdId(id);
		a.setDepositDate(sdf.format(d));
		a.setDate(sdf1.format(d1));
		AgentDeposit ad=	adr.save(a);
		noGeneratorService.updateNoGenerator(noGenerator);
		return ad;
	}

	@Override
	public List<AgentDeposit> getbyadmin(String adminId) {
		// TODO Auto-generated method stub
		return adr.getByAdmin(adminId);
	}

	@Override
	public AgentDeposit getbyId(String Id) {
		// TODO Auto-generated method stub
		return adr.getByadId(Id);
	}

	@Override
	public AgentDeposit updateStatus(AgentDeposit a) {
		// TODO Auto-generated method stub
		return adr.save(a);
	}
}
