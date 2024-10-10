package project3.gamja.mesPage.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import project3.gamja.mesPage.dao.StockDAO;
import project3.gamja.mesPage.dto.MesStockDTO;

@Service
public class StockService {

	@Autowired
	StockDAO stockDAO;
		
	public List<MesStockDTO> selectStock1(){
			
			List<MesStockDTO> list = stockDAO.selectStock1();
					
			return list;
	}
	public List<MesStockDTO> selectStock2(){
		
		List<MesStockDTO> list = stockDAO.selectStock2();
		
		return list;
	}
	public List<MesStockDTO> selectStock3(){
		
		List<MesStockDTO> list = stockDAO.selectStock3();
		
		return list;
	}
	public List<MesStockDTO> getMesPubId(){
		
		List<MesStockDTO> list = stockDAO.getMesPubId();
		
		return list;
	}
	public List<MesStockDTO> getMesBookCodes(){
		
		List<MesStockDTO> list = stockDAO.getMesBookCodes();
		
		return list;
	}
	
	
	
	public MesStockDTO selectOrder(int OrderId){
		MesStockDTO dto = stockDAO.selectOrder(OrderId);
		return dto;
	}
	
	public int deleteOrder(MesStockDTO dto){
		int result = stockDAO.deleteOrder(dto);
		return result;
	}
	public int updateOrder(MesStockDTO dto){
		int result = stockDAO.updateOrder(dto);
		return result;
	}
	public int insertOrder(MesStockDTO dto){
		int result = stockDAO.insertOrder(dto);
		return result;
	}
	
}
