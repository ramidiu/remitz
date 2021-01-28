package com.kws.unitedfintech.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.kws.unitedfintech.entities.EmailTemplate;
@Repository
public interface EmailTemplateServiceRepository extends JpaRepository<EmailTemplate, String> {
	
	@Query("select e from EmailTemplate e where e.emailCode=:emailCode")
	public EmailTemplate findByEmailCode(@Param("emailCode")int emailCode);

	
	@Query("select e from EmailTemplate e where e.admin.adminId=:adminId")
	public List<EmailTemplate> findByAdmin(@Param("adminId")String adminId);
	
	@Query("select e from EmailTemplate e where e.admin.adminId=:adminId and e.title=:title")
	public EmailTemplate findByAdminAndTitle(@Param("adminId")String adminId,@Param("title")String title)
;
}
