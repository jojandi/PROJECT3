package project3.talking.gamja.dao.user;

import project3.talking.gamja.dto.user.JoinDTO;

public interface JoinDAO {
	
	int insertJoin(JoinDTO loanDTO);
	int checkUserIdExists(JoinDTO loanDTO);
	
}
