package com.kws.unitedfintech.repository;

import org.springframework.data.repository.CrudRepository;

import com.kws.unitedfintech.entities.SecurityData;

public interface SecurityDataRepos extends CrudRepository<SecurityData, String> {

}
