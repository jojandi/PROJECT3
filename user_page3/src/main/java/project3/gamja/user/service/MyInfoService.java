package project3.gamja.user.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import project3.gamja.user.dao.MyDAO;
import project3.gamja.user.dto.BookflixDTO;
import project3.gamja.user.dto.JoinDTO;
import project3.gamja.user.dto.UserDTO;


@Service
public class MyInfoService {

	@Autowired
	MyDAO myDAO;
	
	// 내 정보 수정
	public int updateInfo(UserDTO userDTO){
		int result = myDAO.updateInfo(userDTO);
		return result;
	}
	
	// 비밀번호 확인
	public UserDTO selectUser(UserDTO userDTO) {
		UserDTO user = myDAO.selectUser(userDTO);
		return user;
	}
	
	// 아이디 중복 체크
	public int checkUserId(JoinDTO joinDTO) {
		int result = myDAO.checkUserId(joinDTO);
		return result;
	}
	
	// 회원 탈퇴
	public int deleteUser(UserDTO userDTO){
		int result = myDAO.deleteUser(userDTO);
		return result;
	}
	
	// 북플릭스 책 추천
	public List<BookflixDTO> bookflixSelect(String seq){
		List<BookflixDTO> list = myDAO.bookflixSelect(seq);
		return list;
	}
	
	// 북플릭스 회원 탈퇴 - 북플릭스 회원 테이블 딜리트
	public int deleteBuser(BookflixDTO bookflixDTO){
		int result = myDAO.deleteBuser(bookflixDTO);
		return result;
	}
	
	// 북플릭스 회원 탈퇴 - 유저 테이블 업데이트
	public int updateBuser(BookflixDTO bookflixDTO){
		int result = myDAO.updateBuser(bookflixDTO);
		return result;
	}
}
