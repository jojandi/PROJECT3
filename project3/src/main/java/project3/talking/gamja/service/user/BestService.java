package project3.talking.gamja.service.user;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import project3.talking.gamja.dao.user.BestDAO;
import project3.talking.gamja.dto.user.BestDTO;
import project3.talking.gamja.dto.user.CartDTO;
import project3.talking.gamja.dto.user.LibraryDTO;
import project3.talking.gamja.dto.user.LoanDTO;


@Service
public class BestService {

	@Autowired
	BestDAO bestDAO;
	
	// 베스트 리스트
	public List<BestDTO> selectBest(){
		
		List<BestDTO> list = bestDAO.selectBest(); 
				
		return list;
	}
	
	// 도서관 정보 + 도서관 재고
	public List<LibraryDTO> selectLibrary(BestDTO bestDTO){
		
		List<LibraryDTO> list = bestDAO.selectLibCount(bestDTO);
		
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
