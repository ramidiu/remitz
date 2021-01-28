package com.kws.unitedfintech.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.kws.unitedfintech.entities.ModeOfPaymentFees;

public interface ModeOfPaymentFeesRepository extends JpaRepository<ModeOfPaymentFees, String> {

	@Query("SELECT mf FROM ModeOfPaymentFees mf")
	List<ModeOfPaymentFees> findAll();
	
@Query("SELECT mf FROM ModeOfPaymentFees mf WHERE mf.branchId.branchId=:branchId AND mf.modeOfPaymentId.modeOfPayment=:modeOfPayment")	
public ModeOfPaymentFees getModeOfPaymentFeeBasedOnBranchIdAndModeOfPayment(@Param("branchId")String branchId,@Param("modeOfPayment")String modeOfPayment);



@Query("SELECT m FROM ModeOfPaymentFees m WHERE m.admin.adminId=:adminId")
public List<ModeOfPaymentFees> findByAdminId(@Param("adminId") String adminId);

@Query("SELECT m FROM ModeOfPaymentFees m where m.admin.adminId=:adminId and m.status=:status ORDER BY branchId  desc" )
public List<ModeOfPaymentFees> findAllByOrderByBranchIdAndStatus(@Param("adminId") String adminId,@Param("status") String status);

@Query("SELECT m FROM ModeOfPaymentFees m WHERE m.branchId.branchId=:branchId")
public  List<ModeOfPaymentFees> findByBranchId(@Param("branchId")String branchId);

@Query("SELECT m FROM ModeOfPaymentFees m WHERE m.modeOfPaymentFeeId=:modeOfPaymentFeeId AND m.admin.adminId=:adminId")
public ModeOfPaymentFees findAllByModeOfPaymentFeeIdAndAdminId(@Param("modeOfPaymentFeeId") String modeOfPaymentFeeId,@Param("adminId") String adminId);

//public ModeOfPaymentFees updateStatus(String)

@Query("SELECT m FROM ModeOfPaymentFees m WHERE m.modeOfPaymentId.modeOfPaymentId=:modeOfPaymentId AND m.branchId.branchId=:branchId")
public ModeOfPaymentFees findByModeOfPaymentIdAndBranchId(@Param("modeOfPaymentId") String modeOfPaymentId,@Param("branchId") String branchId);
@Query("select mp from  ModeOfPaymentFees mp where mp.status=:status and mp.branchId.branchId=:branchId")
public List<ModeOfPaymentFees> getModeOfPaymentBasedonBranchIdAndStatus(@Param("status")String status,@Param("branchId")String branchId);



@Query("select m from ModeOfPaymentFees m where m.modeOfPaymentId.modeOfPayment=:name")
public ModeOfPaymentFees findByName(@Param("name")  String name);

@Query("select m from ModeOfPaymentFees m where m.modeOfPaymentId.modeOfPaymentId=:mopid and m.branchId.branchId=:branchid and m.admin.adminId=:adminid")
public  List<ModeOfPaymentFees> getAllMopFeesBasedOnAdminBranchModeid(String adminid,String branchid,String mopid);

@Query("SELECT m FROM ModeOfPaymentFees m WHERE m.branchId.branchId=:branchId and m.display!=:display and m.status=:status")
public  List<ModeOfPaymentFees> findByBranchIdAndDisplay(@Param("branchId")String branchId,@Param("display")String display,@Param("status")String status);


@Query("SELECT mf FROM ModeOfPaymentFees mf WHERE mf.branchId.branchId=:branchId AND mf.modeOfPaymentId.modeOfPayment=:modeOfPayment AND mf.minValue<=:amount AND mf.maxValue>=:amount")
public ModeOfPaymentFees findbyAmount(@Param("branchId")String branchId,@Param("modeOfPayment") String modeOfPayment,@Param("amount")double amount);


@Query("SELECT m FROM ModeOfPaymentFees m WHERE m.branchId.branchId=:branchId and m.display!=:display and m.status=:status and m.minValue<=:amount AND m.maxValue>=:amount")
public  List<ModeOfPaymentFees> findByBranchIdAndDisplayAndAmount(@Param("branchId")String branchId,@Param("display")String display,@Param("status")String status,double amount);

@Query("SELECT m FROM ModeOfPaymentFees m WHERE m.modeOfPaymentFeeId=:id")
public ModeOfPaymentFees getbymid(@Param("id")String id);

@Query("SELECT mf FROM ModeOfPaymentFees mf WHERE mf.branchId.branchId=:branchId AND mf.modeOfPaymentId.modeOfPayment=:modeOfPayment")	
public List<ModeOfPaymentFees> findByBranchAndMop(@Param("branchId")String branchId,@Param("modeOfPayment")String modeOfPayment);


};
