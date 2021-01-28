package com.kws.unitedfintech.repository;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.kws.unitedfintech.underremitentities.ZumRailsUser;
@Repository
public interface ZumRailsRepository extends CrudRepository<ZumRailsUser, String> {

}
