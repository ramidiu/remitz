package com.kws.unitedfintech.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.kws.unitedfintech.entities.TopUp;
@Repository
public interface TopUpTransactionRepository extends JpaRepository<TopUp, String> {

}
