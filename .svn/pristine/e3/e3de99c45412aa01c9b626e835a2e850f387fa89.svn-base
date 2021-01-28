package com.kws.unitedfintech.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.kws.unitedfintech.entities.Cash;
@Repository
public interface cashRepository extends JpaRepository<Cash, String>  {
	
	@Query("select c from Cash c where c.admin.adminId=:adminId")
	public List<Cash> findAllByAdmin(@Param("adminId")String adminId);

	
	
	@Query("select c from Cash c where c.country.countryISO=:countryISO")
	public List<Cash> findAllByCountryIso(@Param("countryISO")String countryISO);

	@Query("select c from Cash c where c.admin.adminId=:adminId and c.country.countryISO=:countryISO")
	public List<Cash> findAllByAdminAndISO(@Param("adminId")String adminId,@Param("countryISO")String countryISO);


@Query("select c from Cash c where c.admin.adminId=:adminId and c.collectionPointState.stateId=:stateid")
public List<Cash> getbystateid(@Param("adminId")String adminId,@Param("stateid")String stateid);


@Query("select c from Cash c where c.admin.adminId=:adminId and c.cashPickupFrom like %:name%")
public List<Cash> getbyname(@Param("adminId")String adminId,@Param("name")String name);



@Query("select c from Cash c where c.cashId=:cashId")
public Cash cashpickupbyid(@Param("cashId")String cashId);
}
