package project3.gamja.jojandi.dao.user.my;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import project3.gamja.jojandi.dto.user.my.CartDTO;
import project3.gamja.jojandi.dto.user.my.LoanDTO;

@Mapper
public interface CartDAO {

	List<CartDTO> selectCart(int user_seq);
	int insertAllCart(LoanDTO loanDTO);
	int deleteChkCart(CartDTO cartDTO);
	
}
