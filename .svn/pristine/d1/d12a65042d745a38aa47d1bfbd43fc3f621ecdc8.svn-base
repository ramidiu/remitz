package com.kws.unitedfintech.serviceimpl;

import java.io.File;
import java.io.FileOutputStream;
import java.util.Iterator;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartRequest;

import com.kws.unitedfintech.entities.NoGenerator;
import com.kws.unitedfintech.entities.OnlineMop;
import com.kws.unitedfintech.helpers.FileURLs;
import com.kws.unitedfintech.helpers.SenditoConvertNullsToEmpty;
import com.kws.unitedfintech.repository.OnlineMopRepository;
import com.kws.unitedfintech.service.NoGeneratorService;
import com.kws.unitedfintech.service.OnlineMopService;


@Service
public class OnlineMopServiceImpl implements OnlineMopService{

@Autowired
private OnlineMopRepository onlineMopRepository;
SenditoConvertNullsToEmpty convertNullsToEmpty= new SenditoConvertNullsToEmpty();
@Autowired
private NoGeneratorService noGeneratorService;


@Override
public void save(OnlineMop onlineMop,MultipartRequest multiPartRequest) {
	// TODO Auto-generated method stub
	
	NoGenerator noGenerator = noGeneratorService.getNoGenerator("online_mop");
String onlineId=noGenerator.getIdPrefix()+noGenerator.getTableId();
	System.out.println("onlineId......"+onlineId);
	onlineMop.setOnlineId(onlineId);
	
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
			     
				    String fileName = onlineId+"_"+i+"."+extension;	
				    
			     System.out.println("fileName::"+fileName);
			     fileLocation = FileURLs.getOnlineMopUrl(onlineId);
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
						
						onlineMop.setLogo(fileName);
						System.out.println("filename1......"+fileName);
					}
					}
			   catch (Exception e) {
						e.printStackTrace();
					}
			   }
			}
			onlineMop = convertNullsToEmpty.convertNullFieldToEmpty(onlineMop, OnlineMop.class);

	onlineMopRepository.save(onlineMop);
	noGeneratorService.updateNoGenerator(noGenerator);
		}
	}

}

@Override
public List<OnlineMop> findByAdmin(String adminId) {
	// TODO Auto-generated method stub
	return onlineMopRepository.findByAdmin(adminId);
}

@Override
public void update(OnlineMop onlineMop, MultipartRequest multiPartRequest) {
	String fileLocation="";
	String onlineId=onlineMop.getOnlineId();
	if(multiPartRequest != null ){
		System.out.println("multiPartRequest=="+multiPartRequest);
		int i=0;
		Iterator<String> itr =  multiPartRequest.getFileNames();
		if(itr!=null && !itr.equals("") ){
			while(itr.hasNext()){
				i = i + 1;
			  MultipartFile mpf = multiPartRequest.getFile(itr.next());
			     String orgFileName = mpf.getOriginalFilename();
			     System.out.println("orgFileName==="+orgFileName);
			     String extension = orgFileName.substring(orgFileName.lastIndexOf(".") + 1);
			     
				    String fileName = onlineId+"_"+i+"."+extension;	
				    
			     System.out.println("fileName::"+fileName);
			     fileLocation = FileURLs.getOnlineMopUrl(onlineId);
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
						
						onlineMop.setLogo(fileName);
						System.out.println("filename1......"+fileName);
					}
					}
			   catch (Exception e) {
						e.printStackTrace();
					}
			   }
			}
			onlineMop = convertNullsToEmpty.convertNullFieldToEmpty(onlineMop, OnlineMop.class);

	onlineMopRepository.save(onlineMop);
		}
	}
}

@Override
public OnlineMop findById(String onlineId) {
	// TODO Auto-generated method stub
	return onlineMopRepository.findByOnlineId(onlineId);
}

@Override
public OnlineMop findOneByAdmin(String adminId) {
	// TODO Auto-generated method stub
	return onlineMopRepository.findOneByAdmin(adminId);
}
}
