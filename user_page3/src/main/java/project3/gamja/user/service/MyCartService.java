package project3.gamja.user.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import project3.gamja.user.dao.MyDAO;
import project3.gamja.user.dto.CartDTO;
import project3.gamja.user.dto.LoanDTO;


@Service
public class MyCartService {

	@Autowired
	MyDAO myDAO;
	
	// 예약내역
	public List<CartDTO> selectCart(int user_seq){
		
		List<CartDTO> list = myDAO.selectCart(user_seq); 
				
		return list;
	}
	
	// 여러개 예약 및 삭제
	public int resAll(String[] codes, String[] cart, int user) {
		int result = 0;
		
		try {
			// 예약
			for(int i = 0; i < codes.length; i++) {	
				LoanDTO dto = new LoanDTO();
				
				int code = Integer.parseInt(codes[i]);
				
				dto.setUser_seq(user);
				dto.setBook_code(code);
				
				result += myDAO.insertAllCart(dto);
				System.out.println("예약" + i + " : " + result);
			}
			
			// 찜 목록 삭제
			int delete = delAll(cart, user);
			
			// 재고 업데이트
			int update = updateInvenRes(codes);
			
			System.out.println("삭제 : " + delete);
			System.out.println("재고 업데이트 : " + update);
			
		}catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}
	
	// 여러개 삭제
	public int delAll(String[] cart, int user) {
		int delete = 0;
		
		try {
			for(int i = 0; i < cart.length; i++) {	
				CartDTO dto = new CartDTO();
				
				int seq = Integer.parseInt(cart[i]);
				
				dto.setCart_seq(seq);
				
				delete += myDAO.deleteChkCart(dto);
				System.out.println("삭제" + i + " : " + delete);
			}
			
		}catch (Exception e) {
			e.printStackTrace();
		}
		
		return delete;
	}
	
	// 재고에 예약 중 표시
	public int updateInvenRes(String[] codes) {
		int result = 0;
		try {
			for(int i = 0; i < codes.length; i++) {	
				LoanDTO dto = new LoanDTO();
				
				int code = Integer.parseInt(codes[i]);
				
				dto.setBook_code(code);
				
				result += myDAO.insertAllCart(dto);
				System.out.println("재고 업데이트" + i + " : " + result);
			}
		}catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
}