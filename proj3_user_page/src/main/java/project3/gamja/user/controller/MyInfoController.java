package project3.gamja.user.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import project3.gamja.user.dto.BookflixDTO;
import project3.gamja.user.dto.UserDTO;
import project3.gamja.user.service.MyInfoService;

@Controller
public class MyInfoController {
	
	@Autowired
	MyInfoService myInfoService;

	// 내 정보 페이지
	@RequestMapping(value="/myInfo", method=RequestMethod.GET)
	public String bookApply(Model model, String seq) {
		
		List<BookflixDTO> list = myInfoService.bookflixSelect(seq);
//		System.out.println(list);
		model.addAttribute("list", list);
		
		return "myInfo";
	}

	// 회원 정보 수정
	@RequestMapping(value="/infoEdit", method=RequestMethod.POST)
	public String reschk(Model model, UserDTO userDTO) {
		
		String email = userDTO.getUser_email1() + userDTO.getUser_email2();
		
		userDTO.setUser_email(email);
		System.out.println("이메일 : " + email);
		
		int result = myInfoService.updateInfo(userDTO);
		System.out.println("업데이트 : " + result);
		
		return "redirect:/myInfo";
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
