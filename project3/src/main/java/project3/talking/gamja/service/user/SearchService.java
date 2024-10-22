package project3.talking.gamja.service.user;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import project3.talking.gamja.dao.user.SearchDAO;
import project3.talking.gamja.dto.user.BestDTO;
import project3.talking.gamja.dto.user.CartDTO;
import project3.talking.gamja.dto.user.LibraryDTO;
import project3.talking.gamja.dto.user.LoanDTO;
import project3.talking.gamja.dto.user.SearchDTO;


@Service
public class SearchService {

	@Autowired
	SearchDAO searchDAO;
	
	// 검색 select
	public List<SearchDTO> selectSearch(String book_name){
		
		List<SearchDTO> list = searchDAO.selectSearch(book_name);
		
				
		return list;
	}
	
	// 도서관 정보 + 도서관 재고
	public List<LibraryDTO> selectLibrary(BestDTO bestDTO){
		
		List<LibraryDTO> list = searchDAO.selectLibCount(bestDTO);
		
		return list;
	}
	
	// 장바구니에 담기
	public int insertCart(CartDTO cartDTO) {
		int result = searchDAO.insertCart(cartDTO);
		
		return result;
	}
	
	// 예약하기
	public int insertRes(LoanDTO laonDTO) {
		int result = searchDAO.insertRes(laonDTO);
		
		return result;
	}
	
	// 예약 후 재고에 예약중 표시
	public int updateRes(LoanDTO laonDTO) {
		int result = searchDAO.updateRes(laonDTO);
		
		return result;
	}
	
}
