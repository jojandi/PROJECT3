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
	
}
