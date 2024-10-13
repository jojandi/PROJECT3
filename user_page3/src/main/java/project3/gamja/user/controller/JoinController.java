package project3.gamja.user.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
@Controller
public class JoinController {
	
	@RequestMapping("/join")
	public String join() {
		return "join";
	}
	
}
