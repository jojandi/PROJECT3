package project3.gamja.user.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import project3.gamja.user.dao.LibraryDAO;
import project3.gamja.user.dto.LibraryDTO;



@Service
public class LibraryService {
	@Autowired
	LibraryDAO libraryDAO;
	
	public LibraryDTO selectLibrary(LibraryDTO dto) {
		LibraryDTO list = libraryDAO.selectLibrary(dto);
		
		return list;
	}
	
}
