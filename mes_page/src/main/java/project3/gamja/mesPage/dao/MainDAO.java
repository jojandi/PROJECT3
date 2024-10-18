package project3.gamja.mesPage.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;

import project3.gamja.mesPage.dto.MesMainDTO;
import project3.gamja.mesPage.dto.MesNoticeDTO;

@Mapper
public interface MainDAO {
	
	List<MesMainDTO> selectAll();
	 List<MesMainDTO> getStatisticsByGenre(int month);
	  List<MesMainDTO> findNoticesByEmpId(int emp_id);
	  // 월별 주문 수량 조회
	   
	    int getMonthlyOrderCount(@Param("month") String month);

	    // 월별 출고 수량 조회
	  
	    int getMonthlyDeliveryCount(@Param("month") String month);

}
