package project3.gamja.jojandi.controller.user.my;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import project3.gamja.jojandi.dto.user.my.CartDTO;
import project3.gamja.jojandi.dto.user.my.LoanDTO;
import project3.gamja.jojandi.service.user.my.CartService;

@Controller
public class CartController {
	
	@Autowired
	CartService cartService;

	// 찜목록 selct
	@RequestMapping(value="/user/cart", method=RequestMethod.GET)
	public String res(Model model, int seq) {
		
		List<CartDTO> list = cartService.selectCart(seq);
		model.addAttribute("list", list);
		
		return "cart";
	}
	
	// 여러개의 목록 -> 예약내역
	@RequestMapping(value="/user/reschk", method=RequestMethod.POST)
	@ResponseBody
	public int loan(Model model, @RequestBody CartDTO cartDTO) {

		String code = Integer.toString(cartDTO.getBook_code());
		String cart = Integer.toString(cartDTO.getCart_seq());
		int user= cartDTO.getUser_seq();
		
		System.out.println("책 코드 : " + code);
		System.out.println("찜 번호 : " + cart);
		
		String[] codes = code.split(","); // 만약 책이 하나면 한 개짜리 배열을 돌려줌
    	String[] carts = cart.split(","); // 만약 책이 하나면 한 개짜리 배열을 돌려줌
    	
    	int res = cartService.resAll(codes, carts, user);
		
		return res;
	}
	
}
