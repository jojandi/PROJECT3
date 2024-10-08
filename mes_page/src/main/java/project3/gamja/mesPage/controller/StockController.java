package project3.gamja.mesPage.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import project3.gamja.mesPage.dto.MesStockDTO;
import project3.gamja.mesPage.service.StockService;

@Controller
public class StockController {

	@Autowired
	StockService stockService;
	
	// 각 페이지 셀렉트 ///////////////////////////////////////////////////////////////////
	@RequestMapping("/mes_stock1")
	public String stock1(Model model) {
		List<MesStockDTO> list = stockService.selectStock1();
		model.addAttribute("StockList1", list);
		
		return "mes_stock1";
	}
	@RequestMapping("/mes_stock2")
	public String stock2(Model model) {
		List<MesStockDTO> list = stockService.selectStock2();
		model.addAttribute("StockList2", list);
		
		return "mes_stock2";
	}
	@RequestMapping("/mes_stock3")
	public String stock3(Model model) {
		List<MesStockDTO> list = stockService.selectStock3();
		model.addAttribute("StockList3", list);
		
		
		
		// 부품코드 셀렉트 옵션을 jsp로 전달해주는 친구~

		List<MesStockDTO> mesBookCodes = stockService.getMesBookCodes();
		model.addAttribute("mes_book_code", mesBookCodes);
		// ---------------------------------------------------------
		// 발주처id를 셀렉트 옵션을 jsp로 전달해주는 친구~
		List<MesStockDTO> mesPubId = stockService.getMesPubId();
		model.addAttribute("pub_id", mesPubId);

		// ---------------------------------------------------------
		
		
		
		
		
		return "mes_stock3";
	}
	////////////////////////////////////////////////////////////////////////////////////////
	
	@RequestMapping(value="/stock_update", method=RequestMethod.GET)
	public String orderUpdate(Model model, int order_ID) {
		
		MesStockDTO dto = stockService.selectOrder(order_ID);
		model.addAttribute("dto", dto);
		
		return "stock_update";
	}
	
	
	
}
