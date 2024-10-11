package project3.gamja.mesPage.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import project3.gamja.mesPage.dao.LibraryDAO;
import project3.gamja.mesPage.dto.UserLibraryDTO;

@Service
public class LibraryService {
	@Autowired
	LibraryDAO libraryDAO;
	
	public UserLibraryDTO selectLibrary(UserLibraryDTO dto) {
		UserLibraryDTO list = libraryDAO.selectLibrary(dto);
		
		return list;
	}
	
}
