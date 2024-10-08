package project3.gamja.mesPage.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import project3.gamja.mesPage.dto.MesStockDTO;
import project3.gamja.mesPage.service.StockService;

@Controller
public class StockController {

	@Autowired
	StockService stockService;
	
	@RequestMapping("/mes_stock1")
	public String listEmp(Model model) {
		List<MesStockDTO> list = stockService.selectStock1();
		model.addAttribute("StockList1", list);
		
		return "mes_stock1";
	}
	
	
}
