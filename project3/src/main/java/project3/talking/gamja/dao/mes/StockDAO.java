package project3.talking.gamja.dao.mes;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import project3.talking.gamja.dto.mes.MesStockDTO;


@Mapper
public interface StockDAO {

	List<MesStockDTO> selectStock1(MesStockDTO dto);
	List<MesStockDTO> selectStock2(MesStockDTO dto);
	List<MesStockDTO> selectStock3(MesStockDTO dto);
	int totalSt1(MesStockDTO dto);
	int totalSt2(MesStockDTO dto);
	int totalSt3(MesStockDTO dto);
	List<MesStockDTO> getMesPubId();
	List<MesStockDTO> getMesBookCodes();
	
	MesStockDTO selectOrder(int orderId);
	
	int deleteOrder(MesStockDTO dto);
	int updateOrder(MesStockDTO dto);
	int insertOrder(MesStockDTO dto);
}
