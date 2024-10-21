package project3.talking.gamja.dao.user;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import project3.talking.gamja.dto.user.ApplyDTO;
import project3.talking.gamja.dto.user.BookflixDTO;
import project3.talking.gamja.dto.user.CartDTO;
import project3.talking.gamja.dto.user.JoinDTO;
import project3.talking.gamja.dto.user.LoanDTO;
import project3.talking.gamja.dto.user.UserDTO;

@Mapper
public interface MyDAO {

	// 이용내역
	List<LoanDTO> selectUseRes(LoanDTO loanDTO);
	int totalRes(LoanDTO loanDTO);
	List<LoanDTO> selectUseLoan(LoanDTO loanDTO);
	int totalLoan(LoanDTO loanDTO);
	List<LoanDTO> selectUseOver(LoanDTO loanDTO);
	int totalOver(LoanDTO loanDTO);
	
	// 장바구니
	List<CartDTO> selectCart(int user_seq);
	List<CartDTO> selectLibCount(CartDTO cartDTO);
	int insertAllCart(LoanDTO loanDTO);
	int deleteChkCart(CartDTO cartDTO);
	int updateInvenRes(LoanDTO loanDTO);
	
	// 도서신청내역
	List<ApplyDTO> selectBookApply(ApplyDTO applyDTO);
	int totalApply(ApplyDTO applyDTO);
	
	// 내정보
	int updateInfo(UserDTO userDTO);
	int deleteUser(UserDTO userDTO);
	int checkUserId(JoinDTO joinDTO);
	UserDTO selectUser(UserDTO userDTO);
	List<BookflixDTO> bookflixSelect(String seq);
	int deleteBuser(BookflixDTO bookflixDTO);
	int updateBuser(BookflixDTO bookflixDTO);
	
}
