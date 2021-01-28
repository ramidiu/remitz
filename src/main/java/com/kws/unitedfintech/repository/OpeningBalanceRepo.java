package com.kws.unitedfintech.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.kws.unitedfintech.entities.OpeningBalance;
@Repository
public interface OpeningBalanceRepo extends JpaRepository<OpeningBalance, String> {
	@Query("from OpeningBalance b where b.adminid=:adminId and b.fin=:fin and b.subName=:subName")
	public List<OpeningBalance> getListForDuplicateEntrie(String adminId,String fin,String subName);
	
}
