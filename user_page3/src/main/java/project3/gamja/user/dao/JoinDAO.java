package project3.gamja.user.dao;

import project3.gamja.user.dto.JoinDTO;

public interface JoinDAO {
	
	int insertJoin(JoinDTO loanDTO);
	int checkUserIdExists(JoinDTO loanDTO);
	
}
