package project3.gamja.admin.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class MainController {

	// mainpage
	@RequestMapping(value="/main", method=RequestMethod.GET)
	public String res(Model model) {
		
		return "mian";
	}
	
}
