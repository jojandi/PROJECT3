package project3.gamja.jojandi.service.user.my;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import project3.gamja.jojandi.dao.user.my.CartDAO;
import project3.gamja.jojandi.dto.user.my.CartDTO;
import project3.gamja.jojandi.dto.user.my.LoanDTO;

@Service
public class CartService {

	@Autowired
	CartDAO cartDAO;
	
	// 예약내역
	public List<CartDTO> selectCart(int user_seq){
		
		List<CartDTO> list = cartDAO.selectCart(user_seq); 
				
		return list;
	}
	
	// 여러개 예약 및 삭제
	public int resAll(String[] codes, String[] cart, int user) {
		int result = 0;
		int delete = 0;
		
		try {
			// 예약
			for(int i = 0; i < codes.length; i++) {	
				LoanDTO dto = new LoanDTO();
				
				int code = Integer.parseInt(codes[i]);
				
				dto.setUser_seq(user);
				dto.setBook_code(code);
				
				result += cartDAO.insertAllCart(dto);
				System.out.println("예약" + i + " : " + result);
			}
			
			// 찜 목록 삭제
			for(int i = 0; i < cart.length; i++) {	
				CartDTO dto = new CartDTO();
				
				int seq = Integer.parseInt(cart[i]);
				
				dto.setCart_seq(seq);
				
				delete += cartDAO.deleteChkCart(dto);
				System.out.println("삭제" + i + " : " + delete);
			}
			
		}catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}
	
}
