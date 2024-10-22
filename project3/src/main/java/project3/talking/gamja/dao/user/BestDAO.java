package project3.talking.gamja.dao.user;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import project3.talking.gamja.dto.user.BestDTO;
import project3.talking.gamja.dto.user.CartDTO;
import project3.talking.gamja.dto.user.LibraryDTO;
import project3.talking.gamja.dto.user.LoanDTO;

@Mapper
public interface BestDAO {

	List<BestDTO> selectBest();
	List<LibraryDTO> selectLibCount(BestDTO bestDTO);
	int insertCart(CartDTO cartDTO);
	int insertRes(LoanDTO loanDTO);
	int updateRes(LoanDTO loanDTO);
	
}
