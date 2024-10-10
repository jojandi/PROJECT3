package project3.gamja.Kim.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

import project3.gamja.Kim.dto.LoginDTO;
import project3.gamja.Kim.dto.NotiDTO;

@Mapper
public interface LoginDAO {
//	List<LoginDTO> selectTbl_user(LoginDTO loginDTO);

	List<LoginDTO> selectTbl_user();
	
	}


