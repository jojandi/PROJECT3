package project3.talking.gamja.controller.user;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import project3.talking.gamja.dto.user.CartDTO;
import project3.talking.gamja.dto.user.LoanDTO;
import project3.talking.gamja.service.user.MyCartService;

@Controller
@RequestMapping("/user")
public class MyCartController {
	
	@Autowired
	MyCartService cartService;

	// 찜목록 selct
	@RequestMapping(value="/cart", method=RequestMethod.GET)
	public String res(Model model, int seq) {
		
		List<CartDTO> list = cartService.selectCart(seq);
		model.addAttribute("list", list);
		
		return "cart";
	}
	
	// 여러개의 목록 -> 예약내역
	@RequestMapping(value="/reschk", method=RequestMethod.POST)
	@ResponseBody
	public int reschk(Model model, @RequestBody CartDTO cartDTO) {

		String codes[] = cartDTO.getBook_codes();
		String carts[] = cartDTO.getCart_seqs();
		int user= cartDTO.getUser_seq();
		
    	for(int i = 0; i < codes.length; i++) {
    		System.out.println("책 : " + codes[i]);
    		System.out.println("찜 : " + carts[i]);
    	}
    	int res = cartService.resAll(codes, carts, user);
		
		return res;
	}
	
	// 전체 목록 삭제
	@RequestMapping(value="/delall", method=RequestMethod.DELETE)
	@ResponseBody
	public int delall(Model model, @RequestBody CartDTO cartDTO) {

		String carts[] = cartDTO.getCart_seqs();
		int user= cartDTO.getUser_seq();
		
    	for(int i = 0; i < carts.length; i++) {
    		System.out.println("찜 : " + carts[i]);
    	}
    	int res = cartService.delAll(carts, user);
		
		return res;
	}
	
	// 하나 삭제
	@RequestMapping(value="/cart_del", method=RequestMethod.POST)
	public String delCart(CartDTO cartDTO) {
		
		int delete = cartService.delCart(cartDTO);
		System.out.println("삭제 : " + delete);
		
		return "redirect:/cart?seq="+cartDTO.getUser_seq();
	}
	
	// 하나 예약
	@RequestMapping(value="/cart_res", method=RequestMethod.POST)
	public String resCart(LoanDTO loanDTO) {
		
		int insert = cartService.resCart(loanDTO);
		System.out.println("예약 : " +insert);
		
		return "redirect:/res?seq=" + loanDTO.getUser_seq();
	}
	
	// 예약 시 재고 현황 모달
	@RequestMapping(value="/cartInven", method=RequestMethod.POST)
	@ResponseBody
	public List<CartDTO> selectLibrary(Model model, @RequestBody CartDTO cartDTO) {
		
		List<CartDTO> lib = cartService.selectLibrary(cartDTO);
		
		return lib;
	}
	
}
