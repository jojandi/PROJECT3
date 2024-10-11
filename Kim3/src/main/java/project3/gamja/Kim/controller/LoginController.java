package project3.gamja.Kim.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import project3.gamja.Kim.dto.LoginDTO;

@Controller
public class LoginController {

	@RequestMapping("/login")
	public String login() {
		return "user/login/user_login";
	}

	@RequestMapping("/logingo")
	public String logingo(HttpServletRequest req) {
		String user_id = req.getParameter("user_id"); // 브라우저에서 보냄
		String user_pw = req.getParameter("user_pw");

		// DTO에 값 설정
		LoginDTO dto = new LoginDTO();
		dto.setUser_id(user_id);
		dto.setUser_pw(user_pw);

		System.out.println(dto);

		ModelAndView muv = new ModelAndView();
		muv.addObject("loginDTO", dto);

		muv.setViewName("loginResult");
		// dto 값이랑

		if (dto.getUser_id().equals(user_id)
				&& dto.getUser_pw().equals(user_pw)) {
			return "home";
		} else {
			return "user/login/user_login";
		}
	}

}
