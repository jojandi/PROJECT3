package project3.gamja.user.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import project3.gamja.user.dto.JoinDTO;
import project3.gamja.user.service.JoinService;
@Controller
public class JoinController {
	
	@Autowired
	JoinService joinService;
	
	@Autowired
    private BCryptPasswordEncoder passwordEncoder;
	
    
	@RequestMapping("/join")
	public String join() {
		return "join";
	}
	
	@RequestMapping(value="/join", method=RequestMethod.POST)
	public String insertOrder(JoinDTO dto,HttpServletRequest request) {
		
		// 날짜
		String yyyy = request.getParameter("yyyy");
	    String mm = request.getParameter("mm");
	    String dd = request.getParameter("dd");
	    String d = yyyy + "-" + mm + "-" + dd;
	    java.sql.Date birth = java.sql.Date.valueOf(d);
	    dto.setUser_birth(birth);
	    
	    // 비밀번호 암호화
	    
	    String encryptedPassword = passwordEncoder.encode(dto.getUser_pw());
	    dto.setUser_pw(encryptedPassword);
	    
		joinService.insertJoin(dto);
		
		return "redirect:login";
	}
	
	@RequestMapping(value="/check_username", method=RequestMethod.POST)
	@ResponseBody
	public String checkUsername(@RequestBody JoinDTO dto) {
	    try {
	        int result = joinService.checkUserIdExists(dto);
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
	
	
}
