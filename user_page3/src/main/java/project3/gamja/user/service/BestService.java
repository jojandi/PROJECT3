package project3.gamja.user.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import project3.gamja.user.dao.BestDAO;
import project3.gamja.user.dto.BestDTO;
import project3.gamja.user.dto.CartDTO;
import project3.gamja.user.dto.LibraryDTO;
import project3.gamja.user.dto.LoanDTO;


@Service
public class BestService {

	@Autowired
	BestDAO bestDAO;
	
	// 베스트 리스트
	public List<BestDTO> selectBest(){
		
		List<BestDTO> list = bestDAO.selectBest(); 
				
		return list;
	}
	
	// 도서관 정보
	public List<LibraryDTO> selectLibrary(){
		
		List<LibraryDTO> list = bestDAO.selectLibrary();
		
		return list;
	}
	
	// 장바구니에 담기
	public int insertCart(CartDTO cartDTO) {
		int result = bestDAO.insertCart(cartDTO);
		
		return result;
	}
	
	// 예약하기
	public int insertRes(LoanDTO laonDTO) {
		int result = bestDAO.insertRes(laonDTO);
		
		return result;
	}
	
	// 예약 후 재고에 예약중 표시
	public int updateRes(LoanDTO laonDTO) {
		int result = bestDAO.updateRes(laonDTO);
		
		return result;
	}
	
}
