package project3.gamja.user.service;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import project3.gamja.user.dao.LoginDAO;
import project3.gamja.user.dto.UserDTO;


@Service
public class LoginService {


	
	@Autowired
	LoginDAO loginDAO;

	//UserDTO를 받아 정보를 조회하여 반환
	public UserDTO selectLoginUser(UserDTO userDTO) { 

		UserDTO dto = loginDAO.selectLoginUser(userDTO); // DAO에서 selectLoginUser 를 호출하여 
																		// 데이터 베이스에서 사용자를 찾음 
				

		return dto; // dto를 반환
	}
	
	public UserDTO selectLoginAdmin(UserDTO userDTO) {
		
		UserDTO dto = loginDAO.selectLoginAdmin(userDTO);
		
		return dto;
	}
	
	public UserDTO selectLoginMes(UserDTO userDTO) {
		
		UserDTO dto = loginDAO.selectLoginMes(userDTO);
		
		return dto;
	}
}


