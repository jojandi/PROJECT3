package project3.gamja.user.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import project3.gamja.user.dto.BestDTO;
import project3.gamja.user.dto.CartDTO;
import project3.gamja.user.dto.LibraryDTO;
import project3.gamja.user.dto.LoanDTO;
import project3.gamja.user.dto.SearchDTO;

@Mapper
public interface SearchDAO {

	List<SearchDTO> selectSearch(String book_name);
	List<LibraryDTO> selectLibCount(BestDTO bestDTO);
	int insertCart(CartDTO cartDTO);
	int insertRes(LoanDTO loanDTO);
	int updateRes(LoanDTO loanDTO);
	
}
