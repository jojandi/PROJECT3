package project3.talking.gamja.dao.mes;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import project3.talking.gamja.dto.mes.MesLogDTO;
import project3.talking.gamja.dto.mes.MesMainDTO;

@Mapper
public interface MesMainDAO {

	List<MesMainDTO> selectAll();

	List<MesMainDTO> getStatisticsByGenre(int month);

	List<MesMainDTO> findNoticesByEmpId(int emp_id);
	// 월별 주문 수량 조회
	int getMonthlyOrderCount(@Param("month") String month);

	// 월별 출고 수량 조회
	int getMonthlyDeliveryCount(@Param("month") String month);

	List<MesLogDTO> selectLog();
}
