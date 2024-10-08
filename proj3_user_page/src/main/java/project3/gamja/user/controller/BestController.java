package project3.gamja.user.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import project3.gamja.user.dto.BestDTO;
import project3.gamja.user.dto.CartDTO;
import project3.gamja.user.dto.LibraryDTO;
import project3.gamja.user.dto.LoanDTO;
import project3.gamja.user.service.BestService;

@Controller
public class BestController {

	@Autowired
	BestService bestService;
	
	// 베스트 페이지
	@RequestMapping(value="/best", method=RequestMethod.GET)
	public String selectBestList(Model model) {
		
		List<BestDTO> list = bestService.selectBest();
		List<LibraryDTO> library = bestService.selectLibrary();
		
		model.addAttribute("list", list);
		model.addAttribute("library", library);
		
		return "best";
	}
	
	// 장바구니에 담기
	@RequestMapping(value="/bestCart", method=RequestMethod.POST)
	public String insertCart(CartDTO cartDTO) {
		int result = bestService.insertCart(cartDTO);
		System.out.println("장바구니 : " + result);
		
		return "redirect:/cart?seq=" + cartDTO.getUser_seq();
	}
	
	// 예약하기
	@RequestMapping(value="/bestRes", method=RequestMethod.POST)
	public String insertRes(LoanDTO loanDTO) {
		int insert = bestService.insertRes(loanDTO);
		int update = bestService.updateRes(loanDTO);
		
		System.out.println("예약 : " + insert);
		System.out.println("재고 업데이트 : " + update);
		
		return "redirect:/cart?seq=" + loanDTO.getUser_seq();
	}
	
}
