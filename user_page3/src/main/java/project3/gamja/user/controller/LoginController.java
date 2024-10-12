package project3.gamja.user.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import project3.gamja.user.dto.UserDTO;
import project3.gamja.user.service.LoginService;


@Controller
public class LoginController {

	@Autowired
	LoginService loginService;


		// 로그인 페이지 이동
		@RequestMapping("/login")
		public String login() {
			return "login";
		}

		// 로그인 처리
		@RequestMapping("/logingo")
		public String logingo(HttpServletRequest req, UserDTO userDTO) {
			// DTO에 로그인 시 입력한 아이디와 패스워드를 출력
			System.out.println("id : " + userDTO.getUser_id());
			System.out.println("pw : " + userDTO.getUser_pw());

			// 로그인 사용자 조회
			UserDTO user = loginService.selectLoginUser(userDTO); 
			UserDTO admin = loginService.selectLoginAdmin(userDTO);
			UserDTO mes = loginService.selectLoginMes(userDTO);

			if (user != null) {
				// 일반 사용자 로그인 성공
				System.out.println(user.getUser_name());
				HttpSession session = req.getSession();
				session.setMaxInactiveInterval(60 * 60 * 60); // 세션 타임아웃 설정

				session.setAttribute("login", user);
				session.setAttribute("isLogin", true);

				// 홈으로 이동
				return "forward:/main";
				
			} else if (admin != null) {
				// 관리자 로그인 성공
				HttpSession session = req.getSession();
				session.setMaxInactiveInterval(60 * 60 * 60);

				session.setAttribute("login", admin);
				session.setAttribute("isLogin", true);

				// 관리자 메인 페이지로 이동
				return "forward:/admin/main";
			} else if (mes != null) {
				// MES 사용자 로그인 성공
				HttpSession session = req.getSession();
				session.setMaxInactiveInterval(60 * 60 * 60);

				session.setAttribute("login", mes);
				session.setAttribute("isLogin", true);

				// MES 메인 페이지로 이동
				return "forward:/mesPage/main";
			} else {
				// 로그인 실패 시 "LO01" 코드를 추가하여 로그인 페이지로 리다이렉트
				return "forward:/login?code=LO01";
			}
	}
		
	
	
	// 로그아웃 기능 추가
		@RequestMapping("/logout")
		public String logout(HttpServletRequest req) {
			HttpSession session = req.getSession(false); // 기존 세션이 없으면 null 반환

			if(session != null) {
				// 세션 무효화하여 로그아웃 처리
				session.invalidate();
				System.out.println("로그아웃 됨.");
			}

			// 로그아웃 후 로그인 페이지로 리다이렉트
			return "redirect:/login";			
		
	}
	}
