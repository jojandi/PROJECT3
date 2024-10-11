package project3.gamja.mesPage.dao;

import org.apache.ibatis.annotations.Mapper;

import project3.gamja.mesPage.dto.UserLibraryDTO;

@Mapper
public interface LibraryDAO {
	
	UserLibraryDTO selectLibrary(UserLibraryDTO dto);
	
	
}
