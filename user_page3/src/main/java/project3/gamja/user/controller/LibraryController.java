package project3.gamja.user.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import project3.gamja.user.dto.LibraryDTO;
import project3.gamja.user.service.LibraryService;



@Controller
public class LibraryController {
	
	@Autowired
	LibraryService libraryService;
	
	@RequestMapping(value="user_libraryInfo", method=RequestMethod.GET)
	public String selectLibrary (@RequestParam int lib_id, Model model) {
		
		LibraryDTO dto = new LibraryDTO();
		dto.setLib_id(lib_id);
		
		LibraryDTO list = libraryService.selectLibrary(dto);
		model.addAttribute("selectLibrary", list);

		
		return "user_libraryInfo";
	}
}
