package project3.gamja.user.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import project3.gamja.user.dto.BookflixDTO;
import project3.gamja.user.dto.JoinDTO;
import project3.gamja.user.dto.UserDTO;
import project3.gamja.user.service.MyInfoService;

@Controller
public class MyInfoController {
	
	@Autowired
	MyInfoService myInfoService;
	
	// 암호화
    @Autowired
    private BCryptPasswordEncoder passwordEncoder;

	// 내 정보 페이지
	@RequestMapping(value="/myInfo", method=RequestMethod.GET)
	public String bookApply(Model model, String seq) {
		
		List<BookflixDTO> list = myInfoService.bookflixSelect(seq);
//		System.out.println(list);
		model.addAttribute("list", list);
		
		return "myInfo";
	}
	
	// 비밀번호 확인
	@RequestMapping(value="/infoEditPw", method=RequestMethod.POST)
	@ResponseBody
	public boolean infoEditPw(Model model, @RequestBody UserDTO userDTO) {
		
		// 아이디를 넣어서 유저의 기존 패스워드 가져옴
		UserDTO user = myInfoService.selectUser(userDTO);
		
		System.out.println("사용자가 입력한 평문 비밀번호: " + userDTO.getUser_pw());
        System.out.println("DB에 저장된 암호화된 비밀번호: " + user.getUser_pw());
		
		boolean isPasswordMatch = passwordEncoder.matches(userDTO.getUser_pw(), user.getUser_pw());
		System.out.println("비밀번호 일치 여부: " + isPasswordMatch);
		
		// 아작스로 true, false 보내줌
		return isPasswordMatch;
	}

	// 회원 정보 수정
	@RequestMapping(value="/infoEdit", method=RequestMethod.POST)
	public String updateInfo(Model model, UserDTO userDTO) {
		
		String email = userDTO.getUser_email() + userDTO.getDomain();
		
		userDTO.setUser_email(email);
		System.out.println("이메일 : " + email);
		
		int result = myInfoService.updateInfo(userDTO);
		System.out.println("업데이트 : " + result);
		
		return "redirect:/myInfo";
	}
	
	// 회원 아이디 중복 체크
	@RequestMapping(value="/checkUserId", method=RequestMethod.POST)
	@ResponseBody
	public String checkUserId(@RequestBody JoinDTO dto) {
	    try {
	        int result = myInfoService.checkUserId(dto);
	        if (result > 0) {
	            return "exists";
	        } else {
	            return "available";
	        }
	    } catch (Exception e) {
	        e.printStackTrace();  // 서버 로그에 예외를 기록
	        return "error";  // 클라이언트에 오류 메시지 반환
	    }
	}
	
	// 회원 탈퇴
	@RequestMapping(value="/userDel", method=RequestMethod.POST)
	public String deleteUser(Model model, UserDTO userDTO) {
		
		int result = myInfoService.deleteUser(userDTO);
		System.out.println("탈퇴 : " + result);
		
		return "redirect:/main";
	}
	
	// 북플릭스 회원 탈퇴
	@RequestMapping(value="/buserDel", method=RequestMethod.POST)
	public String deleteBUser(Model model, BookflixDTO bookflixDTO) {
		
		int delete = myInfoService.deleteBuser(bookflixDTO);
		int update = myInfoService.updateBuser(bookflixDTO);
		System.out.println("구독취소 딜리트 : " + delete);
		System.out.println("구독취소 업데이트 : " + update);
		
		return "redirect:/bookflix";
	}
	
}
