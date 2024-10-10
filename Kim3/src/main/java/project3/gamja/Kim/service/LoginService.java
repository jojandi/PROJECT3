package project3.gamja.Kim.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import project3.gamja.Kim.dao.LoginDAO;
import project3.gamja.Kim.dto.LoginDTO;

@Service
public class LoginService {


	
	@Autowired
	LoginDAO loginDAO;		

	public List<LoginDTO> listlogin() {

		List<LoginDTO> list = loginDAO.selectTbl_user();

		return list;
	}
}


