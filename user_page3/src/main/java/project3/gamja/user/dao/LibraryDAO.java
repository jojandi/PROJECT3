package project3.gamja.user.dao;

import org.apache.ibatis.annotations.Mapper;

import project3.gamja.user.dto.LibraryDTO;

@Mapper
public interface LibraryDAO {
	
	LibraryDTO selectLibrary(LibraryDTO dto);
	
	
}
