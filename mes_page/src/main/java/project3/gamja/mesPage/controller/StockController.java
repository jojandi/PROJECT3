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
	
	// 찜목록 selct
//		@RequestMapping(value="/user/cart", method=RequestMethod.GET)
//		public String res(Model model, int seq) {
//			
//			List<CartDTO> list = cartService.selectCart(seq);
//			model.addAttribute("list", list);
//			
//			return "cart";
//		}
	
	
	
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
		
		return "mes_stock3";
	}
	
	
}
