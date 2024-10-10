package project3.gamja.mesPage.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import project3.gamja.mesPage.dto.MesStockDTO;


@Mapper
public interface StockDAO {

	List<MesStockDTO> selectStock1();
	List<MesStockDTO> selectStock2();
	List<MesStockDTO> selectStock3();
	List<MesStockDTO> getMesPubId();
	List<MesStockDTO> getMesBookCodes();
	
	MesStockDTO selectOrder(int orderId);
	
	int deleteOrder(MesStockDTO dto);
	int updateOrder(MesStockDTO dto);
	int insertOrder(MesStockDTO dto);
}
