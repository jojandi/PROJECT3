package project3.gamja.jojandi.dao.user.my;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import project3.gamja.jojandi.dto.user.my.LoanDTO;

@Mapper
public interface UseDAO {

	List<LoanDTO> selectUseRes(LoanDTO loanDTO);
	int totalRes(LoanDTO loanDTO);
	
	List<LoanDTO> selectUseLoan(LoanDTO loanDTO);
	int totalLoan(LoanDTO loanDTO);
	
	List<LoanDTO> selectUseOver(LoanDTO loanDTO);
	int totalOver(LoanDTO loanDTO);
	
}
