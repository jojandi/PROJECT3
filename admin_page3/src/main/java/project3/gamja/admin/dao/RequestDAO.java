package project3.gamja.admin.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import project3.gamja.admin.dto.RequestDTO;

@Mapper
public interface RequestDAO {
	
	List<RequestDTO> selectre(RequestDTO reDTO);
	int totalre(RequestDTO reDTO);

}
