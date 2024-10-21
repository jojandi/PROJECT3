package project3.talking.gamja.dao.user;

import org.apache.ibatis.annotations.Mapper;

import project3.talking.gamja.dto.user.LibraryDTO;

@Mapper
public interface LibraryDAO {
	
	LibraryDTO selectLibrary(LibraryDTO dto);
	
	
}
