package com.kws.unitedfintech.repository;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;

import com.kws.unitedfintech.entities.SuperAdmin;

public interface SuperadminRepository extends CrudRepository<SuperAdmin, String>{

	@Query(value="SELECT s FROM SuperAdmin s WHERE s.userName=:userName AND s.password=:password")
	public SuperAdmin findByuserNameAndpassword(@Param("userName") String username,@Param("password") String password);
}
