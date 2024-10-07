package project3.gamja.mesPage.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import project3.gamja.mesPage.service.MainService;



@Controller
public class MainController {
	@Autowired
	MainService mainService;
	
	@RequestMapping("/mesPage/main")
	
	void listMember() {
	//	MemberService memberService = new MemberServiceImpl();
	//	memberService.setMemberDAO(new MemberDAOImpl());
		
	List list = MainService.Mainlist();
	System.out.println(list);
}
	
}
