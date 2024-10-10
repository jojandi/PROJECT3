package project3.gamja.admin.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import project3.gamja.admin.dto.InvenDTO;
import project3.gamja.admin.dto.LoanResDTO;

@Mapper
public interface InvenDAO {

	List<InvenDTO> selectInven(InvenDTO invenDTO);
	int totalInven(InvenDTO invenDTO);
	List<InvenDTO> selectRes(LoanResDTO loanResDTO);
	int totalRes(LoanResDTO loanResDTO);
	int updateRes(LoanResDTO loanResDTO);
	int inseResLoan(LoanResDTO loanResDTO);
	int invenLoan(LoanResDTO loanResDTO);
	int invenRes(LoanResDTO loanResDTO);
	
}
