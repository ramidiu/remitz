package com.kws.unitedfintech.service;

import java.util.List;

import com.kws.unitedfintech.entities.EmailTemplate;

public interface EmailTemplateService {
	
	public EmailTemplate getEmailTemplateBasedOnTemplateId(int emailCode);

	public List<EmailTemplate> getEmailTemplates();
	
	public List<EmailTemplate> getEmailTemplatesBasedOnAdmin(String adminId);


	public void insertTemplate(EmailTemplate template);
	
	public EmailTemplate getEmailTemplateByTitleAndAdmin(String adminId,String title);

}
