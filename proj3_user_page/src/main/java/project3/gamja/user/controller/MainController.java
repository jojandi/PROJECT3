package project3.gamja.user.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import project3.gamja.user.service.MyCartService;

@Controller
public class MainController {

	// mainpage
	@RequestMapping(value="/main", method=RequestMethod.GET)
	public String res(Model model) {
		
		return "mian";
	}
	
}
