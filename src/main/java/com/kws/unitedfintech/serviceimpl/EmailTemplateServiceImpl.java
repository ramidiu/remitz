package com.kws.unitedfintech.serviceimpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kws.unitedfintech.entities.EmailTemplate;
import com.kws.unitedfintech.helpers.SenditoConvertNullsToEmpty;
import com.kws.unitedfintech.repository.EmailTemplateServiceRepository;
import com.kws.unitedfintech.service.EmailTemplateService;
@Service
public class EmailTemplateServiceImpl implements EmailTemplateService{
	
	@Autowired
	private EmailTemplateServiceRepository emailTemplateServiceRepository;
	SenditoConvertNullsToEmpty senditoConvertNullsToEmpty=new SenditoConvertNullsToEmpty();


	@Override
	public EmailTemplate getEmailTemplateBasedOnTemplateId(int emailCode) {
		// TODO Auto-generated method stub
		return emailTemplateServiceRepository.findByEmailCode(emailCode);
	}

	@Override
	public List<EmailTemplate> getEmailTemplates() {
		// TODO Auto-generated method stub
		return emailTemplateServiceRepository.findAll();
	}

	@Override
	public void insertTemplate(EmailTemplate template) {
		template = senditoConvertNullsToEmpty.convertNullFieldToEmpty(template, EmailTemplate.class);

		emailTemplateServiceRepository.save(template);
	}

	@Override
	public List<EmailTemplate> getEmailTemplatesBasedOnAdmin(String adminId) {
		// TODO Auto-generated method stub
		return emailTemplateServiceRepository.findByAdmin(adminId);
	}

	@Override
	public EmailTemplate getEmailTemplateByTitleAndAdmin(String adminId, String title) {
		// TODO Auto-generated method stub
		return emailTemplateServiceRepository.findByAdminAndTitle(adminId, title);
	}

}
