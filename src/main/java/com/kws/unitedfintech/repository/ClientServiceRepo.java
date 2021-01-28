package com.kws.unitedfintech.repository;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;

import com.kws.unitedfintech.entities.Login;


public interface ClientServiceRepo extends CrudRepository<Login, String> {

	@Query("from  Login e  where e.loginID=:username and e.password=:password")
	public Login checkCredintials(String username,String password);
}
