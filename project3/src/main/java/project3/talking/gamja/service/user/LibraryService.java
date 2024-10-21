package project3.talking.gamja.service.user;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import project3.talking.gamja.dao.user.LibraryDAO;
import project3.talking.gamja.dto.user.LibraryDTO;



@Service
public class LibraryService {
	@Autowired
	LibraryDAO libraryDAO;
	
	public LibraryDTO selectLibrary(LibraryDTO dto) {
		LibraryDTO list = libraryDAO.selectLibrary(dto);
		
		return list;
	}
	
}
