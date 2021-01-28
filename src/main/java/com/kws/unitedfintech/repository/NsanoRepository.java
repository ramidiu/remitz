package com.kws.unitedfintech.repository;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.kws.unitedfintech.entities.Nasano;

@Repository
public interface NsanoRepository extends CrudRepository<Nasano, String>{

}
