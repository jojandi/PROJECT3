package project3.talking.gamja.controller.user;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import project3.talking.gamja.dto.user.BestDTO;
import project3.talking.gamja.dto.user.CartDTO;
import project3.talking.gamja.dto.user.LibraryDTO;
import project3.talking.gamja.dto.user.LoanDTO;
import project3.talking.gamja.service.user.BestService;

@Controller
@RequestMapping("/user")
public class BestController {

	@Autowired
	BestService bestService;
	
	// 베스트 페이지
	@RequestMapping(value="/best", method=RequestMethod.GET)
	public String selectBestList(Model model) {
		
		List<BestDTO> list = bestService.selectBest();
		
		model.addAttribute("list", list);
		
		return "best";
	}
	
	// 베스트 페이지 재고현황 정보 가져오기
	@RequestMapping(value="/bestInven", method=RequestMethod.POST)
	@ResponseBody
	public List<LibraryDTO> selectLibrary(Model model, @RequestBody BestDTO bestDTO) {
		
		List<LibraryDTO> lib = bestService.selectLibrary(bestDTO);
		
		return lib;
	}
	
	// 장바구니에 담기
	@RequestMapping(value="/bestCart", method=RequestMethod.POST)
	public String insertCart(CartDTO cartDTO) {
		int result = bestService.insertCart(cartDTO);
		System.out.println("장바구니 : " + result);
		
		return "redirect:/user/cart?seq=" + cartDTO.getUser_seq();
	}
	
	// 예약하기
	@RequestMapping(value="/bestRes")
	public String insertRes(LoanDTO loanDTO) {
		int insert = bestService.insertRes(loanDTO);
		int update = bestService.updateRes(loanDTO);
		
		System.out.println("예약 : " + insert);
		System.out.println("재고 업데이트 : " + update);
		
		return "redirect:/user/res?seq=" + loanDTO.getUser_seq();
	}
	
}
